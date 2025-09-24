import axios from "axios";

// 创建 Axios 实例
const axiosInstance = axios.create({
    baseURL: "http://localhost:8070", // 后端 API 的基础 URL
    timeout: 5000, // 请求超时时间
});

// 添加请求拦截器
axiosInstance.interceptors.request.use(
    (config) => {
        // 从 localStorage 中获取 token
        const token = localStorage.getItem("token");
        if (token) {
            // 在请求头中添加 Authorization
            config.headers["Authorization"] = `Bearer ${token}`;
        }
        return config;
    },
    (error) => {
        // 请求错误处理
        return Promise.reject(error);
    }
);

// 添加响应拦截器（可选）
axiosInstance.interceptors.response.use(
    (response) => {
        // 对响应数据进行处理
        return response;
    },
    (error) => {
        // 响应错误处理
        if (error.response && error.response.status === 401) {
            console.error("Unauthorized: Please log in again.");
            // 可以在这里跳转到登录页面
        }
        return Promise.reject(error);
    }
);

export default axiosInstance;