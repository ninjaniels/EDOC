codeunit 50100 "EDOC Electronic Document Mgt."
{
    trigger OnRun();
    begin
    end;
    
    var
        TempPrinterSelection : Record "Printer Selection" temporary;
        ElectronicDocumentSetup : Record "EDOC Electronic Document Setup";
        DataTypeManegement : Codeunit "Data Type Management";
        FileManagement : Codeunit "File Management";
        ElectronicDocumentSetupRead : Boolean;
        InvoiceCaption : TextConst ENU='Invoice',NOR='Faktura';
        CreditMemoCaption : TextConst ENU='Credit Memo',NOR='Kreditnota';
        EMailSuccessfulMsg : TextConst ENU='The document was successfully sendt on e-mail.',NOR='Bilaget ble sendt på e-post uten problemer.';
        EMailNotSuccessfulErr : TextConst ENU='There was a problem and the document was not sendt on e-mail.',NOR='Det oppstod et problem og bilaget ble ikke sendt på e-post.';
        DoYouWantToSendPDFTxt : TextConst ENU='Do you want to send document on PDF?',NOR='Vil du sende bilaget på PDF?';
        CannotBeEmptyErr : TextConst ENU='%1 cannot be empty (%2).',NOR='%1 kan ikke være blank (%2).';
        RequiredForEInvoiceTxt : TextConst ENU='This is required for an E-Invoice document which might be created from the posted document.',NOR='Dette er påkrevet for et e-fakturadokument som kan bli opprettet fra det bokførte dokumentet.';

    [IntegrationEvent(false,false)]
    local procedure OnBeforeCreatePDFDocCommonYesNo(var HeaderDoc : Variant);
    begin
        
    end;

    [IntegrationEvent(false,false)]
    local procedure OnAfterCreatePDFDocCommonYesNo(var HeaderDoc : Variant);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeCreatePDFDocument(var RecordRef : RecordRef; var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry");
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnAfterCreatePDFDocument(var RecordRef : RecordRef; var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry");
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeInitializeElectronicDocumentEntry(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry");
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnAfterInitializeElectronicDocumentEntry(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry");
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeSendElectronicDocumentEntry(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; SendBCC : Boolean);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnAfterSendElectronicDocumentEntry(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; SendBCC : Boolean);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeAddToElectronicDocumentCue(var ElectronicDocumentCue : Record "EDOC Electronic Document Cue"; RecordRef : RecordRef);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnAfterAddToElectronicDocumentCue(var ElectronicDocumentCue : Record "EDOC Electronic Document Cue"; RecordRef : RecordRef);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeUpdateElectronicDocumentEntry(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; var RecordRef : RecordRef);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnAfterUpdateElectronicDocumentEntry(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; var RecordRef : RecordRef);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeSaveAsPDFSalesInvoiceHeader(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; ServerFileName : Text; var Handled : Boolean);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeSaveAsPDFSalesCreditMemoHeader(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; ServerFileName : Text; var Handled : Boolean);
    begin
        
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeSaveAsPDFServiceInvoiceHeader(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; ServerFileName : Text; var Handled : Boolean);
    begin
        
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeSaveAsPDFServiceCreditMemoHeader(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; ServerFileName : Text; var Handled : Boolean);
    begin
        
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeTryElectronicDocumentSetupSalesHeader(var RecordRef : RecordRef; var Handled : Boolean);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeTryElectronicDocumentSetupSalesInvoiceHeader(var RecordRef : RecordRef; var Handled : Boolean);
    begin
        
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeTryElectronicDocumentSetupSalesCreditMemoHeader(var RecordRef : RecordRef; var Handled : Boolean);
    begin
        
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeTryElectronicDocumentSetupServiceInvoiceHeader(var RecordRef : RecordRef; var Handled : Boolean);
    begin
        
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeTryElectronicDocumentSetupServiceCreditMemoHeader(var RecordRef : RecordRef; var Handled : Boolean);
    begin
        
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeCreateEHFDocSalesInvoiceHeader(var RecordRef : RecordRef; var Handled : Boolean);
    begin

    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeCreateEHFDocSalesCreditMemoHeader(var RecordRef : RecordRef; var Handled : Boolean);
    begin
        
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeCreateEHFDocServiceInvoiceHeader(var RecordRef : RecordRef; var Handled : Boolean);
    begin
        
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeCreateEHFDocServiceCreditMemoHeader(var RecordRef : RecordRef; var Handled : Boolean);
    begin
        
    end;

    procedure CreatePDFDocumentCommonYesNo(HeaderDoc : Variant);
    begin
        OnBeforeCreatePDFDocCommonYesNo(HeaderDoc);

        if GuiAllowed and (not Confirm(DoYouWantToSendPDFTxt)) then
            error('');        

        if OnCreatePDFDocCommon(HeaderDoc,false) then
            Message(EMailSuccessfulMsg)
        else
            Message(EMailNotSuccessfulErr);
    end;

    procedure OnCreatePDFDocCommon(HeaderDoc : Variant; SendBCC : Boolean) : Boolean;
    var
        RecordRef : RecordRef;
        ElectronicDocumentEntry : Record "EDOC Electronic Document Entry";
        ElectronicDocumentCue : Record "EDOC Electronic Document Cue";
        ServerFile : File;
        InStream : InStream;
        OutStream : OutStream;
        ServerFileName : Text;
    begin
        if not DataTypeManegement.GetRecordRef(HeaderDoc,RecordRef) then
            exit;

        if not TryElectronicDocumentSetupCommon(HeaderDoc) then
            error(GetLastErrorText);

        if not TrySomethingToExport(RecordRef) then begin
            DeleteElectronicDocumentCueFromRecordRef(RecordRef);
            exit;
        end;

        with ElectronicDocumentEntry do begin
            InitializeElectronicDocumentEntry(ElectronicDocumentEntry);
            "PDF-Invoice" := true;

            case RecordRef.Number of
                Database::"Sales Invoice Header":
                    CreatePDFDocSalesInvoiceHeader(RecordRef,ElectronicDocumentEntry);
                Database::"Sales Cr.Memo Header":
                    CreatePDFDocSalesCreditMemoHeader(RecordRef,ElectronicDocumentEntry);
                Database::"Service Invoice Header":
                    CreatePDFDocServiceInvoiceHeader(RecordRef,ElectronicDocumentEntry);
                Database::"Service Cr.Memo Header":
                    CreatePDFDocServiceCreditMemoHeader(RecordRef,ElectronicDocumentEntry);
            end;

            SaveAsPDFCommon(ElectronicDocumentEntry);

            if ElectronicDocumentSetup."Send E-Mail" then
                SendElectronicDocumentEntry(ElectronicDocumentEntry,SendBCC)
            else begin
                Created := true;
                "Date Created" := Today;
                "Time Created" := Time;
            end;

            if Created or (not ElectronicDocumentSetup."Send E-Mail") then begin
                if FileManagement.CanRunDotNetOnClient then begin
                    if FileManagement.ClientFileExists("Path to Attachment") then
                        ServerFileName := FileManagement.UploadFileSilent("Path to Attachment");
                end else begin
                    if Exists("Path to Attachment") then begin
                        ServerFileName := FileManagement.ServerTempFileName(FileManagement.GetExtension("Path to Attachment"));
                        CopyClientFileToServerFile("Path to Attachment",ServerFileName);
                    end;
                end;
                ServerFile.Open(ServerFileName);
                ServerFile.CreateInStream(InStream);
                Attachment.CreateOutStream(OutStream);
                CopyStream(OutStream,InStream);
                ServerFile.Close;
                if FileManagement.CanRunDotNetOnClient then begin
                    FileManagement.DeleteServerFile(ServerFileName);
                    if not ElectronicDocumentSetup."Keep PDF Files" then
                        FileManagement.DeleteClientFile("Path to Attachment");
                end else begin
                    Erase(ServerFileName);
                    Erase("Path to Attachment");
                end;
                if ElectronicDocumentCue.Get("Table ID","Document No.") then
                    ElectronicDocumentCue.Delete;
            end;
            Insert;
            exit(Created);
        end;
    end;

    local procedure CreatePDFDocSalesInvoiceHeader(var RecordRef : RecordRef; var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry");
    var
        SalesInvoiceHeader : Record "Sales Invoice Header";
        Customer : Record Customer;
    begin
        OnBeforeCreatePDFDocument(RecordRef,ElectronicDocumentEntry);

        GetElectronicDocumentSetup;
        RecordRef.SetTable(SalesInvoiceHeader);
        with SalesInvoiceHeader do begin
            Customer.Get("Bill-to Customer No.");
            ElectronicDocumentEntry.Destination := Customer."EDOC PDF-Invoice E-Mail";
            ElectronicDocumentEntry.Invoice := true;
            ElectronicDocumentEntry."Sales Document" := true;
            ElectronicDocumentEntry."Path to Attachment" := StrSubstNo('%1%2%3.pdf',ElectronicDocumentSetup."Sales Invoice Path",InvoiceCaption,"No.");
            ElectronicDocumentEntry."File Name" := FileManagement.GetFileName(ElectronicDocumentEntry."Path to Attachment");
            ElectronicDocumentEntry."Table ID" := RecordRef.Number;
            ElectronicDocumentEntry."Document No." := "No.";
            ElectronicDocumentEntry."Sell-to Customer No." := "Sell-to Customer No.";
            ElectronicDocumentEntry."Bill-to Customer No." := "Bill-to Customer No.";
        end;

        OnAfterCreatePDFDocument(RecordRef,ElectronicDocumentEntry);
    end;

    local procedure CreatePDFDocSalesCreditMemoHeader(var RecordRef : RecordRef; var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry");
    var
        SalesCreditMemoHeader : Record "Sales Cr.Memo Header";
        Customer : Record Customer;
    begin
        OnBeforeCreatePDFDocument(RecordRef,ElectronicDocumentEntry);

        GetElectronicDocumentSetup;
        RecordRef.SetTable(SalesCreditMemoHeader);
        with SalesCreditMemoHeader do begin
            Customer.Get("Bill-to Customer No.");
            ElectronicDocumentEntry.Destination := Customer."EDOC PDF-Invoice E-Mail";
            ElectronicDocumentEntry."Credit Memo" := true;
            ElectronicDocumentEntry."Sales Document" := true;
            ElectronicDocumentEntry."Path to Attachment" := StrSubstNo('%1%2%3.pdf',ElectronicDocumentSetup."Sales Credit Memo Path",CreditMemoCaption,"No.");
            ElectronicDocumentEntry."File Name" := FileManagement.GetFileName(ElectronicDocumentEntry."Path to Attachment");
            ElectronicDocumentEntry."Table ID" := RecordRef.Number;
            ElectronicDocumentEntry."Document No." := "No.";
            ElectronicDocumentEntry."Sell-to Customer No." := "Sell-to Customer No.";
            ElectronicDocumentEntry."Bill-to Customer No." := "Bill-to Customer No.";
        end;

        OnAfterCreatePDFDocument(RecordRef,ElectronicDocumentEntry);
    end;

    local procedure CreatePDFDocServiceInvoiceHeader(var RecordRef : RecordRef; var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry");
    var
        ServiceInvoiceHeader : Record "Service Invoice Header";
        Customer : Record Customer;
    begin
        OnBeforeCreatePDFDocument(RecordRef,ElectronicDocumentEntry);

        GetElectronicDocumentSetup;
        RecordRef.SetTable(ServiceInvoiceHeader);
        with ServiceInvoiceHeader do begin
            Customer.Get("Bill-to Customer No.");
            ElectronicDocumentEntry.Destination := Customer."EDOC PDF-Invoice E-Mail";
            ElectronicDocumentEntry.Invoice := true;
            ElectronicDocumentEntry."Service Document" := true;
            ElectronicDocumentEntry."Path to Attachment" := StrSubstNo('%1%2%3.pdf',ElectronicDocumentSetup."Service Invoice Path",InvoiceCaption,"No.");
            ElectronicDocumentEntry."File Name" := FileManagement.GetFileName(ElectronicDocumentEntry."Path to Attachment");
            ElectronicDocumentEntry."Table ID" := RecordRef.Number;
            ElectronicDocumentEntry."Document No." := "No.";
            ElectronicDocumentEntry."Sell-to Customer No." := "Customer No.";
            ElectronicDocumentEntry."Bill-to Customer No." := "Bill-to Customer No.";
        end;

        OnAfterCreatePDFDocument(RecordRef,ElectronicDocumentEntry);
    end;

    local procedure CreatePDFDocServiceCreditMemoHeader(var RecordRef : RecordRef; var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry");
    var
        ServiceCreditMemoHeader : Record "Service Cr.Memo Header";
        Customer : Record Customer;
    begin
        OnBeforeCreatePDFDocument(RecordRef,ElectronicDocumentEntry);

        GetElectronicDocumentSetup;
        RecordRef.SetTable(ServiceCreditMemoHeader);
        with ServiceCreditMemoHeader do begin
            Customer.Get("Bill-to Customer No.");
            ElectronicDocumentEntry.Destination := Customer."EDOC PDF-Invoice E-Mail";
            ElectronicDocumentEntry."Credit Memo" := true;
            ElectronicDocumentEntry."Service Document" := true;
            ElectronicDocumentEntry."Path to Attachment" := StrSubstNo('%1%2%3.pdf',ElectronicDocumentSetup."Service Credit Memo Path",CreditMemoCaption,"No.");
            ElectronicDocumentEntry."File Name" := FileManagement.GetFileName(ElectronicDocumentEntry."Path to Attachment");
            ElectronicDocumentEntry."Table ID" := RecordRef.Number;
            ElectronicDocumentEntry."Document No." := "No.";
            ElectronicDocumentEntry."Sell-to Customer No." := "Customer No.";
            ElectronicDocumentEntry."Bill-to Customer No." := "Bill-to Customer No.";
        end;

        OnAfterCreatePDFDocument(RecordRef,ElectronicDocumentEntry);
    end;

    local procedure SaveAsPDFCommon(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry");
    var
        ServerFileName : Text;
        ClientFileName : Text;
        FileExtension : Text[10];
    begin
        ClientFileName := ElectronicDocumentEntry."Path to Attachment";
        ElectronicDocumentEntry."Path to Attachment" := '';
        FileExtension := FileManagement.GetExtension(ClientFileName);
        ServerFileName := FileManagement.ServerTempFileName(FileExtension);

        case true of
            ElectronicDocumentEntry."Table ID" = Database::"Sales Invoice Header":
                SaveAsPDFSalesInvoiceHeader(ElectronicDocumentEntry,ServerFileName);
            ElectronicDocumentEntry."Table ID" = Database::"Sales Cr.Memo Header":
                SaveAsPDFSalesCreditMemoHeader(ElectronicDocumentEntry,ServerFileName);
            ElectronicDocumentEntry."Table ID" = Database::"Service Invoice Header":
                SaveAsPDFServiceInvoiceHeader(ElectronicDocumentEntry,ServerFileName);
            ElectronicDocumentEntry."Table ID" = Database::"Service Cr.Memo Header":
                SaveAsPDFServiceCreditMemoHeader(ElectronicDocumentEntry,ServerFileName);
        end;

        if FileManagement.CanRunDotNetOnClient then begin
            if FileManagement.ServerFileExists(ServerFileName) then begin
                FileManagement.DownloadToFile(ServerFileName,ClientFileName);
                ElectronicDocumentEntry."Path to Attachment" := ClientFileName;
                FileManagement.DeleteServerFile(ServerFileName);
            end;
        end else begin
            if Exists(ServerFileName) then begin
                CopyClientFileToServerFile(ServerFileName,ClientFileName);
                ElectronicDocumentEntry."Path to Attachment" := ClientFileName;
                Erase(ServerFileName);
            end;
        end;
    end;

    local procedure SaveAsPDFSalesInvoiceHeader(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; ServerFileName : Text);
    var
        SalesInvoiceHeader : Record "Sales Invoice Header";
        Handled : Boolean;
    begin
        OnBeforeSaveAsPDFSalesInvoiceHeader(ElectronicDocumentEntry,ServerFileName,Handled);
        if Handled then
            exit;

        with SalesInvoiceHeader do begin
            GetElectronicDocumentSetup;
            Get(ElectronicDocumentEntry."Document No.");
            SetRecFilter;
            ElectronicDocumentSetup.TestField("Sales Inv. Report ID");
            Report.SaveAsPdf(ElectronicDocumentSetup."Sales Inv. Report ID",ServerFileName,SalesInvoiceHeader);
        end;
    end;

    local procedure SaveAsPDFSalesCreditMemoHeader(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; ServerFileName : Text);
    var
        SalesCreditMemoHeader : Record "Sales Cr.Memo Header";
        Handled : Boolean;
    begin
        OnBeforeSaveAsPDFSalesCreditMemoHeader(ElectronicDocumentEntry,ServerFileName,Handled);
        if Handled then
            exit;

        with SalesCreditMemoHeader do begin
            GetElectronicDocumentSetup;
            Get(ElectronicDocumentEntry."Document No.");
            SetRecFilter;
            ElectronicDocumentSetup.TestField("Sales Credit Memo Report ID");
            Report.SaveAsPdf(ElectronicDocumentSetup."Sales Credit Memo Report ID",ServerFileName,SalesCreditMemoHeader);
        end;
    end;

    local procedure SaveAsPDFServiceInvoiceHeader(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; ServerFileName : Text);
    var
        ServiceInvoiceHeader : Record "Service Invoice Header";
        Handled : Boolean;
    begin
        OnBeforeSaveAsPDFServiceInvoiceHeader(ElectronicDocumentEntry,ServerFileName,Handled);
        if Handled then
            exit;

        with ServiceInvoiceHeader do begin
            GetElectronicDocumentSetup;
            Get(ElectronicDocumentEntry."Document No.");
            SetRecFilter;
            ElectronicDocumentSetup.TestField("Service Invoice Report ID");
            Report.SaveAsPdf(ElectronicDocumentSetup."Service Invoice Report ID",ServerFileName,ServiceInvoiceHeader);
        end;
    end;

    local procedure SaveAsPDFServiceCreditMemoHeader(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; ServerFileName : Text);
    var
        ServiceCreditMemoHeader : Record "Service Cr.Memo Header";
        Handled : Boolean;
    begin
        OnBeforeSaveAsPDFServiceCreditMemoHeader(ElectronicDocumentEntry,ServerFileName,Handled);
        if Handled then
            exit;

        with ServiceCreditMemoHeader do begin
            GetElectronicDocumentSetup;
            Get(ElectronicDocumentEntry."Document No.");
            SetRecFilter;
            ElectronicDocumentSetup.TestField("Service Credit Memo Report ID");
            Report.SaveAsPdf(ElectronicDocumentSetup."Service Credit Memo Report ID",ServerFileName,ServiceCreditMemoHeader);
        end;
    end;

    local procedure InitializeElectronicDocumentEntry(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry");
    begin
        OnBeforeInitializeElectronicDocumentEntry(ElectronicDocumentEntry);

        with ElectronicDocumentEntry do begin
            Init;
            "User ID" := UserId;
            Created := false;
        end;

        OnAfterInitializeElectronicDocumentEntry(ElectronicDocumentEntry);
    end;

    local procedure SendElectronicDocumentEntry(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; SendBCC : Boolean);
    var
        SMTP : Codeunit "SMTP Mail";
        SubjectText : Text;
        BodyText : Text;
        ServerFileName : Text;
        BodyBigText : BigText;
    begin
        OnBeforeSendElectronicDocumentEntry(ElectronicDocumentEntry,SendBCC);

        with ElectronicDocumentEntry do begin
            if not Created then begin
                CalcFields("Sell-to Customer Name");
                if FileManagement.CanRunDotNetOnClient then begin
                    if not FileManagement.ClientFileExists("Path to Attachment") then
                        exit;
                    ServerFileName := FileManagement.UploadFileSilent("Path to Attachment");
                    CopyClientFileToServerFile("Path to Attachment",ServerFileName);
                end;
                GetElectronicDocumentSetup;
                ElectronicDocumentSetup.ReadFromEMailBody(BodyBigText);
                BodyBigText.GetSubText(BodyText,1);
                if Invoice then
                    SubjectText := InvoiceCaption
                else
                    SubjectText := CreditMemoCaption;
                Clear(SMTP);
                SMTP.CreateMessage(
                    ElectronicDocumentSetup."SMTP Name",
                    ElectronicDocumentSetup."SMTP E-Mail",
                    Destination,
                    StrSubstNo(
                        '%1 %2 %3',
                            "Sell-to Customer Name",
                            SubjectText,
                            "Document No."),
                    BodyText,false);
                SMTP.AddAttachment(ServerFileName,"File Name");
                if SMTP.TrySend then begin
                    Created := true;
                    "Date Created" := Today;
                    "Time Created" := Time;
                end;
                if SendBCC and (ElectronicDocumentSetup."Send BCC To" <> '') then begin
                    Clear(SMTP);
                    SMTP.CreateMessage(
                        ElectronicDocumentSetup."SMTP Name",
                        ElectronicDocumentSetup."SMTP E-Mail",
                        ElectronicDocumentSetup."Send BCC To",
                        StrSubstNo(
                            '%1 %2 %3',
                                "Sell-to Customer Name",
                                SubjectText,
                                "Document No."),
                        BodyText,false);
                    SMTP.AddAttachment(ServerFileName,"File Name");
                    if SMTP.TrySend then ;
                end;
                if FileManagement.CanRunDotNetOnClient then
                    FileManagement.DeleteServerFile(ServerFileName)
                else
                    Erase(ServerFileName);
            end;
        end;

        OnAfterSendElectronicDocumentEntry(ElectronicDocumentEntry,SendBCC);
    end;

    local procedure GetElectronicDocumentSetup();
    begin
        if not ElectronicDocumentSetupRead then begin
            ElectronicDocumentSetup.Get;
            ElectronicDocumentSetupRead := true;
        end;        
    end;

    [TryFunction]
    procedure TryElectronicDocumentSetupCommon(var HeaderDoc : Variant);
    var
        CompanyInformation : Record "Company Information";
        UserSetup : Record "User Setup";
        DataTypeManagement : Codeunit "Data Type Management";
        RecordRef : RecordRef;
    begin
        if not HeaderDoc.IsRecord then
            exit;

        DataTypeManagement.GetRecordRef(HeaderDoc,RecordRef);
        GetElectronicDocumentSetup;
        ElectronicDocumentSetup.TestField(Active,true);
        ElectronicDocumentSetup.TestField("SMTP Name");
        ElectronicDocumentSetup.TestField("SMTP E-Mail");

        CompanyInformation.Get;
        CompanyInformation.TestField("EDOC Allow Use of PDF-Invoice");

        UserSetup.Get(UserId);
        UserSetup.TestField("EDOC Allow Use of PDF-Invoice");

        case RecordRef.Number of
            Database::"Sales Header":
                if not TryElectronicDocumentSetupSalesHeader(RecordRef) then
                    Error(GetLastErrorText);
            Database::"Sales Invoice Header":
                if not TryElectronicDocumentSetupSalesInvoiceHeader(RecordRef) then
                    Error(GetLastErrorText);
            Database::"Sales Cr.Memo Header":
                if not TryElectronicDocumentSetupSalesCreditMemoHeader(RecordRef) then
                    Error(GetLastErrorText);
            Database::"Service Invoice Header":
                if not TryElectronicDocumentSetupServiceInvoiceHeader(RecordRef) then
                    Error(GetLastErrorText);
            Database::"Service Cr.Memo Header":
                if not TryElectronicDocumentSetupServiceCreditMemoHeader(RecordRef) then
                    Error(GetLastErrorText);
        end;
    end;

    [TryFunction]
    local procedure TryElectronicDocumentSetupSalesHeader(var RecordRef : RecordRef);
    var
        SalesHeader : Record "Sales Header";
        Handled : Boolean;
    begin
        OnBeforeTryElectronicDocumentSetupSalesHeader(RecordRef,Handled);
        if Handled then
            exit;

        GetElectronicDocumentSetup;
        RecordRef.SetTable(SalesHeader);
        with SalesHeader do begin
            if "Document Type" in ["Document Type"::Order,"Document Type"::Invoice] then begin
                ElectronicDocumentSetup.TestField("Sales Invoice Path");
                ElectronicDocumentSetup.TestField("Sales Inv. Report ID");
            end;

            if "Document Type" = "Document Type"::"Credit Memo" then begin
                ElectronicDocumentSetup.TestField("Sales Credit Memo Path");
                ElectronicDocumentSetup.TestField("Sales Credit Memo Report ID");
            end;
        end;
    end;

    [TryFunction]
    local procedure TryElectronicDocumentSetupSalesInvoiceHeader(var RecordRef : RecordRef);
    var
        Handled : Boolean;
    begin
        OnBeforeTryElectronicDocumentSetupSalesInvoiceHeader(RecordRef,Handled);
        if Handled then
            exit;

        GetElectronicDocumentSetup;
        ElectronicDocumentSetup.TestField("Sales Invoice Path");
        ElectronicDocumentSetup.TestField("Sales Inv. Report ID");
    end;

    [TryFunction]
    local procedure TryElectronicDocumentSetupSalesCreditMemoHeader(var RecordRef : RecordRef);
    var
        Handled : Boolean;
    begin
        OnBeforeTryElectronicDocumentSetupSalesCreditMemoHeader(RecordRef,Handled);
        if Handled then
            exit;

        GetElectronicDocumentSetup;
        ElectronicDocumentSetup.TestField("Sales Credit Memo Path");
        ElectronicDocumentSetup.TestField("Sales Credit Memo Report ID");
    end;

    [TryFunction]
    local procedure TryElectronicDocumentSetupServiceInvoiceHeader(var RecordRef : RecordRef);
    var
        Handled : Boolean;
    begin
        OnBeforeTryElectronicDocumentSetupServiceInvoiceHeader(RecordRef,Handled);
        if Handled then
            exit;

        GetElectronicDocumentSetup;
        ElectronicDocumentSetup.TestField("Service Invoice Path");
        ElectronicDocumentSetup.TestField("Service Invoice Report ID");
    end;

    [TryFunction]
    local procedure TryElectronicDocumentSetupServiceCreditMemoHeader(var RecordRef : RecordRef);
    var
        Handled : Boolean;
    begin
        OnBeforeTryElectronicDocumentSetupServiceCreditMemoHeader(RecordRef,Handled);
        if Handled then
            exit;

        GetElectronicDocumentSetup;
        ElectronicDocumentSetup.TestField("Service Credit Memo Path");
        ElectronicDocumentSetup.TestField("Service Credit Memo Report ID");
    end;

    local procedure AddToElectronicDocumentCueSalesInvoiceHeader(var ElectronicDocumentCue : Record "EDOC Electronic Document Cue"; var RecordRef : RecordRef) : Boolean;
    var
        SalesInvoiceHeader : Record "Sales Invoice Header";
    begin
        OnBeforeAddToElectronicDocumentCue(ElectronicDocumentCue,RecordRef);

        GetElectronicDocumentSetup;
        RecordRef.SetTable(SalesInvoiceHeader);
        with SalesInvoiceHeader do begin
            if (not "EDOC PDF-Invoice") and (not "E-Invoice") then
                exit;
            if  "EDOC PDF-Invoice" and (not ElectronicDocumentSetup."Include PDF in Document Cue") then
                exit;
            if "E-Invoice" and (not ElectronicDocumentSetup."Include EHF in Document Cue") then
                exit;

            ElectronicDocumentCue."Document No." := "No.";
            ElectronicDocumentCue."E-Invoice" := "E-Invoice";
            ElectronicDocumentCue."PDF-Invoice" := "EDOC PDF-Invoice";
            ElectronicDocumentCue.Invoice := true;
            ElectronicDocumentCue."Sales Document" := true;
            ElectronicDocumentCue."Sell-to Customer No." := "Sell-to Customer No.";
            ElectronicDocumentCue."Bill-to Customer No." := "Bill-to Customer No.";
        end;

        OnAfterAddToElectronicDocumentCue(ElectronicDocumentCue,RecordRef);

        exit(true);
    end;

    local procedure AddToElectronicDocumentCueSalesCreditMemoHeader(var ElectronicDocumentCue : Record "EDOC Electronic Document Cue"; var RecordRef : RecordRef) : Boolean;
    var
        SalesCreditMemoHeader : Record "Sales Cr.Memo Header";
    begin
        OnBeforeAddToElectronicDocumentCue(ElectronicDocumentCue,RecordRef);

        GetElectronicDocumentSetup;
        RecordRef.SetTable(SalesCreditMemoHeader);
        with SalesCreditMemoHeader do begin 
            if not ("EDOC PDF-Invoice") and (not E-"E-Invoice") then
                exit;
            if "EDOC PDF-Invoice" and (not ElectronicDocumentSetup."Include PDF in Document Cue") then
                exit;
            if "E-Invoice" and (not ElectronicDocumentSetup."Include EHF in Document Cue") then
                exit;

            ElectronicDocumentCue."Document No." := "No.";
            ElectronicDocumentCue."E-Invoice" := "E-Invoice";
            ElectronicDocumentCue."PDF-Invoice" := "EDOC PDF-Invoice";
            ElectronicDocumentCue."Credit Memo" := true;
            ElectronicDocumentCue."Sales Document" := true;
            ElectronicDocumentCue."Sell-to Customer No." := "Sell-to Customer No.";
            ElectronicDocumentCue."Bill-to Customer No." := "Bill-to Customer No.";
        end;

        OnAfterAddToElectronicDocumentCue(ElectronicDocumentCue,RecordRef);

        exit(true);
    end;

    local procedure AddToElectronicDocumentCueServiceInvoiceHeader(var ElectronicDocumentCue : Record "EDOC Electronic Document Cue"; var RecordRef : RecordRef) : Boolean;
    var
        ServiceInvoiceHeader : Record "Service Invoice Header";
    begin
        OnBeforeAddToElectronicDocumentCue(ElectronicDocumentCue,RecordRef);

        GetElectronicDocumentSetup;
        RecordRef.SetTable(ServiceInvoiceHeader);
        with ServiceInvoiceHeader do begin
            if (not "EDOC PDF-Invoice") and (not "E-Invoice") then
                exit;
            if "EDOC PDF-Invoice" and (not ElectronicDocumentSetup."Include PDF in Document Cue") then
                exit;
            if "E-Invoice" and (not ElectronicDocumentSetup."Include EHF in Document Cue") then
                exit;

            ElectronicDocumentCue."Document No." := "No.";
            ElectronicDocumentCue."E-Invoice" := "E-Invoice";
            ElectronicDocumentCue."PDF-Invoice" := "EDOC PDF-Invoice";
            ElectronicDocumentCue.Invoice := true;
            ElectronicDocumentCue."Service Document" := true;
            ElectronicDocumentCue."Sell-to Customer No." := "Customer No.";
            ElectronicDocumentCue."Bill-to Customer No." := "Bill-to Customer No.";
        end;

        OnAfterAddToElectronicDocumentCue(ElectronicDocumentCue,RecordRef);

        exit(true);
    end;

    local procedure AddToElectronicDocumentCueServiceCreditMemoHeader(var ElectronicDocumentCue : Record "EDOC Electronic Document Cue"; var RecordRef : RecordRef) : Boolean;
    var
        ServiceCreditMemoHeader : Record "Service Cr.Memo Header";
    begin
        OnBeforeAddToElectronicDocumentCue(ElectronicDocumentCue,RecordRef);

        GetElectronicDocumentSetup;
        RecordRef.SetTable(ServiceCreditMemoHeader);
        with ServiceCreditMemoHeader do begin
            if (not "EDOC PDF-Invoice") and (not "E-Invoice") then
                exit;
            if "EDOC PDF-Invoice" and (not ElectronicDocumentSetup."Include PDF in Document Cue") then
                exit;
            if "E-Invoice" and (not ElectronicDocumentSetup."Include EHF in Document Cue") then
                exit;

            ElectronicDocumentCue."Document No." := "No.";
            ElectronicDocumentCue."E-Invoice" := "E-Invoice";
            ElectronicDocumentCue."PDF-Invoice" := "EDOC PDF-Invoice";
            ElectronicDocumentCue."Credit Memo" := true;
            ElectronicDocumentCue."Service Document" := true;
            ElectronicDocumentCue."Sell-to Customer No." := "Customer No.";
            ElectronicDocumentCue."Bill-to Customer No." := "Bill-to Customer No.";
        end;

        OnAfterAddToElectronicDocumentCue(ElectronicDocumentCue,RecordRef);        

        exit(true);
    end;

    procedure OnCreateEHFDocCommon(var HeaderDoc : Variant) : Boolean;
    var
        CompanyInformation : Record "Company Information";
        UserSetup : Record "User Setup";
        RecordRef : RecordRef;
    begin
        if HeaderDoc.IsRecord then begin
            GetElectronicDocumentSetup;
            ElectronicDocumentSetup.TestField(Active,true);
            CompanyInformation.Get;
            CompanyInformation.TestField("EDOC Allow Use of PDF-Invoice",true);
            UserSetup.Get(UserId);
            UserSetup.TestField("EDOC Allow Use of PDF-Invoice",true);
            DataTypeManegement.GetRecordRef(HeaderDoc,RecordRef);

            if not TrySomethingToExport(RecordRef) then begin
                DeleteElectronicDocumentCue(RecordRef);
                exit;
            end;

            case RecordRef.Number of
                Database::"Sales Invoice Header":
                    exit(CreateEHFDocSalesInvoiceHeader(RecordRef));
                Database::"Sales Cr.Memo Header":
                    exit(CreateEHFDocSalesCreditMemoHeader(RecordRef));
                Database::"Service Invoice Header":
                    exit(CreateEHFDocServiceInvoiceHeader(RecordRef));
                Database::"Service Cr.Memo Header":
                    exit(CreateEHFDocServiceCreditMemoHeader(RecordRef));
            end;
        end;
    end;

    local procedure CreateEHFDocSalesInvoiceHeader(var RecordRef : RecordRef) : Boolean;
    var
        SalesInvoiceHeader : Record "Sales Invoice Header";
        Handled : Boolean;
    begin
        OnBeforeCreateEHFDocSalesInvoiceHeader(RecordRef,Handled);
        if Handled then
            exit(true);

        RecordRef.SetTable(SalesInvoiceHeader);
        SalesInvoiceHeader.SetRecFilter;
        Report.RunModal(Report::"Create Electronic Invoices",false,false,SalesInvoiceHeader);
        exit(true);
    end;

    local procedure CreateEHFDocSalesCreditMemoHeader(var RecordRef : RecordRef) : Boolean;
    var
        SalesCreditMemoHeader : Record "Sales Cr.Memo Header";
        Handled : Boolean;
    begin
        OnBeforeCreateEHFDocSalesCreditMemoHeader(RecordRef,Handled);
        if Handled then
            exit(true);

        RecordRef.SetTable(SalesCreditMemoHeader);
        SalesCreditMemoHeader.SetRecFilter;
        Report.RunModal(Report::"Create Electronic Credit Memos",false,false,SalesCreditMemoHeader);
        exit(true);
    end;

    local procedure CreateEHFDocServiceInvoiceHeader(var RecordRef : RecordRef) : Boolean;
    var
        ServiceInvoiceHeader : Record "Service Invoice Header";
        Handled : Boolean;
    begin
        OnBeforeCreateEHFDocServiceInvoiceHeader(RecordRef,Handled);
        if Handled then
            exit(true);

        RecordRef.SetTable(ServiceInvoiceHeader);
        ServiceInvoiceHeader.SetRecFilter;
        Report.RunModal(Report::"Create Elec. Service Invoices",false,false,ServiceInvoiceHeader);
        exit(true);
    end;

    local procedure CreateEHFDocServiceCreditMemoHeader(var RecordRef : RecordRef) : Boolean;
    var
        ServiceCreditMemoHeader : Record "Service Cr.Memo Header";
        Handled : Boolean;
    begin
        OnBeforeCreateEHFDocServiceCreditMemoHeader(RecordRef,Handled);
        if Handled then
            exit(true);

        RecordRef.SetTable(ServiceCreditMemoHeader);
        ServiceCreditMemoHeader.SetRecFilter;
        Report.RunModal(Report::"Create Elec. Service Cr. Memos",false,false,ServiceCreditMemoHeader);
        exit(true);
    end;

    procedure CommonSetPDFInvoiceFromCustomerNo(var RecordRef : RecordRef; FieldNumber : Integer; CustomerNo : Code[20]);
    var
        Customer : Record Customer;
        FieldReference : FieldRef;
    begin
        if Customer.Get(CustomerNo) then begin
            FieldReference := RecordRef.Field(FieldNumber);
            FieldReference.Value := Customer."EDOC PDF-Invoice";
        end;
    end;

    local procedure UpdateElectronicDocEntryFromSalesInvoiceHeader(var ElectronicDocumentEntry : Record "EDOC Electronic Document Entry"; var RecordRef : RecordRef);
    var
        SalesInvoiceHeader : Record "Sales Invoice Header";
    begin
        OnBeforeUpdateElectronicDocumentEntry(ElectronicDocumentEntry,RecordRef);

        RecordRef.SetTable(SalesInvoiceHeader);
        with ElectronicDocumentEntry do begin
            "Table ID" := RecordRef.Number;
            "Document No." := SalesInvoiceHeader."No.";
            Destination := StrSubstNo('%1 : %2',FieldCaption("E-Invoice"),SalesInvoiceHeader."Bill-to Name");
            Invoice := true;
            "Sales Document" := true;
            "Sell-to Customer No." := SalesInvoiceHeader."Sell-to Customer No.";
            "Bill-to Customer No." := SalesInvoiceHeader."Bill-to Customer No.";
        end;

        OnAfterUpdateElectronicDocumentEntry(ElectronicDocumentEntry,RecordRef);
    end;
}