function fn() {
 var env =  karate.env;// get java system property 'karate.env'
   if (!env) {
      env = 'From Karate Config'; // a custom 'intelligent' default
    }
    if (env=="qa") {
          env = 'From qa Karate Config'; // a custom 'intelligent' default
        }
        var qa = "This is qa env specific variable";

       var prop = karate.properties['some.prop'] || 'xyz';
         return {
           env: env,
           ob: qa,
           prop: prop
         };

}

