# Digest
## Digest Mail Main  
### Report  
ID: `mint_system.digest.digest_mail_main.report`  
```xml
<t t-name="digest.digest_mail_main.report">
    <t t-set="body">
        <t t-set="kpi_data" t-value="env['digest.digest'].browse(1).compute_kpis(env.user.company_id, env.user)"/>
        <div t-if="kpi_data" class="global_layout" style="padding-bottom: 0;">
            <div t-foreach="kpi_data" t-as="kpi_info" class="kpi_row_footer">
                <div t-if="kpi_info.get('kpi_col1') or kpi_info.get('kpi_col2') or kpi_info.get('kpi_col3')">
                    <div class="kpi_header">
                        <span t-esc="kpi_info['kpi_fullname']" style="vertical-align: middle;"/>
                        <a t-if="kpi_info['kpi_action']" t-att-href="'/web#action=%s' % kpi_info['kpi_action']">
                            <span class="button" id="button_open_report">Open Report</span>
                        </a>
                    </div>
                    <div t-if="kpi_info.get('kpi_col1')" class="kpi_cell">
                        <div t-call="digest.digest_tool_kpi">
                            <t t-set="kpi_value" t-value="kpi_info['kpi_col1']['value']"/>
                            <t t-set="kpi_margin" t-value="kpi_info['kpi_col1'].get('margin')"/>
                            <t t-set="kpi_subtitle" t-value="kpi_info['kpi_col1']['col_subtitle']"/>
                        </div>
                    </div>
                    <div t-if="kpi_info.get('kpi_col2')" class="kpi_cell">
                        <div t-call="digest.digest_tool_kpi">
                            <div t-set="kpi_value" t-value="kpi_info['kpi_col2']['value']"/>
                            <div t-set="kpi_margin" t-value="kpi_info['kpi_col2'].get('margin')"/>
                            <div t-set="kpi_subtitle" t-value="kpi_info['kpi_col2']['col_subtitle']"/>
                        </div>
                    </div>
                    <div t-if="kpi_info.get('kpi_col3')" class="kpi_cell">
                        <div t-call="digest.digest_tool_kpi">
                            <div t-set="kpi_value" t-value="kpi_info['kpi_col3']['value']"/>
                            <div t-set="kpi_margin" t-value="kpi_info['kpi_col3'].get('margin')"/>
                            <div t-set="kpi_subtitle" t-value="kpi_info['kpi_col3']['col_subtitle']"/>
                        </div>
                    </div>
                    <div class="kpi_trick"/>
                </div>
            </div>
        </div>
    </t>
    <t t-call="digest.digest_mail_layout"/>
</t>

```
Source: [snippets/digest.digest_mail_main.report.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/digest.digest_mail_main.report.xml)

