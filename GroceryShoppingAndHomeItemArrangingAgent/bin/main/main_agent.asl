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
grocery_open:- .time(H,M,S) & H>7 & H<21.


/* Beliefs addition */
+see(human).


/* Initial goals */
!arrange_item.

/* Plans */
// +!arrange_item: true <- .print("hello").
+!arrange_item: not see(human)
 & see_incorectly_placed(item)
    <- say("Items must be arranged");
    ?coordinates(item,IncorrectlyPlacedCoordinate);
    go(IncorrectlyPlacedCoordinate);
    pick(item);
    ?correct_coordinates(item,CorrectCoordinates);
    go(CorrectCoordinates);
    put(item);
    ?coordinates(room,RoomCoordinates);
    go(RoomCoordinates);
    .wait(1000);
    -+see(human);
    -+see_incorectly_placed(item);
    !arrange_item
    .

+!arrange_item: see(human) & see_incorectly_placed(item)
    <- say("Human in room can't arrage");
    .wait(1000);
    -+see(human);
    .suspend.

+!arrange_item: (not see(human) | see(human)) & not see_incorectly_placed(item)
    <- say("All items are in place");
    .wait(1000).

+!buy(Food,Price): grocery_open <- .print("I can go buy ");
?coordinates(shop,XYZ);
go(XYZ);
.


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
{ include("$moiseJar/asl/org-obedient.asl") }