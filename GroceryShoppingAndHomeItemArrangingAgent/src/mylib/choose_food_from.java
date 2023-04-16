package mylib;

import jason.asSyntax.*;
import jason.asSemantics.*;
import java.util.*;

public class choose_food_from extends DefaultInternalAction{
    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {

        List<String> foodItems = Arrays.asList(
            "milk",
            "butter",
            "cheese",
            "cherry",
            "raspberry",
            "pomegranate",
            "potato",
            "ginger",
            "pumpkin",
            "spinach",
            "fish",
            "beef"
        );

        int minimumNumberOfItems = 1;
        int maximumNumberOfItems = foodItems.size();
        int numberOfTotalFoodItemsToBuy = pickHowMuchItemsToBuy(foodItems.size(), minimumNumberOfItems);
        
        // System.out.println("I'm going to buy: "+ numberOfTotalFoodItemsToBuy+" items. Which are: ");

        List<String> choosenFoods = chooseWhatItemsToBuy(foodItems,numberOfTotalFoodItemsToBuy);

        Collections.sort(choosenFoods);
        
        return un.unifies(args[1], new StringTermImpl(getChooseFoodsAsString(choosenFoods)));
    }

    public static int pickHowMuchItemsToBuy(int max,int min){
        Random pickRandomNumber = new Random();
        return pickRandomNumber.nextInt(max-min+1)+min;
    }

    public static ArrayList<String> chooseWhatItemsToBuy(List<String> foodItems,int numberOfTotalFoodItemsToBuy){
        ArrayList<String> choosenFoods = new ArrayList<>();
        Random pickNumber = new Random();
        int maximumNumberOfItems = foodItems.size();
        
        
        int choosenFoodIndex;
        for(int i=0;i<numberOfTotalFoodItemsToBuy;i++){
            choosenFoodIndex = pickNumber.nextInt(maximumNumberOfItems);
            choosenFoods.add(foodItems.get(choosenFoodIndex));
        }

        return choosenFoods;
    }

    public static String getChooseFoodsAsString(List<String> choosenFoods){
                String foodNames="";
        for(String food: choosenFoods){
            foodNames+=food+",";
        }
        foodNames=foodNames.substring(0, foodNames.length()-1);

        return foodNames;
    }

}
