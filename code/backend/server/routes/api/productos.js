const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();
router.get('/', (req, res) => {
    connection.query('call Proveedor_Listar()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
        //console.log('The solution is: ', rows[0].name)
    });
});
