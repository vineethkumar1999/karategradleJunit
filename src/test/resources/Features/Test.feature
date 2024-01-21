@test2
Feature: Testing my API

  Background:
      * def var1 = karate.properties['someprop']
      * print var1
      * print 'Started'
      * print  ob
      * print env
      * print 'Ended'
     * print prop

  @Check90
  Scenario: Variable Declaration and Assert Usage
# Given, And , When can be used to define variables
    Given def var1 = 'Hi'
    Then print var1
    * def var2 = 'Hi'
    And print var2
    And def var3 = var2
    * assert var1 == var2
    Then assert var1 == var2
    * def var4 = { key1: 'val1' , key2:{ Ikey1 : 'IV1', Ikey2: 'IV2' } , key3 : [A,B,C] }
    Then print 'The Json Var4 is :' +var4
    * print 'Calling Karate Method' + karate.pretty(var4)
#   +var4 prints the values in same line ,var4 will pretty print it \n can be used in print

  @Check89
  Scenario: Json and XML Parsing
    * print 'Scenario 2 Started'
    * def J =  { key1: 'val1' , key2:{ Ikey1 : 'IV1', Ikey2: 'IV2' } , key3 : [A,B,C] }
    * def Json2 = J.key2.Ikey2
    Then print karate.pretty(Json2)
    * match Json2 == 'IV2'
    And match J.key3[1] == 'B'
    Given def cat = <cat><name>Billie</name><scores><score>2</score><score>5</score></scores></cat>
    Then match cat.cat.name == 'Billie'
    And match cat.cat.scores.score[1] == '5'

  @ignore
  Scenario: Embedded Expressions
#      They work only when accompanied by def, match , configure. and has to be in Json or XML
    When def a = 10
    Then print a
    * def User =  { key1: 'val1' , key2:{ Ikey1 : 'IV1', Ikey2: 'IV2' } , key3 : [A,B,C] }
    * def user2 = { key1 : '#(User.key1)' , key2 : '#(a)'}
    Then print user2
    And match user2 ==
      """
      {
       key1 : 'val1' ,
        key2 : 10
       }
      """
#      Above Example is multi line expression, we can give such

  @ignore
  Scenario: Table and Set Example
    Given def n = 'John'
    * table t
      | name | value |
      | n    | 2     |
      | 'v'  | 5     |
      | 'z'  | 6     |
    * match t == [{name: 'John',value: 2},{name: 'v',value: 5},{name: 'z',value: 6}]
    And match t[1] == {name:'v', value:5}
    And match t[0] == { name: #string , value: #notnull}
    * table S
      | key | value         |
      | 1   | null          |
      | 2   | {IK :1, IK:2} |
      | 3   | [A,B,C]       |
      | 4   |               |
    * match S[3] == {key:4}

  @ignore
  Scenario: Text Replace
    Given def text = 'Hello <replace> World'
    Then replace text.replace = 'My'
    And match text == 'Hello My World'
    * def js = { key1: 'val1' , key2:{ Ikey1 : 'IV1', Ikey2: 'IV2' } , key3 : [A,B,C] }
    * print js
    * replace js
      | token | value  |
      | one   | 'val1' |
      | two   | 'IV2'  |
    Then print js


  @ignore
  Scenario: Function Check
    * def f =
      """
    function(name){
     var a = 10;
     var b = 20;
     return a+b;
    }
      """
    * def r = f('hello')
    Then match r == 30.0
    Given def f2 = function() {return 'Hello'}
    When def r2 = f2()
    Then match r2 == 'Hello'
    And def r3 = call f2
    Then match r3 == 'Hello'

  @ignore
  Scenario: Read a File, Call a Function inside a file
    Given def f = read('classpath:Files/Text.txt')
    Given def fs = call read('classpath:reusableFunctions/AddFunction.js')
    Given def fs1 = read('classpath:reusableFunctions/AddFunction.js')
    * print f
    * print fs
    * def r = call fs1
#     or you can do def r = fs1()
    * print r
    Given def fs2 = call read('classpath:reusableFunctions/TwoFunction.js') ('Hello')
    * print fs2
    Given def fs3 = read('classpath:reusableFunctions/ParameterFunction.js')
    * print fs3(10,20)
    #only 1 arg passing is allowed to a JS function in karate, if more than 1 then use normal way like above

  @ignore
  Scenario: Calling Java Methods using Java Script and Karate
    * def fc = read('classpath:reusableFunctions/CallJava.js')
    * def res = fc(10,20)
    Then match res == 30
    * def jc = Java.type('karaterunner.TestUtils')
    * def jo = new jc()
    * def res = jo.mul(10,20)
    * match res == 200

  @ignore
  Scenario: Calling a Feature file
    * def a = 'Rooney'
    * def b = 'Check'
    * def res = call read('classpath:Features/MyTestClass.feature') { firstname : 'John' , lastname : '#(a)'}
#      __arg can be used in called feature to see what all variables it received
#      any variables set there can be accessed in calling feature also
    * def resp = res.response
    Then print resp
    And print res.A
#    Calling a scenario in feature file
    * def res2 = call read('classpath:Features/MyTestClass.feature@Check2') { firstname : 'John' , lastname : '#(a)'}
    * assert res2.R == 'In Check 2'

  @ignore
  Scenario: Image Comparison
    * configure imageComparison = { onShowRebase: '(cfg, saveAs) => saveAs(cfg.name)' }
    * configure imageComparison = { hideUiOnSuccess: true }
    * configure imageComparison = { failureThreshold: 2 }
    * compareImage { baseline: 'classpath:Images/Baseline.jpg'  , latest: 'classpath:Images/Baseline2.jpg'}

  @ignore
  Scenario: Type Conversion
    * string a = '{ key1: "a"}'
    * json b = a
    * match b.key1 == 'a'

  @ignore
  Scenario: Insert into Report
    * url 'https://jsonplaceholder.typicode.com/users'
    * method get
    * doc { read: 'users.html' }
  @ignore
  Scenario: Simple Get Test
    Given url 'https://api.aviationapi.com'
    Given path 'v1/charts'
    And param apt = 'AVL'
#    Total URL will be https://api.aviationapi.com/v1/charts?apt=AVL
    When method get
    Then status 200
    @TEst2
    Scenario: call Java
      * def jc = Java.type('karaterunner.TestUtils')
      * def jo = new jc()
      Then def res = jo.test(2,2,6,5)
      Then def res2 = jo.az('as')




