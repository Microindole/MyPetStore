import React from "react";
import { BrowserRouter as Router, Routes, Route} from "react-router-dom";
import Index from "./pages/Catalog/index.jsx";
import Main from "./pages/Catalog/main.jsx";
import Login from "./pages/account/login.jsx";
import Logout from "./pages/account/logout.jsx";
import Register from "./pages/account/register.jsx";
import EditAccount from "./pages/account/edit.jsx";
import Help from "./pages/help.jsx";
import Layout from "./pages/common/layout.jsx";
import ListOrder from "./pages/order/listOrder.jsx";
import ViewOrder from "./pages/order/viewOrder.jsx";
import NewOrder from "./pages/order/newOrder.jsx";
import Category from "./pages/Catalog/category.jsx";
import Product from "./pages/Catalog/product.jsx";
import Item from "./pages/Catalog/item.jsx";
import Search from "./pages/Catalog/search.jsx";
import Cart from "./pages/cart/cart.jsx";
import GitHubCallback from "./pages/account/GitHubCallback.jsx";
function App() {
    return (
        <Router>

                <Routes>
                    <Route path="/" element={<Index />} />


                    <Route path="/" element={<Layout />}>
                        <Route path="/catalog/index" element={<Main />} />
                        <Route path="/help" element={<Help />} />
                        <Route path="/order/listOrder" element={<ListOrder />} />
                        <Route path="/viewOrder" element={<ViewOrder />} />
                        <Route path="/order/newOrder" element={<NewOrder />} />
                        <Route path="/account/login" element={<Login />} />
                        <Route path="/account/logout" element={<Logout />} />
                        <Route path="/account/register" element={<Register />} />
                        <Route path="/account/edit" element={<EditAccount />}/>
                        <Route path="/catalog/viewCategory" element={<Category />} />
                        <Route path="/catalog/viewProduct" element={<Product />} />
                        <Route path="/catalog/viewItem" element={<Item />} />
                        <Route path="/catalog/searchProducts" element={<Search />} />
                        <Route path="/cart" element={<Cart />} />
                        <Route path="/account/github-callback" element={<GitHubCallback />} />

                    </Route>


                </Routes>

        </Router>
    );
}

export default App;
