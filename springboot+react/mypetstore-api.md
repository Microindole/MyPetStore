# mypetstore-api

​						*注意，未截图声明的post请求均是以具体的数据提交的，而不是打包成json数据*

### 声明：

1. 在org/csu/petstore/Configuration/WebConfig.java中添加登录拦截器，仅有/account/tokens（仅适用登录，退出登录不算），/catalog/**（商品展示），/account/info（用户注册），无需登录状态。

   未登录信息         *以下未说明错误情况均为未登录*

   ```json
   {
       "status": 10,
       "msg": "用户未登录，请先登录"
   }
   ```

   ​	

1. 需要从令牌中获取当前登录用户名数据时

   		@RequestHeader("Authorization") String token	/*加入该参数*/
   	/*方法前两行加入*/
   	Map<String, Object> claims = JwtUtil.parseToken(token);
   	String username = (String) claims.get("username");

1. 后端所有api都有"/api"前缀，部分图片的示例url有误，以标题为准

### catalog 

###### GET: 	/api/catalog/categories/{id}             根据categoryId获取商品列表

​	SUCCESS

​	http://localhost:8070/api/catalog/categories/BIRDS

```json
{
    "status": 0,
    "msg": "SUCCESS",
    "data": {
        "categoryId": "BIRDS",
        "categoryName": "Birds",
        "productList": [
            {
                "productId": "AV-CB-01",
                "categoryId": "BIRDS",
                "name": "Amazon Parrot",
                "description": "<image src=\"images/bird2.gif\">Great companion for up to 75 years"
            },
            {
                "productId": "AV-SB-02",
                "categoryId": "BIRDS",
                "name": "Finch",
                "description": "<image src=\"images/bird1.gif\">Great stress reliever"
            }
        ]
    }
}
```

​	ERROR

​	http://localhost:8070/api/catalog/categories/birds

```json
{
    "status": 1,
    "msg": "该分类下没有商品"
}
```



###### GET:	/api/catalog/products/{id} 	根据productId获取商品项列表

​	SUCCESS

​	http://localhost:8070/api/catalog/products/FL-DSH-01

```json
{
    "status": 0,
    "msg": "SUCCESS",
    "data": {
        "productId": "FL-DSH-01",
        "categoryId": "CATS",
        "productName": "Manx",
        "itemList": [
            {
                "itemId": "EST-14",
                "productId": "FL-DSH-01",
                "listPrice": 58.50,
                "unitCost": 12.00,
                "supplierId": 1,
                "status": "P",
                "attribute1": "Tailless",
                "attribute2": null,
                "attribute3": null,
                "attribute4": null,
                "attribute5": null
            },
            {
                "itemId": "EST-15",
                "productId": "FL-DSH-01",
                "listPrice": 23.50,
                "unitCost": 12.00,
                "supplierId": 1,
                "status": "P",
                "attribute1": "With tail",
                "attribute2": null,
                "attribute3": null,
                "attribute4": null,
                "attribute5": null
            }
        ]
    }
}
```

​	ERROR

​	http://localhost:8070/api/catalog/products/est-15

```json
{
    "status": 1,
    "msg": "该商品下没有商品项"
}
```





###### POST:	/api/catalog/products/{keyword}	根据商品名称返回商品列表

​	SUCCESS

​	http://localhost:8070/api/catalog/products/etriever

```json
{
    "status": 0,
    "msg": "SUCCESS",
    "data": [
        {
            "searchId": "K9-RT-01",
            "searchName": "Golden Retriever",
            "descriptionImage": "images/dog1.gif",
            "descriptionText": "Great family dog"
        },
        {
            "searchId": "K9-RT-02",
            "searchName": "Labrador Retriever",
            "descriptionImage": "images/dog5.gif",
            "descriptionText": "Great hunting dog"
        }
    ]
}
```

​	ERROR

​	http://localhost:8070/api/catalog/products/petstore

```json
{
    "status": 1,
    "msg": "没有找到相关商品"
}
```





###### GET:	/api/catalog/items/{id}	根据itemId获取具体商品项信息

​	SUCCESS

​	http://localhost:8070/api/catalog/items/EST-15

```json
{
    "status": 0,
    "msg": "SUCCESS",
    "data": {
        "itemId": "EST-15",
        "productId": "FL-DSH-01",
        "productName": "Manx",
        "descriptionImage": "images/cat2.gif",
        "descriptionText": "Great for reducing mouse populations",
        "listPrice": 23.50,
        "attributes": "With tail",
        "quantity": 10000
    }
}
```

​	ERROR

​	http://localhost:8070/api/catalog/items/est-13

```json
{
    "status": 1,
    "msg": "服务器异常"
}
```



### account 

###### POST:	/api/account/tokens	用户登录

​	成功会返回令牌，浏览器接下来每次会在请求头中加入令牌

<img src="C:\Users\15139\AppData\Roaming\Typora\typora-user-images\image-20250405114239894.png" alt="image-20250405114239894" style="zoom:50%;" />

​	但是postman模拟时要加入如下信息

