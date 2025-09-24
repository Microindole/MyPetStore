import React from 'react';
import { useLocation, Link } from 'react-router-dom';

const ConfirmOrder = () => {
    const { state: order } = useLocation();

    return (
        <div>
            <div id="BackLink">
                <Link to="/catalog/index">Return to Main Menu</Link>
            </div>

            <div id="Catalog">
                <p>Please confirm the information below and then press continue...</p>
                <form action="/order/viewOrder" method="get">
                    <table id="register_table">
                        <thead>
                        <tr>
                            <th colSpan="2"><b>Order</b></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr><th colSpan="2">Billing Address</th></tr>
                        <tr><td>First name:</td><td>{order.billToFirstname}</td></tr>
                        <tr><td>Last name:</td><td>{order.billToLastname}</td></tr>
                        <tr><td>Address 1:</td><td>{order.billAddr1}</td></tr>
                        <tr><td>Address 2:</td><td>{order.billAddr2}</td></tr>
                        <tr><td>City:</td><td>{order.billCity}</td></tr>
                        <tr><td>State:</td><td>{order.billState}</td></tr>
                        <tr><td>Zip:</td><td>{order.billZip}</td></tr>
                        <tr><td>Country:</td><td>{order.billCountry}</td></tr>

                        <tr><th colSpan="2">Shipping Address</th></tr>
                        <tr><td>First name:</td><td>{order.shipToFirstname}</td></tr>
                        <tr><td>Last name:</td><td>{order.shipToLastname}</td></tr>
                        <tr><td>Address 1:</td><td>{order.shipAddr1}</td></tr>
                        <tr><td>Address 2:</td><td>{order.shipAddr2}</td></tr>
                        <tr><td>City:</td><td>{order.shipCity}</td></tr>
                        <tr><td>State:</td><td>{order.shipState}</td></tr>
                        <tr><td>Zip:</td><td>{order.shipZip}</td></tr>
                        <tr><td>Country:</td><td>{order.shipCountry}</td></tr>
                        </tbody>
                    </table>

                    <input type="submit" name="viewOrder" value="Confirm" />
                </form>
            </div>
        </div>
    );
};

export default ConfirmOrder;
