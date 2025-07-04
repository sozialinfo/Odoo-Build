# Base
## Contact Name  
### Format Parent Name  
ID: `mint_system.base.contact_name.format_parent_name`  
```xml
<data inherit_id="base.contact_name" priority="50">
    <xpath expr="//t[1]/span" position="replace">
        <!--if object has no parent show name only-->
        <t t-if="not object.parent_name">
            <span itemprop="name" t-esc="object.name"/>
        </t>
        <!-- if object has parent with same name show name only -->
        <t t-if="object.name == object.parent_name">
            <span itemprop="name" t-esc="object.parent_name"/>
        </t>
        <!--if object has parent with different name show parent on second line -->
        <t t-if="object.parent_name and object.name != object.parent_name ">
            <span itemprop="name" t-esc="object.name"/>
            <br/>
            <span itemprop="name" t-esc="object.parent_name"/>
        </t>
    </xpath>
</data>

```
Source: [snippets/base.contact_name.format_parent_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.contact_name.format_parent_name.xml)

### Modify Name  
ID: `mint_system.base.contact_name.modify_name`  
```xml
<data inherit_id="base.contact_name" priority="50">
    <xpath expr="//div" position="replace">
        <t t-if="object.parent_name">
            <div t-esc="object.parent_name"/>
            <!-- 
            <div t-esc="object.parent_id.name2"/>
            -->
            <span t-field="object.title"/>
            <span t-esc="object.name"/>
            <!--
            <div t-esc="object.department"/>
            -->
        </t>
        <t t-if="not object.parent_name">
            <div t-esc="object.name"/>
            <!--
            <span t-esc="object.name2"/>
            -->
        </t>
        <t t-if="options.get('country_image') and 'country_id' in fields and object.country_id and object.country_id.image_url">
            <span t-field="object.country_id.image_url" t-options="{&quot;widget&quot;: &quot;image_url&quot;, &quot;class&quot;: &quot;country_flag&quot;}"/>
        </t>
    </xpath>
</data>

```
Source: [snippets/base.contact_name.modify_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.contact_name.modify_name.xml)

### Remove Parent Name  
ID: `mint_system.base.contact_name.remove_parent_name`  
```xml
<data inherit_id="base.contact_name" priority="50">
    <xpath expr="//t[2]" position="replace"/>
    <xpath expr="//span[@itemprop='name']" position="attributes">
        <attribute name="t-esc">object.name</attribute>
    </xpath>
</data>

```
Source: [snippets/base.contact_name.remove_parent_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.contact_name.remove_parent_name.xml)

## Ir Cron View Tree  
### Show Ir Actions Server Id  
ID: `mint_system.base.ir_cron_view_tree.show_ir_actions_server_id`  
```xml
<data inherit_id="base.ir_cron_view_tree" priority="50">
    <field name="model_id" position="after">
        <field name="ir_actions_server_id" optional="hide"/>
    </field>
</data>

```
Source: [snippets/base.ir_cron_view_tree.show_ir_actions_server_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.ir_cron_view_tree.show_ir_actions_server_id.xml)

## Ir Filters View Form  
### Remove Domain Widget  
ID: `mint_system.base.ir_filters_view_form.remove_domain_widget`  
```xml
<data inherit_id="base.ir_filters_view_form" priority="50">
    <field name="domain" position="attributes">
        <attribute name="widget"/>
    </field>
</data>

```
Source: [snippets/base.ir_filters_view_form.remove_domain_widget.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.ir_filters_view_form.remove_domain_widget.xml)

## Module View Kanban  
### Group Erp System  
ID: `mint_system.base.module_view_kanban.group_erp_system`  
```xml
<data inherit_id="base.module_view_kanban" priority="50">
    <button name="button_immediate_install" position="attributes">
        <attribute name="groups">base.group_erp_manager</attribute>
    </button>
    <a name="button_immediate_upgrade" position="attributes">
        <attribute name="groups">base.group_erp_manager</attribute>
    </a>
    <a name="button_uninstall_wizard" position="attributes">
        <attribute name="groups">base.group_erp_manager</attribute>
    </a>
    <button name="action_open_install_request" position="attributes">
        <attribute name="groups">!base.group_erp_manager</attribute>
    </button>
</data>

```
Source: [snippets/base.module_view_kanban.group_erp_system.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.module_view_kanban.group_erp_system.xml)

