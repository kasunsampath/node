
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const jsonWebToken = require('jsonwebtoken');
const mysql = require('mysql');

app.use(bodyParser.json()); // only parses json data
app.use(bodyParser.urlencoded({ // handles the urlencoded bodies
    extended: true
}));

const myJWTSecretKey = 'my-secret-key'; // set secret key, which we will use for creating and decoding JWT tokens, keep it safe.

// connection configurations
const mc = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'node_api_new'
});

// connect to database
mc.connect();


app.post('/salespersonLogin', (req, res) => {

    let username = mc.escape(req.body.username);
    let password = mc.escape(req.body.password);

    if (!username) {
        return res.status(400).send({ error: true, message: 'Please provide username' });
    }

    if (!password) {
        return res.status(400).send({ error: true, message: 'Please provide password' });
    }


    mc.query('SELECT salesperson_code,salesperson_code_count FROM sales_person where salesperson_username=? AND salesperson_password=?', [username, password], function (error, results, fields) {
        if (error) throw error;
        if (results.length == 0) {
            return res.send({ error: true, message: 'Invalid username or password' });
        } else if (results.length == 1) {
            const user = {
                un: username,
                pw: password
            };


            // sign with default (HMAC SHA256) 
            const token = jsonWebToken.sign(user, myJWTSecretKey);
            res.json({
                error: false,
                token: token,
                message: 'Successfully logged in',
                data: results
            });

        } else {
            return res.send({ error: true, message: 'More users' });
        }
        //return res.send({ error: false, data: results[0], message: results.length });
    });




});

function isValidToken(token) {
    try {
        const tokenDecodedData = jsonWebToken.verify(token, myJWTSecretKey);
        return true;
    } catch (error) {
        return false;
    }
}

// GET - http://localhost:3000/verify/{token}
app.get('/verify/:token', (req, res) => {
    try {
        const tokenDecodedData = jsonWebToken.verify(req.params.token, myJWTSecretKey);
        return res.json({
            error: false,
            data: tokenDecodedData
        });
    } catch (error) {
        res.json({
            error: true,
            data: error
        });
    }
})


// Retrieve todo with id 
app.get('/products', function (req, res) {
    let token = mc.escape(req.headers.authorization);

    if (!token) {
        return res.status(400).send({ error: true, message: 'Please provide token' });
    }

    if (isValidToken(token)) {
        mc.query('SELECT a.name as product_name,sum(b.order_items_qty) as product_quantity FROM product as a,sales_person_items as b where a.idproduct=b.product_idproduct  Group By a.name', function (error, results, fields) {
            if (error) throw error;
            if (results.length > 0)
                return res.send({ error: false, data: results, message: 'Products list' });
            else
                return res.send({ error: true, data: results, message: 'Product list is empty' });
        });
    } else {
        res.json({
            error: true,
            data: "Invalid Token"
        });
    }



});

app.listen(3000, () => {
    console.log(`Server is running at: 8080`);
});