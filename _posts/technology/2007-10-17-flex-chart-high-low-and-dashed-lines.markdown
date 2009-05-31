--- 
wordpress_id: 563
title: Flex Chart - High-Low and Dashed lines
wordpress_url: http://www.tiagoluchini.eu/2007/10/17/flex-chart-high-low-and-dashed-lines/
layout: post
---
Recently I came across what should be a quite simple scenario but, thanks to Adobe, it provided me with some interesting challenges.

My main target was to port a simplified version of the following MS Excel chart into Adobe Flex:

![Chart Excel](/wp-content/uploads/2007/10/chartexcel.png)

Nothing very complex here: two axis, a couple of series, different rendering styles, choose some nice colours and _voi la_! It should be simple enough.

But although quite powerful, [Adobe Flex](http://www.adobe.com/products/flex) sometimes lacks a direct way of doing very basic things. Two major show-stoppers were on my hands: Flex does not render high-low connecting lines and, amazingly enough, Flex does not natively implement dashed lines on charts. A source-code download and live demo are available at end of the article.

**First Challenge: high-low line or up/down bars**

I am not a huge fan of Excel but I must confess its charting capabilities are most of the times very well designed. To produce those vertical lines connecting the "diamond-shaped" series to the main trend lines there is a simple and direct check on Excel's series' option tab called "high-low line". Impressively enough, another option called "up/down bars" have a very similar effect (I just don't appreciate its bulky default style):

![High-low lines](/wp-content/uploads/2007/10/highlowlines.png)

Adobe Flex charting does not have anything of the kind. A workaround was to use an `HLOCSeries` setting properties `openField` and `lowField` to the Trend value and setting `closeField` and `highField` to the "diamond-shaped" value. It is not a perfect scenario but the source code for that series looks clean:

    <mx:HLOCSeries openField="Trend" closeField="Real" lowField="Trend" highField="Real" displayName="Actuators">

**Second Challenge: dashed lines**

You probably noticed my source chart from MS Excel had two series rendered with dashed lines. This was mandatory for the the Flex port at stake. Altough it should be as simple as setting an style (`setStyle("dashed")=true` for example) it seems that people at Adobe are not very keen on dashed lines: they simply did not implement this "optional" feature.

The solution was to implement my own dashed line series. I started by extending class `LineRenderer` into my very own `DashedLineRenderer`. `LineRenderer` happens to the default renderer when using a `LineSeries`.

This subclass has a property called `pattern` that will be used later for creating different dashing styles. I also overrode method `updateDisplayList` and, instead of calling the superclass implementation I decided to re-implement the line drawing process of the basic `LineRenderer`.

The default `LineRenderer` implementation delegates its drawing intelligence to an utilities class called `mx.charts.chartClasses.GraphicUtilities`. Before trying to decode its internal mathematics, I googled a little and found [Ely Greenfield's implementation](http://www.quietlyscheming.com/blog/charts/dashed-lines/) of a very similar GraphicUtilities with dashing lines support which I adapted into class `DashedGraphicUtilities`.

With that in the bag, my implementation of updateDisplayList became very simple:

    var stroke:IStroke = getStyle("lineStroke");
    var form:String = getStyle("form");
    var pattern:Array = getStyle("dashingPattern");
    pattern = (pattern == null) ? _pattern : pattern;
    
    graphics.clear();
    
    DashedGraphicUtilities.drawDashedPolyLine(graphics, stroke, pattern, _lineSegment.items);

The `dashingPattern` style was implemented on an auxiliary extension of the `LineSeries` class which I dubbed `DashedLineSeries` and is supposed to contain an `Array` specifying the dashing "rythym". The idea here is to make everyday usage as simple as possible and, instead of having to instantiate the specialized dashing renderer for every series to be dashed, you simply use an instance of `DashedLineSeries` like this:

    <local:DashedLineSeries yField="Target" displayName="Target">

**Finally**

After all these challenges my chart finally ressembled what was initally required:

![Flash Chart](/wp-content/uploads/2007/10/flashchart.png)

- [Download the source code here](/downloads/flexchart/DashedHighLowSource.zip) or
- Check an [on-line demo](/downloads/flexchart/)