## Res Bank View Search  
### Add Zip Bic Code City  
ID: `mint_system.base.res_bank_view_search.add_zip_bic_code_city`  
```xml
<data inherit_id="base.res_bank_view_search" priority="50">
    <xpath expr="//field[@name='name']" position="after">
        <separator/>
        <field string="PLZ" name="zip"/>
        <field string="Bankleitzahl" name="bic"/>
        <field string="Code" name="code"/>
        <field string="Stadt" name="city"/>
    </xpath>
</data>

```
Source: [snippets/base.res_bank_view_search.add_zip_bic_code_city.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.res_bank_view_search.add_zip_bic_code_city.xml)

## Res Partner Kanban View  
### Show Agreements Count  
ID: `mint_system.base.res_partner_kanban_view.show_agreements_count`  
```xml
<data inherit_id="base.res_partner_kanban_view" priority="50">
    <xpath expr="//kanban/field[@name='type']" position="after">
        <field name="agreements_count"/>
    </xpath>
    <xpath expr="//div[hasclass('oe_kanban_details')]/ul" position="after">
        <a class="o_project_kanban_box" name="action_open_agreement" type="object">
            <div>
                <span class="o_value">
                    <t t-esc="record.agreements_count.value"/>
                </span>
                <span class="o_label">Agreements</span>
            </div>
        </a>
    </xpath>
</data>

```
Source: [snippets/base.res_partner_kanban_view.show_agreements_count.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.res_partner_kanban_view.show_agreements_count.xml)

### Show Phone  
ID: `mint_system.base.res_partner_kanban_view.show_phone`  
```xml
<data inherit_id="base.res_partner_kanban_view" priority="50">
    <xpath expr="//li/field[@name='email']/.." position="before">
        <li t-if="record.phone.raw_value" class="o_text_overflow">
            <field name="phone"/>
        </li>
    </xpath>
</data>

```
Source: [snippets/base.res_partner_kanban_view.show_phone.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.res_partner_kanban_view.show_phone.xml)

### Show Pricelist  
ID: `mint_system.base.res_partner_kanban_view.show_pricelist`  
```xml
<?xml version="1.0" encoding="utf-8"?>
<data inherit_id="base.res_partner_kanban_view" priority="50">
    <xpath expr="//field[@name='email']" position="after">
        <field name="property_product_pricelist"/>
    </xpath>
    <xpath expr="//li[@t-if='record.email.raw_value']" position="after">
        <li t-if="record.property_product_pricelist.raw_value">
            <field name="property_product_pricelist"/>
        </li>
    </xpath>
</data>

```
Source: [snippets/base.res_partner_kanban_view.show_pricelist.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.res_partner_kanban_view.show_pricelist.xml)

### Show Website  
ID: `mint_system.base.res_partner_kanban_view.show_website`  
```xml
<data inherit_id="base.res_partner_kanban_view" priority="50">
    <xpath expr="//li/field[@name='email']/.." position="after">
        <li t-if="record.website.raw_value" class="o_text_overflow">
            <field name="website"/>
        </li>
    </xpath>
</data>

```
Source: [snippets/base.res_partner_kanban_view.show_website.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.res_partner_kanban_view.show_website.xml)

### X Eori  
ID: `mint_system.base.res_partner_kanban_view.x_eori`  
```xml
<data inherit_id="base.res_partner_kanban_view" priority="50">
    <xpath expr="//t[@t-name='kanban-box']//field[@name='display_name']/.." position="after">
        <br/>
        <field name="x_eori"/>
    </xpath>
</data>

```
Source: [snippets/base.res_partner_kanban_view.x_eori.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.res_partner_kanban_view.x_eori.xml)

### X Schema  
ID: `mint_system.base.res_partner_kanban_view.x_schema`  
```xml
<data inherit_id="base.res_partner_kanban_view" priority="50">
    <xpath expr="//t[@t-name='kanban-box']//field[@name='display_name']" position="before">
        <field name="x_schema" widget="badge"/>
        <br/>
    </xpath>
</data>

```
Source: [snippets/base.res_partner_kanban_view.x_schema.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.res_partner_kanban_view.x_schema.xml)

