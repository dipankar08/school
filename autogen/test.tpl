{% extends "layout.html" %}
{% block body %}
<div class="xform">
    <div>{% for datagroup in form.data.datagroup %}
        <div class="datagroup">
            <p>{{datagroup.name}}</p>
            <ul class="xfields" name="{{datagroup.name}}">
                {% for entry in datagroup.entry %}                    
                    <li><p>{{entry.label }}</p></li>
                    <li>
                        {% if entry.type == "select"%}
                        <{{entry.type}} name="{{entry.name}}" placeholder="{{entry.placeholder}}" class="xfield">
                          {% for e in entry.option %}
                            <option value="{{e.value}}">{{e.label }}</option>
                          {% endfor %}
                        </{{entry.type}}>
                        {% elif entry.type == "radio" %}
                          {% for e in entry.option %}
                          <input type="radio" name="{{entry.name}}" value="{{e.value}}" checked> {{e.label }}<br>
                          {% endfor %}                         
                        {% elif entry.type == "password" %}
                          <input type="password" name="{{entry.name}}" value=""><br>        
                        {% elif entry.type == "checkbox" %}
                          {% for e in entry.option %}
                          <input type="checkbox" name="{{entry.name}}" value="{{e.value}}" checked> {{e.label }}<br>
                          {% endfor %}
                        {% else %}
                         <{{entry.type}} name="{{entry.name}}" placeholder="{{entry.placeholder}}" class="xfield"></{{entry.type}}>
                        {% endif %}                        
                    </li>
                {% endfor %}
            </ul>
    {% endfor %}</div>    
</div>
{% endblock %}