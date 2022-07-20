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