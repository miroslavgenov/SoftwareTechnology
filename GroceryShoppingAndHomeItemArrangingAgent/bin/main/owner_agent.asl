// Agent owner_agent in project groceryShoppingAndHomeItemArrangingAgent

/* Initial beliefs and rules */
money(1000).
food(items).
full(fridge).


/* Rules */
have_enought_money(Price):- money(Money) & Money>Price.

/* Beliefs addition */


/* Initial goals */
!pick_food.


/* Plans */
+!pick_food: full(fridge) <- 
-+food(remaining_food);
-+see(food_magazine);
.print("Hmmmm...");
mylib.choose_food_from(food_magazine,Choosen_food);
!order_food(Choosen_food).


+!order_food(Food): mylib.calculate_food_price(Food,Price) &  have_enought_money(Price) <- 
-+food(Food);
?money(Money);
MyNewMoney = Money-Price;
-+money(MyNewMoney);
say("Hello Robot.I want to have ",Food);
.send(main_agent,achieve,buy(Food,Price)).


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
{ include("$moiseJar/asl/org-obedient.asl") }
