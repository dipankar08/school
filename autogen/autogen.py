import json
import xmltodict
from jinja2 import Template

def xml2dict(xml_file, xml_attribs=True):
    with open(xml_file, "rb") as f:    # notice the "rb" mode
        d = xmltodict.parse(f, xml_attribs=xml_attribs)
        j = json.dumps(d, indent=4)
        j = j.replace("@","")
        print j
        return json.loads(j)
        
def render(file,data):
    f = open(file,'r')
    #print f.read()
    template = Template(f.read())
    ans = template.render(data)
    open(file+'.html','w').write(ans)
#main function.
data = xml2dict("test.xml")
render("test.tpl",data)
