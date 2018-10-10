table 50113 "EDOC Electronic Document Cue"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Table ID";Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Table ID',NOR='Tabell-ID';
        }

        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Document No.',NOR='Bilagsnr.';
        }

        field(3;Date;Date)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Date',NOR='Dato';
        }

        field(4;"User ID";Code[50])
        {
            DataClassification = EndUserIdentifiableInformation;
            CaptionML = ENU='User ID',NOR='Bruker-ID';
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            trigger OnLookup();
                var
                    UserManagement : Codeunit "User Management";
                begin
                    UserManagement.LookupUserID("User ID");
                end;            
        }

        field(5;Invoice;Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Invoice',NOR='Faktura';
        }

        field(6; "Credit Memo"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Credit Memo',NOR='Kreditnota';
        }

        field(7; "Sales Document"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Sales Document',NOR='Salgsbilag';
        }

        field(8;"Service Document";Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Service Document',NOR='Servicebilag';
        }

        field(11;"E-Invoice";Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='E-Invoice',NOR='E-faktura';
        }

        field(12;"Sell-to Customer No.";Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Sell-to Customer No.',NOR='Salg til-kundenr.';
            TableRelation = Customer;
        }

        field(13;"Sell-to Customer Name";Text[50])
        {
            FieldClass = FlowField;
            CaptionML = ENU='Sell-to Customer Name',NOR='Salg til-kundenavn';
            CalcFormula = lookup(Customer.Name where("No." = field("Sell-to Customer No.")));
            Editable = false;
        }

        field(14;"Bill-to Customer No.";Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Bill-to Customer No.',NOR='Faktura til-kundenr.';
            TableRelation = Customer;
        }

        field(15;"Bill-to Name";Text[50])
        {
            FieldClass = FlowField;
            CaptionML = ENU='Bill-to Name',NOR='Faktura til-navn';
            CalcFormula = lookup(Customer.Name where("No." = field("Bill-to Customer No.")));
            Editable = false;
        }

        field(16;"PDF-Invoice";Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='PDF-Invoice',NOR='PDF-faktura';
        }
    }

    keys
    {
        key(PK;"Table ID","Document No.")
        {
            Clustered = true;
        }
    }

    procedure ShowDocument();
    var
        SalesInvoiceHeader : Record "Sales Invoice Header";
        SalesCreditMemoHeader : Record "Sales Cr.Memo Header";
        ServiceInvoiceHeader : Record "Service Invoice Header";
        ServiceCreditMemoHeader : Record "Service Cr.Memo Header";
        RecRelatedVariant : Variant;
        Handled : Boolean;
        PageID : Integer;
    begin
        OnBeforeShowDocument(Handled);
        if handled then
            exit;

        case "Table ID" of
            Database::"Sales Invoice Header":
                begin
                    SalesInvoiceHeader.Get("Document No.");
                    PageID := Page::"Posted Sales Invoice";
                    RecRelatedVariant := SalesInvoiceHeader;
                end;
            Database::"Sales Cr.Memo Header":
                begin
                    SalesCreditMemoHeader.Get("Document No.");
                    PageID := Page::"Posted Sales Credit Memo";
                    RecRelatedVariant := SalesCreditMemoHeader;
                end;
            Database::"Service Invoice Header":
                begin
                    ServiceInvoiceHeader.Get("Document No.");
                    PageID := Page::"Posted Service Invoice";
                    RecRelatedVariant := ServiceInvoiceHeader;
                end;
            Database::"Service Cr.Memo Header":
                begin
                    ServiceCreditMemoHeader.Get("Document No.");
                    PageID := Page::"Posted Service Credit Memo";
                    RecRelatedVariant := ServiceCreditMemoHeader;
                end;
        end;        

        if PageID > 0 then
            Page.RunModal(PageID,RecRelatedVariant);        
    end;

    [IntegrationEvent(true,false)]
    local procedure OnBeforeShowDocument(var Handled : Boolean);
    begin
        
    end;
}