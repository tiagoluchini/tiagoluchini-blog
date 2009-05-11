--- 
wordpress_id: 563
title: Flex Chart - High-Low and Dashed lines
wordpress_url: http://www.tiagoluchini.eu/2007/10/17/flex-chart-high-low-and-dashed-lines/
layout: post
---
Recently I came across what should be a quite simple scenario but, thanks to Adobe, it provided me with some interesting challenges.

My main target was to port a simplified version of the following MS Excel chart into Adobe Flex:

<img src="http://www.tiagoluchini.eu/wp-content/uploads/2007/10/chartexcel.png" alt="chartexcel.png" />

Nothing very complex here: two axis, a couple of series, different rendering styles, choose some nice colours and <em>voi la</em>! It should be simple enough.

But although quite powerful, <a href="http://www.adobe.com/products/flex" target="_new">Adobe Flex</a> sometimes lacks a direct way of doing very basic things. Two major show-stoppers were on my hands: <a href="#flexchart1st">Flex does not render high-low connecting lines</a> and, amazingly enough, <a href="#flexchart2nd">Flex does not natively implement dashed lines on charts</a>. A source-code download and live demo are available at <a href="#flexchartend">end of the article</a>.

<a title="flexchart1st" id="flexchart1st" name="flexchart1st"></a><strong>First Challenge: high-low line or up/down bars</strong>

I am not a huge fan of Excel but I must confess its charting capabilities are most of the times very well designed. To produce those vertical lines connecting the "diamond-shaped" series to the main trend lines there is a simple and direct check on Excel's series' option tab called "high-low line". Impressively enough, another option called "up/down bars" have a very similar effect (I just don't appreciate its bulky default style):

<img src="http://www.tiagoluchini.eu/wp-content/uploads/2007/10/highlowlines.png" alt="highlowlines.png" />

Adobe Flex charting does not have anything of the kind. A workaround was to use an <code>HLOCSeries</code> setting properties <code>openField</code> and <code>lowField</code> to the Trend value and setting <code>closeField</code> and <code>highField</code> to the "diamond-shaped" value. It is not a perfect scenario but the source code for that series looks clean:
<pre>
&lt;mx:HLOCSeries openField="Trend" closeField="Real" lowField="Trend" highField="Real" displayName="Actuators"/&gt;</pre>
<a title="flexchart2nd" id="flexchart2nd" name="flexchart2nd"></a><strong>Second Challenge: dashed lines</strong>

You probably noticed my source chart from MS Excel had two series rendered with dashed lines. This was mandatory for the the Flex port at stake. Altough it should be as simple as setting an style (<code>setStyle("dashed")=true</code> for example) it seems that people at Adobe are not very keen on dashed lines: they simply did not implement this "optional" feature.

The solution was to implement my own dashed line series. I started by extending class <code>LineRenderer</code> into my very own <code>DashedLineRenderer</code>. <code>LineRenderer</code> happens to the default renderer when using a <code>LineSeries</code>.

This subclass has a property called <code>pattern</code> that will be used later for creating different dashing styles. I also overrode method <code>updateDisplayList</code> and, instead of calling the superclass implementation I decided to re-implement the line drawing process of the basic <code>LineRenderer</code>.

The default <code>LineRenderer</code> implementation delegates its drawing intelligence to an utilities class called <code>mx.charts.chartClasses.GraphicUtilities</code>. Before trying to decode its internal mathematics, I googled a little and found <a href="http://www.quietlyscheming.com/blog/charts/dashed-lines/" target="_blank">Ely Greenfield's implementation</a> of a very similar GraphicUtilities with dashing lines support which I adapted into class <code>DashedGraphicUtilities</code>.

With that in the bag, my implementation of updateDisplayList became very simple:
<pre>
var stroke:IStroke = getStyle("lineStroke");
var form:String = getStyle("form");
var pattern:Array = getStyle("dashingPattern");
pattern = (pattern == null) ? _pattern : pattern;

graphics.clear();

DashedGraphicUtilities.drawDashedPolyLine(graphics, stroke, pattern, _lineSegment.items);</pre>
The <code>dashingPattern</code> style was implemented on an auxiliary extension of the <code>LineSeries</code> class which I dubbed <code>DashedLineSeries</code> and is supposed to contain an <code>Array</code> specifying the dashing "rythym". The idea here is to make everyday usage as simple as possible and, instead of having to instantiate the specialized dashing renderer for every series to be dashed, you simply use an instance of <code>DashedLineSeries</code> like this:
<pre>
&lt;local:DashedLineSeries yField="Target" displayName="Target"/&gt;</pre>
<a title="flexchartend" id="flexchartend" name="flexchartend"></a><strong>Finally</strong>

After all these challenges my chart finally ressembled what was initally required:

<img src="http://www.tiagoluchini.eu/wp-content/uploads/2007/10/flashchart.png" alt="flashchart.png" />
<ul>
	<li><a href="http://www.tiagoluchini.eu/downloads/flexchart/DashedHighLowSource.zip">Download the source code here</a> or</li>
	<li>Check an <a href="http://www.tiagoluchini.eu/downloads/flexchart/" target="_blank">on-line demo</a></li>
</ul>
