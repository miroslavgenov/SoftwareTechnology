package mylib;

import jason.asSyntax.*;
import jason.asSemantics.*;
import java.util.*;

public class check extends DefaultInternalAction{
    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        // String st = new String("hello world");
        // ts.getLogger().info("Hello what is this");
        // return un.unifies(args[0], new StringTermImpl(st));


        // List<> itemNames = Arrays.asList("","Cake");
        

        return un.unifies(args[0], new ObjectTermImpl(Arrays.asList("a","b")));
        

    }}
