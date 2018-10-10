tableextension 50106 "EDOC Sales Header Archive Ext." extends "Sales Header Archive"
{
    fields
    {
        field(50100; "EDOC PDF-Invoice"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='PDF-Invoice',NOR='PDF-faktura';
            Description = 'EDOC';
        }
    }
}