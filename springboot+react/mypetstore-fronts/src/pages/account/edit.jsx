import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import TopBar from "../common/top";
import BottomBar from "../common/bottom";
import axios from "axios";
import "/src/css/mypetstore.css";
import "/src/css/edit.css";

const generateCaptcha = () => {
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    let captcha = "";
    for (let i = 0; i < 6; i++) {
        captcha += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return captcha;
};
const EditAccount = () => {
    const navigate = useNavigate();
    const [formData, setFormData] = useState({
        username: "",
        password: "",
        email: "",
        firstName: "",
        lastName: "",
        address1: "",
        address2: "",
        city: "",
        state: "",
        zip: "",
        country: "",
        phone: "",
        langPref: "english",
        favoriteGory: "BIRDS",
        myListOpt: 1,
        bannerOpt: 1,
        status: "OK",
    });
    const [captcha, setCaptcha] = useState(generateCaptcha());
    const [captchaInput, setCaptchaInput] = useState("");

    const handleInputChange = (e) => {
        const { name, value, type, checked } = e.target;
        setFormData({
            ...formData,
            [name]: type === "checkbox" ? (checked ? 1 : 0) : value,
        });
    };

    // 从后端获取用户原有信息
    const fetchUserData = async () => {
        try {
            const token = localStorage.getItem("token");
            console.log("Token:", token);
            const response = await axios.post(
                "/api/account",
                null,
                {
                    headers: {
                        Authorization: `${token}`
                    },
                    withCredentials: true,
                });
            if (response.data.status === 0) {
                setFormData(response.data.data); // 将用户原有信息填入表单
                console.log("用户信息:", response.data.data);
            } else {
                alert("无法获取用户信息，请稍后再试！");
            }
        } catch (error) {
            console.error("获取用户信息失败:", error);
            alert("获取用户信息失败，请稍后再试！");
        }
    };
    useEffect(() => {
        fetchUserData();
    }, []);
    const validateForm = () => {
        const requiredFields = [
            "username",
            "password",
            "email",
            "firstName",
            "lastName",
            "address1",
            "city",
            "state",
            "zip",
            "country",
            "phone",
            "langPref",
        ];
        for (const field of requiredFields) {
            if (!formData[field]) {
                alert(`字段 "${field}" 不能为空！`);
                return false;
            }
        }
        return true;
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!validateForm()) {
            return;
        }
        // if (captchaInput !== captcha) {
        //     alert("验证码错误，请重新输入！");
        //     setCaptcha(generateCaptcha());
        //     return;
        // }
        try {
            const token = localStorage.getItem("token"); // 假设 token 存储在 localStorage 中
            console.log("Token:", token);
            const response = await axios.post(
                "/api/account/edit",
                { ...formData },
                {
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `${token}`, // 添加 Authorization 头
                    },
                    withCredentials: true,
                }
            );
            console.log("提交的数据:", { ...formData });
            if (response.data.status === 0) {
                alert("用户信息更新成功");
                setTimeout(() => {
                    navigate("/catalog/index"); // 跳转到主界面
                }, 500); // 延迟 500 毫秒后跳转
            } else {
                alert(response.data.msg || "用户信息修改失败，请重试！");
                // setCaptcha(generateCaptcha());
            }
        } catch (error) {
            console.error("用户信息修改失败:", error);
            if (error.response) {
                if (error.response.status === 401) {
                    alert("用户未登录或登录已过期，请重新登录！");
                    // navigate("/login"); // 跳转到登录页面
                } else {
                    alert(error.response.data.msg || "用户信息修改失败，请稍后再试！");
                }
            } else if (error.request) {
                alert("无法连接到服务器，请检查网络连接！");
            } else {
                alert("发生未知错误，请稍后再试！");
            }
            setCaptcha(generateCaptcha());
        }
    }

    return (
        <div id="Content">

            <div className="editAccount-container">
                <form className="editAccount-form" onSubmit={handleSubmit}>
                    <div className="form-header">
                        <h3>User Information</h3>
                        <button
                            type="button"
                            className="return-button"
                            onClick={() => navigate("/catalog/index")}
                        >
                            Back to Main
                        </button>
                    </div>

                    <div className="form-group">
                        <label htmlFor="username">User ID:</label>
                        <input
                            type="text"
                            id="username"
                            name="username"
                            value={formData.username}
                            readOnly // 设置为只读
                            className="readonly-input" // 添加只读样式类
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="password">Password:</label>
                        <input
                            type="password"
                            id="password"
                            name="password"
                            value={formData.password}
                            onChange={handleInputChange}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="email">Email:</label>
                        <input
                            type="email"
                            id="email"
                            name="email"
                            value={formData.email}
                            onChange={handleInputChange}
                            required
                        />
                    </div>
                    <div className="form-group-row">
                        <div className="form-group">
                            <label htmlFor="firstName">First Name:</label>
                            <input
                                type="text"
                                id="firstName"
                                name="firstName"
                                value={formData.firstName}
                                onChange={handleInputChange}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label htmlFor="lastName">Last Name:</label>
                            <input
                                type="text"
                                id="lastName"
                                name="lastName"
                                value={formData.lastName}
                                onChange={handleInputChange}
                                required
                            />
                        </div>
                    </div>
                    <div className="form-group-row">
                        <div className="form-group">
                            <label htmlFor="address1">Address 1:</label>
                            <input
                                type="text"
                                id="address1"
                                name="address1"
                                value={formData.address1}
                                onChange={handleInputChange}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label htmlFor="phone">Phone:</label>
                            <input
                                type="text"
                                id="phone"
                                name="phone"
                                value={formData.phone}
                                onChange={handleInputChange}
                                required
                            />
                        </div>
                    </div>
                    <div className="form-group-row">
                        <div className="form-group">
                            <label htmlFor="city">City:</label>
                            <input
                                type="text"
                                id="city"
                                name="city"
                                value={formData.city}
                                onChange={handleInputChange}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label htmlFor="state">State:</label>
                            <input
                                type="text"
                                id="state"
                                name="state"
                                value={formData.state}
                                onChange={handleInputChange}
                                required
                            />
                        </div>
                    </div>
                    <div className="form-group-row">
                        <div className="form-group">
                            <label htmlFor="zip">Zip:</label>
                            <input
                                type="text"
                                id="zip"
                                name="zip"
                                value={formData.zip}
                                onChange={handleInputChange}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label htmlFor="country">Country:</label>
                            <input
                                type="text"
                                id="country"
                                name="country"
                                value={formData.country}
                                onChange={handleInputChange}
                                required
                            />
                        </div>
                    </div>
                    <h3>Profile Information</h3>
                    <div className="form-group">
                        <label htmlFor="langPref">Language Preference:</label>
                        <select
                            id="langPref"
                            name="langPref"
                            value={formData.langPref}
                            onChange={handleInputChange}
                            required
                        >
                            <option value="english">English</option>
                            <option value="spanish">Spanish</option>
                            <option value="french">French</option>
                            <option value="chinese">Chinese</option>
                            <option value="japanese">Japanese</option>
                            <option value="korean">Korean</option>
                        </select>
                    </div>
                    <div className="form-group">
                        <label htmlFor="favoriteGory">Favourite Category:</label>
                        <select
                            id="favoriteGory"
                            name="favoriteGory"
                            value={formData.favoriteGory}
                            onChange={handleInputChange}
                        >
                            <option value="BIRDS">Birds</option>
                            <option value="DOGS">Dogs</option>
                            <option value="CATS">Cats</option>
                            <option value="FISH">Fish</option>
                            <option value="REPTILES">Reptiles</option>
                        </select>
                    </div>
                    <div className="form-group checkbox-group">
                        <label htmlFor="myListOpt">
                        MyList
                            <input
                                type="checkbox"
                                name="myListOpt"
                                id="myListOpt"
                                checked={formData.myListOpt === 1}
                                onChange={handleInputChange}
                            />
                        </label>
                        <label htmlFor="bannerOpt">
                        MyBanner
                            <input
                                type="checkbox"
                                name="bannerOpt"
                                id="bannerOpt"
                                checked={formData.bannerOpt === 1}
                                onChange={handleInputChange}
                            />
                        </label>
                    </div>

                    <button type="submit" className="editAccount-button">
                        EditAccount
                    </button>

                </form>

            </div>

        </div>

    );

};
export default EditAccount;
