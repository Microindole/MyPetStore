import React, { useEffect, useState } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';

const Search = () => {
    const [searchParams] = useSearchParams();
    const keyword = searchParams.get('keyword');
    const [searchList, setSearchList] = useState([]);
    const [loading, setLoading] = useState(false);
    const [errorMsg, setErrorMsg] = useState('');
    const navigate = useNavigate();

    // 分页参数
    const [currentPage, setCurrentPage] = useState(1);
    const pageSize = 5; // 每页显示的条数

    // 计算总页数
    const totalPages = Math.ceil(searchList.length / pageSize);

    useEffect(() => {
        if (keyword) {
            setLoading(true);
            fetch(`http://localhost:8070/api/catalog/products/${keyword}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                }
            })
                .then(res => res.json())
                .then(data => {
                    if (data.status === 0) {
                        setSearchList(data.data);
                        setErrorMsg('');
                        setCurrentPage(1); // 每次新搜索返回第一页
                    } else {
                        setErrorMsg('搜索失败：' + data.msg);
                        setSearchList([]);
                    }
                })
                .catch(err => {
                    setErrorMsg('请求错误：' + err.message);
                    setSearchList([]);
                })
                .finally(() => {
                    setLoading(false);
                });
        }
    }, [keyword]);

    const handleProductClick = (productId) => {
        navigate(`/catalog/viewProduct?productId=${productId}`);
    };

    // 获取当前页数据
    const currentData = searchList.slice((currentPage - 1) * pageSize, currentPage * pageSize);

    // 分页组件
    const renderPagination = () => {
        if (totalPages <= 1) return null;

        const pages = [];
        for (let i = 1; i <= totalPages; i++) {
            pages.push(
                <button
                    key={i}
                    onClick={() => setCurrentPage(i)}
                    style={{
                        margin: '0 5px',
                        padding: '5px 10px',
                        backgroundColor: i === currentPage ? '#007BFF' : '#f0f0f0',
                        color: i === currentPage ? '#fff' : '#000',
                        border: 'none',
                        borderRadius: '4px',
                        cursor: 'pointer',
                    }}
                >
                    {i}
                </button>
            );
        }

        return (
            <div style={{ marginTop: '20px', textAlign: 'center' }}>
                <button
                    disabled={currentPage === 1}
                    onClick={() => setCurrentPage(prev => Math.max(1, prev - 1))}
                    style={{ marginRight: '10px' }}
                >
                    上一页
                </button>
                {pages}
                <button
                    disabled={currentPage === totalPages}
                    onClick={() => setCurrentPage(prev => Math.min(totalPages, prev + 1))}
                    style={{ marginLeft: '10px' }}
                >
                    下一页
                </button>
            </div>
        );
    };

    return (
        <div id="Content">
            <div id="BackLink">
                <a href="/catalog/index">Return to Main Menu</a>
            </div>

            <div id="Catalog">
                <h2>Search Results for: {keyword}</h2>

                {loading && <p>🔍 正在搜索中，请稍候...</p>}
                {errorMsg && <p style={{ color: 'red' }}>{errorMsg}</p>}

                {!loading && currentData.length === 0 && !errorMsg && (
                    <p>未找到与“{keyword}”相关的产品。</p>
                )}

                {currentData.length > 0 && (
                    <>
                        <table id="register_table" border="1" cellPadding="10">
                            <thead>
                            <tr>
                                <th>Image</th>
                                <th>Product ID</th>
                                <th>Name</th>
                                <th>Description</th>
                            </tr>
                            </thead>
                            <tbody>
                            {currentData.map((item) => (
                                <tr key={item.searchId}>
                                    <td>
                                        <img
                                            src={`/${item.descriptionImage}`}
                                            alt={item.searchName}
                                            width="125"
                                            height="125"
                                            style={{ cursor: 'pointer' }}
                                            onClick={() => handleProductClick(item.searchId)}
                                        />
                                    </td>
                                    <td>
                                        <a
                                            href="#"
                                            onClick={(e) => {
                                                e.preventDefault();
                                                handleProductClick(item.searchId);
                                            }}
                                            style={{ color: 'black' }}
                                        >
                                            {item.searchId}
                                        </a>
                                    </td>
                                    <td>{item.searchName}</td>
                                    <td>{item.descriptionText}</td>
                                </tr>
                            ))}
                            </tbody>
                        </table>
                        {renderPagination()}
                    </>
                )}
            </div>
        </div>
    );
};

export default Search;
