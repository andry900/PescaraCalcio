const cds = require('@sap/cds')

module.exports = cds.service.impl(async function () {
    /*this.before('READ', 'Players', function () {  //before, on o after
        console.log("SAP College 2021");
    })*/

    this.after('READ', 'Players', async each => {
        var result;

        for (var j = 0; j < each.length; j++) {
            result = 0;
            var training = await SELECT.one.from('Trainings').where({ player_ID: each[j].ID });

            if (training != null) {
                var phisicalCond = await SELECT.from('PhisicalConditions').where({ training_ID: training.ID });

                if (phisicalCond.length > 0) {
                    for (var i = 0; i < phisicalCond.length; i++) {
                        result += phisicalCond[i].condition;
                    }

                    result = result / phisicalCond.length;
                }
            }
            
            each[j].cond = parseInt(result);
        }
    })

    this.on('sayhello', function (req) {   //le azioni vengono lanciate in POST
        return "ciao " + req.data.to;
    })
})