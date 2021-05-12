using pesacaraCalcio.coach as db from '../db/data-model';

service CatalogService {
    entity Players as select from db.Players;
    action sayhello(to : String) returns String;
}
