var assert = require("assert");
var chai = require('chai'),
    chaiHttp = require('chai-http');
var server = require('../server.js'); // my express app
var expect = chai.expect;

chai.use(chaiHttp);

describe("proveedores", function() {
    describe("listar", function() {
            it('se verifica si la ruta para listar proveedores funciona', done => {
                chai
                    .request(server)
                    .get('/api/proveedores')
                    .end((err, res) => {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    })
            });
        }),
        describe("agregar", function() {
            it('se verifica si la ruta para listar proveedores funciona', done => {
                chai.request(server)
                    .post('/api/proveedores')
                    .send({
                        nombre: 'proveedortest',
                        apellido: 'apellido ejemplo',
                        direccion: "12av. 15-24",
                        telefono: "12345678",
                        email: "proveedor@gmail.com",
                        genero: "1",
                        pagina_web: "proveedor.com.gt",
                        pais: "Guatemala",
                        ciudad: "Villa nueva"
                    })
                    .end(function(err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        }),
        describe("ver", function() {
            it('metodo para ver un proveedor especifico', done => {
                chai.request(server)
                    .get('/api/proveedores/1')
                    .end(function(err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        })
})