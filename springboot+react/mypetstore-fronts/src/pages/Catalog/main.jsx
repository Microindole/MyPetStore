import React, { useContext } from "react";
import TopBar from "/src/pages/common/top.jsx";
import BottomBar from "/src/pages/common/bottom.jsx";
import { Link } from "react-router-dom";
import "/src/css/mypetstore.css";


const Main = () => {
    // const username = useContext(UserContext); // 从 localStorage 获取 username
    return (
        <div id="Content">
            <div>

            </div>

            <div id="Main">

                <div id="Sidebar">
                    <div id="SidebarContent">
                        <Link to="/catalog/viewCategory?categoryId=FISH">
                            <img src="/images/fish_icon.gif" alt="Fish" />
                        </Link>
                        <br />
                        Saltwater, Freshwater <br />
                        <Link to="/catalog/viewCategory?categoryId=DOGS">
                            <img src="/images/dogs_icon.gif" alt="Dogs" />
                        </Link>
                        <br />
                        Various Breeds <br />
                        <Link to="/catalog/viewCategory?categoryId=CATS">
                            <img src="/images/cats_icon.gif" alt="Cats" />
                        </Link>
                        <br />
                        Various Breeds, Exotic Varieties <br />
                        <Link to="/catalog/viewCategory?categoryId=REPTILES">
                            <img src="/images/reptiles_icon.gif" alt="Reptiles" />
                        </Link>
                        <br />
                        Lizards, Turtles, Snakes <br />
                        <Link to="/catalog/viewCategory?categoryId=BIRDS">
                            <img src="/images/birds_icon.gif" alt="Birds" />
                        </Link>
                        <br />
                        Exotic Varieties
                    </div>
                </div>


                <div id="MainImage">
                    <div id="MainImageContent">
                        <map name="estoremap">
                            <area
                                alt="Birds"
                                coords="72,2,280,250"
                                href="/catalog/viewCategory?categoryId=BIRDS"
                                shape="RECT"
                            />
                            <area
                                alt="Fish"
                                coords="2,180,72,250"
                                href="/catalog/viewCategory?categoryId=FISH"
                                shape="RECT"
                            />
                            <area
                                alt="Dogs"
                                coords="60,250,130,320"
                                href="/catalog/viewCategory?categoryId=DOGS"
                                shape="RECT"
                            />
                            <area
                                alt="Reptiles"
                                coords="140,270,210,340"
                                href="/catalog/viewCategory?categoryId=REPTILES"
                                shape="RECT"
                            />
                            <area
                                alt="Cats"
                                coords="225,240,295,310"
                                href="/catalog/viewCategory?categoryId=CATS"
                                shape="RECT"
                            />
                            <area
                                alt="Birds"
                                  coords="280,180,350,250"
                                  href="/catalog/viewCategory?categoryId=BIRD"
                                  shape="RECT"
                            />
                        </map>
                        <img className="img2" height="355" src="/images/splash.gif" alt="Store" useMap="#estoremap"
                             width="350"/>
                    </div>
                </div>
            </div>
            <div>

            </div>
        </div>
    );
};

export default Main;
