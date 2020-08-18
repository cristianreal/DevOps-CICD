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

//ADD
router.post('/', urlencodedParser, (req, res) => {
    if(!req.body.nombre){
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    }else{
        let nombre = req.body.nombre.replace("\'", "");
        let apellido = req.body.apellido.replace("\'", "");
        let direccion = req.body.direccion.replace("\'", "");
        let telefono = req.body.telefono.replace("\'", "");
        let email = req.body.email.replace("\'", "");
        let genero = req.body.genero.replace("\'", "");
        let pagina_web = req.body.pagina_web.replace("\'", "");
        let pais = req.body.pais.replace("\'", "");
        let ciudad = req.body.ciudad.replace("\'", "");
        connection.query('call Proveedor_Crear(\''+nombre+'\',\''+apellido+'\',\''+direccion+'\',\''+telefono+'\',\''+email+'\','+genero+',\''+pagina_web+'\',\''+pais+'\',\''+ciudad+'\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Proveedor added")
        });
    }
});

//OBTENER proveedor ESPECIFICA
router.get('/:id', (req, res) => {
    let id = req.params.id.replace("\'", "");
    connection.query('call Proveedor_Buscar_Por_Id('+id+')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

//UPDATE
router.put('/:id', urlencodedParser, (req, res) => {
    if(!req.body.nombre){
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    }else{
        let id = req.params.id.replace("\'", "");
        let nombre = req.body.nombre.replace("\'", "");
        let apellido = req.body.apellido.replace("\'", "");
        let direccion = req.body.direccion.replace("\'", "");
        let telefono = req.body.telefono.replace("\'", "");
        let email = req.body.email.replace("\'", "");
        let pagina_web = req.body.pagina_web.replace("\'", "");
        let pais = req.body.pais.replace("\'", "");
        let ciudad = req.body.ciudad.replace("\'", "");
        connection.query('call Proveedor_Modificar('+id+',\''+nombre+'\',\''+apellido+'\',\''+direccion+'\',\''+telefono+'\',\''+email+'\',\''+pagina_web+'\',\''+pais+'\',\''+ciudad+'\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Proveedor UPDATED")
        });
    }
});

//DELETE
router.delete('/:id', (req, res) => {
    connection.query('call Proveedor_Eliminar('+req.params.id+')', 
    function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.send("name deleted")
    });
});

module.exports = router;