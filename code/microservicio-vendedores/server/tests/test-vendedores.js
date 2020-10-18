var assert = require("assert");
var chai = require('chai'),
    chaiHttp = require('chai-http');
var server = require('../server.js'); // my express app
var expect = chai.expect;
let random = Math.floor(Math.random() * Math.floor(500));;
let idUsuario = "";

chai.use(chaiHttp);

describe("vendedores", function () {
    /**
     * @name test-vendedor-listar
     * Prueba la ruta de listar vendedores
     */
    describe("listar", function () {
        it('se verifica si la ruta para listar vendedores funciona', done => {
            chai
                .request(server)
                .get('/api/vendedores')
                .end((err, res) => {
                    expect(err).to.be.null;
                    expect(res).to.have.status(200);
                    done();
                })
        });
    }),
        /***
         * @name test-vendedor-agregar
         * Prueba la ruta de agregar vendedor
         */
        describe("agregar", function () {
            it('se verifica si la ruta para agregar vendedores funciona', done => {
                chai.request(server)
                    .post('/api/vendedores')
                    .send({
                        nombre: 'vendedortest' + random,
                        apellido: 'apellidotest' + random,
                        direccion: "12av. 15-24",
                        telefono: "12345678",
                        email: "vendedor" + random + "@gmail.com",
                        pass: "@Password" + random,
                        genero: "1",
                        fecha_nacimiento: "2001-03-16",
                        fecha_vinculacion: "2001-03-16",
                        jornada: "1"
                    })
                    .end(function (err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        }),
        /***
         * @name test-vendedor-login
         * Prueba la ruta de login
         */
        describe("login", function () {
            it('se verifica si la ruta para realizar el login funciona', done => {
                chai.request(server)
                    .post('/api/vendedores/login')
                    .send({
                        email: "vendedor" + random + "@gmail.com",
                        password: "@Password" + random
                    })
                    .end(function (err, res) {
                        expect(err).to.be.null;
                        idUsuario = JSON.parse(res.text)[0][0].pk_vendedor;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        }),
        /***
         * @name test-vendedor-ver
         * Prueba la ruta de ver detalle de vendedor especifico.
         */
        describe("ver", function () {
            it('metodo para ver un vendedores especifico', done => {
                chai.request(server)
                    .get('/api/vendedores/' + idUsuario)
                    .end(function (err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        }),
        /***
        * @name test-vendedor-update
        * Prueba la ruta de acutalizar informacion de un vendedor especifico.
        */
        describe("update", function () {
            it('metodo para actualizar un vendedores especifico', done => {
                chai.request(server)
                    .put('/api/vendedores/' + idUsuario)
                    .send({
                        nombre: 'nuevoNombre' + random,
                        apellido: 'nuevoApellido' + random,
                        direccion: "12av. 15-24",
                        telefono: "12345678",
                        email: "vendedor" + random + "@gmail.com",
                        jornada: "1"
                    })
                    .end(function (err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        }),
        /***
         * @name test-vendedor-delete
         * Prueba la ruta de eliminar vendedor especifico.
         */
        describe("delete", function () {
            it('se elimina al vendedor que se acaba de crear', done => {
                chai.request(server)
                    .delete('/api/vendedores/' + idUsuario)
                    .end(function (err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        })
})