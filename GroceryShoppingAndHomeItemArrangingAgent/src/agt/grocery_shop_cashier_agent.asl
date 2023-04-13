// Agent grocery_shop_cashier_agent in project groceryShoppingAndHomeItemArrangingAgent

/* Initial beliefs and rules */

/* Rules */

/* Initial goals */

/* Beliefs addition */


!start.

/* Plans */

+!start : true <- .print("hello world.").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
{ include("$moiseJar/asl/org-obedient.asl") }
