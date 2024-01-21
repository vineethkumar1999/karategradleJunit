To run from CMD
gradle test -Dkarate.env="e2e" "-Dkarate.options=--tags @Check89 --dryrun" --info
gradle test -Dkarate.env="e2e" "-Dkarate.options=--tags @Check89" --info

gradle test -Dkarate.env="qa" "-Dkarate.options=--tags @Check89"  -Dsome.prop="TestRandomProp" --info

to read random properties, pass them using -D from cmd. import it in gradle in build.gradle...and then use it in karate-config



response or $ is same

responseTime, responseStatus, responseType can also be used


* configure retry = { count: 10, interval: 5000 }

#number, #ignore, #present, #notpresent, #uuid, #string, #null, #notnull, #boolean, #object, #array
* can be used in contains as wild card match or use #regex exp
##string --> means this field is optional
match ==

match !=

match a contains b

match a !contains b

match a contains only b

match a contains any b

match a contains deep b

match a contains only deep b

* def expected = zone == 'zone1' ? { foo: '#string' } : { bar: '#number' }

* if (responseStatus == 200) karate.call('delete-user.feature')
