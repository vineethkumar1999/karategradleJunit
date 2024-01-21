Feature: TO Test

  Background:
#    * print env

  @Test2F
  Scenario: Normal Variable Tests
    Given def var1 = 5
    Then assert var1 == 5
    * text query =
    """
    Just a normal one
    """
    * match query == 'Just a normal one'
    * table t1
      | name   | role  |
      | 'Josh' | 'dev' |
    * match t1 == [{name:'Josh', role:'dev'}]
    * def cat = { name: 'Billie', scores: [2, 5] }
    * assert cat.scores[1] == 5
    * assert t1[0].name == 'Josh'


  Scenario: Read a File, Call a Function inside a file
    Given def f = read('classpath:Files/Text.txt')
    Given def fs = call read('classpath:reusableFunctions/AddFunction.js')
    Given def fs1 = read('classpath:reusableFunctions/AddFunction.js')
    * print f
    * print fs1
    * def r = call fs1
#     or you can do def r = fs1()
    * print r
    Given def fs2 = call read('classpath:reusableFunctions/TwoFunction.js') ('Hello')
    * print fs2
    Given def fs3 = read('classpath:reusableFunctions/ParameterFunction.js')
    * print fs3(10,20)


  Scenario: Get Call
    Given url 'https://automationexercise.com/api/productsList'
    When method get
    Then status 200
    Then print 'The response is :', response
    * json data = response.products
    * print karate.sizeOf(response.products)
    * print data

  Scenario: Post call 405
    Given url 'https://automationexercise.com/api/productsList'
    When method post
    Then status 200
    Then assert response.responseCode == 405

  Scenario: Create account
    Given url 'https://automationexercise.com'
    * def query = { name: 'User', email: 'test@gmail.com', password: 'Pass@1', title : 'Mr.' , birth_date:21 , birth_month:12, birth_year:1998,firstname:'Test',lastname:'User',country:'India', state:'AP', city:'T', zipcode:'234',mobile_number:1234  }
    And path 'api/createAccount'
    And params query
    When method post
    Then status 201

  Scenario: Post call
    Given url 'https://dummy.restapiexample.com'
    And path 'api/v1/create'
    And params {"name":"testUser7","salary":"123","age":"23"}
    When method post
    Then status 200
    And path 'api/v1/employees'
    When method get
    Then status 200
    * print response
    * def myUsers =
  """
    function (array){
    for(var i=0;i<array.length;i++){
    console.log(array[i].id)
    if(array[i].employee_name == 'Garrett Winters')
    return array[i].id
    }
    }
    """
    * def myId = myUsers(response.data)
    * print myId

  Scenario: Update put
    Given url 'https://dummy.restapiexample.com'
    And path 'update/21'
    And request {"name":"test","salary":"123","age":"23"}
    When method put
    Then status 200


    Scenario: Test
      * def j = {foo:'Hi' , bar:'bye'}
      * j.bar2 = 'ooo'
      * print j
      * remove j.foo
      Then print j
      * def j2 = [{foo:'hi'}]
      * delete j2['foo']
      * print j2
      * def cat = { name: 'Billie', type: 'LOL', id: 'a9f7a56b-8d5c-455c-9d13-808461d17b91' }
      * match cat == { name: '#ignore', type: '#regex [A-Z]{3}', id: '#uuid' }
      * def actual = { age: 25 }
      * def expected = { name: '#notpresent' , age:25 }
      * match actual == expected



