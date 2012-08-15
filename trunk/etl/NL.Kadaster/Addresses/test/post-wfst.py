import httplib

def post_wfst():
    
    filename = 'wfs-t-example.xml'
    headers = {"Content?type" : 'Content-type: text/xml',"Accept":"text/xml"}
    
    conn = httplib.HTTPConnection("localhost", "8080")
    conn.request("POST","/services/wfs-inspire-ad", open(filename,"r"), headers)
    
    response = conn.getresponse()
    print response.read()
    conn.close()

post_wfst()

