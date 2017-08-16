<style>
ul,li{margin:0;padding:0;width:100%;display:inline-block;}
.xfields li{
    height: 45px;
    margin: 0px 10px 10px 10px;
}
.xfields li.label{ width:50px}
.xfields li.input{ width:calc(50% - 100px);}
    .xform{}
    .tab_holder{}
    .main_holder{
    position: relative;
    height: 100%;
    width: 100%;
}
.datagroup {
    width: 100%;
    height: auto;
    margin-bottom: 40px;
    border: 1px dashed black;
    padding: 0px;
}
.datagroup .head {
border-bottom: 1px dashed black;
    padding: 10px 0;
    margin-bottom: 13px;
    margin: 0;
    padding-left: 20px;
    font-size: 1.5rem;
    text-transform: uppercase;
    }
.datagroup     ul {padding: 20px 0;
}
    .xfields {}
    
    .xfields .xfield{}
input[type=text],input[type=password], select, textarea,checkbox {
    width: 100%;
    height: 100%;
    font-size: 15px;
    font-family: monospace;
    border: 1px solid black;
    padding: 5px;
    outline: none;
    color: black;} 
</style>
<div class="xform">
    <div class="tab_holder">
        <ul>
        {% for datagroup in form.data.datagroup %}
            <li class="{{datagroup.name}}"> {{datagroup.label}}</li>
        {% endfor %}
        </ul>
    </div>
    <div class="main_holder">
        {% for datagroup in form.data.datagroup %}
        <div class="datagroup {{datagroup.name}}">
            <p class="head">{{datagroup.name}}</p>
            <ul class="xfields" name="{{datagroup.name}}">
                {% for entry in datagroup.entry %}                    
                    <li class="label"><p>{{entry.label }}</p></li>
                    <li class="input">
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
                         <{{entry.type}} type="text" name="{{entry.name}}" placeholder="{{entry.placeholder}}" class="xfield"></{{entry.type}}>
                        {% endif %}                        
                    </li>
                {% endfor %}
            </ul>
        </div> <!-- end of datagroup -->
    {% endfor %}
    </div>    <!-- end of main_holder -->
</div> <!-- end of xform -->
