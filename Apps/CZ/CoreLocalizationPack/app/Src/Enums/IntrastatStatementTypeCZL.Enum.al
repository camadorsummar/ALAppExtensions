﻿// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Inventory.Intrastat;

enum 11724 "Intrastat Statement Type CZL"
{
    Extensible = true;
    Access = Internal;

    value(0; Primary)
    {
        Caption = 'Primary';
    }
    value(1; Null)
    {
        Caption = 'Null';
    }
    value(2; Replacing)
    {
        Caption = 'Replacing';
    }
    value(3; Deleting)
    {
        Caption = 'Deleting';
    }
}
