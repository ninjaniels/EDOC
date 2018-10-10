tableextension 50103 "User Setup Extension" extends "User Setup"
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