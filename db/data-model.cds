namespace pesacaraCalcio.coach;

using {cuid} from '@sap/cds/common';

entity Players : cuid {
    name               : String;
    surname            : String;
    dateBirth          : Date;
    height             : Integer;
    weight             : Decimal;
    role               : String;
    foot               : String;

    TrainingAssoc      : Association to many Trainings
                             on TrainingAssoc.player = $self;
    PlayerSeasonsAssoc : Association to many PlayerSeasons
                             on PlayerSeasonsAssoc.player = $self;
}

entity Trainings : cuid {
    player                 : Association to Players;
    date                   : DateTime;
    duration               : Integer;
    trainingType           : String;

    PhisicalConditionAssoc : Association to many PhisicalConditions
                                 on PhisicalConditionAssoc.training = $self;
}

entity PlayerSeasons : cuid {
    player       : Association to Players;
    presence     : Integer;
    goal         : Integer;
    goalConceded : Integer;
    assist       : Integer;
    yellowCard   : Integer;
    redCard      : Integer;
    playedMinute : Integer;
}

entity PhisicalConditions : cuid {
    training        : Association to Trainings;
    measurementTime : DateTime;
    bloodPressure   : String;
    bpm             : Integer;
    VO2max          : Integer;
    fatigue         : Integer;
    cond       : Integer;
}

view TrainingDate as
    select from Players {
        ID,
        name as nomeGiocatore,
        surname,
        TrainingAssoc.date
    };