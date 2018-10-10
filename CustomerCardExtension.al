pageextension 50100 "EDOC Customer Card Extension" extends "Customer Card"
{
    layout
    {
        addafter("E-Invoice")
        {
            field("EDOC PDF-Invoice";"EDOC PDF-Invoice"){
                Description = 'EDOC';
            }
            field("EDOC PDF-Invoice E-Mail";"EDOC PDF-Invoice E-Mail"){
                Description = 'EDOC';
            }
        }
    }
}