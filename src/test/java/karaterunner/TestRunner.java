package karaterunner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

//    @Karate.Test
//    Karate testUi() {
//        return Karate.run("classpath:Features/Test.feature:23");
//    }

    @Karate.Test
    Karate test(){
        String tags = System.getProperty("karate.tags"); // Retrieve tags from system property
        String env = System.getProperty("karate.env"); // Retrieve environment from system property

        return Karate.run("classpath:Features").tags("@Test2F").karateEnv("qa");
    }



}