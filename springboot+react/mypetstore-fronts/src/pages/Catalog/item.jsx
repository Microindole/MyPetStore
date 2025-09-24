import React, { useEffect, useState } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';

const Item = () => {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();
    const itemId = searchParams.get('itemId');
    const [item, setItem] = useState(null);
    const token = localStorage.getItem('token');
    const handleAddToCart = (itemId) => {
        if (!token) {
            alert("请先登录以加入购物车");
            console.log("redirecting to login");

            return;
        }

        fetch(`/api/cart/${itemId}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `${token}`
            },
            credentials: 'include'
        })
            .then((res) => res.json())
            .then((data) => {
                if (data.status === 0) {
                    alert('已成功加入购物车！');
                    setTimeout(() => {
                        navigate("/cart");
                    }, 200);
                } else {
                    alert('添加失败：' + data.msg);
                }
            })
            .catch((err) => {
                alert('请求失败：' + err.message);
            });
    };


    useEffect(() => {
        if (itemId) {
            fetch(`/api/catalog/items/${itemId}`)
                .then(res => res.json())
                .then(data => {
                    if (data.status === 0) {
                        setItem(data.data);
                    } else {
                        console.error('加载商品失败：', data.msg);
                    }
                })
                .catch(err => console.error('请求失败：', err));
        }
    }, [itemId]);

    if (!item) return <div>Loading...</div>;

    return (
        <div id="Content">
            <div id="BackLink">
                <a
                    href="#"
                    onClick={(e) => {
                        e.preventDefault();
                        navigate(`/catalog/viewProduct?productId=${item.productId}`);
                    }}
                >
                    Return to <span>{item.productId}</span>
                </a>
            </div>

            <div id="Catalog">
                <table id="register_table">
                    <tbody>
                    <tr>
                        <td>
                            <img src={`/${item.descriptionImage}`} alt="item" />
                            <p>{item.descriptionText}</p>
                        </td>
                    </tr>
                    <tr>
                        <td><b>{item.itemId}</b></td>
                    </tr>
                    <tr>
                        <td>
                            <b>
                                <font size="4">{item.attributes}</font>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td>{item.productName}</td>
                    </tr>
                    <tr>
                        <td>
                            {item.quantity <= 0 ? (
                                <label>Back ordered.</label>
                            ) : (
                                <label>{item.quantity} in stock.</label>
                            )}
                        </td>
                    </tr>
                    <tr>
                        <td>${item.listPrice.toFixed(2)}</td>
                    </tr>
                    <tr>
                        <td>
                            <a

                                onClick={() => handleAddToCart(item.itemId)}
                                className="Button"
                            >
                                Add to Cart
                            </a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default Item;
