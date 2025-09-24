import React, { useContext, useState } from "react";
import { useNavigate } from "react-router-dom";
import { UserContext } from "/src/context/UserContext";
import axios from "axios";
import "/src/css/mypetstore.css";
import "/src/css/login.css";

const generateCaptcha = () => {
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    let captcha = "";
    for (let i = 0; i < 6; i++) {
        captcha += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return captcha;
};

const Login = () => {
    const [username, setUsernameInput] = useState("");
    const [password, setPassword] = useState("");
    const [captcha, setCaptcha] = useState(generateCaptcha());
    const [captchaInput, setCaptchaInput] = useState("");
    const { setUsername } = useContext(UserContext); // 从上下文获取 setUsername
    const navigate = useNavigate();

    const handleLogin = async (e) => {
        e.preventDefault();

        if (captchaInput !== captcha) {
            alert("验证码错误，请重新输入！");
            setCaptcha(generateCaptcha()); // 重新生成验证码
            return;
        }

        try {
            const response = await axios.post(
                "/api/account/tokens",
                new URLSearchParams({ username, password }).toString(),
                {
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded",
                    },
                }
            );

            if (response.data.status === 0) {
                localStorage.setItem("token", response.data.data);
                setUsername(username);
                navigate("/catalog/index"); // 跳转到主页
            } else {
                alert("登录失败: " + response.data.msg);
            }
        } catch (error) {
            console.error("Login error:", error);
        }
    };

    const handleGitHubLogin = () => {
        window.location.href = "http://localhost:8070/api/oauth/render";
        
    };

    return (
        <div id="Catalog">
            {/* <div id="BackLink">
                <a href="/catalog/index">Return to Main Menu</a>
            </div> */}

            <div id="LoginCard">
                <h2 className="login-title">Login</h2>

                <form className="login-form" onSubmit={handleLogin}>
                    <div className="form-group">
                        <label htmlFor="username">Username</label>
                        <input
                            type="text"
                            id="username"
                            value={username}
                            onChange={(e) => setUsernameInput(e.target.value)}
                            placeholder="Enter your username"
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="password">Password</label>
                        <input
                            type="password"
                            id="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            placeholder="Enter your password"
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="captcha">Captcha</label>
                        <div className="captcha-container">
                            <span className="captcha">{captcha}</span>
                            <button
                                type="button"
                                className="refresh-captcha"
                                onClick={() => setCaptcha(generateCaptcha())}
                            >
                                Refresh
                            </button>
                        </div>
                        <input
                            type="text"
                            id="captcha"
                            value={captchaInput}
                            onChange={(e) => setCaptchaInput(e.target.value)}
                            placeholder="Enter the captcha"
                            required
                        />
                    </div>
                    <button type="submit" className="login-button">
                        Login
                    </button>
                </form>
                <button
                    className="github-login-button"
                    onClick={handleGitHubLogin}
                >
                    Login with GitHub
                </button>

                <div className="login-footer">
                    <p>
                        Need an account?{" "}
                        <a href="/account/register" className="link">
                            Register Now
                        </a>
                    </p>
                    <p>
                        Are you an administrator?{" "}
                        <a href="http://localhost:8070/admin/login" className="link">
                            Click to CMS
                        </a>
                    </p>
                </div>
                <button
                    className="back-button"
                    onClick={() => navigate("/catalog/index")}
                >
                    Back to Main
                </button>
            </div>
        </div>
    );
};

export default Login;