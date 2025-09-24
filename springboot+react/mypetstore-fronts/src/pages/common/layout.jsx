// src/layout/Layout.jsx
import React from 'react';
import { Outlet } from 'react-router-dom';
import TopBar from '../common/top.jsx';
import BottomBar from "./bottom.jsx";

const Layout = () => {
    const token = localStorage.getItem('token');
    const username = token ? JSON.parse(atob(token.split('.')[1])).username : null; // 简单解析JWT

    return (
        <>
            <TopBar username={username} />
            <main style={{ padding: '20px' }}>
                <Outlet /> {}
            </main>
            <BottomBar />
        </>
    );
};

export default Layout;
