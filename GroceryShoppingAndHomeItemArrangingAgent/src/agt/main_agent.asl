// Agent main_agent in project groceryShoppingAndHomeItemArrangingAgent

//TODO: can get msg from owner if place item list, can get money, 

/* Initial beliefs and rules */
coordinates(home,xyz).
coordinates(shop,xyz).
coordinates(robot,xyz).
coordinates(rest,xyz).
coordinates(room,xyz).
coordinates(item,xyz).

correct_coordinates(item,xyz).

/* Rules */

/* Beliefs addition */



/* Initial goals */
// !arrange_item.

/* Plans */
//TODO create external action that prints Items must be arranged , etc ...
// +!arrange_item: not see(human) & see_incorectly_placed(item)
//     <- .print("Items must be arranged");
//     ?coordinates(item,IncorrectlyPlacedCoordinate);
//     go(IncorrectlyPlacedCoordinate);
//     pick(item);
//     ?correct_coordinates(item,CorrectCoordinates);
//     go(CorrectCoordinates);
//     put(item);
//     ?coordinates(room,RoomCoordinates);
//     go(RoomCoordinates);
//     .wait(1000);
//     -+see(human);
//     -+see_incorectly_placed(item);
//     !arrange_item
//     .

// +!arrange_item: see(human) & see_incorectly_placed(item)
//     <- .print("Human in room can't arrage");
//     .wait(1000);
//     -+see(human);
//     !arrange_item.

// +!arrange_item: (not see(human) | see(human)) & not see_incorectly_placed(item)
//     <- .print("All items are in place");
//     .wait(1000);
//     !arrange_item.

// +!buy[source(owner_agent)]:


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
{ include("$moiseJar/asl/org-obedient.asl") }