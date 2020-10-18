const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();

// Productos sin existencia
router.get('/reporte1', (req, res) => {
    connection.query('call Reporte_Productos_Sin_Existencia()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

// Productos con menos cantidad del limite
router.get('/reporte2/:limite', (req, res) => {
    let limite = req.params.limite;
    connection.query('call Reporte_Productos_Debajo_Limite(' + limite + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

// Ingresos y egresos de un producto en determinado mes.
router.get('/reporte3/:id/:mes', (req, res) => {
    let id = req.params.id;
    let mes = req.params.mes;
    connection.query('call Reporte_Producto_Movimientos_Especifico_Mes(' + id + ',' + mes + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

// Productos sin ventas en los ultimos N meses
router.get('/reporte4/:mes', (req, res) => {
    let mes = req.params.mes;
    connection.query('call Reporte_Productos_Sin_Ventas(' + mes + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

// TOP Productos con mas ventas en los ultimos N meses
router.get('/reporte5/:mes', (req, res) => {
    let mes = req.params.mes;
    connection.query('call Reporte_Productos_Top_Ventas(' + mes + ',10)', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

// N Productos caros
router.get('/reporte6', (req, res) => {
    connection.query('call Reporte_Productos_Top_Caros(' + req.body.n + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

// N Productos baratos
router.get('/reporte7', (req, res) => {
    connection.query('call Reporte_Productos_Top_Baratos(' + req.body.n + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

// TOP Productos con menos ventas en los ultimos N meses
router.get('/reporte8', (req, res) => {
    connection.query('call Reporte_Productos_Top_Menos_Ventas(' + req.body.mes + ',' + req.body.n + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

// TOP Productos con menos ventas en los ultimos N meses
router.get('/reporte9/:id', (req, res) => {
    let id = req.params.id;
    connection.query('call Reporte_Movimientos(' + id + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});


module.exports = router;