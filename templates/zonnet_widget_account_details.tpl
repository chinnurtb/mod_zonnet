{% extends "zonnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
    {% if dashboard %}
    {% button class="btn btn-mini pull-right" action={redirect dispatch="zonnet_account_details"} text=_"show all"%}
    {% endif %}
{% endblock %}

{% block widget_class %}{% if last %}last{% endif %}{% endblock %}

{% block widget_content %}
<table class="table do_adminLinkedTable">
    <thead>
        <tr>
            <th width="35%" colspan="2">{{ m.zonnet[{accounts_table fields="name" limit=1}] }}</th>
        </tr>
    </thead>
    <tbody>
     {% if m.zonnet.user_type == 1 %}
     {% if not dashboard %}
        <tr><td>ИНН / КПП</td><td>{{ m.zonnet[{accounts_table fields="inn" limit=1}] }} / 
                                  {{ m.zonnet[{accounts_table fields="kpp" limit=1}] }}</td></tr>
     {% endif %}
        <tr><td width="35%">Контактное лицо</td><td>{{ m.zonnet[{accounts_table fields="kont_person" limit=1}] }}</td></tr>
     {% endif %}
        <tr><td>E-mail</td><td>{% for email in m.zonnet.get_accounts_emails %} {{ email }} {% endfor %}</td></tr>
        <tr><td>Телефон</td><td>{{ m.zonnet[{accounts_table fields="phone" limit=1}] }}</td></tr>
     {% if not dashboard %}
        <tr><td>Факс</td><td>{{ m.zonnet[{accounts_table fields="fax" limit=1}] }}</td></tr>
        <tr><td>Юридический адрес</td><td>{{ m.zonnet[{format_address addrtype=0}] }}</td></tr>
        <tr><td>Почтовый адрес</td><td>{{ m.zonnet[{format_address addrtype=1}] }}</td></tr>
        <tr><td>Адрес доставки счета</td><td>{{ m.zonnet[{format_address addrtype=2}] }}</td></tr>
     {% if m.zonnet.user_type == 1 %}
        <tr><td>Директор</td><td>{{ m.zonnet[{accounts_table fields="gen_dir_u" limit=1}] }}</td></tr>
        <tr><td>Главный бухгалтер</td><td>{{ m.zonnet[{accounts_table fields="gl_buhg_u" limit=1}] }}</td></tr>
     {% endif %}
     {% endif %}
    </tbody>
</table>
{% endblock %}

