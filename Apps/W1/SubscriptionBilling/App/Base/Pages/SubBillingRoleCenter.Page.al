namespace Microsoft.SubscriptionBilling;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;
using Microsoft.Purchases.Vendor;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.History;
#if not CLEAN26
using Microsoft.Projects.Project.Job;
using Microsoft.Projects.Project.Journal;
using Microsoft.Projects.Project.Ledger;
using Microsoft.Projects.Project.Planning;
using Microsoft.Projects.Resources.Ledger;
using Microsoft.Finance.GeneralLedger.Journal;
#endif
using Microsoft.Finance.GeneralLedger.Ledger;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Ledger;

page 8084 "Sub. Billing Role Center"
{

    Caption = 'Subscription Billing';
    PageType = RoleCenter;
    ApplicationArea = Basic, Suite;

    layout
    {
        area(rolecenter)
        {
            part(Headline; "Sub. Billing Headline RC")
            {
                ApplicationArea = All;
            }
            part(ManagementActivities; "Sub. Billing Activities")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Sections)
        {
            group(SalesAndPurchases)
            {
                Caption = 'Sales & Purchases';
                action("Sales Quotes")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Sales Quotes';
                    Image = Quote;
                    RunObject = Page "Sales Quotes";
                    ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
                }
                action(SalesOrder)
                {
                    Caption = 'Sales Orders';
                    Image = Order;
                    RunObject = page "Sales Order List";
                    ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
                }
                action(SalesInvoices)
                {
                    Caption = 'Sales Invoices';
                    Image = Invoice;
                    RunObject = page "Sales Invoice List";
                    ToolTip = 'Register your sales to customers and invite them to pay according to the delivery and payment terms by sending them a sales invoice document. Posting a sales invoice registers shipment and records an open receivable entry on the customer''s account, which will be closed when payment is received. To manage the shipment process, use sales orders, in which sales invoicing is integrated.';
                }
                action(SalesCreditMemos)
                {
                    Caption = 'Sales Credit Memos';
                    RunObject = page "Sales Credit Memos";
                    ToolTip = 'Revert the financial transactions involved when your customers want to cancel a purchase or return incorrect or damaged items that you sent to them and received payment for. To include the correct information, you can create the sales credit memo from the related posted sales invoice or you can create a new sales credit memo with copied invoice information. If you need more control of the sales return process, such as warehouse documents for the physical handling, use sales return orders, in which sales credit memos are integrated. Note: If an erroneous sale has not been paid yet, you can simply cancel the posted sales invoice to automatically revert the financial transaction.';
                }
                action(PurchaseOrders)
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Orders';
                    RunObject = page "Purchase Order List";
                    ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action(PurchaseInvoices)
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Invoices';
                    RunObject = page "Purchase Invoices";
                    ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action(PurchaseCreditMemos)
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Credit Memos';
                    RunObject = page "Purchase Credit Memos";
                    ToolTip = 'Create purchase credit memos to mirror sales credit memos that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. If you need more control of the purchase return process, such as warehouse documents for the physical handling, use purchase return orders, in which purchase credit memos are integrated. Purchase credit memos can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
                }
            }
            group(UsageData)
            {
                Caption = 'Usage Data';
                action(UsageDataSuppliers)
                {
                    Caption = 'Usage Data Suppliers';
                    RunObject = page "Usage Data Suppliers";
                    ToolTip = 'Opens the list of Usage Data Suppliers.';
                }
                action(UsageDataImports)
                {
                    Caption = 'Usage Data Imports';
                    RunObject = page "Usage Data Imports";
                    ToolTip = 'Opens the list of Usage Data Imports.';
                }
                action(UsageDataSubscriptions)
                {
                    Caption = 'Usage Data Supp. Subscriptions';
                    RunObject = page "Usage Data Subscriptions";
                    ToolTip = 'Opens the list of Usage Data Subscriptions.';
                }
                action(UsageDataSupplierReferences)
                {
                    Caption = 'Usage Data Supplier References';
                    RunObject = page "Usage Data Supp. References";
                    ToolTip = 'Opens the list of Usage Data Supplier References.';
                }
            }
#if not CLEAN26
            group(Job)
            {
                ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                ObsoleteState = Pending;
                ObsoleteTag = '26.0';
                Visible = false;
                Caption = 'Projects';
                Image = Job;
                ToolTip = 'Create, plan, and execute tasks in project management. ';
                action(Jobs)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Projects';
                    Image = Job;
                    RunObject = page "Job List";
                    ToolTip = 'Define a project activity by creating a project card with integrated project tasks and project planning lines, structured in two layers. The project task enables you to set up project planning lines and to post consumption to the project. The project planning lines specify the detailed use of resources, items, and various general ledger expenses.';
                }
                action(Open)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Open';
                    RunObject = page "Job List";
                    RunPageView = where(Status = filter(Open));
                    ToolTip = 'Open the card for the selected record.';
                }
                action(JobsPlannedAndQuotd)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Planned and Quoted';
                    RunObject = page "Job List";
                    RunPageView = where(Status = filter(Quote | Planning));
                    ToolTip = 'Open the list of all planned and quoted projects.';
                }
                action(JobsComplet)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Completed';
                    RunObject = page "Job List";
                    RunPageView = where(Status = filter(Completed));
                    ToolTip = 'Open the list of all completed projects.';
                }
                action(JobsUnassign)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Unassigned';
                    RunObject = page "Job List";
                    RunPageView = where("Person Responsible" = filter(''));
                    ToolTip = 'Open the list of all unassigned projects.';
                }
                action(JobTasks)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    ApplicationArea = Suite;
                    Caption = 'Project Tasks';
                    RunObject = page "Job Task List";
                    ToolTip = 'Open the list of ongoing project tasks. Project tasks represent the actual work that is performed in a project, and they enable you to set up project planning lines and to post consumption to the project.';
                }
                action(JobRegister)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Project Registers';
                    Image = JobRegisters;
                    RunObject = page "Job Registers";
                    ToolTip = 'View auditing details for all project ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action(JobPlanningLines)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Project Planning Lines';
                    RunObject = page "Job Planning Lines";
                    ToolTip = 'Open the list of ongoing project planning lines for the project. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a project (budget) or you can specify what you actually agreed with your customer that he should pay for the project (billable).';
                }
                action(JobJournals)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Project Journals';
                    RunObject = page "Job Journal Batches";
                    RunPageView = where(Recurring = const(false));
                    ToolTip = 'Record project expenses or usage in the project ledger, either by reusing project planning lines or by manual entry.';
                }
                action(JobGLJournals)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Project G/L Journals';
                    RunObject = page "General Journal Batches";
                    RunPageView = where("Template Type" = const(Jobs),
                                        Recurring = const(false));
                    ToolTip = 'Record project expenses or usage in project accounts in the general ledger. For expenses or usage of type G/L Account, use the project G/L journal instead of the project journal.';
                }
                action(RecurringJobJournals)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Recurring Project Journals';
                    RunObject = page "Job Journal Batches";
                    RunPageView = where(Recurring = const(true));
                    ToolTip = 'Reuse preset journal lines to record recurring project expenses or usage in the project ledger.';
                }
            }
