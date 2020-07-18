var assert = require("assert");
var chai = require('chai'),
    chaiHttp = require('chai-http');
var server = require('../server.js'); // my express app
var expect = chai.expect;

chai.use(chaiHttp);

describe("movimientos", function() {
    describe("listar ingresos", function() {
            it('se verifica si la ruta para listar los movimientos de ingreso funciona', done => {
                chai
                    .request(server)
                    .get('/api/movimientos/ingreso')
                    .end((err, res) => {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    })
            });
        }),
    describe("listar egresos especifico", function() {
        it('se verifica si la ruta para listar los movimientos de egreso funciona', done => {
            chai
                .request(server)
                .get('/api/movimientos/egreso')
                .end((err, res) => {
                    expect(err).to.be.null;
                    expect(res).to.have.status(200);
                    done();
                })
        });
    }),
    describe("ver ingreso especifico", function() {
        it('metodo para ver un un ingreso especifico', done => {
            chai.request(server)
                .get('/api/movimientos/ingreso/1')
                .end(function(err, res) {
                    expect(err).to.be.null;
                    expect(res).to.have.status(200);
                    done();
                });
        });
    }),
    describe("ver egreso", function() {
        it('metodo para ver un un egreso especifico', done => {
            chai.request(server)
                .get('/api/movimientos/egreso/2')
                .end(function(err, res) {
                    expect(err).to.be.null;
                    expect(res).to.have.status(200);
                    done();
                });
        });
    })
})