package mylib;

import jason.asSyntax.*;
import jason.asSemantics.*;
import java.util.*;

public class calculate_food_price extends DefaultInternalAction{
    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {

        //init
        String foodNames = args[0].toString();
        foodNames = foodNames.substring(1, foodNames.length()-1);
        // System.out.println(foodNames);
        String[] choosenFoods  = foodNames.split(",");


        
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
            
        int[] howMuchTimesFoodItemIsMentioned = new int[foodItems.size()]; 
        for(String food: choosenFoods){
            for(int i=0;i<foodItems.size();i++){
                if(food.equals(foodItems.get(i))){
                    howMuchTimesFoodItemIsMentioned[i]+=1;
                }
            }
        }
        
        
        
        
        // System.out.println("getting the price");

        // for(int i=0;i<choosenFoods.size();i++){
        //     System.out.println(choosenFoods.get(i));
        // }
        
        List<Integer> foodPrices  =  Arrays.asList(
            12,
            15,
            20,
            5,
            5,
            4,
            7,
            8,
            6,
            10,
            11,
            12
            );

            int sumPrice=0;
            for(int i=0;i<howMuchTimesFoodItemIsMentioned.length;i++){
                if(howMuchTimesFoodItemIsMentioned[i]!=0){
                    for(int j=0;j<howMuchTimesFoodItemIsMentioned[i];j++){
                        sumPrice+=foodPrices.get(i);
                    }
                }
            }
        
        return un.unifies(args[1], new NumberTermImpl(sumPrice));
    }

}
