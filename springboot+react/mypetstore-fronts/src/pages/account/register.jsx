import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import TopBar from "../common/top";
import BottomBar from "../common/bottom";
import axios from "axios";
import "/src/css/register.css";

const generateCaptcha = () => {
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    let captcha = "";
    for (let i = 0; i < 6; i++) {
        captcha += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return captcha;
};

const Register = () => {
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

        if (captchaInput !== captcha) {
            alert("验证码错误，请重新输入！");
            setCaptcha(generateCaptcha());
            return;
        }

        try {
            const response = await axios.post(
                "/api/account/info", {
                ...formData,
                captcha: captchaInput,
            });

            if (response.data.status === 0) {
                alert("注册成功！");
                setFormData({
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
                setCaptchaInput("");
                setCaptcha(generateCaptcha());

                // 跳转到 /catalog/index
                setTimeout(() => {
                    navigate("/catalog/index");
                }, 500);
            } else {
                alert(response.data.message || "注册失败，请重试！");
                setCaptcha(generateCaptcha());
            }
        } catch (error) {
            console.error("注册失败:", error);
            alert("注册过程中发生错误，请稍后再试！");
            setCaptcha(generateCaptcha());
        }
    };

    return (
        <div id="Content">

            <div className="register-container">
                <form className="register-form" onSubmit={handleSubmit}>
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
                            onChange={handleInputChange}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="password">New Password:</label>
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
                    <div className="form-group">
                        <label>
                            <input
                                type="checkbox"
                                name="myListOpt"
                                checked={formData.myListOpt === 1}
                                onChange={handleInputChange}
                            />
                            Enable MyList
                        </label>
                    </div>
                    <div className="form-group">
                        <label>
                            <input
                                type="checkbox"
                                name="bannerOpt"
                                checked={formData.bannerOpt === 1}
                                onChange={handleInputChange}
                            />
                            Enable MyBanner
                        </label>
                    </div>
                    <div className="form-group">
                        <label htmlFor="captchaInput">Captcha:</label>
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
                            id="captchaInput"
                            name="captchaInput"
                            value={captchaInput}
                            onChange={(e) => setCaptchaInput(e.target.value)}
                            placeholder="Enter the captcha"
                            required
                        />
                    </div>
                    <button type="submit" className="register-button">
                        Register
                    </button>
                </form>
            </div>

        </div>
    );
};

export default Register;