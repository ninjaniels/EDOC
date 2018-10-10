tableextension 50109 "EDOC Service Cr.Memo Hdr. Ext." extends "Service Cr.Memo Header"
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
            CalcFormula = exist("EDOC Electronic Document Entry" where("Table ID" = const(5994), "Document No." = field("No."), Created = const(true)));
            Editable = false;
        }
    }
}