// Agent owner_agent in project groceryShoppingAndHomeItemArrangingAgent

/* Initial beliefs and rules */
money(1000).
food(items).

/* Rules */
have_money:- money(X) & X>20.

/* Beliefs addition */


/* Initial goals */
!send_robot_to_buy_food.

/* Plans */
+!send_robot_to_buy_food: have_money  <- ?food(X).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
{ include("$moiseJar/asl/org-obedient.asl") }