### X Vat  
ID: `mint_system.base.res_partner_kanban_view.x_vat`  
```xml
<data inherit_id="base.res_partner_kanban_view" priority="50">
    <xpath expr="//t[@t-name='kanban-box']//field[@name='display_name']/.." position="after">
        <br/>
        <field name="x_vat"/>
    </xpath>
</data>

```
Source: [snippets/base.res_partner_kanban_view.x_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.res_partner_kanban_view.x_vat.xml)

### X Zaz  
ID: `mint_system.base.res_partner_kanban_view.x_zaz`  
```xml
<data inherit_id="base.res_partner_kanban_view" priority="50">
    <xpath expr="//t[@t-name='kanban-box']//field[@name='display_name']/.." position="after">
        <br/>
        <field name="x_zaz"/>
    </xpath>
</data>

```
Source: [snippets/base.res_partner_kanban_view.x_zaz.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.res_partner_kanban_view.x_zaz.xml)

## User Groups View  
### Remove Fleet Groups  
ID: `mint_system.base.user_groups_view.remove_fleet_groups`  
```xml
<data inherit_id="base.user_groups_view" priority="50">
    <field name="in_group_154" position="replace"/>
    <field name="in_group_153" position="replace"/>
</data>

```
Source: [snippets/base.user_groups_view.remove_fleet_groups.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.user_groups_view.remove_fleet_groups.xml)

## View Bank Form  
### Add Display Name  
ID: `mint_system.base.view_bank_form.add_display_name`  
```xml
<data inherit_id="base.view_bank_form" priority="50">
    <xpath expr="//field[@name='name']" position="after">
        <field name="display_name"/>
    </xpath>
</data>

```
Source: [snippets/base.view_bank_form.add_display_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_bank_form.add_display_name.xml)

## View Company Form  
### Show Account Onboarding Panel  
ID: `mint_system.base.view_company_form.show_account_onboarding_panel`  
```xml
<data inherit_id="base.view_company_form" priority="50">
    <field name="website" position="after">
        <field name="account_dashboard_onboarding_state"/>
    </field>
</data>

```
Source: [snippets/base.view_company_form.show_account_onboarding_panel.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_company_form.show_account_onboarding_panel.xml)

### Show Analytic Plan Id  
ID: `mint_system.base.view_company_form.show_analytic_plan_id`  
```xml
<data inherit_id="base.view_company_form" priority="50">
    <field name="website" position="after">
        <field name="analytic_plan_id"/>
    </field>
</data>

```
Source: [snippets/base.view_company_form.show_analytic_plan_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_company_form.show_analytic_plan_id.xml)

### Show Font  
ID: `mint_system.base.view_company_form.show_font`  
```xml
<data inherit_id="base.view_company_form" priority="50">
    <field name="favicon" position="after">
        <field name="font"/>
    </field>
</data>

```
Source: [snippets/base.view_company_form.show_font.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_company_form.show_font.xml)

## View Country Tree  
### Set Limit  
ID: `mint_system.base.view_country_tree.set_limit`  
```xml
<data inherit_id="base.view_country_tree" priority="50">
    <tree position="attributes">
        <attribute name="limit">250</attribute>
    </tree>
</data>

```
Source: [snippets/base.view_country_tree.set_limit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_country_tree.set_limit.xml)

## View Model Fields Form  
### Show State  
ID: `mint_system.base.view_model_fields_form.show_state`  
```xml
<data inherit_id="base.view_model_fields_form" priority="50">
    <field name="ttype" position="after">
        <field name="state"/>
    </field>
</data>

```
Source: [snippets/base.view_model_fields_form.show_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_model_fields_form.show_state.xml)

## View Partner Form  
### Add Commercial Partner Id  
ID: `mint_system.base.view_partner_form.add_commercial_partner_id`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='bank_ids']/.." position="before">
        <group>
            <field name="commercial_partner_id" readonly="0"/>
        </group>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.add_commercial_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.add_commercial_partner_id.xml)

### Add Credit Limit  
ID: `mint_system.base.view_partner_form.add_credit_limit`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='property_account_payable_id']" position="after">
        <field name="credit_limit"/>
    </xpath>
    <xpath expr="//group[@name='misc']/field" position="replace">
  </xpath>
</data>

```
Source: [snippets/base.view_partner_form.add_credit_limit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.add_credit_limit.xml)

### Add Department And Lang On Page Contact Addresses  
ID: `mint_system.base.view_partner_form.add_department_and_lang_on_page_contact_addresses`  
```xml
<data inherit_id="base.view_partner_form" priority="52">&gt;

