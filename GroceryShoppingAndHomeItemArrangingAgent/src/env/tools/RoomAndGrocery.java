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

  @OPERATION void pick(Object object){
    
  }

  @OPERATION void put(Object object){
    
  }

  @OPERATION void put(Object object1,Object object2){
    
  }

  @OPERATION void open(Object object){
    
  }

  @OPERATION void close(Object object){
    
  }


  @OPERATION void get(Object object){
    
  }

  @OPERATION void say(String msg) {
    System.out.println(msg);
  }

  @OPERATION void say(String msg1,String msg2) {
    System.out.println(msg1+" "+msg2);
  }

}
