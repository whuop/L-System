
import luxe.Input;
import luxe.Vector;
import lsystem.LSystem;
import renderers.TurtleGraphicsRenderer;

//
//  All axioms and rules used as examples below come from the wikipedia page for L-Systems 
//  ( http://en.wikipedia.org/wiki/L-system ).
//


class Main extends luxe.Game 
{
    override function ready() 
    {
        //fractalPlant();
        //dragonCurve();
        sierpinskiTriangle();
    } //ready

    function fractalPlant() : Void
    {
        var options = {
            axiom : "A"
        };
        var lsystem = new LSystem(options);

        lsystem.setRule("A", "B-[[A]+A]+B[+BA]-A");
        lsystem.setRule("B", "BB");

        lsystem.iterate(4);

        var renderer = new TurtleGraphicsRenderer(new Vector(Luxe.screen.w / 2, Luxe.screen.h / 2), 270.0);

        for( i in 0...lsystem.options.axiom.length)
        {
            var char = lsystem.options.axiom.charAt(i);

            switch(char)
            {
                case "[":
                    renderer.push();
                case "]":
                    renderer.pop();
                case "+":
                    renderer.rotate(25.0);
                case "-":
                    renderer.rotate(-25.0);
                case "A":
                    renderer.moveForwardAndDraw(4);
                case "B":
                    renderer.moveForwardAndDraw(4);
            }
        }
    }

    function dragonCurve() : Void
    {
        var options = {
            axiom : "FX"
        };
        var lsystem = new LSystem(options);

        lsystem.setRule("X", "X+YF");
        lsystem.setRule("Y", "FX-Y");

        lsystem.iterate(10);

        var renderer = new TurtleGraphicsRenderer(new Vector(Luxe.screen.w / 2, Luxe.screen.h / 2), 270.0);

        for( i in 0...lsystem.options.axiom.length)
        {
            var char = lsystem.options.axiom.charAt(i);

            switch(char)
            {
                case "[":
                    renderer.push();
                case "]":
                    renderer.pop();
                case "+":
                    renderer.rotate(90.0);
                case "-":
                    renderer.rotate(-90.0);
                case "F":
                    renderer.moveForwardAndDraw(12);
            }
        }
    }

    function sierpinskiTriangle() : Void
    {
        var options = {
            axiom : "A"
        };
        var lsystem = new LSystem(options);

        lsystem.setRule("A", "B-A-B");
        lsystem.setRule("B", "A+B+A");

        lsystem.iterate(8);

        var renderer = new TurtleGraphicsRenderer(new Vector(Luxe.screen.w - 50, Luxe.screen.h - 50), 180.0);

        for( i in 0...lsystem.options.axiom.length)
        {
            var char = lsystem.options.axiom.charAt(i);

            switch(char)
            {
                case "[":
                    renderer.push();
                case "]":
                    renderer.pop();
                case "+":
                    renderer.rotate(60.0);
                case "-":
                    renderer.rotate(-60.0);
                case "A":
                    renderer.moveForwardAndDraw(2);
                case "B":
                    renderer.moveForwardAndDraw(2);
            }
        }
    }

    override function onkeyup( e:KeyEvent ) 
    {

        if(e.keycode == Key.escape) 
        {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) 
    {	

    } //update


} //Main
