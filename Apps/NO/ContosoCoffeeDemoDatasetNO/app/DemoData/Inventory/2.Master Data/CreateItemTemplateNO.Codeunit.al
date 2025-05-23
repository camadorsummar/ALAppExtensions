// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace Microsoft.DemoData.Inventory;

using Microsoft.DemoData.Finance;
using Microsoft.Inventory.Item;

codeunit 10718 "Create Item Template NO"
{
    InherentEntitlements = X;
    InherentPermissions = X;

    trigger OnRun()
    var
        CreateVatPostingGrpNO: Codeunit "Create Vat Posting Groups NO";
        CreateItemTemplate: Codeunit "Create Item Template";
    begin
        UpdateItemTemplate(CreateItemTemplate.Item(), CreateVatPostingGrpNO.High());
        UpdateItemTemplate(CreateItemTemplate.Service(), CreateVatPostingGrpNO.High());
    end;

    local procedure UpdateItemTemplate(ItemTemplateCode: Code[20]; VatProdPostingGrp: Code[20])
    var
        ItemTemplate: Record "Item Templ.";
    begin
        ItemTemplate.Get(ItemTemplateCode);
        ItemTemplate.Validate("VAT Prod. Posting Group", VatProdPostingGrp);
        ItemTemplate.Modify(true);
    end;
}
