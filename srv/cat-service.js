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

    this.on('calculateCondition', async function () {
        var ffResult = await SELECT.from('PhisicalConditions')

        for (var i = 0; i < ffResult.length; i++) {
            var pressure = ffResult[i].bloodPressure.split("-");

            if (pressure[0] < 70 || pressure[1] > 130) {
                ffValue = 10
            } else {
                ffValue = 25
            }

            if (ffResult[i].bpm < 60) {
                ffValue += 15
            } else if (ffResult[i].bpm >= 60 && ffResult[i].bpm < 100) {
                ffValue += 25
            } else {
                ffValue += 10
            }

            if (ffResult[i].VO2max < 80) {
                ffValue += 10
            } else {
                ffValue += 25
            }

            if (ffResult[i].fatigue < 50) {
                ffValue += 25
            } else if (ffResult[i].fatigue >= 50 && ffResult[i].fatigue < 80) {
                ffValue += 15
            } else {
                ffValue += 5
            }

            await UPDATE('PhisicalConditions', ffResult[i].ID).with({
                cond: ffValue
            })
        }

        return 0;
    })

    this.on('sayhello', function (req) {   //le azioni vengono lanciate in POST
        return "ciao " + req.data.to;
    })
})