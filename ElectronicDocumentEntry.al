table 50111 "EDOC Electronic Document Entry"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Entry No.',NOR='Løpenr.';
            AutoIncrement = true;
        }
        field(2;"Destination";Text[80])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Destination',NOR='Mål';
        }
        field(6;"Path to Attachment";Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Path to Attachment',NOR='Filsti til vedlegg';
        }
        field(9; "File Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='File Name',NOR='Filnavn';
        }
        field(10; "Table ID"; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Table ID',NOR='Tabell-ID';
            TableRelation = AllObjWithCaption."Object ID" where ("Object Type" = const(Table));
        }
        field(11;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Document No.',NOR='Bilagsnr.';
        }
        field(12; "PDF-Invoice"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='PDF-Invoice',NOR='PDF-faktura';
        }
        field(13; "E-Invoice"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='E-Invoice',NOR='E-faktura';
        }
        field(14; "User ID"; Code[50])
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
        field(15; Created; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Created',NOR='Opprettet';
        }
        field(16; Attachment; Blob)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Attachment',NOR='Vedlegg';
        }
        field(17; "Date Created"; Date)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Date Created',NOR='Dato opprettet';
        }
        field(18; "Time Created"; Time)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Time Created',NOR='Klokkeslett opprettet';
        }
        field(21; Invoice; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Invoice',NOR='Faktura';
        }
        field(22; "Credit Memo"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Credit Memo',NOR='Kreditnota';
        }
        field(23; "Sales Document"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Sales Document',NOR='Salgsbilag';
        }
        field(24; "Service Document"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Service Document',NOR='Servicebilag';
        }
        field(30; "Sell-to Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Sell-to Customer Name',NOR='Salgs til-kundenavn';
            TableRelation = Customer;
        }
        field(31; "Sell-to Customer Name"; Text[50])
        {
            CaptionML = ENU='Sell-to Customer Name',NOR='Salg til-kundenavn';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Sell-to Customer No.")));
            Editable = false;
        }
        field(32; "Bill-to Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU='Bill-to Customer No.',NOR='Faktura til-kundenr.';
            TableRelation = Customer;
        }
        field(33; "Bill-to Name"; Text[50])
        {
            CaptionML = ENU='Bill-to Name',NOR='Faktura til-navn';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Bill-to Customer No.")));
            Editable = false;
        }
    }
    
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(MyKey; "Table ID","Document No."){}
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
        if Handled then
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

    local procedure ExportAttachment();
    var
        BlobRef : Record TempBlob;
        FileManagement : Codeunit "File Management";
        Handled : Boolean;
        FileExtension : Text;
        ClientFileName : Text;
    begin
        OnBeforeExportAttachment(Handled);
        if Handled then
            exit;

        if not Attachment.HasValue then
            exit;

        if "PDF-Invoice" then
            FileExtension := 'pdf';

        if "E-Invoice" then
            FileExtension := 'xml'; 

        ClientFileName := 'Default' + FileExtension;
        BlobRef.Blob := Attachment;
        ClientFileName := FileManagement.BLOBExport(BlobRef,ClientFileName,true);        
    end;

    [IntegrationEvent(true,false)]
    local procedure OnBeforeShowDocument(var Handled : Boolean);
    begin       

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeExportAttachment(var Handled : Boolean);
    begin

    end;
}