<img src="C:\Users\15139\AppData\Roaming\Typora\typora-user-images\image-20250401135411353.png" alt="image-20250401135411353" style="zoom:33%;" />

​	否则需要验证登录的请求没有令牌没有会显示，"用户未登录，请先登录"

​	SUCCESS

```json
{
    "status": 0,
    "msg": "SUCCESS",
    "data": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGFpbXMiOnsidXNlcm5hbWUiOiIxMTExIn0sImV4cCI6MTc0MzUyOTc1MX0.SCb4VlOIbuG1AaSK0cKr_GBu3rJkHpC0joQ7NzaAIOE"
}
```

​	ERROR

![image-20250405114426699](C:\Users\15139\AppData\Roaming\Typora\typora-user-images\image-20250405114426699.png)

###### DELETE:	/api/account/tokens	用户退出登录

​		*这里退出登录用黑名单的形式实现*

```json
{
    "status": 0,
    "msg": "用户已退出登录"
}
```



###### POST:	/api/account	获取当前用户登录信息  需要登录

​	SUCCESS

​	http://localhost:8070/api/account

```json
{
    "status": 0,
    "msg": "SUCCESS",
    "data": {
        "username": "j2ee",
        "password": "Not Found",
        "email": "",
        "firstName": "",
        "lastName": "",
        "status": "OK",
        "address1": "",
        "address2": "",
        "city": "",
        "state": "",
        "zip": "",
        "country": "",
        "phone": "",
        "langPref": "english",
        "favoriteGory": "BIRDS",
        "myListOpt": 1,
        "bannerOpt": 1
    }
}
```



###### POST:	/api/account/info	用户注册

​	*其中，username,password,email,firstName,lastName,,address1,city,state,zip,*

​		*country,phone,langPref不能为空，这些在前端进行验证*

​	SUCCESS

<img src="C:\Users\15139\AppData\Roaming\Typora\typora-user-images\image-20250401111538209.png" alt="image-20250401111538209" style="zoom:50%;" />

```json
{
    "status": 0,
    "msg": "注册成功"
}
```

​	注册失败

<img src="C:\Users\15139\AppData\Roaming\Typora\typora-user-images\image-20250331111736604.png" alt="image-20250331111736604" style="zoom:50%;" />

```json
{
    "status": 1,
    "msg": "注册失败"
}
```



###### POST:	/api/account/edit	更新用户信息

​	注意，password,email,firstName,lastName,,address1,city,state,zip,

​		country,phone,langPref不能为空，这些在前端进行验证。并且用户未修改的项填入默认值（用户原有的信息）

​	SUCCESS

<img src="C:\Users\15139\AppData\Roaming\Typora\typora-user-images\image-20250331123932221.png" alt="image-20250331123932221" style="zoom:50%;" />

​	

```json
{
    "status": 0,
    "msg": "用户信息更新成功"
}
```



### cart 

​			购物车界面的总商品数和总价需要再前端计算

###### GET:	/api/cart	获取用户购物车信息,需要登录

​	SUCESS

​	http://localhost:8070/api/cart

```json
{
    "status": 0,
    "msg": "购物车内商品列表获取成功",
    "data": [
        {
            "itemVO": {
                "itemId": "EST-22",
                "productId": "K9-RT-02",
                "productName": "Labrador Retriever",
                "descriptionImage": "images/dog5.gif",
                "descriptionText": "Great hunting dog",
                "listPrice": 135.50,
                "attributes": "Adult Male",
                "quantity": 10000
            },
            "cart": {
                "userid": "mypetstore",
                "itemId": "EST-22",
                "quantity": 1
            },
            "inStock": 10000,
            "total": 135.50
        }
    ]
}
```



###### POST:	/api/cart	根据具体一项商品更新购物车，需要登录

​	SUCCESS

<img src="C:\Users\15139\AppData\Roaming\Typora\typora-user-images\image-20250331182240080.png" alt="image-20250331182240080" style="zoom:50%;" />

```json
{
    "status": 0,
    "msg": "购物车已更新",
    "data": [
        {
            "itemVO": {
                "itemId": "EST-22",
                "productId": "K9-RT-02",
                "productName": "Labrador Retriever",
                "descriptionImage": "images/dog5.gif",
                "descriptionText": "Great hunting dog",
                "listPrice": 135.50,
                "attributes": "Adult Male",
                "quantity": 10000
            },
            "cart": {
                "userid": "mypetstore",
                "itemId": "EST-22",
                "quantity": 1
            },
            "inStock": 10000,
            "total": 135.50
        }
    ]
}
```



​	未登录

```json
{
    "status": 0,
    "msg": "用户未登录，请先登录"
}
```



###### GET:	/api/cart/{id}	根据商品项id将商品项加入购物车  需要登录

​	SUCCESS		

​	http://localhost:8070/api/cart/EST-22

```json
{
    "status": 0,
    "msg": "商品项EST-22已加入购物车"
}
```



###### DELETE:	/api/cart/{id}	根据商品项id将该商品项从购物车中删除  需要登录

​	SUCCESS

​	http://localhost:8070/api/cart/EST-1

