const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../database');

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
    if (!req.body.nombre) {
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    } else {
        // Quitando las comillas simples de todos los elementos
        let objeto = req.body;
        Object.keys(objeto).map(function (key, index) {
            objeto[key] = String(objeto[key]).replace("\'", "");
        });
        // Obteniendo los parametros de body
        let { nombre, descripcion, precio, marca } = objeto;

        connection.query('call Producto_Crear(\'' + nombre + '\',\'' + descripcion + '\',' + precio + ',' + marca + ')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Producto added")
        });
    }
});

// Cantidad de productos disponibles
router.get('/total', (req, res) => {
    connection.query('call Producto_Total()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});


//OBTENER producto ESPECIFICo
router.get('/:id', (req, res) => {
    let id = req.params.id.replace("\'", "");
    connection.query('call Producto_Buscar_Por_Id(' + id + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)

        let obj = {
            productos: rows
        }
        res.json(obj)
    });
});

//UPDATE
router.put('/:id', urlencodedParser, (req, res) => {
    if (!req.body.nombre) {
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    } else {
        let id = req.params.id;
        // Quitando las comillas simples de todos los elementos
        let objeto = req.body;
        Object.keys(objeto).map(function (key, index) {
            objeto[key] = String(objeto[key]).replace("\'", "");
        });
        // Obteniendo los parametros de body
        let { nombre, descripcion, precio, marca } = objeto;
        connection.query('call Producto_Modificar(' + id + ',\'' + nombre + '\',\'' + descripcion + '\',' + precio + ',' + marca + ')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Producto UPDATED")
        });
    }
});

//DELETE
router.delete('/:id', (req, res) => {
    connection.query('call Producto_Eliminar(' + req.params.id + ')',
        function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Producto deleted")
        });
});

module.exports = router;
