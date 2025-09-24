import React, { useEffect, useState } from "react";
import { useContext } from "react";
import { UserContext } from "/src/context/UserContext";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const GitHubCallback = () => {
    const navigate = useNavigate();
    const [isLoginSuccessful, setIsLoginSuccessful] = useState(false); // 登录状态
    const [errorMessage, setErrorMessage] = useState(""); // 错误消息
    const { setUsername } = useContext(UserContext);

    useEffect(() => {
        // 获取 URL 中的查询参数
        const queryParams = new URLSearchParams(window.location.search);
        const token = queryParams.get("token");
        const username = queryParams.get("username");

        if (!token || token === "null") {
            // 如果 token 不存在或为 "null"，提示用户以 username 注册账号
            alert(`未检测到有效的登录令牌，请以用户名 "${username}" 注册一个账号！`);
            navigate("/account/register"); // 跳转到注册页面并传递用户名
            return;
        }

        // 保存 token 到本地存储
        localStorage.setItem("token", token);

        const fetchUserData = async () => {
            try {
                console.log("Token:", token);
                const response = await axios.post(
                    "/api/account",
                    null,
                    {
                        headers: {
                            Authorization: `${token}`, // 确保添加 Bearer 前缀
                        },
                        withCredentials: true,
                    }
                );
                if (response.data.status === 0) {
                    setIsLoginSuccessful(true); // 登录成功
                    const thisname = response.data.data.username; // 假设后端返回 { username: "JohnDoe" }
                    setUsername(thisname);
                } else {
                    alert("无法获取用户信息，请稍后再试！");
                }
            } catch (error) {
                console.error("获取用户信息失败：", error);
                setErrorMessage("登录过程中发生错误，请稍后再试！");
            }
        };

        // 调用 fetchUserData
        fetchUserData();
    }, [navigate, setUsername]);

    const handleCompleteLogin = () => {
        navigate("/catalog/index"); // 跳转到主页
    };

    return (
        <div style={{ textAlign: "center", marginTop: "50px" }}>
            {isLoginSuccessful ? (
                <div>
                    <h2>登录成功！</h2>
                    <button
                        onClick={handleCompleteLogin}
                        style={{
                            padding: "10px 20px",
                            fontSize: "16px",
                            backgroundColor: "#4CAF50",
                            color: "white",
                            border: "none",
                            borderRadius: "5px",
                            cursor: "pointer",
                        }}
                    >
                        完成登录
                    </button>
                </div>
            ) : errorMessage ? (
                <div>
                    <h2>登录失败</h2>
                    <p>{errorMessage}</p>
                    <button
                        onClick={() => navigate("/account/login")}
                        style={{
                            padding: "10px 20px",
                            fontSize: "16px",
                            backgroundColor: "#f44336",
                            color: "white",
                            border: "none",
                            borderRadius: "5px",
                            cursor: "pointer",
                        }}
                    >
                        返回登录页面
                    </button>
                </div>
            ) : (
                <div>
                    <h2>正在处理登录，请稍候...</h2>
                </div>
            )}
        </div>
    );
};

export default GitHubCallback;