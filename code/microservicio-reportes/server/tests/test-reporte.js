var assert = require("assert");
var chai = require('chai'),
    chaiHttp = require('chai-http');
var server = require('../server.js'); // my express app
var expect = chai.expect;

chai.use(chaiHttp);

describe("reportes", function () {
    describe("reporte1", function () {
        it('se verifica si la ruta para el reporte1 funciona', done => {
            chai
                .request(server)
                .get('/api/reportes/reporte1')
                .end((err, res) => {
                    expect(err).to.be.null;
                    expect(res).to.have.status(200);
                    done();
                })
        });
    }),
        describe("reporte2", function () {
            it('se verifica si la ruta para el reporte2 funciona', done => {
                chai
                    .request(server)
                    .get('/api/reportes/reporte2/30')
                    .end((err, res) => {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    })
            });
        })
})