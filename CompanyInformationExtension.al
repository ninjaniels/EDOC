tableextension 50102 "EDOC Company Information Ext." extends "Company Information"
{
    fields
    {
        field(50100; "EDOC Allow Use of PDF-Invoice"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Allow Use of PDF-Invoice',NOR='Tillat bruk av PDF-faktura';
            Description = 'EDOC';
        }
    }
}