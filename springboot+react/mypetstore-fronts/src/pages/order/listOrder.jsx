// src/pages/OrderList.jsx
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const ListOrder = () => {
    const [orders, setOrders] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchOrders = async () => {
            try {
                const token = localStorage.getItem('token');
                const response = await axios.get('/api/order/lists', {
                    headers: {
                        Authorization: token
                    }
                });

                // 你的后端返回的是 CommonResponse<List<Order>>
                // 所以数据在 response.data.data
                setOrders(response.data.data);
            } catch (error) {
                console.error('获取订单失败:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchOrders();
    }, []);

    return (
        <div className="order-list-container">

            <div id="BackLink">
                <Link to="/catalog/index">Return to Main Menu</Link>
            </div>

            <div id="Catalog">
                <h2>My Orders</h2>

                {loading ? (
                    <p>Loading...</p>
                ) : (
                    <table id="register_table">
                        <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Total Price</th>
                        </tr>
                        </thead>
                        <tbody>
                        {orders.map((order) => (
                            <tr key={order.orderId}>
                                <td>
                                    <Link to={`/viewOrder?orderId=${order.orderId}`}>
                                        {order.orderId}
                                    </Link>
                                </td>
                                <td>{order.orderDate.substring(0, 10)}</td>
                                <td>{order.totalPrice}</td>
                            </tr>
                        ))}
                        </tbody>
                    </table>
                )}

                <div id="Separator">&nbsp;</div>
            </div>
        </div>
    );
};

export default ListOrder;