<data><xpath expr="//page[@name='contact_addresses']/field[@name='child_ids']/form[1]/sheet[1]/group[1]/group[1]/field[@name='comment']" position="before"><field name="department"/><field name="lang"/></xpath></data>

</data>

```
Source: [snippets/base.view_partner_form.add_department_and_lang_on_page_contact_addresses.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.add_department_and_lang_on_page_contact_addresses.xml)

### Add Display Name  
ID: `mint_system.base.view_partner_form.add_display_name`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='name']" position="after">
        <field name="display_name"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.add_display_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.add_display_name.xml)

### Attributes Child Ids  
ID: `mint_system.base.view_partner_form.attributes_child_ids`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='child_ids']" position="attributes">
        <attribute name="mode">tree</attribute>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.attributes_child_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.attributes_child_ids.xml)

### Hide Company Registry  
ID: `mint_system.base.view_partner_form.hide_company_registry`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
  <xpath expr="//field[@name='company_registry']" position="attributes">
    <attribute name="invisible">1</attribute>
  </xpath>
</data>
```
Source: [snippets/base.view_partner_form.hide_company_registry.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.hide_company_registry.xml)

### Hide Meeting  
ID: `mint_system.base.view_partner_form.hide_meeting`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//button[@name='schedule_meeting']" position="attributes">
        <attribute name="invisible">1</attribute>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.hide_meeting.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.hide_meeting.xml)

### Hide Opportunity  
ID: `mint_system.base.view_partner_form.hide_opportunity`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//button[@name='action_view_opportunity']" position="attributes">
        <attribute name="invisible">1</attribute>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.hide_opportunity.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.hide_opportunity.xml)

### Lang Required  
ID: `mint_system.base.view_partner_form.lang_required`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//sheet/group/group/field[@name='lang']" position="attributes">
        <attribute name="required">1</attribute>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.lang_required.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.lang_required.xml)

### Move Company Registry  
ID: `mint_system.base.view_partner_form.move_company_registry`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='vat']" position="after">
        <xpath expr="//page[@name='sales_purchases']//field[@name='company_registry']" position="move"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.move_company_registry.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.move_company_registry.xml)

### Move Property Product Pricelist  
ID: `mint_system.base.view_partner_form.move_property_product_pricelist`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='property_product_pricelist']" position="replace"/>
    <xpath expr="//field[@name='vat']" position="after">
        <field name="property_product_pricelist" groups="product.group_product_pricelist" attrs="{'invisible': [('is_company','=',False),('parent_id','!=',False)]}"/>
        <div name="parent_pricelists" groups="product.group_product_pricelist" colspan="2" attrs="{'invisible': ['|',('is_company','=',True),('parent_id','=',False)]}">
            <p>Preislisten werden auf dem Unternehmen verwaltet.</p>
        </div>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.move_property_product_pricelist.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.move_property_product_pricelist.xml)

### Move Ref  
ID: `mint_system.base.view_partner_form.move_ref`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//page[@name='sales_purchases']//field[@name='ref']" position="replace">
  </xpath>
    <xpath expr="//field[@name='vat']" position="after">
        <field name="ref"/>
    </xpath>
    <xpath expr="//notebook//form/sheet/group/group/field[@name='company_id']" position="after">
        <field name="ref"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.move_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.move_ref.xml)

### Move Zip And City  
ID: `mint_system.base.view_partner_form.move_zip_and_city`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='city']" position="replace"/>
    <xpath expr="//field[@name='state_id']" position="replace"/>
    <xpath expr="//field[@name='zip']" position="replace"/>
    <xpath expr="//field[@name='street2']" position="after">
        <field name="zip" placeholder="PLZ" class="o_address_zip" attrs="{'readonly': [('type', '=', 'contact'),('parent_id', '!=', False)]}"/>
        <field name="city" placeholder="Stadt" class="o_address_city" attrs="{'readonly': [('type', '=', 'contact'),('parent_id', '!=', False)]}"/>
        <field name="state_id" class="o_address_state" placeholder="Bundesland" options="{'no_open': True, 'no_quick_create': True}" attrs="{'readonly': [('type', '=', 'contact'),('parent_id', '!=', False)]}" context="{'country_id': country_id, 'default_country_id': country_id, 'zip': zip}"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.move_zip_and_city.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.move_zip_and_city.xml)

