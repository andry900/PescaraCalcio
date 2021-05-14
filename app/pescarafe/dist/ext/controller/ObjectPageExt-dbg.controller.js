/* eslint-disable no-undef */
sap.ui.define([
],
    function (UriParameters) {
        return sap.ui.controller("pescaraCalcio.coach.pescarafe.ext.controller.ObjectPageExt", {

            onInit: function () {
                var oChart = this.getView().byId("pescaraCalcio.coach.pescarafe::PlayersObjectPage--fe::CustomSubSection::customSection--idVizFrame");
                var asyncChartUpdate = function () {
                    oChart.setVizProperties({
                        title: {
                            text: "Grafico condizioni"
                        }
                    });
                };
                setTimeout(asyncChartUpdate, 0);
            },
            onAfterRendering: function () {
                var oFilter = new sap.ui.model.Filter("ID", sap.ui.model.FilterOperator.EQ, window.location.href.split("ID=")[1].split(",")[0]);

                this.getView().byId("pescaraCalcio.coach.pescarafe::PlayersObjectPage--fe::CustomSubSection::customSection--idVizFrame").getDataset().getBinding("data").filter([oFilter]);
            }
        })
    });