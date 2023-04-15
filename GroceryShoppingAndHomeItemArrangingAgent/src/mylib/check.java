package mylib;

import jason.asSyntax.*;
import jason.asSemantics.*;


public class check extends DefaultInternalAction{
    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        // System.out.println("The argument is: ",args[0]);
        String st = new String("hello world");
        ts.getLogger().info("Hello what is this");
        // return un.unifies(args[0], new)
        return un.unifies(args[0], new StringTermImpl(st));

        // return true;
    }}
