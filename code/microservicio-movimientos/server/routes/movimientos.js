const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();

router.get('/ingreso', (req, res) => {
    connection.query('call Ingreso_Listar()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

router.get('/ingreso/:id', (req, res) => {
    let id = req.params.id.replace("\'", "");
    connection.query('call Ingreso_Buscar_Por_Id(' + id + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

//ADD
router.post('/ingreso', urlencodedParser, (req, res) => {
    if (!req.body.fecha_movimiento) {
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    } else {
        let fecha_movimiento = String(req.body.fecha_movimiento).replace("\'", "");
        let fk_vendedor = String(req.body.fk_vendedor).replace("\'", "");
        let fk_proveedor = String(req.body.fk_proveedor).replace("\'", "");
        let detalle = req.body.detalle;

        connection.query('call Ingreso_Movimiento(\'' + fecha_movimiento + '\',' + fk_vendedor + ',' + fk_proveedor + ')', function (err, result, fields) {
            if (err) throw res.send('error: ' + err)
            detalle.forEach(async function (element) {
                let cantidad = String(element.cantidad).replace("\'", "")
                let subtotal = String(element.subtotal).replace("\'", "")
                let fk_producto = String(element.fk_producto).replace("\'", "")
                connection.query('call Detalle_Crear(' + cantidad + ',' + subtotal + ',' + fk_producto + ')', function (err, result, fields) {
                    if (err) throw res.send('error: ' + err)
                });
            });
            res.send("Ingreso agregado")
        });
    }
});

router.get('/egreso', (req, res) => {
    connection.query('call Egreso_Listar()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

router.get('/egreso/:id', (req, res) => {
    let id = req.params.id.replace("\'", "");
    connection.query('call Egreso_Buscar_Por_Id(' + id + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

//ADD
router.post('/egreso', urlencodedParser, (req, res) => {
    if (!req.body.fecha_movimiento) {
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    } else {
        let fecha_movimiento = String(req.body.fecha_movimiento).replace("\'", "");
        let fk_vendedor = String(req.body.fk_vendedor).replace("\'", "");
        let detalle = req.body.detalle;
        connection.query('call Egreso_Movimiento(\'' + fecha_movimiento + '\',' + fk_vendedor + ')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            detalle.forEach(async function (element) {
                let cantidad = String(element.cantidad).replace("\'", "")
                let subtotal = String(element.subtotal).replace("\'", "")
                let fk_producto = String(element.fk_producto).replace("\'", "")
                connection.query('call Detalle_Crear(' + cantidad + ',' + subtotal + ',' + fk_producto + ')', function (err, result, fields) {
                    if (err) throw res.send('error: ' + err)
                });
            });
            res.send("Egreso agregado")
        });
    }
});

router.get('/detalle/:id', (req, res) => {
    connection.query('call Detalle_Movimiento(' + req.params.id + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

//DELETE
router.delete('/:id', (req, res) => {
    connection.query('call Movimiento_Eliminar(' + req.params.id + ')',
        function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Movimiento deleted")
        });
});

module.exports = router;