### Readonly Property Product Pricelist  
ID: `mint_system.base.view_partner_form.readonly_property_product_pricelist`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='property_product_pricelist']" position="attributes">
        <attribute name="readonly">1</attribute>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.readonly_property_product_pricelist.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.readonly_property_product_pricelist.xml)

### Remove Smart Buttons  
ID: `mint_system.base.view_partner_form.remove_smart_buttons`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <button name="schedule_meeting" position="replace"/>
    <button name="action_view_opportunity" position="replace"/>
    <xpath expr="//field[@name='task_count']/.." position="replace"/>
    <xpath expr="//field[@name='purchase_order_count']/.." position="replace"/>
    <xpath expr="//field[@name='supplier_invoice_count']/.." position="replace"/>
    <button name="open_partner_ledger" position="replace"/>
    <xpath expr="//field[@name='mass_mailing_contacts_count']/.." position="replace"/>
    <xpath expr="//field[@name='mass_mailing_stats_count']/.." position="replace"/>
    <field name="is_published" position="replace"/>
</data>

```
Source: [snippets/base.view_partner_form.remove_smart_buttons.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.remove_smart_buttons.xml)

### Show Color  
ID: `mint_system.base.view_partner_form.show_color`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='category_id']" position="after">
        <field name="color" widget="color_picker"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.show_color.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.show_color.xml)

### Show Industry  
ID: `mint_system.base.view_partner_form.show_industry`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='industry_id']" position="attributes">
        <attribute name="attrs">{'invisible': False}</attribute>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.show_industry.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.show_industry.xml)

### Show Type  
ID: `mint_system.base.view_partner_form.show_type`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='street']" position="before">
        <field name="type" readonly="1"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.show_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.show_type.xml)

### Show User Id  
ID: `mint_system.base.view_partner_form.show_user_id`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//page[@name='internal_notes']" position="inside">
        <field name="user_id"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.show_user_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.show_user_id.xml)

### Show User Ids  
ID: `mint_system.base.view_partner_form.show_user_ids`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//page[@name='internal_notes']" position="inside">
        <field name="user_ids"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.show_user_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.show_user_ids.xml)

### X Bexioid  
ID: `mint_system.base.view_partner_form.x_bexioid`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='vat']" position="after">
        <field name="x_bexioid" readonly="1"/>
    </xpath>
    <xpath expr="//notebook//form/sheet/group/group/field[@name='company_id']" position="after">
        <field name="x_bexioid"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.x_bexioid.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_bexioid.xml)

### X Birthdate  
ID: `mint_system.base.view_partner_form.x_birthdate`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='vat']" position="after">
        <field name="x_birthdate" attrs="{'invisible': [('is_company','=',True)]}"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.x_birthdate.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_birthdate.xml)

### X Created On  
ID: `mint_system.base.view_partner_form.x_created_on`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='vat']" position="after">
        <field name="x_created_on"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.x_created_on.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_created_on.xml)

### X Eori  
ID: `mint_system.base.view_partner_form.x_eori`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <field name="display_name" position="after">
        <field name="x_eori"/>
    </field>
</data>
```
Source: [snippets/base.view_partner_form.x_eori.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_eori.xml)

### X External Ref  
ID: `mint_system.base.view_partner_form.x_external_ref`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='vat']" position="after">
        <field name="x_external_ref"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.x_external_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_external_ref.xml)

### X Global Location Number  
ID: `mint_system.base.view_partner_form.x_global_location_number`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='vat']" position="after">
        <field name="x_global_location_number"/>
    </xpath>
    <xpath expr="//notebook//form/sheet/group/group/field[@name='company_id']" position="after">
        <field name="x_global_location_number"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.x_global_location_number.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_global_location_number.xml)

### X Packaging Ref  
ID: `mint_system.base.view_partner_form.x_packaging_ref`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='ref']" position="after">
        <field name="x_packaging_ref"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.x_packaging_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_packaging_ref.xml)

### X Privacy Visibility  
ID: `mint_system.base.view_partner_form.x_privacy_visibility`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='category_id']" position="after">
        <field name="x_privacy_visibility"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.x_privacy_visibility.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_privacy_visibility.xml)

### X Remarks  
ID: `mint_system.base.view_partner_form.x_remarks`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='vat']" position="before">
        <field name="x_remarks"/>
    </xpath>
