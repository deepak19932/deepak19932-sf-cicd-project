@isTest
public class HelloWorldTest {
    @isTest
    static void testSayHello() {
        String result = HelloWorld.sayHello('Deepak');
        System.assertEquals('Hello, Deepak! Welcome from Dev Org.', result, 'sayHello should return correct greeting');
    }

    @isTest
    static void testSayHelloWithEmptyName() {
        String result = HelloWorld.sayHello('');
        System.assertEquals('Hello, ! Welcome from Dev Org.', result, 'sayHello should handle empty name');
    }
}
