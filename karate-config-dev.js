function fn() {
 var env =  karate.env;// get java system property 'karate.env'
   if (env=="dev") {
      env = 'From dev Karate Config'; // a custom 'intelligent' default
    }
    var dev = "This is dev env specific variable"
     return {
       env: env,
       ob: dev
     };
}