</data>
```
Source: [snippets/base.view_partner_form.x_remarks.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_remarks.xml)

### X Schema  
ID: `mint_system.base.view_partner_form.x_schema`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <field name="display_name" position="after">
        <field name="x_schema" optional="show" widget="badge"/>
    </field>
</data>
```
Source: [snippets/base.view_partner_form.x_schema.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_schema.xml)

### X Vat  
ID: `mint_system.base.view_partner_form.x_vat`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <field name="display_name" position="after">
        <field name="x_vat"/>
    </field>
</data>
```
Source: [snippets/base.view_partner_form.x_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_vat.xml)

### X Vst  
ID: `mint_system.base.view_partner_form.x_vst`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <xpath expr="//field[@name='vat']" position="after">
        <field name="x_vst"/>
    </xpath>
    <xpath expr="//notebook//form/sheet/group/group/field[@name='company_id']" position="after">
        <field name="x_vst"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_form.x_vst.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_vst.xml)

### X Zaz  
ID: `mint_system.base.view_partner_form.x_zaz`  
```xml
<data inherit_id="base.view_partner_form" priority="50">
    <field name="display_name" position="after">
        <field name="x_zaz"/>
    </field>
</data>
```
Source: [snippets/base.view_partner_form.x_zaz.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_form.x_zaz.xml)

## View Partner Tree  
### Add Ref Zip Type  
ID: `mint_system.base.view_partner_tree.add_ref_zip_type`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <xpath expr="//field[@name='display_name']" position="after">
        <field name="ref"/>
    </xpath>
    <xpath expr="//field[@name='city']" position="before">
        <field name="zip"/>
    </xpath>
    <xpath expr="//field[@name='category_id']" position="after">
        <field name="type"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_tree.add_ref_zip_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.add_ref_zip_type.xml)

### Format Decoration  
ID: `mint_system.base.view_partner_tree.format_decoration`  
```xml
<xpath expr="//field[@name='display_name']" position="attributes">
    <attribute name="decoration-bf">is_company</attribute>
</xpath>

```
Source: [snippets/base.view_partner_tree.format_decoration.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.format_decoration.xml)

### Move Zip And City  
ID: `mint_system.base.view_partner_tree.move_zip_and_city`  
```xml
<data inherit_id="base.view_partner_tree" priority="60">
    <field name="city" position="replace"/>
    <field name="zip" position="replace"/>
    <field name="display_name" position="after">
        <field name="zip"/>
        <field name="city"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.move_zip_and_city.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.move_zip_and_city.xml)

### Optional Payment Terms  
ID: `mint_system.base.view_partner_tree.optional_payment_terms`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="vat" position="after">
        <field name="property_payment_term_id" optional="hide"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.optional_payment_terms.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.optional_payment_terms.xml)

### Optional Zip  
ID: `mint_system.base.view_partner_tree.optional_zip`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="city" position="before">
        <field name="zip" optional="hide"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.optional_zip.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.optional_zip.xml)

### Property Payment Term Id  
ID: `mint_system.base.view_partner_tree.property_payment_term_id`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="category_id" position="after">
        <field name="property_payment_term_id" optional="hide"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.property_payment_term_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.property_payment_term_id.xml)

### Show Company Registry  
ID: `mint_system.base.view_partner_tree.show_company_registry`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="vat" position="before">
        <field name="company_registry" optional="show"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.show_company_registry.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.show_company_registry.xml)

### Show Industry  
ID: `mint_system.base.view_partner_tree.show_industry`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="country_id" position="after">
        <field name="industry_id" optional="hide"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.show_industry.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.show_industry.xml)

### Show Pricelist  
ID: `mint_system.base.view_partner_tree.show_pricelist`  
```xml
<?xml version="1.0" encoding="utf-8"?>
<data inherit_id="base.view_partner_tree" priority="50">
    <xpath expr="//field[@name='user_id']" position="after">
        <field name="property_product_pricelist" optional="show"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_tree.show_pricelist.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.show_pricelist.xml)

### Show Property Payment Term Id  
ID: `mint_system.base.view_partner_tree.show_property_payment_term_id`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="category_id" position="after">
        <field name="property_payment_term_id" optional="show"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.show_property_payment_term_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.show_property_payment_term_id.xml)

### Show Property Product Pricelist  
ID: `mint_system.base.view_partner_tree.show_property_product_pricelist`  
```xml
<data inherit_id="base.view_partner_tree" priority="60">
    <field name="country_id" position="after">
        <field name="property_product_pricelist" optional="hide"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.show_property_product_pricelist.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.show_property_product_pricelist.xml)

