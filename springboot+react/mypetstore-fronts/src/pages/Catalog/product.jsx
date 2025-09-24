import React, { useEffect, useState } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';


const Product = () => {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();
    const productId = searchParams.get('productId');
    const [product, setProduct] = useState(null);

    const token = localStorage.getItem('token');

    const handleAddToCart = (itemId) => {
        if (!token) {
            alert("请先登录以加入购物车");
            navigate("/account/login");
            return;
        }

        fetch(`/api/cart/${itemId}`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `${token}`,
            },
            credentials: 'include'
        })
            .then((res) => res.json())
            .then((data) => {
                if (data.status === 0) {
                    alert('已成功加入购物车，跳转至购物车页面...');
                    // 延迟 0.2 秒后跳转
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
        if (productId) {
            fetch(`/api/catalog/products/${productId}`)
                .then(res => res.json())
                .then(data => {
                    if (data.status === 0) {
                        setProduct(data.data);
                    } else {
                        console.error('加载产品失败：', data.msg);
                    }
                })
                .catch(err => console.error('请求错误：', err));
        }
    }, [productId]);

    if (!product) return <div>Loading...</div>;

    return (
        <div id="Content">
            <div id="BackLink">
                <a href={`/catalog/viewCategory?categoryId=${product.categoryId}`}>
                    Return to <span>{product.categoryId}</span>
                </a>
            </div>

            <div id="Catalog">
                <h2>{product.productName}</h2>

                <table id="register_table">
                    <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Product ID</th>
                        <th>Description</th>
                        <th>List Price</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    {product.itemList.map(item => (
                        <tr key={item.itemId}>
                            <td>
                                <a
                                    href="#"
                                    onClick={(e) => {
                                        e.preventDefault();
                                        navigate(`/catalog/viewItem?itemId=${item.itemId}`);
                                    }}
                                >
                                    {item.itemId}
                                </a>
                            </td>
                            <td>{product.productId}</td>
                            <td>{item.attribute1}</td>
                            <td>${item.listPrice.toFixed(2)}</td>
                            <td>
                                <a

                                    onClick={() => handleAddToCart(item.itemId)}
                                    className="Button"
                                >
                                    Add to Cart
                                </a>
                            </td>
                        </tr>
                    ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default Product;
