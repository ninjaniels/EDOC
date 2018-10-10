tableextension 50100 "EDOC Customer Extension" extends Customer
{
    fields
    {
        field(50100; "EDOC PDF-Invoice"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='PDF-Invoice',NOR='PDF-faktura';
            Description = 'EDOC';
        }

        field(50101; "EDOC PDF-Invoice E-Mail"; Text[80])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='PDF-Invoice E-Mail',NOR='E-post for PDF-faktura';
            ExtendedDatatype = EMail;

            trigger OnValidate()
                var
                    MailManagement : Codeunit "Mail Management";
                begin
                    if "EDOC PDF-Invoice E-Mail" <> xRec."EDOC PDF-Invoice E-Mail" then
                        if not MailManagement.CheckValidEmailAddress("EDOC PDF-Invoice E-Mail") then
                            error(GetLastErrorText);
                end;
        }
    }
}