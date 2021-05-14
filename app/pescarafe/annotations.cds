using CatalogService as service from '../../srv/cat-service';

annotate CatalogService.Players with @UI : {
    DataPoint                   : {
        $Type         : 'UI.DataPointType',
        Value         : cond,
        TargetValue   : 100,
        Visualization : #Progress,
        Criticality   : progressStatus,
    },
    SelectionFields             : [
        name,
        surname,
        role,
        cond
    ],
    LineItem                    : [
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : surname,
        },
        {
            $Type : 'UI.DataField',
            Value : role,
        },
        {
            $Type  : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint',
            Label  : 'Condizione',
        },
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.EntityContainer/calculateCondition',
            Label  : 'Ricalcola condizione',
        },
    ],
    HeaderInfo                  : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Giocatore',
        TypeNamePlural : 'Giocatori',
        Title          : {
            $Type : 'UI.DataField',
            Value : name,
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : role,
        },
    },
    HeaderFacets                : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#headerDettaglio',
    }, ],
    FieldGroup #headerDettaglio : {
        $Type : 'UI.FieldGroupType',
        Data  : [{
            $Type : 'UI.DataField',
            Value : surname,
        }, ],
    },
    Facets                      : [
        {
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#parametriFisici',
            Label  : 'Parametri Fisici',
            ID : 'Players_ID',
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'PlayerSeasonsAssoc/@UI.LineItem#Seasons',
            Label  : 'Stagioni',
        },
    ],
    FieldGroup #parametriFisici : {
        $Type : 'UI.FieldGroupType',
        Label : 'Parametri Fisici',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : cond,
            },
            {
                $Type : 'UI.DataField',
                Value : dateBirth,
            },
            {
                $Type : 'UI.DataField',
                Value : height,
            },
            {
                $Type : 'UI.DataField',
                Value : weight,
            },
            {
                $Type : 'UI.DataField',
                Value : foot,
            },
        ],
    },
};

annotate CatalogService.Players with {
    ID        @UI.Hidden;
    name      @title : 'Nome';
    surname   @title : 'Cognome';
    player    @title : 'Giocatore';
    role      @title : 'Ruolo';
    cond      @title : 'Condizione';
    height    @title : 'Altezza';
    weight    @title : 'Peso';
    dateBirth @title : 'Data di nascita';
    foot      @title : 'Piede preferito';
};

annotate CatalogService.PlayerSeasons with @UI : {LineItem #Seasons : [
    {
        $Type : 'UI.DataField',
        Value : year,
    },
    {
        $Type : 'UI.DataField',
        Value : presence,
    },
    {
        $Type : 'UI.DataField',
        Value : goal,
    },
    {
        $Type : 'UI.DataField',
        Value : goalConceded,
    },
    {
        $Type : 'UI.DataField',
        Value : assist,
    },
    {
        $Type : 'UI.DataField',
        Value : playedMinute,
    },
], };

annotate CatalogService.PlayerSeasons with {
    ID           @UI.Hidden;
    year         @title : 'Anno';
    presence     @title : 'Presenze';
    goal         @title : 'Goal';
    goalConceded @title : 'Goal subiti';
    assist       @title : 'Assists';
    playedMinute @title : 'Minuti Giocati';
};