### Show Ref  
ID: `mint_system.base.view_partner_tree.show_ref`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="display_name" position="before">
        <field name="ref" optional="show" string="Ku-Nr."/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.show_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.show_ref.xml)

### Show Street  
ID: `mint_system.base.view_partner_tree.show_street`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="city" position="before">
        <field name="street" optional="show"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.show_street.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.show_street.xml)

### Show Type  
ID: `mint_system.base.view_partner_tree.show_type`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="display_name" position="before">
        <field name="type" optional="show"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.show_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.show_type.xml)

### Show X Schema  
ID: `mint_system.base.view_partner_tree.show_x_schema`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="display_name" position="after">
        <field name="x_schema" optional="show"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.show_x_schema.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.show_x_schema.xml)

### X Bexioid  
ID: `mint_system.base.view_partner_tree.x_bexioid`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="active" position="after">
        <field name="x_bexioid" optional="hide"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.x_bexioid.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.x_bexioid.xml)

### X Eori  
ID: `mint_system.base.view_partner_tree.x_eori`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="display_name" position="after">
        <field name="x_eori"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.x_eori.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.x_eori.xml)

### X First Sale Date  
ID: `mint_system.base.view_partner_tree.x_first_sale_date`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="user_id" position="after">
        <field name="x_first_sale_date" optional="hide"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.x_first_sale_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.x_first_sale_date.xml)

### X Global Location Number  
ID: `mint_system.base.view_partner_tree.x_global_location_number`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <xpath expr="//field[@name='vat']" position="after">
        <field name="x_global_location_number"/>
    </xpath>
    <xpath expr="//notebook//form/sheet/group/group/field[@name='company_id']" position="after">
        <field name="x_global_location_number"/>
    </xpath>
</data>

```
Source: [snippets/base.view_partner_tree.x_global_location_number.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.x_global_location_number.xml)

### X Schema  
ID: `mint_system.base.view_partner_tree.x_schema`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="display_name" position="after">
        <field name="x_schema" optional="show" widget="badge"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.x_schema.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.x_schema.xml)

### X Vat  
ID: `mint_system.base.view_partner_tree.x_vat`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="display_name" position="after">
        <field name="x_vat"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.x_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.x_vat.xml)

### X Vst  
ID: `mint_system.base.view_partner_tree.x_vst`  
```xml
<data inherit_id="base.view_partner_tree" priority="60">
    <field name="active" position="after">
        <field name="x_vst" optional="hide"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.x_vst.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.x_vst.xml)

### X Zaz  
ID: `mint_system.base.view_partner_tree.x_zaz`  
```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="display_name" position="after">
        <field name="x_zaz"/>
    </field>
</data>

```
Source: [snippets/base.view_partner_tree.x_zaz.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_partner_tree.x_zaz.xml)

## View Res Bank Tree  
### Add Zip  
ID: `mint_system.base.view_res_bank_tree.add_zip`  
```xml
<data inherit_id="base.view_res_bank_tree" priority="50">
    <xpath expr="//field[@name='city']" position="before">
        <field name="zip"/>
    </xpath>
</data>

```
Source: [snippets/base.view_res_bank_tree.add_zip.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_res_bank_tree.add_zip.xml)

## View Res Partner Filter  
### Add Type Description  
ID: `mint_system.base.view_res_partner_filter.add_type_description`  
```xml
<data inherit_id="base.view_res_partner_filter" priority="50">
    <xpath expr="//field[@name='pricelist_id']" position="after">
        <separator/>
        <field string="Typenbezeichnung" name="type_description"/>
        <field string="Typenbezeichnung 2" name="type_description2"/>
    </xpath>
</data>

```
Source: [snippets/base.view_res_partner_filter.add_type_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_res_partner_filter.add_type_description.xml)

### Add Zip And City  
ID: `mint_system.base.view_res_partner_filter.add_zip_and_city`  
```xml
<data inherit_id="base.view_res_partner_filter" priority="50">
    <xpath expr="//field[@name='user_id']" position="after">
        <separator/>
        <field string="PLZ" name="zip"/>
        <field string="Stadt" name="city"/>
    </xpath>
</data>

```
Source: [snippets/base.view_res_partner_filter.add_zip_and_city.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_res_partner_filter.add_zip_and_city.xml)

