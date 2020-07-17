const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();

router.get('/ingreso', (req, res) => {
    connection.query('call Ingreso_Listar()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

//ADD
router.post('/ingreso', urlencodedParser, (req, res) => {
    if(!req.body.fecha_movimiento){
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    }else{
        let fecha_movimiento = req.body.fecha_movimiento.replace("\'", "");
        let fk_vendedor = req.body.fk_vendedor;
        let fk_proveedor = req.body.fk_proveedor;
        let detalle = req.body.detalle;
        console.log(req.body);
        connection.query('call Ingreso_Movimiento(\''+fecha_movimiento+'\','+fk_vendedor+','+fk_proveedor+')', function (err, result, fields) {
            if (err) throw res.send('error: ' + err)
            detalle.forEach(async function(element){
                connection.query('call Detalle_Crear('+element.cantidad+','+element.subtotal+','+element.fk_producto+')', function (err, result, fields) {                });
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

//ADD
router.post('/egreso', urlencodedParser, (req, res) => {
    if(!req.body.fecha_movimiento){
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    }else{
        let fecha_movimiento = req.body.fecha_movimiento.replace("\'", "");
        let fk_vendedor = req.body.fk_vendedor;
        let detalle = req.body.detalle;
        connection.query('call Egreso_Movimiento(\''+fecha_movimiento+'\','+fk_vendedor+')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            detalle.forEach(async function(element){
                connection.query('call Detalle_Crear('+element.cantidad+','+element.total+','+element.fk_producto+')', function (err, result, fields) {
                    if (err) throw res.send('error: ' + err)
                });
            });
            res.send("Egreso agregado")
        });
    }
});

module.exports = router;