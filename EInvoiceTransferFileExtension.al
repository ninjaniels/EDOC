tableextension 50108 "EDIC E-Inv. Transfer File Ext." extends "E-Invoice Transfer File"
{
    fields
    {
        field(50100; "EDOC Electronic Inv. Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Electronic Inv. Entry No.', NOR = 'Løpenr. i elektronisk fakturapost';
            Editable = false;
            TableRelation = "EDOC Electronic Document Entry";
            ValidateTableRelation = false;
        }
    }
}