// Agent main_agent in project groceryShoppingAndHomeItemArrangingAgent

/* Initial beliefs and rules */
coordinates(home,xyz).
coordinates(grocery_shop,xyz).
coordinates(robot,xyz).
coordinates(rest,xyz).
coordinates(room,xyz).
coordinates(item,xyz).
coordinates(fridge,xyz).

correct_coordinates(item,xyz).

coordinates(grocery_shop_cashier,xyz).

wallet(0).

/* Rules */
grocery_open:- .time(H,M,S) & H>7 & H<21.


/* Beliefs addition */
+see(human).

+transaction_completed: true <- 
    -+wallet(0);
    !return_home.
    

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
    !arrange_item.

+!arrange_item: see(human) & see_incorectly_placed(item)
    <- say("Human in room can't arrage");
    .wait(1000);
    -+see(human);
    .suspend.

+!arrange_item: (not see(human) | see(human)) & not see_incorectly_placed(item)
    <- say("All items are in place");
    .wait(1000);
    ?coordinates(rest,RestCoordinates);
    go(RestCoordinates).

+!buy(Food,Price)[source(owner_agent)]: grocery_open <-
    say("Hello owner.The grocery is open and I'm going to buy them!");
    -+wallet(Price);
    -+food(Food);
    ?coordinates(grocery_shop,GroceryShopCoordinates);
    go(GroceryShopCoordinates);
    pick(Food);
    ?coordinates(grocery_shop_cashier,CashierCoordinates);
    go(CashierCoordinates);
    say("Hello cashier. I'm going to buy ",Food);
    ?wallet(Money);
    .send(grocery_shop_cashier_agent,achieve,sell_food(Food,Money)).

+!return_home: true <-
    ?coordinates(home,HomeCoordinates);
    go(HomeCoordinates);
    ?coordinates(room,RoomCoordinates);
    go(RoomCoordinates);
    say("Hello owner, the food is here!");
    ?coordinates(fridge,FridgeCoordinates);
    go(FridgeCoordinates);
    open(fridge);
    ?food(Food);
    put(Food,fridge);
    close(fridge);
    ?coordinates(rest,RestCoordinates);
    go(RestCoordinates)
    .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
{ include("$moiseJar/asl/org-obedient.asl") }