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
router.post('/ingreso', urlencodedParser, (req, res) => {
    if(!req.body.tipo_movimiento){
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    }else{
        let tipo_movimiento = req.body.tipo_movimientos;
        let fecha_movimiento = req.body.fecha_movimiento.replace("\'", "");
        let fk_vendedor = req.body.fk_vendedor;
        let fk_proveedor = req.body.fk_proveedor;
        connection.query('call Ingreso_Movimiento('+tipo_movimiento+'\''+fecha_movimiento+'\','+fk_vendedor+','+fk_proveedor+')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Ingreso agregado")
        });
    }
});

//ADD
router.post('/egreso', urlencodedParser, (req, res) => {
    if(!req.body.tipo_movimiento){
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    }else{
        let tipo_movimiento = req.body.tipo_movimientos;
        let fecha_movimiento = req.body.fecha_movimiento.replace("\'", "");
        let fk_vendedor = req.body.fk_vendedor;
        connection.query('call Egreso_Movimiento('+tipo_movimiento+'\''+fecha_movimiento+'\','+fk_vendedor+')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Egreso agregado")
        });
    }
});