```json
{
    "status": 0,
    "msg": "商品EST-1已从购物车中删除",
    "data": [
        {
            "itemVO": {
                "itemId": "EST-22",
                "productId": "K9-RT-02",
                "productName": "Labrador Retriever",
                "descriptionImage": "images/dog5.gif",
                "descriptionText": "Great hunting dog",
                "listPrice": 135.50,
                "attributes": "Adult Male",
                "quantity": 10000
            },
            "cart": {
                "userid": "mypetstore",
                "itemId": "EST-22",
                "quantity": 1
            },
            "inStock": 10000,
            "total": 135.50
        }
    ]
}
```



### order

###### GET:	/api/order/lists	查看用户的订单列表,需要登录

​	SUCCESS

​	http://localhost:8070/api/order/lists

```json
{
    "status": 0,
    "msg": "SUCCESS",
    "data": [
        {
            "orderId": 1025,
            "outStatus": "P",
            "userId": "1111",
            "orderDate": "1975-06-12T16:00:00.000+00:00",
            "shipAddr1": "123",
            "shipAddr2": "123",
            "shipCity": "123",
            "shipState": "123",
            "shipZip": "123",
            "shipCountry": "中国",
            "billAddr1": "123",
            "billAddr2": "123",
            "billCity": "123",
            "billState": "123",
            "billZip": "123",
            "billCountry": "中国",
            "courier": "UPS",
            "totalPrice": 3707.50,
            "billToFirstname": "abc",
            "billToLastname": "abc",
            "shipToFirstname": "abc",
            "shipToLastname": "abc",
            "creditCard": "123",
            "expiryDate": "3/12",
            "cardType": "Visa",
            "locale": "CA"
        },
        {
            "orderId": 1026,
            "outStatus": "P",
            "userId": "1111",
            "orderDate": "1975-06-12T16:00:00.000+00:00",
            "shipAddr1": "123",
            "shipAddr2": "123",
            "shipCity": "123",
            "shipState": "123",
            "shipZip": "123",
            "shipCountry": "中国",
            "billAddr1": "123",
            "billAddr2": "123",
            "billCity": "123",
            "billState": "123",
            "billZip": "123",
            "billCountry": "中国",
            "courier": "UPS",
            "totalPrice": 3707.50,
            "billToFirstname": "abc",
            "billToLastname": "abc",
            "shipToFirstname": "abc",
            "shipToLastname": "abc",
            "creditCard": "123",
            "expiryDate": "3/12",
            "cardType": "Visa",
            "locale": "CA"
        }
    ]
}
```



###### GET:	/api/lists/{id}	查看根据订单id订单详情

​	SUCCESS

​	http://localhost:8070/api/order/lists/1025

```json
{
    "status": 0,
    "msg": "订单号为1025的订单详情",
    "data": {
        "orderId": 1025,
        "outStatus": "P",
        "userId": "1111",
        "orderDate": "1975-06-12T16:00:00.000+00:00",
        "shipAddr1": "123",
        "shipAddr2": "123",
        "shipCity": "123",
        "shipState": "123",
        "shipZip": "123",
        "shipCountry": "中国",
        "billAddr1": "123",
        "billAddr2": "123",
        "billCity": "123",
        "billState": "123",
        "billZip": "123",
        "billCountry": "中国",
        "courier": "UPS",
        "totalPrice": 3707.50,
        "billToFirstname": "abc",
        "billToLastname": "abc",
        "shipToFirstname": "abc",
        "shipToLastname": "abc",
        "creditCard": "123",
        "expiryDate": "3/12",
        "cardType": "Visa",
        "locale": "CA"
    }
}
```



###### POST:	/api/order	创建新的订单	注意：这里需要将订单的totalPrice设为前端计算的subTotal

<img src="C:\Users\15139\AppData\Roaming\Typora\typora-user-images\image-20250331184158009.png" alt="image-20250331184158009" style="zoom:50%;" />

​	SUCCESS

```json
{
    "status": 0,
    "msg": "订单创建成功",
    "data": {
        "orderId": 1045,
        "outStatus": "NP",
        "userId": "1111",
        "orderDate": "2025-03-30T16:00:00.000+00:00",
        "shipAddr1": "avdsf",
        "shipAddr2": "",
        "shipCity": "vsfdvd",
        "shipState": "123fsv",
        "shipZip": "123",
        "shipCountry": "",
        "billAddr1": "add1111",
        "billAddr2": "add2222",
        "billCity": "city11",
        "billState": "state11",
        "billZip": "zip11",
        "billCountry": "中国",
        "courier": "UPS",
        "totalPrice": 574.00,
        "billToFirstname": "aa",
        "billToLastname": "aa",
        "shipToFirstname": "cdasva",
        "shipToLastname": "vfsdvds",
        "creditCard": "999 9999 9999 9999",
        "expiryDate": "2025-04-14",
        "cardType": "Visa",
        "locale": "CA"
    }
}
```



###### GET:	/api/order/{id}	完成订单，更新库存

​	SUCCESS

​	http://localhost:8070/api/order/1045

```json
{
    "status": 0,
    "msg": "订单已完成,库存已相应更新"
}
```

