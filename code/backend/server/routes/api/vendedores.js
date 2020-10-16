const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();
router.get('/', (req, res) => {
    connection.query('call Vendedor_Listar()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
        //console.log('The solution is: ', rows[0].name)
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
        let nombre = req.body.nombre.replace("\'", "");
        let apellido = req.body.apellido.replace("\'", "");
        let direccion = req.body.direccion.replace("\'", "");
        let telefono = req.body.telefono.replace("\'", "");
        let email = req.body.email.replace("\'", "");
        let genero = req.body.genero.replace("\'", "");
        let fecha_nacimiento = req.body.fecha_nacimiento.replace("\'", "");
        let fecha_vinculacion = req.body.fecha_vinculacion.replace("\'", "");
        let jornada = req.body.jornada.replace("\'", "");
        let pass = req.body.pass.replace("\'", "");
        connection.query('call Vendedor_Crear(\'' + nombre + '\',\'' + apellido + '\',\'' + direccion + '\',\'' + telefono + '\',\'' + email + '\',' + genero + ',\'' + fecha_nacimiento + '\',\'' + fecha_vinculacion + '\',' + jornada + ',\'' + pass + '\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Vendedor added")
        });
    }
});

router.post('/login', urlencodedParser, (req, res) => {
    if (!req.body.email) {
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    } else {
        let email = req.body.email.replace("\'", "");
        let password = req.body.password.replace("\'", "");
        connection.query('call Vendedor_Login(\'' + email + '\',\'' + password + '\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.json(rows)
        });
    }
});

//OBTENER MARCA ESPECIFICA
router.get('/:id', (req, res) => {
    let id = req.params.id.replace("\'", "");
    connection.query('call Vendedor_Buscar_Por_Id(' + id + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

//UPDATE
router.put('/:id', urlencodedParser, (req, res) => {
    console.log(req)
    if (!req.body.nombre) {
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    } else {
        let id = req.params.id.replace("\'", "");
        let nombre = req.body.nombre.replace("\'", "");
        let apellido = req.body.apellido.replace("\'", "");
        let direccion = req.body.direccion.replace("\'", "");
        let telefono = req.body.telefono.replace("\'", "");
        let email = req.body.email.replace("\'", "");
        let jornada = req.body.jornada;
        connection.query('call Vendedor_Modificar(' + id + ',\'' + nombre + '\',\'' + apellido + '\',\'' + direccion + '\',\'' + telefono + '\',\'' + email + '\',' + jornada + ')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Vendedores UPDATED")
        });
    }
});

//DELETE
router.delete('/:id', (req, res) => {
    connection.query('call Vendedor_Eliminar(' + req.params.id + ')',
        function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Vendedor eliminado")
        });
});

module.exports = router;