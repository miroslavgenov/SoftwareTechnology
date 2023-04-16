package tools;

import cartago.*;
import jason.asSyntax.*;
import jason.asSemantics.*;



public class RoomAndGrocery extends Artifact {
// names of observable property as well as actions must start with downcase letter
  void init() {
    // defineObsProperty("groceryMsg","");
  }

  @OPERATION void test(Object test){
    System.out.println("Hello world");
  }

  @OPERATION void go(Object coordinats){

  }

  @OPERATION void pick(Object coordinats){
    
  }

  @OPERATION void put(Object coordinats){
    
  }

  @OPERATION void get(Object coordinats){
    
  }

  @OPERATION void write(Object coordinats){
    
  }

  @OPERATION void say(String msg) {
    System.out.println(msg);
  }

  @OPERATION void sayGroceryGreetingsMessage(String msg) {
    System.out.println(msg);
    // getObsProperty("groceryMsg").updateValue(msg);
  }


}
