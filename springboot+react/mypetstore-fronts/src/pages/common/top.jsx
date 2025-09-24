import {Link, useNavigate} from "react-router-dom";
import {useContext, useState} from "react";
import {UserContext} from "../../context/UserContext.jsx";

const TopBar = () => {
    const { username } = useContext(UserContext); // 仍可用作昵称展示（可选）
    const token = localStorage.getItem('token'); // 改为用 token 判断登录状态
    const [keyword, setKeyword] = useState('');
    const navigate = useNavigate();

    const handleSearch = (e) => {
        e.preventDefault();
        if (keyword.trim() !== '') {
            navigate(`/catalog/searchProducts?keyword=${encodeURIComponent(keyword)}`);
        }
    };

    return (
        <header>
            <div id="Header">
                <div className="nav-top">
                    <div className="w">
                        <div className="user-info">
                            {token ? (
                                <span className="user logged-in">
                                    <span>
                                        Welcome here!
                                        <span className="username">{username || 'User'}</span>
                                    </span>
                                    <img className="img1" src="/images/separator.gif" alt="|"/>
                                    <Link to="/account/logout" className="link">Sign Out</Link>
                                    <img className="img1" src="/images/separator.gif" alt="|"/>
                                </span>
                            ) : (
                                <span className="user not-login">
                                    <Link to="/account/login" className="link">Sign In</Link>
                                    <img className="img1" src="/images/separator.gif" alt="|"/>
                                    <Link to="/account/register" className="link">Register</Link>
                                </span>
                            )}
                        </div>

                        <ul className="nav-top-list">
                            <li className="nav-top-item">
                                <Link to="/cart" className="link">
                                    <i className="fa fa-shopping-cart"></i> Cart
                                </Link>
                                <img className="img1" src="/images/separator.gif" alt="|"/>
                            </li>

                            {token && (
                                <>
                                    <img className="img1" src="/images/separator.gif" alt="|"/>
                                    <li className="nav-top-item">
                                        <Link to={`/order/listOrder?username=${username}`} className="link">My Orders</Link>
                                    </li>
                                    <img className="img1" src="/images/separator.gif" alt="|"/>
                                    <li className="nav-top-item">
                                        <Link to="/account/edit" className="link">My Account</Link>
                                    </li>
                                    <img className="img1" src="/images/separator.gif" alt="|"/>
                                </>
                            )}

                            <li className="nav-top-item">
                                <Link to="/help" className="link">Help</Link>
                            </li>
                        </ul>
                    </div>
                </div>

                <div className="nav-search">
                    <div className="w">
                        <Link to="/catalog/index" className="link logo">JPetStore</Link>
                        <form className="search-content" onSubmit={handleSearch}>
                            <input
                                id="keyword"
                                name="keyword"
                                type="text"
                                className="search-input"
                                placeholder="Please enter the name of the product"
                                value={keyword}
                                onChange={(e) => setKeyword(e.target.value)}
                            />
                            <button type="submit" className="btn search-btn">Search</button>
                        </form>
                        <div id="productAutoComplete">
                            <ul id="productAutoList"></ul>
                        </div>
                    </div>
                </div>

                <div className="crumb">
                    <div id="QuickLinks">
                        <Link to="/catalog/viewCategory?categoryId=FISH">
                            <img src="/images/sm_fish.gif" alt="Fish"/>
                        </Link>
                        <img className="img1" src="/images/separator.gif" alt="|"/>
                        <Link to="/catalog/viewCategory?categoryId=DOGS">
                            <img src="/images/sm_dogs.gif" alt="Dogs"/>
                        </Link>
                        <img className="img1" src="/images/separator.gif" alt="|"/>
                        <Link to="/catalog/viewCategory?categoryId=REPTILES">
                            <img src="/images/sm_reptiles.gif" alt="Reptiles"/>
                        </Link>
                        <img className="img1" src="/images/separator.gif" alt="|"/>
                        <Link to="/catalog/viewCategory?categoryId=CATS">
                            <img src="/images/sm_cats.gif" alt="Cats"/>
                        </Link>
                        <img className="img1" src="/images/separator.gif" alt="|"/>
                        <Link to="/catalog/viewCategory?categoryId=BIRDS">
                            <img src="/images/sm_birds.gif" alt="Birds"/>
                        </Link>
                    </div>
                </div>
            </div>
        </header>
    );
};

export default TopBar;
