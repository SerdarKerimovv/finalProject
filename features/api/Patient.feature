
Feature: all tests related to patient module

@updatePatient
Scenario: verify doctor can update patient with PUT
    Given doctor is logged in
    When user provides "first_name" with new value "UpdatedName"
    And user provides "last_name" with new value "UpdatedLastName"
    And user hits PUT "/api-patients"
    Then verify status code is 200
    And verify response body contains "first_name" with "UpdatedName"

@createPatient
Scenario: verify doctor can create patient with POST
    Given doctor is logged in
    When user hits POST "/api-patients" with body
    """
    {
        "first_name": "Tony",
        "last_name": "Brown",
        "dob": "2022-05-20",
        "gender": "Male",
        "phone": "323452323",
        "email": "tony@gmail.com",
        "address": "string",
        "emergency_contact_name": "string",
        "emergency_contact_phone": "string",
        "insurance_provider": "string",
        "insurance_policy_number": "string"
    }
    """
    Then verify status code is 201

@createPatient
Scenario: verify doctor can create patient with POST
    Given doctor is logged in
    When user hits POST "/api-patients" with body
    """
    {
        "first_name": "Tony",
        "last_name": "Brown",
        "dob": "2022-05-20",
        "gender": "Male",
        "phone": "323452323",
        "email": "tony@gmail.com",
        "address": "string",
        "emergency_contact_name": "string",
        "emergency_contact_phone": "string",
        "insurance_provider": "string",
        "insurance_policy_number": "string"
    }
    """
    Then verify status code is 201




@createRandomPatient
Scenario: verify doctor can create patient with POST
    Given doctor is logged in
    When user creates random patient using POST "/api-patients"
    Then verify status code is 201
