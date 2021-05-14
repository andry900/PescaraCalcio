using pescaraCalcio.coach as db from '../db/data-model';

service CatalogService {
    @odata.draft.enabled
    entity Players            as
        select from db.Players {
            *,
            0 as cond           : Integer,
            0 as progressStatus : Integer
        };

    @odata.draft.enabled
    entity Trainings          as
        select from db.Trainings
        order by
            date;

    @odata.draft.enabled
    entity PlayerSeasons      as select from db.PlayerSeasons;

    @odata.draft.enabled
    entity PhisicalConditions as select from db.PhisicalConditions;

    entity PlayerGraphs       as
        select from db.PhisicalConditions {
            measurementTime,
            cond,
            training.player.ID
        };

    action calculateCondition() returns Integer;
    action sayhello(to : String) returns String;
}
