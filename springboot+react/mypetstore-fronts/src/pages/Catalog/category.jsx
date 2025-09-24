import React, { useEffect, useState } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';

const Category = () => {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();
    const categoryId = searchParams.get('categoryId');
    const [category, setCategory] = useState(null);

    useEffect(() => {
        if (categoryId) {
            fetch(`/api/catalog/categories/${categoryId}`)
                .then(res => res.json())
                .then(data => {
                    if (data.status === 0) {
                        setCategory(data.data);
                    } else {
                        console.error('加载分类失败：', data.msg);
                    }
                })
                .catch(err => console.error('请求错误：', err));
        }
    }, [categoryId]);

    const handleProductClick = (productId) => {
        navigate(`/catalog/viewProduct?productId=${productId}`);
    };

    if (!category) return <div>Loading...</div>;

    return (
        <div id="Catalog">
            <div id="BackLink">
                <a href="/catalog/index">Return to Main Menu</a>
            </div>

            <div>
                <h2>{category.categoryName}</h2>

                <table id="register_table">
                    <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                    </tr>
                    </thead>
                    <tbody>
                    {category.productList.map(product => (
                        <tr key={product.productId}>
                            <td>
                                <a
                                    href="#"
                                    onClick={(e) => {
                                        e.preventDefault();
                                        handleProductClick(product.productId);
                                    }}
                                >
                                    {product.productId}
                                </a>
                            </td>
                            <td>{product.name}</td>
                        </tr>
                    ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default Category;
