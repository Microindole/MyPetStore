import React, { useContext, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { UserContext } from "/src/context/UserContext";

const Logout = () => {
    const { setUsername } = useContext(UserContext); // 从上下文获取 setUsername
    const navigate = useNavigate();

    useEffect(() => {
        // 清除 localStorage 中的 token
        localStorage.removeItem("token");

        // 更新全局状态，将 username 设置为 null
        setUsername(null);

        // 跳转到登录页面
        navigate("/catalog/index"); // 或者你想要跳转的其他页面
    }, [setUsername, navigate]);

    return null; // 不需要渲染任何内容
};

export default Logout;