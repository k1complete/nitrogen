-module (web_samples_jquerypaths).
-include_lib ("nitrogen/include/wf.hrl").
-compile(export_all).
-define (STYLE, "border: solid 1px #cde; margin: 7px; float: left; width: 100px; line-height: 40px; text-align: center; height: 40px;").

main() -> #template { file="./templates/onecolumn.html", bindings=[
	{'Group', learn},
	{'Item', samples}
]}.

title() -> "JQuery Paths".
headline() -> "JQuery Paths".
right() -> linecount:render().

body() -> [
	"In addition to referencing elements based on the element name, Nitrogen now allows 
	you to use jQuery style paths to reference your elements.
	<p>
	For example:
	",
	#p{},
	#link { text="Click to highlight all boxes with TargetPath== \".box\"", actions=[
		#event { target=".box", type=click, actions=#effect { effect=highlight, speed=1000, options=[{color, "#ffff00"}] } }
	]}, 
	#br{},
	#link { text="Click to highlight all boxes with TargetPath == \".box:even\"", actions=[
			#event { target=".box:even", type=click, actions=#effect { effect=highlight, speed=1000, options=[{color, "#ffff00"}] } }
	]},
	#br{},
	#link { text="Click to highlight all boxes with TargetPath == \".box:odd\"", actions=[
			#event { target=".box:odd", type=click, actions=#effect { effect=highlight, speed=1000, options=[{color, "#ffff00"}] } }
	]},
	#p{},	
	#panel { class=box, style=?STYLE, body="Box 0" },
	#panel { class=box, style=?STYLE, body="Box 1" },
	#panel { class=box, style=?STYLE, body="Box 2" },
	#panel { class=box, style=?STYLE, body="Box 3" },
	#panel { class=box, style=?STYLE, body="Box 4" },
	#p{ style="clear:both;" },	
	#hr {},
	"
	jQuery selectors can be used in all places where a trigger or target are specified, ie:
	<p>
	<pre>wf:wire(TargetPath, ...actions...)</pre>
	<pre>wf:wire(TriggerPath, TargetPath, ...actions...)</pre>
	<pre>#event { target=TargetPath }</pre>	
	<pre>#event { trigger=TriggerPath, target=TargetPath }</pre>
	<p>
	<b>TriggerPath</b> and <b>TargetPath</b> can be in the following forms:
	<p>
	<ul>
	<li><b>element3</b> - Targets 'element3'.
	<li><b>element1.element2.element3</b> - Nested elements. This also targets 'element3', but only when
	it's nested inside element2, which in turn must be nested under element1.
	<li><b>element1.element3</b> - Similar to above. You can skip the middle elements.
	<li><b>me</b> - In an action, you can refer to the target of the action by specifying the atom 'me'.
	<li><b>\".class1\"</b> - By specifying a string, you can switch to JQuery style selectors.
	<li><b>\".class1 .class2\"</b> - Selects all elements with .class2 that are inside of elements with .class1.
	<li><b>\".class1 > .class2\"</b> - Selects all elements with .class2 that are direct children of elements with .class1.
	<li><b>\".class1:odd\"</b> - Selects all elements with .class2, then keeps only the odd ones.
	</ul>
	<p>
	See <a href='http://docs.jquery.com/Selectors'>jQuery selector documentation</a> for more information
	on jQuery selectors.
	"
].