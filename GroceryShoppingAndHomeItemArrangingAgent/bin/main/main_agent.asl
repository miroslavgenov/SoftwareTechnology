// Agent main_agent in project groceryShoppingAndHomeItemArrangingAgent

//TODO: can get msg from owner if place item list, can get money, 

/* Initial beliefs and rules */
coordinates(home,[X,Y,Z]).
coordinates(shop,[X,Y,Z]).
coordinates(robot,[1,2,3]).
proper_coordinates_of(items).

/* Rules */

/* Beliefs addition */

/* Initial goals */
!arrange_room_items.
!arrange_item.

/* Plans */
+!arrange_room_items: not see(owner) <- .print("helo").

// +!arrange_item: 



{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
{ include("$moiseJar/asl/org-obedient.asl") }
