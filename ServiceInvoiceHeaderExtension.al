tableextension 50110 "EDOC Service Inv. Header Ext." extends "Service Invoice Header"
{
    fields
    {
        field(50100; "EDOC PDF-Invoice"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='PDF-Invoice',NOR='PDF-faktura';
            Description = 'EDOC';
        }

        field(50101; "EDOC PDF-Invoice Created"; Boolean)
        {
            FieldClass = FlowField;
            CaptionML = ENU='PDF-Invoice Created',NOR='PDF-faktura er opprettet';
            Description = 'EDOC';
            CalcFormula = exist("EDOC Electronic Document Entry" where("Table ID" = const(5992), "Document No." = field("No."), Created = const(true)));
            Editable = false;
        }
    }
}