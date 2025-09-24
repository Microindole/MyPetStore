import React from "react";
import { Link } from "react-router-dom";

import styles from "/src/css/index.module.css";

const Index = () => {
    return (
        <div className={styles.container}>
            <div className={styles.content}>
                <h2 className={styles.title}>Welcome to JPetStore 6</h2>
                <p>
                    <Link to="/catalog/index" className={styles.button}>Enter the Store</Link>
                </p>
                <p className={styles.text}>
                    <sub>Copyright Central South University.</sub>
                </p>
            </div>
        </div>
    );
};

export default Index;


