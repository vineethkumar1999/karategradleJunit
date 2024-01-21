function J(a,b)
{
    var JavaDemo = Java.type('karaterunner.TestUtils');
    return JavaDemo.add(a,b);
//   create a object in case you want to call a non static method like var jd = new JavaDemo();
}