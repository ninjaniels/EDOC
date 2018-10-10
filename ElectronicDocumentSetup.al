table 50112 "EDOC Electronic Document Setup"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Primary Key',NOR='Primærnøkkel';
        }

        field(2;Active;Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Active',NOR='Aktiv';
        }

        field(3;"Send E-Mail";Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Send E-Mail',NOR='Send e-post';
        }

        field(4;"Keep PDF Files";Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Keep PDF Files',NOR='Behold PDF-filer';
        }

        field(5;"Include PDF in Document Cue";Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Include PDF in Document Cue',NOR='Inkluder PDF i bilagskø';
        }

        field(6;"SMTP Name";Text[50])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='SMTP Name',NOR='SMTP-navn';
        }

        field(7;"SMTP E-Mail";Text[80])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='SMTP E-Mail',NOR='SMTP-e-post';
        }

        field(8;"Send BCC To";Text[80])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Send BCC To',NOR='Send BCC til';
        }

        field(9;"Include EHF in Document Cue";Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Include EHF in Document Cue',NOR='Inkluder EHF i bilagskø';
        }

        field(10;"Sales Invoice Path";Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Invoice Path',NOR='Fakturabane';
        }

        field(14;"Sales Inv. Report ID";Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Report ID',NOR='Rapport-ID';
            TableRelation = Object.ID where(Type = const(Report));

            trigger OnValidate();
            begin
                CalcFields("Sales Inv. Report Caption");
            end;
        }

        field(15;"Sales Inv. Report Caption";Text[80])
        {
            FieldClass = FlowField;
            CaptionML = ENU='Report Caption',NOR='Rapportoverskrift';
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Report), "Object ID" = field("Sales Inv. Report ID")));
            Editable = false;
        }

        field(20;"Sales Credit Memo Path";Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Credit Memo Path',NOR='Kreditnotabane';
        }

        field(23; "Sales Credit Memo Report ID"; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Report ID',NOR='Rapport-ID';
            TableRelation = Object.ID where(Type = const(Report));

            trigger OnValidate();
            begin
                CalcFields("Sales Credit Memo Rep. Caption");
            end;
        }

        field(25; "Sales Credit Memo Rep. Caption"; Text[80])
        {
            FieldClass = FlowField;
            CaptionML = ENU='Report Caption',NOR='Rapportoverskrift';
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Report), "Object ID" = field("Sales Credit Memo Report ID")));
            Editable = false;
        }

        field(30;"Service Invoice Path";Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Invoice Path',NOR='Fakturabane';
        }

        field(32; "Service Invoice Report ID"; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Report ID',NOR='Rapport-ID';
            TableRelation = Object.ID where(Type = const(Report));

            trigger OnValidate();
            begin
                CalcFields("Service Invoice Report Caption")
            end;
        }

        field(33;"Service Invoice Report Caption";Text[80])
        {
            FieldClass = FlowField;
            CaptionML = ENU='Report Caption',NOR='Rapportoverskrift';
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Report), "Object ID" = field("Service Invoice Report ID")));
            Editable = false;
        }

        field(40;"Service Credit Memo Path";Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Credit Memo Path',NOR='Kreditnotabane';
        }
        
        field(42;"Service Credit Memo Report ID";Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Report ID',NOR='Rapport-ID';
            TableRelation = Object.ID where(Type = const(Report));

            trigger OnValidate();
            begin
                CalcFields("Service Credit Memo Rep. Cptn.");
            end;
        }

        field(43; "Service Credit Memo Rep. Cptn."; Text[80])
        {
            FieldClass = FlowField;
            CaptionML = ENU='Report Caption',NOR='Rapportoverskrift';
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Report), "Object ID" = field("Service Credit Memo Report ID")));
            Editable = false;
        }

        field(100;"E-Mail Body";Blob)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='E-Mail Body',NOR='E-posttekst';
        }
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    
    procedure WriteToEMailBody(var BodyBigText : BigText);
    var
        OutStream : OutStream;
        Handled : Boolean;
    begin
        OnBeforeWriteToEMailBody(BodyBigText,Handled);
        if Handled then
            exit;

        clear("E-Mail Body");
        "E-Mail Body".CreateOutStream(OutStream);
        BodyBigText.Write(OutStream);
    end;

    procedure ReadFromEMailBody(var BodyBigText : BigText);
    var
        InStream : InStream;
        Handled : Boolean;
    begin
        OnBeforeReadFromEMailBody(BodyBigText,Handled);
        if Handled then
            exit;

        CalcFields("E-Mail Body");
        "E-Mail Body".CreateInStream(InStream);
        BodyBigText.Read(InStream);
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeWriteToEMailBody(var BodyBigText : BigText; var Handled : Boolean);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeReadFromEMailBody(var BodyBigText : BigText; var Handled : Boolean);
    begin

    end;
}