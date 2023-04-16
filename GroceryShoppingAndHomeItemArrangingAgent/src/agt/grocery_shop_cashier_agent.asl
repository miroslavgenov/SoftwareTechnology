// Agent grocery_shop_cashier_agent in project groceryShoppingAndHomeItemArrangingAgent

/* Initial beliefs and rules */

/* Rules */
have_enought_money_to_buy(Food,Money):- mylib.calculate_food_price(Food,Price) & Money=Price.

/* Initial goals */

/* Beliefs addition */


/* Plans */
+!sell_food(Food,Money): have_enought_money_to_buy(Food,Money) <-
    say("Hello client you bought the food successfully.");
    .send(main_agent,tell,transaction_completed).


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
{ include("$moiseJar/asl/org-obedient.asl") }
