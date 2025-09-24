import React, { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import "/src/css/mypetstore.css";
import "/src/css/cart.css"; // 引入新的 cart.css

const Cart = () => {
    const [cartItems, setCartItems] = useState([]);
    const [subTotal, setSubTotal] = useState(0);
    const navigate = useNavigate();

    useEffect(() => {
        fetchCartData();
    }, []);

    const fetchCartData = () => {
        const token = localStorage.getItem("token");

        if (!token) {
            alert("请先登录再查看购物车");
            navigate("/account/login");
            return;
        }

        axios
            .get("/api/cart", {
                headers: {
                    Authorization: `${token}`,
                },
            })
            .then((response) => {
                const data = response.data.data;
                if (Array.isArray(data) && data.length > 0) {
                    const items = data.map((entry) => ({
                        itemId: entry.itemVO.itemId,
                        productId: entry.itemVO.productId,
                        descriptionText: entry.itemVO.descriptionText,
                        inStock: entry.inStock,
                        quantity: entry.cart.quantity,
                        listPrice: entry.itemVO.listPrice,
                        total: entry.total,
                    }));
                    setCartItems(items);
                    setSubTotal(items.reduce((sum, item) => sum + item.total, 0));
                } else {
                    setCartItems([]);
                    setSubTotal(0);
                }
            })
            .catch((error) => {
                console.error("Error fetching cart data:", error);
                setCartItems([]);
                setSubTotal(0);
            });
    };

    const handleQuantityChange = (itemId, newQuantity) => {
        if (newQuantity > 0) {
            const token = localStorage.getItem("token");

            if (!token) {
                alert("请先登录！");
                return;
            }

            const updatedItems = cartItems.map((item) =>
                item.itemId === itemId
                    ? { ...item, quantity: newQuantity, total: newQuantity * item.listPrice }
                    : item
            );
            setCartItems(updatedItems);
            setSubTotal(updatedItems.reduce((sum, item) => sum + item.total, 0));

            axios
                .post(
                    "/api/cart",
                    null,
                    {
                        params: {
                            itemId: itemId,
                            quantity: newQuantity,
                        },
                        headers: {
                            Authorization: `${token}`,
                        },
                    }
                )
                .then(() => {
                    console.log("购物车更新成功");
                })
                .catch((error) => {
                    console.error("Error updating cart item:", error);
                    alert("更新购物车失败，请重试！");
                });
        }
    };

    const handleQuantityBlur = (itemId, quantity) => {
        if (!quantity || quantity <= 0) {
            handleRemoveItem(itemId); // 调用删除物品的函数
        }
    };

    const handleRemoveItem = (itemId) => {
        const token = localStorage.getItem("token");

        if (!token) {
            alert("请先登录！");
            return;
        }

        axios
            .delete(`/api/cart/${itemId}`, {
                headers: {
                    Authorization: `${token}`,
                },
            })
            .then(() => {
                fetchCartData();
            })
            .catch((error) => console.error("Error removing item from cart:", error));
    };

    const handleCheckout = () => {
        // 检查是否有商品的数量超过库存
        const outOfStockItems = cartItems.filter(item => item.quantity > item.inStock);

        if (outOfStockItems.length > 0) {
            // 弹出提示，列出库存不足的商品
            const itemId = outOfStockItems.map(item => item.itemId).join(", ");
            alert(`以下商品库存不足：${itemId}\n请调整数量或删除这些商品。`);
        } else {
            // 跳转到结账页面
            navigate("/order/newOrder");
        }
    };

    return (
        <div id="Catalog">
            {/* 返回主页按钮 */}
            <div className="cart-header">
                <button
                    type="button"
                    className="return-button"
                    onClick={() => navigate("/catalog/index")}
                >
                    Back to Main
                </button>
            </div>

            <div id="Cart">
                <h2>Shopping Cart</h2>
                <form onSubmit={(e) => e.preventDefault()}>
                    <table id="register_table">
                        <thead>
                            <tr>
                                <th><b>Item ID</b></th>
                                <th><b>Product ID</b></th>
                                <th><b>Description</b></th>
                                <th><b>In Stock?</b></th>
                                <th><b>Quantity</b></th>
                                <th><b>List Price</b></th>
                                <th><b>Total Cost</b></th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            {cartItems.length === 0 ? (
                                <tr>
                                    <td colSpan="8"><b>Your cart is empty.</b></td>
                                </tr>
                            ) : (
                                cartItems.map((item) => (
                                    <tr key={item.itemId}>
                                        <td>
                                            <Link to={`/catalog/viewItem?itemId=${item.itemId}`}>
                                                {item.itemId}
                                            </Link>
                                        </td>
                                        <td>{item.productId}</td>
                                        <td>{item.descriptionText}</td>
                                        <td
                                            className={
                                                item.quantity > item.inStock
                                                    ? "out-of-stock"
                                                    : ""
                                            }
                                        >
                                            {item.inStock}
                                        </td>
                                        <td>
                                            <input
                                                type="number"
                                                value={item.quantity}
                                                min="1"
                                                onBlur={(e) =>
                                                    handleQuantityBlur(item.itemId, parseInt(e.target.value, 10))
                                                }
                                                onChange={(e) =>
                                                    handleQuantityChange(item.itemId, parseInt(e.target.value, 10))
                                                }
                                            />
                                        </td>
                                        <td>${item.listPrice.toFixed(2)}</td>
                                        <td>${item.total.toFixed(2)}</td>
                                        <td>
                                            <button
                                                type="button"
                                                onClick={() => handleRemoveItem(item.itemId)}
                                            >
                                                Remove
                                            </button>
                                        </td>
                                    </tr>
                                ))
                            )}
                            {subTotal > 0 && (
                                <tr>
                                    <td colSpan="6" style={{ textAlign: "right" }}>
                                        <b>Sub Total:</b>
                                    </td>
                                    <td colSpan="2">
                                        <b>${subTotal.toFixed(2)}</b>
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </form>
                {subTotal > 0 && (
                    <button className="Button" onClick={handleCheckout}>
                        Proceed To Checkout
                    </button>
                )}
            </div>
            <div id="Separator">&nbsp;</div>
        </div>
    );
};

export default Cart;
