const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();
router.get('/', (req, res) => {
    connection.query('call Marca_Listar()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

//ADD
router.post('/', urlencodedParser, (req, res) => {
    if (!req.body.name) {
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
        let { name, country, webpage } = objeto;
        connection.query('call Marca_Crear(\'' + name + '\',\'' + country + '\',\'' + webpage + '\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("MARCA ADDED")
        });
    }
});


//OBTENER MARCA ESPECIFICA
router.get('/:id', (req, res) => {
    let id = req.params.id.replace("\'", "");
    connection.query('call Marca_Buscar_Por_Id(' + id + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

//UPDATE
router.put('/:id', urlencodedParser, (req, res) => {
    if (!req.body.name) {
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
        let { name, country, webpage } = objeto;

        connection.query('call Marca_Modificar(' + id + ',\'' + name + '\',\'' + country + '\',\'' + webpage + '\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("MARCA UPDATED")
        });
    }
});

//DELETE
router.delete('/:id', (req, res) => {
    connection.query('call Marca_Eliminar(' + req.params.id + ')',
        function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("name deleted")
        });
});

module.exports = router;