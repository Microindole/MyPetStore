//商品展示js
var xmlHttpRequest;
var name;

function createXMLHttpRequest()
{
    xmlHttpRequest = new XMLHttpRequest();
}

function showInform(categoryId)
{
    name  = categoryId;
    var url = "categoryShowJs?categoryId="+categoryId;
    sendRequest(url);


}

function sendRequest(url)
{
    createXMLHttpRequest();
    xmlHttpRequest.onreadystatechange = processInform;
    xmlHttpRequest.open("GET",url,true);
    xmlHttpRequest.send(null);
}

function processInform() {
    if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
        var rep = xmlHttpRequest.responseText.trim(); // 获取后端返回的数据
        console.log("Response from server:", rep);

        var inform = document.getElementById('inform');

        // 解析返回的文本内容，按行分割
        var lines = rep.split('\n');
        console.log("Parsed lines:", lines);

        if (lines.length > 1) {
            // 表头
            var header = lines[0].trim();
            console.log("Header:", header);

            // 产品列表
            var products = lines.slice(1).map(line => line.trim()).filter(line => line.length > 0); // 去掉空行
            console.log("Products:", products);

            if (products.length === 0) {
                inform.innerText = "No products available for this category.";
            } else {
                var content = '<table border="1"><thead><tr>';
                var headers = header.split(/\s+/); // 根据空格分割表头
                headers.forEach(function (col) {
                    content += '<th>' + col + '</th>';
                });
                content += '</tr></thead><tbody>';

                products.forEach(function (productLine) {
                    var columns = productLine.split('\t');
                    content += '<tr>';
                    columns.forEach(function (col) {
                        content += '<td>' + col + '</td>';
                    });
                    content += '</tr>';
                });

                content += '</tbody></table>';
                inform.innerHTML = content; // 设置表格内容
            }
        } else {
            // 如果返回的数据格式不正确
            inform.innerText = "Unexpected error occurred.";
        }

        inform.className = name;
        inform.style.display = 'block';
    }
}


function hiddenInform(event)
{
    var informDiv = document.getElementById('inform');
    var x = event.clientX;
    var y = event.clientY;
    var divx1 = informDiv.offsetLeft;
    var divy1 = informDiv.offsetTop;
    var divx2 = informDiv.offsetLeft+informDiv.offsetWidth;
    var divy2 = informDiv.offsetTop+informDiv.offsetHeight;
    if(x < divx1 || x > divx2 || y < divy1 || y> divy2)
    {
        document.getElementById('inform').style.display = 'none';
    }
}