### Fuzzy Search  
ID: `mint_system.base.view_res_partner_filter.fuzzy_search`  
```xml
<data inherit_id="base.view_res_partner_filter" priority="50">
    <field name="name" position="attributes">
        <attribute name="filter_domain">['|', '|', '|', '|', ('name', '%', self), ('ref', 'ilike', self), ('email', 'ilike', self), ('vat', 'ilike', self), ('company_registry', 'ilike', self)]</attribute>
    </field>
</data>
```
Source: [snippets/base.view_res_partner_filter.fuzzy_search.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_res_partner_filter.fuzzy_search.xml)

### Main Contacts  
ID: `mint_system.base.view_res_partner_filter.main_contacts`  
```xml
<?xml version="1.0" encoding="utf-8"?>
<data inherit_id="base.view_res_partner_filter" priority="50">
    <xpath expr="//filter[@name='type_company']" position="after">
        <filter string="Main Contacts" name="main_contact" domain="[('type', '=', 'contact'), ('parent_id', '=', False )]"/>
    </xpath>
</data>

```
Source: [snippets/base.view_res_partner_filter.main_contacts.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_res_partner_filter.main_contacts.xml)

### Search Zip  
ID: `mint_system.base.view_res_partner_filter.search_zip`  
```xml
<data inherit_id="base.view_res_partner_filter" priority="50">
    <field name="user_id" position="after">
        <field name="zip"/>
    </field>
</data>

```
Source: [snippets/base.view_res_partner_filter.search_zip.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_res_partner_filter.search_zip.xml)

## View Translation Lang Src Value Tree  
### Show Comments  
ID: `mint_system.base.view_translation_lang_src_value_tree.show_comments`  
```xml
<data inherit_id="base.view_translation_lang_src_value_tree" priority="50">
    <field name="value" position="after">
        <field name="comments"/>
    </field>
</data>

```
Source: [snippets/base.view_translation_lang_src_value_tree.show_comments.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_translation_lang_src_value_tree.show_comments.xml)

## View Translation Tree  
### Show Comments  
ID: `mint_system.base.view_translation_tree.show_comments`  
```xml
<data inherit_id="base.view_translation_tree" priority="50">
    <field name="state" position="after">
        <field name="comments"/>
    </field>
    <field name="name" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="module" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="type" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="state" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
</data>

```
Source: [snippets/base.view_translation_tree.show_comments.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_translation_tree.show_comments.xml)

## View Users Form  
### Email  
ID: `mint_system.base.view_users_form.email`  
```xml
<data inherit_id="base.view_users_form" priority="50">
    <field name="odoobot_state" position="after">
        <field name="email"/>
    </field>
</data>

```
Source: [snippets/base.view_users_form.email.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_users_form.email.xml)

### Show Color  
ID: `mint_system.base.view_users_form.show_color`  
```xml
<data inherit_id="base.view_users_form" priority="50">
    <field name="service_user" position="after">
        <field name="color"/>
    </field>
</data>

```
Source: [snippets/base.view_users_form.show_color.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_users_form.show_color.xml)

### Specific Ations  
ID: `mint_system.base.view_users_form.specific_ations`  
```xml
<data inherit_id="base.view_users_form" priority="50">
    <xpath expr="//field[@name='in_group_88']" position="attributes">
        <attribute name="help">M&#xE4;chtige Server-Aktionen (zum Beispiel "Lagerbuchung abbrechen")</attribute>
    </xpath>
</data>

```
Source: [snippets/base.view_users_form.specific_ations.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_users_form.specific_ations.xml)

### Write Partner Id  
ID: `mint_system.base.view_users_form.write_partner_id`  
```xml
<data inherit_id="base.view_users_form" priority="50">
    <xpath expr="//group/field[@name='partner_id']" position="attributes">
        <attribute name="readonly">0</attribute>
    </xpath>
</data>

```
Source: [snippets/base.view_users_form.write_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_users_form.write_partner_id.xml)

## View View Form  
### Add Key  
ID: `mint_system.base.view_view_form.add_key`  
```xml
<data inherit_id="base.view_view_form" priority="50">
    <xpath expr="//group[1]/field[@name='name']" position="before">
        <field name="key"/>
    </xpath>
</data>

```
Source: [snippets/base.view_view_form.add_key.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/base.view_view_form.add_key.xml)