#endif
            group(PostedDocuments)
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View the posting history for sales, shipments, and inventory.';
                action(PostedSalesInvoices)
                {
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action(PostedSalesCreditMemos)
                {
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action(PostedPurchaseInvoices)
                {
                    Caption = 'Posted Purchase Invoices';
                    RunObject = page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action(PostedPurchaseCreditMemos)
                {
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action(GLRegisters)
                {
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = page "G/L Registers";
                    ToolTip = 'View auditing details for all G/L entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
#if not CLEAN26
                action(JobRegisters)
                {
                    ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Project Registers';
                    Image = JobRegisters;
                    RunObject = page "Job Registers";
                    ToolTip = 'View auditing details for all item ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
#endif
                action(ItemRegisters)
                {
                    Caption = 'Item Registers';
                    Image = ItemRegisters;
                    RunObject = page "Item Registers";
                    ToolTip = 'View auditing details for all item ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
#if not CLEAN26
                action(ResourceRegisters)
                {
                    ObsoleteReason = 'Removed as it resources are not relevant in context of Subscription Billing';
                    ObsoleteState = Pending;
                    ObsoleteTag = '26.0';
                    Visible = false;
                    Caption = 'Resource Registers';
                    Image = ResourceRegisters;
                    RunObject = page "Resource Registers";
                    ToolTip = 'View auditing details for all resource ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
#endif
            }
            group("Setup")
            {
                Caption = 'Setup';
                Image = Setup;
                ToolTip = 'View the setup.';
                action(ServiceContractSetup)
                {
                    Caption = 'Subscription Contract Setup';
                    Image = ServiceAgreement;
                    RunObject = page "Service Contract Setup";
                    ToolTip = 'View or edit Subscription Contract Setup.';
                }
                action(ContractTypes)
                {
                    Caption = 'Subscription Contract Types';
                    Image = FileContract;
                    RunObject = page "Contract Types";
                    ToolTip = 'View or edit Subscription Contract Types.';
                }
                action(ServiceCommitmentTemplates)
                {
                    Caption = 'Sub. Package Line Templates';
                    Image = Template;
                    RunObject = page "Service Commitment Templates";
                    ToolTip = 'View or edit Subscription Package Line Templates.';
                }
                action(ServiceCommitmentPackages)
                {
                    Caption = 'Subscription Packages';
                    Image = Template;
                    RunObject = page "Service Commitment Packages";
                    ToolTip = 'View or edit Subscription Packages.';
                }
            }
        }
        area(embedding)
        {
            action(CustomersList)
            {
                ApplicationArea = All;
                Caption = 'Customers';
                Image = Customer;
                RunObject = page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(VendorsList)
            {
                ApplicationArea = All;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
#if not CLEAN26
            action(JobsList)
            {
                ObsoleteReason = 'Removed as projects are not relevant in context of Subscription Billing';
                ObsoleteState = Pending;
                ObsoleteTag = '26.0';
                Visible = false;
                ApplicationArea = All;
                Caption = 'Projects';
                Image = Job;
                RunObject = page "Job List";
                ToolTip = 'Define a project activity by creating a project card with integrated project tasks and project planning lines, structured in two layers. The project task enables you to set up project planning lines and to post consumption to the project. The project planning lines specify the detailed use of resources, items, and various general ledger expenses.';
            }
#endif
            action(ItemsList)
            {
                ApplicationArea = All;
                Caption = 'Items';
                Image = Item;
                RunObject = page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(ServiceObjectsList)
            {
                ApplicationArea = All;
                Caption = 'Subscriptions';
                Image = ServiceSetup;
                RunObject = page "Service Objects";
                ToolTip = 'Detailed information on the Subscriptions. The Subscriptions shows the item for which it was created and the Subscription Lines that belong to it. The amount and the details of the provision can be seen. The service recipient indicates to which customer the Subscription Item was sold. Different delivery and billing addresses provide information about who the item was delivered to and who received the invoice. In addition, the Subscription Lines are shown in detail and can be edited.';
            }
            action(CustomerContractsList)
            {
                ApplicationArea = All;
                Caption = 'Customer Sub. Contracts';
                Image = Customer;
                RunObject = page "Customer Contracts";
                ToolTip = 'Detailed information on Customer Subscription Contracts that include recurring subscriptions. A Customer Subscription Contract is used to calculate these Subscription Lines based on the parameters specified in the Subscription Lines. The Subscription Lines are presented in detail and can be edited. In addition, commercial information as well as delivery and billing addresses can be stored in a Contract.';
            }
            action(VendorContractsList)
            {
                ApplicationArea = All;
                Caption = 'Vendor Sub. Contracts';
                Image = Vendor;
                RunObject = page "Vendor Contracts";
                ToolTip = 'Detailed information on Vendor Subscription Contracts that include recurring subscriptions. A Vendor Subscription Contract is used to calculate these Subscription Lines based on the parameters specified in the Subscription Lines. The Subscription Lines are presented in detail and can be edited. In addition, commercial information can be stored in a Contract.';
            }
        }
        area(processing)
        {
            action(RecurringBilling)
            {
                ApplicationArea = All;
                Caption = 'Recurring Billing';
                RunObject = page "Recurring Billing";
                ToolTip = 'Opens the page for creating billing proposals for Recurring subscriptions.';
            }
            action(ContractDeferralsRelease)
            {
                ApplicationArea = All;
                Caption = 'Contract Deferrals Release';
                RunObject = report "Contract Deferrals Release";
                ToolTip = 'Releases the deferrals for the all contracts.';
            }
            group(New)
            {
                Caption = 'New';
                action(ServiceCommitmentTemplate)
                {
                    Caption = 'Subscription Package Line Template';
                    Image = ApplyTemplate;
                    RunObject = page "Service Commitment Templates";
                    RunPageMode = Create;
                    ToolTip = 'Create a new Subscription Package Line Template.';
                }
                action(ServiceCommitmentPackage)
                {
                    Caption = 'Subscription Package';
                    Image = ServiceLedger;
                    RunObject = page "Service Commitment Package";
                    RunPageMode = Create;
                    ToolTip = 'Create a new Subscription Package.';
                }
                action(ServiceObject)
                {
                    Caption = 'Subscription';
                    Image = NewOrder;
                    RunObject = Page "Service Object";
                    RunPageMode = Create;
                    ToolTip = 'Create a new Subscription.';
                }
                action(CustomerContract)
                {
                    Caption = 'Customer Subscription Contract';
                    Image = NewOrder;
                    RunObject = page "Customer Contract";
                    RunPageMode = Create;
                    ToolTip = 'Create a new Customer Subscription Contract.';
                }
                action(VendorContract)
                {
                    Caption = 'Vendor Subscription Contract';
                    Image = NewOrder;
                    RunObject = page "Vendor Contract";
                    RunPageMode = Create;
                    ToolTip = 'Create a new Vendor Subscription Contract.';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                action(OverviewOfContractComponents)
                {
                    ApplicationArea = All;
                    Caption = 'Overview of Subscription Contract components';
                    Image = "Report";
                    RunObject = Report "Overview Of Contract Comp";
                    ToolTip = 'Analyze components of your contracts.';
                }
                action(CustomerContractDeferralsAnalysis)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Subscription Contract Deferrals Analysis';
                    Image = "Report";
                    RunObject = Report "Cust. Contr. Def. Analysis";
                    ToolTip = 'Analyze Customer Subscription Contract deferrals.';
                }
                action(VendorContractDeferralsAnalysis)
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Subscription Contract Deferrals Analysis';
                    Image = "Report";
                    RunObject = Report "Vend Contr. Def. Analysis";
                    ToolTip = 'Analyze Vendor Subscription Contract deferrals.';
                }
            }
            group(History)
            {
                Caption = 'History';
                action("Posted Customer Contract Invoices")
                {
                    Caption = 'Posted Customer Subscription Contract Invoices';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Invoices";
                    RunPageView = where("Recurring Billing" = const(true));
                    ToolTip = 'Open the list of Posted Sales Invoices for Customer Subscription Contracts.';
                }
                action("Posted Customer Contract Credit Memos")
                {
                    Caption = 'Posted Customer Subscription Contract Credit Memos';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Credit Memos";
                    RunPageView = where("Recurring Billing" = const(true));
                    ToolTip = 'Open the list of Posted Sales Credit Memos for Customer Subscription Contracts.';
                }
                action("Posted Vendor Contract Invoices")
                {
                    Caption = 'Posted Vendor Subscription Contract Invoices';
                    Image = PostedOrder;
                    RunObject = page "Posted Purchase Invoices";
                    RunPageView = where("Recurring Billing" = const(true));
                    ToolTip = 'Open the list of Posted Purchase Invoices for Vendor Subscription Contracts.';
                }
                action("Posted Vendor Contract Credit Memos")
                {
                    Caption = 'Posted Vendor Subscription Contract Credit Memos';
                    Image = PostedOrder;
                    RunObject = page "Posted Purchase Credit Memos";
                    RunPageView = where("Recurring Billing" = const(true));
                    ToolTip = 'Open the list of Posted Purchase Credit Memos for Vendor Subscription Contracts.';
                }
            }
        }
    }
}
