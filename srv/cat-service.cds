using pesacaraCalcio.coach as db from '../db/data-model';

service CatalogService {
    entity Players       as
        select from db.Players {
            *,
            0 as cond : Integer
        };

    entity Trainings     as
        select from db.Trainings
        order by
            date;

    entity PlayerSeasons as select from db.PlayerSeasons;
    //action calculateCondition(to : String) returns String;
    action sayhello(to : String) returns String;
}
