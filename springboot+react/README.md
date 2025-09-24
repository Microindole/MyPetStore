# Mypetstore-SpringBoot_React

### 软件开发架构平台小组实验

#### 简介：

​	这是一个前后端分离的项目，后端使用SpringBoot进行开发，前端使用React+Vite开发

##### 结构

###### mypetstore-api

​		后端部分

###### mypetstore-front

​		前端部分

###### mypetstore-api.pdf  mypetstore-api.md

​		后端接口文档      .md是源文件

#### mypetstore-api

​	该项目基于 Spring Boot 和 MyBatis Plus，支持 RESTful API。

### `main/` 目录

- **`java/`**：包含 Java 源代码。

  - `org.csu.petstore`

    ：项目的主包。

    - **`MyPetStoreSsmDevApplication.java`**：Spring Boot 应用程序的入口类。
    - **`controller/`**：控制器层，处理 HTTP 请求。
    - **`service/`**：服务层，包含业务逻辑。
    - **`entity/`**：实体类，映射数据库表。
    - **`persistence/`**：持久层接口，使用 MyBatis Mapper。
    - **`vo/`**：值对象，用于封装数据。

#### mypetstore-front

##### 说明

1. **App.jsx**：负责应用的初始化和路由配置。
2. **`context/`**：存放全局状态管理的上下文文件，例如用户信息。
3. **`css/`**：存放项目的样式文件，分为全局样式和页面/组件样式。
4. **`js/`**：存放功能性 JavaScript 文件，例如表单验证、购物车更新等。
5. **`pages/`**：存放页面组件，按功能模块划分子文件夹。
6. **`utils/`**：存放工具类文件，例如 Axios 配置。
7. **`assets/`**：存放静态资源，例如图片、SVG 文件等。



