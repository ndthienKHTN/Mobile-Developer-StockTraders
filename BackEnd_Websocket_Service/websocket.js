const WebSocket = require('ws');
const axios = require('axios');

//const wss = new WebSocket.Server({ port: 8080 });
const wss = new WebSocket.Server({ port: 8080 }, () => {
    console.log('WebSocket server started on port 8080');
});

wss.on('connection', (ws) => {
    console.log('Client connected');
    ws.on('message', async (message) => {
        console.log('Received:', message);

        // Gửi request tới API
        const response = await axios.post('https://stocktraders.vn/service/data/getTotalTradeReal', {
            TotalTradeRealRequest: { account: 'StockTraders' }
        });
        const limitedData = response.data.TotalTradeRealReply.stockTotalReals.slice(0, 60);
        const limitedResponse = {
            TotalTradeRealReply: {
                stockTotalReals: limitedData
            }
        };

        // Gửi dữ liệu giới hạn tới client
        ws.send(JSON.stringify(limitedResponse));
        //console.log('Received data API:', JSON.stringify(response.data));

        // Gửi dữ liệu nhận được từ API tới client
        //ws.send(JSON.stringify(response.data));
    });

    ws.on('close', () => {
        console.log('Client disconnected');
    });
});
