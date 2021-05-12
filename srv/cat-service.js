const cds = require('@sap/cds')

module.exports = cds.service.impl(async function () {
    this.before('READ', 'Players', function () {  //before, on o after
        console.log("SAP College 2021");
    })

    this.on('sayhello', function (req) {   //le azioni vengono lanciate in POST
        return "ciao " + req.data.to;
    })
})