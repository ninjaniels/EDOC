pageextension 50101 "EDOC Customer List Extension" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("EDOC PDF-Invoice";"EDOC PDF-Invoice")
            {
                Description = 'EDOC';
            }
            field("EDOC PDF-Invoice E-Mail";"EDOC PDF-Invoice E-Mail")
            {
                Description = 'EDOC';
            }
        }
    }
}