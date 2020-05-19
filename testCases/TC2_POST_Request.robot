*** Settings ***
Library  RequestsLibrary
Library  Collections


*** Variables ***
${base_url}  http://restapi.demoqa.com/customer


*** Test Cases ***
Put_CustomerRegister
    CREATE SESSION    mysession       ${base_url}
    ${body}=     CREATE DICTIONARY  FirstName=rav193478   LastName=r193489  UserName=daio4   Password=oid1934  Email=ranjpid1934@gmail.com
    ${header}=   CREATE DICTIONARY  Content-Type=application/json
    ${response}=      post request    mysession       /register   data=${body}   headers=${header}
    log to console   ${response.status_code}
    log to console   ${response.content}


    #VALIDATIONS
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}     201
    ${res_body}=    convert to string  ${response.content}
    should contain      ${res_body}         OPERATION_SUCCESS
    should contain      ${res_body}         Operation completed successfully

