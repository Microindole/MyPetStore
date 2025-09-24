import React, { useEffect, useState } from 'react';
import { useSearchParams } from 'react-router-dom';
import axios from 'axios';


const ViewOrder = () => {
    const [searchParams] = useSearchParams();
    const orderId = searchParams.get('orderId');
    const [order, setOrder] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchOrder = async () => {
            try {
                const token = localStorage.getItem('token');
                const response = await axios.get(`/api/order/lists/${orderId}`, {
                    headers: {
                        Authorization: token,
                    },
                });
                setOrder(response.data.data);
            } catch (error) {
                console.error('获取订单详情失败:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchOrder();
    }, [orderId]);

    if (loading) return <p>Loading...</p>;
    if (!order) return <p>未找到订单信息</p>;

    return (
        <div>

            <div id="BackLink">
                <a href="/catalog/index">Return to Main Menu</a>
            </div>

            <div id="Catalog">

                <table id="register_table">
                    <tbody>
                    <tr>
                        <th colSpan="2">Order #{order.orderId}</th>
                    </tr>
                    <tr>
                        <th colSpan="2">Payment Details</th>
                    </tr>
                    <tr>
                        <td>Card Type:</td>
                        <td>{order.cardType}</td>
                    </tr>
                    <tr>
                        <td>Card Number:</td>
                        <td>{order.creditCard} * Fake number!</td>
                    </tr>
                    <tr>
                        <td>Expiry Date:</td>
                        <td>{order.expiryDate}</td>
                    </tr>

                    <tr>
                        <th colSpan="2">Billing Address</th>
                    </tr>
                    <tr>
                        <td>First name:</td>
                        <td>{order.billToFirstname}</td>
                    </tr>
                    <tr>
                        <td>Last name:</td>
                        <td>{order.billToLastname}</td>
                    </tr>
                    <tr>
                        <td>Address 1:</td>
                        <td>{order.billAddr1}</td>
                    </tr>
                    <tr>
                        <td>Address 2:</td>
                        <td>{order.billAddr2}</td>
                    </tr>
                    <tr>
                        <td>City:</td>
                        <td>{order.billCity}</td>
                    </tr>
                    <tr>
                        <td>State:</td>
                        <td>{order.billState}</td>
                    </tr>
                    <tr>
                        <td>Zip:</td>
                        <td>{order.billZip}</td>
                    </tr>
                    <tr>
                        <td>Country:</td>
                        <td>{order.billCountry}</td>
                    </tr>

                    <tr>
                        <th colSpan="2">Shipping Address</th>
                    </tr>
                    <tr>
                        <td>First name:</td>
                        <td>{order.shipToFirstname}</td>
                    </tr>
                    <tr>
                        <td>Last name:</td>
                        <td>{order.shipToLastname}</td>
                    </tr>
                    <tr>
                        <td>Address 1:</td>
                        <td>{order.shipAddr1}</td>
                    </tr>
                    <tr>
                        <td>Address 2:</td>
                        <td>{order.shipAddr2}</td>
                    </tr>
                    <tr>
                        <td>City:</td>
                        <td>{order.shipCity}</td>
                    </tr>
                    <tr>
                        <td>State:</td>
                        <td>{order.shipState}</td>
                    </tr>
                    <tr>
                        <td>Zip:</td>
                        <td>{order.shipZip}</td>
                    </tr>
                    <tr>
                        <td>Country:</td>
                        <td>{order.shipCountry}</td>
                    </tr>

                    <tr>
                        <td>Courier:</td>
                        <td>{order.courier}</td>
                    </tr>
                    <tr>
                        <td>Status:</td>
                        <td>{order.outStatus}</td>
                    </tr>
                    <tr>
                        <td>Total Price:</td>
                        <td>{order.totalPrice}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default ViewOrder;
