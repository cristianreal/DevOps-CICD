const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();

router.get('/', (req, res) => {
    connection.query('call Producto_Listar()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

//ADD
router.post('/', urlencodedParser, (req, res) => {
    if(!req.body.nombre){
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    }else{
        let nombre = req.body.nombre.replace("\'", "");
        let descripcion = req.body.descripcion.replace("\'", "");
        let precio = req.body.precio.replace("\'", "");
        let marca = req.body.marca;
        connection.query('call Producto_Crear(\''+nombre+'\',\''+descripcion+'\','+precio+','+marca+')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Producto added")
        });
    }
});

module.exports = router;
