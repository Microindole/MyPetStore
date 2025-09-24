import axiosInstance from "/src/utils/axiosInstance";

const IsLogin = () => {
    // 调用后端 API 获取用户名
    const getUsername = async () => {
        try {
            const response = await axiosInstance.post("/account", {}); // 不需要手动添加 Authorization
            if (response.data.status === 0) {
                const username = response.data.data.username; // 假设后端返回 { username: "JohnDoe" }
                return username;
            } else {
                console.error("Failed to fetch username");
                return null;
            }
        } catch (error) {
            console.error("Error fetching username:", error);
            return null;
        }
    };

    return { getUsername };
};

export default IsLogin;