// Agent owner_agent in project groceryShoppingAndHomeItemArrangingAgent

/* Initial beliefs and rules */

/* Rules */


/* Beliefs addition */

/* Initial goals */
!start.

/* Plans */

+!start : true <- .send(main_agent,tell,hello("Hello")).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
{ include("$moiseJar/asl/org-obedient.asl") }
