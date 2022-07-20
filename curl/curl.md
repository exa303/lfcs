# cURL

* **Curl POST JSON:**
	* `curl -X POST https://reqbin.com/echo/post/json
   -H 'Content-Type: application/json'
   -d '{"login":"my_login","password":"my_password"}'`

* **POST Body:**
	* `curl -X POST https://reqbin.com/echo/post/json 
   -H "Content-Type: application/json"
   -d '{"productId": 123456, "quantity": 100}'  `

* **Add multiple headers:** 
 	* `curl https://reqbin.com/echo/get/json
   -H "X-Custom-Header: value"
   -H "Content-Type: application/json"
     `

* **Download a file:**
 	* `curl -o filename.txt https://reqbin.com/echo`

* **HTTPS requests:**
 	
 	When sending a request to an HTTPS URL, Curl verifies the SSL certificate of the target URL against the local CA certificate store. For expired and self-signed certificates, Curl returns Certificate Verify Failed error message. To bypass certificate checking, pass -k or --insecure command-line switch to Curl. Click Run to execute the Curl HTTPS request online and see the results. 
 	* `curl -k https://expired.badssl.com`

* **Follow redirects using Curl:**
 	* `curl https://www.reqbin.com/echo -L`

* **Request With Bearer Token Authorization Header:**
	
	Example Curl request using bearer token authorization header. The bearer token is sent to the server with the 'Authorization: Bearer {token}' authorization header. The 'Accept: application/json' header tells the server that the client is expecting JSON. The server informs the client that it has returned JSON with a 'Content-Type: application/json' response header. In this Curl Request With Bearer Token Authorization Header example, we are sending a request to the ReqBin echo URL. 
	* `curl https://reqbin.com/echo/get/json
   -H "Accept: application/json"
   -H "Authorization: Bearer {token}"`

* **get JSON:** 
	
	To get JSON with Curl, you need to make an HTTP GET request and provide the Accept: application/json request header. The application/json request header is passed to the server with the curl -H command-line option and tells the server that the client is expecting JSON in response. If you do not provide an Accept request header, the server may respond with a different MIME type than JSON. The server specifies the returned data type with the Content-Type response header. In this Curl GET JSON example, we send an HTTP GET request to download the JSON from the ReqBin echo URL. Click the Run button to execute the Curl GET JSON example online and see the results. 
	* `curl https://reqbin.com/echo/get/json
   -H "Accept: application/json" `


* **Post form data:**
	
	To post form data with Curl, you can use one of two command-line parameters: -F (--form) or -d (--data). The -F command-line parameter sends form data with the multipart/form-data content type, and the -d command-line parameter sends form data with the application/x-www-form-urlencoded content type. In this Curl POST Form example, we are sending a form to the ReqBin echo URL. Click Run to execute the Curl POST Form request online and see the results. 
	* `curl -X POST https://reqbin.com/echo/post/form
   -H "Content-Type: application/x-www-form-urlencoded" 
   -d "param1=value1&param2=value2" `


* **send a HEAD request:**

	To make a HEAD request with Curl, you need to use the -I or --head command-line parameter. The -I command-line parameter tells Curl to send an HTTP HEAD request to receive only HTTP headers. The HEAD request is very similar to a GET request, except that the server only returns HTTP headers without a response body. In this Curl HEAD request example, we send a HEAD request to the ReqBin echo URL. Click Run to execute the Curl HEAD request online and see the results. 
	* `curl -I https://reqbin.com/echo`


* **send a DELETE request:**
	
	* `curl -X DELETE http://reqbin.com/sample/delete/json?id=1
     -H "Accept: application/json"`


* **GET multiple resources where IDs are in a range:**
	
	* `curl http://api.example.com:8080/items/[1230-1234]` 

