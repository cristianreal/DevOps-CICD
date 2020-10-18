var assert = require("assert");
var chai = require('chai'),
    chaiHttp = require('chai-http');
var server = require('../server.js'); // my express app
var expect = chai.expect;
let random = Math.floor(Math.random() * Math.floor(500));;
let idUsuario = "";

chai.use(chaiHttp);

describe("proveedores", function () {
    /***
    * @name test-proveedor-agregar
    * Prueba la ruta de agregar proveedor
    */
    describe("agregar", function () {
        it('se verifica si la ruta para agregar proveedores funciona', done => {
            chai.request(server)
                .post('/api/proveedores')
                .send({
                    nombre: 'proveedortest' + random,
                    apellido: 'apellido ejemplo' + random,
                    direccion: "12av. 15-24",
                    telefono: "12345678",
                    email: "proveedor" + random + "@gmail.com",
                    genero: "1",
                    pagina_web: "proveedor.com.gt",
                    pais: "Guatemala",
                    ciudad: "Villa nueva"
                })
                .end(function (err, res) {
                    expect(err).to.be.null;
                    expect(res).to.have.status(200);
                    done();
                });
        });
    }),
        /**
         * @name test-proveedor-listar
         * Prueba la ruta de listar proveedores
         */
        describe("listar", function () {
            it('se verifica si la ruta para listar proveedores funciona', done => {
                chai
                    .request(server)
                    .get('/api/proveedores')
                    .end((err, res) => {
                        expect(err).to.be.null;
                        let proveedores = JSON.parse(res.text)[0];
                        idUsuario = proveedores[Object.keys(proveedores).length - 1].pk_proveedor;
                        expect(res).to.have.status(200);
                        done();
                    })
            });
        }),
        /***
         * @name test-proveedor-ver
         * Prueba la ruta de ver detalle de proveedor especifico.
         */
        describe("ver", function () {
            it('metodo para ver un proveedor especifico', done => {
                chai.request(server)
                    .get('/api/proveedores/' + idUsuario)
                    .end(function (err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        }),
        /***
        * @name test-proveedor-update
        * Prueba la ruta de actualizar informacion de un proveedor especifico.
        */
        describe("actualizar", function () {
            it('se verifica si la ruta para actualizar un proveedor funciona', done => {
                chai.request(server)
                    .put('/api/proveedores/' + idUsuario)
                    .send({
                        nombre: 'NuevoProveedor' + random,
                        apellido: 'NuevoApellido' + random,
                        direccion: "12av. 15-24",
                        telefono: "12345678",
                        email: "proveedor" + random + "@gmail.com",
                        genero: "1",
                        pagina_web: "proveedor.com.gt",
                        pais: "Guatemala",
                        ciudad: "Villa nueva"
                    })
                    .end(function (err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        }),
        /***
         * @name test-proveedor-delete
         * Prueba la ruta de eliminar proveedor especifico.
         */
        describe("eliminar", function () {
            it('metodo para eliminar un proveedor especifico', done => {
                chai.request(server)
                    .delete('/api/proveedores/' + idUsuario)
                    .end(function (err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        })
})