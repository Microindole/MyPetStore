
import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';


export default function NewOrder() {
    const [step, setStep] = useState('form');
    const [activeTab, setActiveTab] = useState('payment');// 'form' 或 'confirm'
    const [formData, setFormData] = useState({
        cardType: "Visa",
        creditCard: "",
        expiryDate: "",
        billToFirstname: "",
        billToLastname: "",
        billAddr1: "",
        billAddr2: "",
        billCity: "",
        billState: "",
        billZip: "",
        billCountry: "",
        courier: "UPS",
        shipToFirstname: "",
        shipToLastname: "",
        shipAddr1: "",
        shipAddr2: "",
        shipCity: "",
        shipState: "",
        shipZip: "",
        shipCountry: "",
        totalPrice: "",
        locale: "CA",
        outStatus: "NP",
        userId: "",
        orderDate: ""
    });

    const [subtotal, setSubtotal] = useState(0);
    const [cartItems, setCartItems] = useState([]);
    const token = localStorage.getItem('token');
    const username = localStorage.getItem('username');
    const navigate = useNavigate();
    useEffect(() => {
        fetch('/api/cart', {
            headers: { 'Authorization': `${token}` }
        })
            .then(res => res.json())
            .then(data => {
                if (data.status === 0) {
                    const total = data.data.reduce((sum, item) => sum + item.total, 0);
                    setSubtotal(total.toFixed(2));
                    setFormData(prev => ({
                        ...prev,
                        totalPrice: total.toFixed(2),
                        userId: username || ''
                    }));
                    setCartItems(data.data);
                }
            })
            .catch(err => console.error('Error fetching cart:', err));
    }, [token, username]);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleNext = (e) => {
        e.preventDefault();
        setStep('confirm');
    };

    const handleConfirm = async () => {
        try {
            const res = await fetch('/api/order', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `${token}`
                },
                body: JSON.stringify(formData),
            });
            if (res.ok) {
                const result = await res.json();
                const orderId = result.data.orderId;
                console.log("订单创建返回结果：", result);
                console.log("获取的 orderId：", orderId);
                if (result.status === 0 && result.data?.orderId) {
                    alert('订单提交成功！');
                    await fetch(`/api/order/${orderId}`, {
                        method: 'GET',
                        headers: {
                            'Authorization': `${token}`
                        }
                    });
                    await Promise.all(
                        cartItems.map(item =>
                            fetch(`/api/cart/${item.cart.itemId}`, {
                                method: 'DELETE',
                                headers: {
                                    'Authorization': `${token}`
                                }
                            })
                        )
                    );

                    navigate(`/viewOrder?orderId=${result.data.orderId}`);
                } else {
                    alert('订单提交失败：后端未返回订单 ID。');
                }
            } else {
                alert('订单提交失败。');

            }
        } catch (err) {
            alert('提交时发生错误。');
        }
    };

    const fieldLabels = {
        billToFirstname: 'First Name',
        billToLastname: 'Last Name',
        billAddr1: 'Address1',
        billAddr2: 'Address2',
        billCity: 'City',
        billState: 'State',
        billZip: 'Zip',
        billCountry: 'Country',
        shipToFirstname: 'First Name',
        shipToLastname: 'Last Name',
        shipAddr1: 'Address1',
        shipAddr2: 'Address2',
        shipCity: 'City',
        shipState: 'State',
        shipZip: 'Zip',
        totalPrice: 'Total Price'
    };
    return (
        <div style={{ padding: '20px' }}>
            {step === 'form' ? (
                <form  onSubmit={handleNext}>
                    <div style={{ marginBottom: '20px' }}>
                        <button
                            type="button"
                            onClick={() => setActiveTab('payment')}
                            style={{
                                marginRight: '12px',
                                padding: '14px 28px',
                                fontSize: '16px',
                                backgroundColor: activeTab === 'payment' ? '#2e8e46' : '#e0e0e0',
                                color: activeTab === 'payment' ? 'white' : 'black',
                                border: 'none',
                                borderRadius: '8px'
                            }}
                        >
                            Payment Information
                        </button>
                        <button
                            type="button"
                            onClick={() => setActiveTab('shipping')}
                            style={{
                                padding: '14px 28px',
                                fontSize: '16px',
                                backgroundColor: activeTab === 'shipping' ? '#2e8e46' : '#e0e0e0',
                                color: activeTab === 'shipping' ? 'white' : 'black',
                                border: 'none',
                                borderRadius: '8px'
                            }}
                        >
                            Shipping Address
                        </button>
                    </div>
                    {activeTab === 'payment' && (
                        <div className="tab">

                            <table id="register_table">
                                <tbody>
                                <tr>
                                    <td className="custom-h4">Payment Details</td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Card Type:</td>
                                    <td>
                                        <select name="cardType" value={formData.cardType} onChange={handleChange}>
                                            <option value="Visa">Visa</option>
                                            <option value="wechat">WeChat</option>
                                            <option value="alipay">Alipay</option>
                                            <option value="others">Others</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Card Number:</td>
                                    <td>
                                        <input name="creditCard" value={formData.creditCard} onChange={handleChange} />
                                    </td>
                                </tr>
                                </tbody>




                                <tbody>
                                <tr>
                                    <td className="custom-h4">Billing Address</td>
                                </tr>
                                </tbody>

                                <tbody>
                                <tr>
                                    <td>First name:</td>
                                    <td>
                                        <input name="billToFirstname" value={formData.billToFirstname} onChange={handleChange} />
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Last name:</td>
                                    <td>
                                        <input name="billToLastname" value={formData.billToLastname} onChange={handleChange} />
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Address 1:</td>
                                    <td>
                                        <input name="billAddr1" value={formData.billAddr1} onChange={handleChange} />
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Address 2:</td>
                                    <td>
                                        <input name="billAddr2" value={formData.billAddr2} onChange={handleChange}  />
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>City:</td>
                                    <td>
                                        <input name="billCity" value={formData.billCity} onChange={handleChange}  />
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>State:</td>
                                    <td>
                                        <input name="billState" value={formData.billState} onChange={handleChange}/>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Zip:</td>
                                    <td>
                                        <input name="billZip" value={formData.billZip} onChange={handleChange} />
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Country:</td>
                                    <td>
                                        <input name="billCountry" value={formData.billCountry} onChange={handleChange} />
                                    </td>
                                </tr>

                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Courier:</td>
                                    <td>
                                        <input name="courier" value={formData.courier} onChange={handleChange} />
                                    </td>
                                </tr>
                                </tbody>

                            </table>
                            {/*<div>
                            <label>Ship to different address?</label>
                            <input type="checkbox" name="shippingAddressRequired" checked={formData.shippingAddressRequired} onChange={handleChange} />
                        </div>*/}
                        </div>
                    )}

                    {activeTab === 'shipping' && (
                        <div className="tab">
                            <table id="register_table">
                                <tbody>
                                <tr>
                                    <td className="custom-h4">Shipping Address</td>
                                </tr>
                                </tbody>

                                <tbody>
                                <tr>
                                    <td>First Name:</td>
                                    <td>
                                        <input name="shipToFirstname" value={formData.shipToFirstname} onChange={handleChange} />
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Last name:</td>
                                    <td>
                                        <input name="shipToLastname" value={formData.shipToLastname} onChange={handleChange}   />
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Address 1:</td>
                                    <td>
                                        <input name="shipAddr1" value={formData.shipAddr1} onChange={handleChange} />
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Address 2:</td>
                                    <td>
                                        <input name="shipAddr2" value={formData.shipAddr2} onChange={handleChange} />
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>City:</td>
                                    <td>
                                        <input name="shipCity" value={formData.shipCity} onChange={handleChange}/>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>State:</td>
                                    <td>
                                        <input name="shipState" value={formData.shipState} onChange={handleChange}/>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Zip:</td>
                                    <td>
                                        <input name="shipZip" value={formData.shipZip} onChange={handleChange}/>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Country:</td>
                                    <td>
                                        <input name="shipCountry" value={formData.shipCountry} onChange={handleChange} />
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    )}

                    <div style={{ marginTop: '24px' }}>
                        <label>Total Price: {subtotal}</label>
                    </div>
                    <button type="submit" style={{ marginTop: '24px', padding: '10px 16px', backgroundColor: '#0d8a2e', color: 'white', border: 'none', borderRadius: '4px' }}>下一步</button>
                </form>
            ) : (
                <div>


                    <table id="register_table">
                        <tbody>
                        <tr>
                        <th colSpan="2" className="custom-h4">Please Confirm Information</th>
                        </tr>
                        </tbody>
                        <tbody>
                        <tr><th colSpan="2" style={{ textAlign: 'left', padding: '10px', background: '#f0f0f0' }}>Billing Information</th></tr>
                        {['billToFirstname', 'billToLastname', 'billAddr1', 'billAddr2','billCity', 'billState', 'billZip'].map(key => (
                            <tr key={key} >
                                <td style={{ width:'200px', padding: '10px 12px' }}>{fieldLabels[key]}:</td>
                                <td style={{ width:'200px', padding: '10px 12px' }}>{formData[key]}</td>
                            </tr>
                        ))}
                        </tbody>
                        <tbody>
                        <tr><th colSpan="2" style={{ textAlign: 'left', padding: '10px', background: '#f0f0f0' }}>Shipping Information</th></tr>
                        {['shipToFirstname', 'shipToLastname', 'shipAddr1','shipAddr2', 'shipCity', 'shipState', 'shipZip'].map(key => (
                            <tr key={key} >
                                <td style={{ width:'200px', padding: '10px 12px' }}>{fieldLabels[key]}:</td>
                                <td style={{ width:'200px', padding: '10px 12px' }}>{formData[key]}</td>
                            </tr>
                        ))}
                        </tbody>
                    </table>
                    <button onClick={() => setStep('form')} style={{  marginTop: '20px', backgroundColor: '#0d8a2e', color: 'white', padding: '10px 16px', border: 'white', borderRadius: '40px' }}>返回修改</button>
                    <button onClick={handleConfirm} style={{ marginTop: '20px', backgroundColor: '#0d8a2e', color: 'white', padding: '10px 16px', border: 'none', borderRadius: '40px' }}>确认订单</button>
                </div>
            )}
        </div>
    );
}

