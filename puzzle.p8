pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--levels

lvls={
{-- level pack 1 "tutorial"
 {"tutorial",{5,3,-1},{1,1,1},{2,2,1},{4,3,1}},
},

{ -- level pack 2 "base levels"
	{"intro",{4,4,-1},{2,2,1},{3,3,1}},
	{"two-step",{4,5,-1},{4,3,1},{3,4,1},{3,5,1}},
	{"factory",{4,3,-1},{3,2,1},{4,2,1},{5,1,1},{6,3,1}},
	{"corner boost",{5,5,-1},{2,2,1},{1,2,1},{2,1,1},{4,4,1}},
	{"escape pod",{1,5,-1},{3,3,1},{3,4,1},{4,4,1}},
	{"corner boost 2",{4,6,-1},{6,4,1},{3,4,1},{4,3,1},{4,4,1}},
	{"escape pod 2",{6,5,-1},{3,3,1},{3,4,1},{4,3,1},{4,4,1}},
	{"inchworm",{5,6,-1},{2,4,1},{2,5,1},{2,6,1},{3,6,1}},
	{"goals",{3,6,-1},{4,6,-1},{3,3,1},{4,4,1},{6,4,1},{4,5,1},{5,6,1}},
	{"expand",{2,3,-1},{2,5,-1},{4,5,-1},{3,3,1},{3,4,1},{3,5,1},{4,3,1}},
	{"criss-cross",{2,6,-1},{4,1,-1},{4,2,1},{3,3,1},{3,4,1},{2,5,1}},
	{"factory 2",{1,3,-1},{1,1,1},{2,1,1},{4,2,1},{5,4,1},{4,5,1},{2,4,1}},
	{"elephant",{1,4,-1},{1,1,1},{3,1,1},{2,2,1},{4,3,1},{5,4,1},{2,4,1}},
	{"cage",{5,6,-1},{2,1,0},{3,1,0},{4,1,0},{5,1,0},{2,2,0},{5,2,0},{2,3,0},{3,2,1},{4,3,1},{5,3,0},{2,4,0},{3,4,0},{5,4,0}},
	{"extender",{6,4,-1},{1,5,1},{2,5,1},{3,5,1},{2,6,1},{3,6,1}},
},

--level pack 3 "rocket levels"
{
 {"refuel",{6,6,-1},{1,2,1},{6,1,0},{2,2,2}},	
 {"overshot",{5,5,-1},{1,1,1},{2,2,2},{3,3,2}},
 {"overshot 2",{5,5,-1},{1,1,1},{2,2,2},{6,4,1},{6,5,1}},
 {"round trip",{1,4,-1},{2,4,2},{1,3,0},{1,5,0},{6,4,1},},
 {"smile",{1,1,-1},{6,1,-1},{1,2,0},{2,1,0},{2,2,2},{6,2,0},{5,1,0},{5,6,0},{6,5,0},{1,5,0},{2,6,0},{5,2,2}},
 {"asteroid",{1,1,-1},{6,1,0},{5,2,2},{3,3,1},{2,5,0},{5,5,2},{6,6,0}},
 {"asteroid 2",{1,1,-1},{6,2,0},{6,1,0},{5,3,2},{3,3,1},{1,6,0},{5,5,2},{6,6,0}},
 {"rocket boost",{6,5,-1},{1,4,1},{4,2,1},{2,4,2},{2,5,2}},
 {"landlocked",{1,6,-1},{2,2,0},{3,2,1},{3,4,1},{3,5,1},{3,6,2}},
 {"out of bounds",{5,3,-1},{4,2,2},{4,1,1},{5,7,0},{1,3,1},{2,2,0},{5,2,1},{2,5,1}},
 {"lateral liftoff",{2,1,-1},{6,3,1},{5,4,2},{5,5,1},{3,6,1}},
 {"round trip 2",{4,4,-1},{5,4,1},{4,5,1},{5,5,2},{1,6,1},{6,6,0}},
 {"crevasse",{6,1,-1},{3,6,0},{2,5,2},{4,4,1},{4,5,1},{5,5,1}},
 {"rocket boost 2",{6,1,-1},{2,5,2},{4,4,2},{4,5,1},{5,5,1}},
 {"slingshot",{6,6,-1},{2,2,0},{2,3,1},{3,3,1},{2,4,2},{2,5,1}},
},

--level pack 4 "more levels"
{
	{"ogre",{5,1,-1},{2,5,1},{3,4,1},{4,4,1},{5,5,1}},
	{"the dance",{6,3,-1},{2,2,1},{2,3,1},{2,4,1},{3,3,1},{4,3,0}},
	{"push",{1,1,-1},{6,4,1},{7,4,0},{6,3,1},{4,3,1},{2,2,1}},
	{"behind the back",{2,2,-1},{2,4,1},{3,3,1},{5,3,1},{5,1,1},{5,4,1}},
	{"zig zag",{2,6,-1},{3,3,1},{3,4,1},{3,5,1},{4,3,1}},
	{"first impressions",{5,1,-1},{3,3,1},{4,3,1},{3,4,1},{3,5,1}},
	{"get and go",{1,2,-1},{5,1,-1},{4,3,-1},{4,1,1},{3,2,1},{4,2,1},{3,3,1},{5,3,1},{6,4,1}},
	{"get and go 2",{1,2,-1},{5,1,-1},{4,3,-1},{4,1,1},{3,2,1},{4,2,1},{1,3,1},{3,3,1},{2,5,1},{4,5,1},{6,5,1}},
	{"open arms",{6,1,-1},{3,3,1},{3,4,1},{4,4,1},{4,5,1}},
	{"ogre 2",{5,1,-1},{5,2,0},{3,3,1},{4,3,1},{3,4,1},{2,5,1},{5,5,1}},
	{"backscratch",{6,1,-1},{1,1,1},{1,2,1},{2,2,1},{5,1,1},{5,2,1},{4,2,1}},
	{"smush",{3,6,-1},{1,1,1},{4,1,1},{1,2,1},{2,2,1},{4,2,1},{5,2,1}},
	{"extender 2",{5,1,-1},{1,5,1},{2,5,1},{3,5,1},{2,6,1},{3,6,1}},
	{"sidelined",{4,6,-1},{1,1,1},{5,1,1},{1,2,1},{2,2,1},{4,2,1},{5,2,1}},
	{"the wall",{6,6,-1},{1,2,1},{2,2,1},{1,3,1},{2,3,1},{3,3,1},{5,3,1},{4,4,1},{5,4,0},{5,5,0}},
},

--level pack 5 "no."
{
	{"the wall 2",{6,6,-1},{1,2,1},{2,2,1},{1,3,1},{2,3,1},{3,3,1},{5,3,1},{4,4,1},{5,4,0},{5,5,0},{5,6,0},},
},

--level pack 6 "experimental"
{
	{"key",{5,3,-1},{4,3,1},{5,1,1},{5,2,1},{4,4,1},{2,5,1},{1,4,1},{2,3,1},},
	{"least is most",{3,2,-1},{4,4,1},{3,6,1},{3,5,1},{4,5,1},{2,5,1},{5,4,1},},
	{"lose",{4,3,-1},{1,1,1},{2,2,1},{3,4,1},{5,5,1},{6,5,1},{4,2,2},{4,1,1},},
	{"toggle",{5,5,-1},{1,3,1},{1,2,1},{2,2,1},{3,2,2},{3,3,1},{4,3,1},{1,1,1},{2,1,1},{3,1,1}},

},
--level pack 7 "storage"
{
	{"orwell",{1,1,-1},{6,6,1},{4,4,4},},
	{"bonk",{5,3,-1},{4,3,1},{5,5,0},{5,1,3},{6,1,0},},
	{"climb",{2,1,-1},{2,6,0},{2,5,3},{4,4,0},},
	{"side by side",{1,6,-1},{4,5,0},{5,4,0},{4,4,3},{4,3,3},},
	{"side by side 2",{2,3,-1},{2,6,0},{3,1,0},{3,2,3},{3,5,3},},
	{"statue",{1,3,-1},{3,5,2},{2,3,3},{1,4,0},{4,1,0},{3,3,0},},
	{"focus",{4,4,-1},{3,4,0},{3,2,3},{4,3,3},{4,1,1}},
}}

aa=""
for i=1,4096 do
	aa=aa.."6"
end

lplogos = {
 "666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666644444444444444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444444444444444444444446666444444444444444444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444e44444444444444444446666444444444444444444e444444444444444444444444444444444444444446666444444e444444444444444444444e4444444444444444444444444444444666644444eee4444444444444444444eee44444444444444444444444e4444446666444444e444444444444444444444e44444444444444444444444444444446666444444444444444444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444e44444444444444466664444444444444444444444444444444444444444444eee44444444444444666644444444444444444444444444444444444444444444e44444444444444466664444444444444444444444444444444444444444444444444444444444446666444444e444444e444444444444444444444e4444444444444444e44444446666444444444444eee4444444444e444444444444444444444444444444444466664444444444444e4444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444444444444444444444446666444444444444444444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444e444444444e44444666644eeeeeeeeeeeeeeee44444444444444444444444444444444444eee4444666644eeeeeeeeeeeeeeee4444e4444444444e44444444444444444444e44444666644eeeeeeeeeeeeeeee44444444444444eee4444444444444444444444444666644444444eee4444444444444444444444e44444444444444444444444444666644444444eee4444444444444444444444444444444444444444444444444666644444444eee4444444444444444444444444444444444444444444444444666644444444eee444444444444ee4444444444ee44444444444444444ee4444666644444444eee444444444444ee4444444444ee4ee44ee44eeee4444ee4444666644444444eee44ee44444444ee4444444444eeeeee4ee4eeeeee444ee4444666644444444eee44ee444ee44eeee444444444eee4ee4444eeeeee444ee4444666644444444eee44ee444ee44eeee44eeeee44ee44444ee4ee44ee444ee4444666644444444eee44ee44eee444ee44eeeeee44ee44444ee4ee44ee444ee4444666644444444eee44ee44eee444ee44eee4ee44ee44444ee4ee44eee44ee4444666644444444eee44eeeeee4444ee44eee4ee44ee44444ee4eeeeeeee4ee4444666644444444eee444eeeee4444ee44eeeeee44ee44444ee44eeeeeee4eee444666644444444eee4444eee44444ee444eeee444ee44444ee4444444ee4eee444666644444444eee444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444444444444444444444446666444444444444444444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444444444444444444444446666444444444444444444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444444444444444444444446666444444444444444444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444444444444444444444446666444444444444444444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444444444444444444444446666444444444444444444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444444444444444444444446666444444444444444444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444444444444444444444446666444444444444444444444444444444444444444444444444444444444444666644444444444444444444444444444444444444444444444444444444444466664444444444444444444444444444444444444444444444444444444444446666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666",
 "6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaaaaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaaaaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaeeeaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaeeeaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaeaaaeeeeeeeeeeeeeeeeeeeeeeaaaaeeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaaaaaeeeeeeeeeeeeeeeeeeeeeaaaaaaeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaaaaaaaeeeeeeeeeeeeeeeeeeeaaeeaaeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaaaaaaaaaeeeeeaaaaeeeeeeeeaaeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeaaeeeeaaaaaeeeaaaaaeeeeeeeeaaaeeeeeeeaaaaaaaeeeeeeeeeee6666eeeeeaaeeeeeeaaaeeaaaaeaaaeeeeeeeaaaeeeeeaaaaaaaaaeeeeeeeeee6666eeeeeaaeeeeeeeaaeeaaaeeaaaeeeeeeeeaaaaeeeaaaeeeaaaeeeeeeeeee6666eeeeeaaeeeeeeeaaeeaaeeeaaaeeeeeeeeeeaaaeeaaaaaaaaaeeeeeeeeee6666eeeeeaaeeeeeeaaaeeaaeeeaaaeeeeeeeeeeeaaeeaaaaaaaaaeeeeeeeeee6666eeeeeaaeeeeaaaaaeeaaeeeaaaeeeeeeaaeeaaaeeaaeeeeeeeeeeeeeeeee6666eeeeeaaeaaaaaaaeeeaaaeeeaaaaeeeeaaaaaaeeeaaaaeeeeeeeeeeeeeee6666eeeeeaaaaaaaaeeeeeaaaaaaaaaaaeeeeaaaaeeeeeaaaaaaaaeeeeeeeeee6666eeeeeeaaaaeeeeeeeeeaaaaaaeaaaeeeeeeeeeeeeeeaaaaaaaeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeaeeeeeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeaeeeeeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeaaaaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaaeeeeeeeeeeeeeeeeeeee6666eeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaaeeeeeeeeeeeeeeeeeeee6666eeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaaeeeeeeeeeeeeeeeeeeee6666eeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaaeeeaaaaeeeeeeeeeeeee6666eeeaaaeeeeeeeeeeeeeaaeeeeeaaeeeeeeeeeeaaeeaaaaaaeeeeeeeeeeee6666eeeaaaeeeeeaaaaaaeeaaeeeeeaaeeeaaaeeeeaaeeaaeeaaeeeeeeeeeeee6666eeeaaaeeeeeaaaaaaaeaaeeeeeaaeeaaaaaaeeaaeeaaeeeeeeeeeeeeeeee6666eeeaaaeeeeaaaeeaaaeaaaeeeaaaeaaaaaaaeeaaeeaaaeeeeeeeeeeeeeee6666eeeaaaeeeeaaaaaaaaeeaaeeeaaeeaaaeeaaaeaaaeeaaaeeeeeeeeeeeeee6666eeeaaaeeeeaaaaaaaaeeeaaeaaeeeaaaaaaaaeaaaeeeaaaaeeeeeeeeeeee6666eeeaaaeeeeaaaeeeeeeeeaaaaaeeeaaaaaaaaeeaaeeeeeaaaeeeeeeeeeee6666eeeaaaaeeeeaaaaaaeeeeeaaaeeeeaaaeeeeeeeaaeeeeeeaaeeeeeeeeeee6666eeeaaaaaaeeaaaaaaeeeeeeaeeeeeaaaaaaaeeeeeeaaeeaaaeeeeeeeeeee6666eeeaaaaaaeeeeeeeeeeeeeeeeeeeeeaaaaaaeeeeeeaaaaaaeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaaaaeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666",
 "6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666ccc7ccccccccccccccccccc7cccccccccccccccccccccccc7cccccccc7cc6666cc7c7ccccccccccccccccc7c7cccccccccccccccc7cccccccccccccccccc6666ccc7ccccccccccccccccccc7cccccccccccccccc7c7ccccccccccccccccc6666ccccccccccccccccccccccccccccccccccccccccc7cccccccccccccccccc6666cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666cccccccccccc7ccccccccccccccccc7ccccccccccccccccccc0ccccccccc6666ccccccccccccccccccccccccccccccccccccccccccccccccc060cccccccc6666cccccccccccccccccccccccccccccccccccccccccccccccc06660cccc7cc6666cccccccccccccccccccccccccccccccccccccccccccccccc06060ccccccc6666ccc7ccccccccccccccccccccccccccc7ccccccccccccccc060c060cccccc6666cccccccccccccccccccccccccccccc7c7cccccccccccccc060c060cccccc6666ccccccccccccccccccccccccccccccc7cccccccccccccc066606660ccccc6666ccccccccccccc7cccccccccccccccccccccccccccccccc0660c0660ccccc6666ccc666666ccc7c7ccccccccccccccccccccccccccccccc0660c0660ccccc6666ccc6666666ccc7ccccccccccc7ccccccccccccc7cccccc066606660ccccc6666ccc66cc666cccccccccccccccccccccccccccccccccccc0660c0660ccccc6666cc666ccc666ccccccccccccccccccccccccccccccccccc0660c0660ccccc6666cc66ccccc66ccccccccccccccccccccccccccccccccccc066606660ccccc6666cc66ccccc66cccccccccccccccccccccccccccccccccccc0666660cccccc6666cc66cccc666ccccccccccccccccccccccccccccccccccc006666600ccccc6666cc66c666666cccccccccccccccc66cc66cccccccccccc0e0666660e0cccc6666cc66666666ccccc6666cccccccc66cc66cc66666cccc0ee0666660ee0ccc6666cc66666ccccccc666666ccc666c66c66cc6666666ccc0ee0666660ee0ccc6666cc666666ccccc666cc666c6666c66c66cc66ccc66ccc0ee0666660ee0ccc6666cc66c6666cccc66cccc66c66ccc6666ccc6666666cccc0ee00000ee0cccc6666cc66cc6666ccc66cccc66c66ccc6666ccc6666666cccc0e0ca7ac0e0cccc6666cc66ccc6666cc666cc666c66ccc66666cc66ccccccccc0e0ca7ac0e0cccc6666cc66cccc6666cc666666cc6666c66c666c666666cccccc0cc9a9cc0ccccc6666cc66ccccc666ccc6666cccc666c66cc66cc6666cccccccccc494cccccccc6666cc66ccccccccccccccccccccccccccccccccccccccc7cccccc4ccccccccc6666cccccccccccccccccccccccccccccccccccccccccc7c7ccccccccccccccc6666ccccccccccccccccccccccccccccccccccccccccccc7cccccccccccccccc6666c7cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666ccc66ccccccccccccccccccccccccc7ccccccccccccccccccccccccccccc6666ccc666cccccccc7ccccccccccccccccccccccccccccccccccccccccccccc6666ccc666ccccccc7c7cccccccccccccccccccccccccccccccccccccccccccc6666ccc666cccccccc7ccccccccccccccccccccccccccccccccccccccccccccc6666ccc666ccccccccccccccccccccccccccccccccc66ccc6666cccccccccccc6666ccc666ccccccccccccccccccccccccccccccccc66cc666666ccccc7ccccc6666ccc666ccccccccccccccccccccccccccccccccc66cc66cc66ccccccccccc6666ccc666ccccccccccccc66ccccc66ccccccccccc66cc66ccccccccccccccc6666ccc666ccccc666666cc66ccccc66ccc666ccccc66cc666cccccccccccccc6666ccc666ccccc6666666c66ccccc66cc666666ccc66ccc666ccccccccccccc6666ccc666cccc666cc666c666ccc666c6666666ccc66cccc6666ccccccccccc6666ccc666cccc66666666cc66ccc66cc666cc666cc66cccccc666cccccccccc6666ccc666cccc66666666ccc66c66ccc66666666cc666cccccc66cccccccccc6666ccc666cccc666cccccccc66666ccc66666666cc666c66cc666cccccccccc6666ccc6666cccc666666ccccc666cccc666cccccccc66c666666ccccccccccc6666ccc666666cc666666cccccc6ccccc6666666cccc66cc6666cccc7ccccccc6666ccc666666ccccccccccccccccccccc666666ccccccccccccccc7c7cccccc6666cccccccccccccccccccccccccccccccccccccccccccccccccccc7ccccccc6666cccccccccccccccccccccc7ccccccccccccccccccccccccccccccccccccc6666cccc7cccccccccccccccc7c7cccccccccccccccccccccccccccccccccccc6666cccccccccccccccccccccc7ccccccccccccccccccccccccccccccccccccc6666cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666",
 "6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666fffff444fffffff444ffffffffffffffffffffffffffffffffffffffffff6666fffff4444ffffff4444fffffffffffffffffffffffffffffffffffffffff6666fffff44444fffff4444ffffffffffffffff44fffffffffffffffffffffff6666fffff444444fff44444ffffffffffffffff44f4444ffffffffffffffffff6666fffff44f444ff444f44ffffffffffffffff44444444fffffffffffffffff6666fffff44ff444f444f44ffffffffffffffff44444444fffffffffffffffff6666fffff44ff444f44ff44fffffffffffffffff444fffffffffffffffffffff6666fffff44fff44444ff44ffffffff444ffffff444fffffff4444ffffffffff6666fffff44fff44444ff44fffffff444444fff444fffffff44444444fffffff6666fffff44ffff444fff44ffffff4444444fff444fffffff444f44444ffffff6666fffff44fffff44fff44fffff444fff44fff44fffffff444ffff4444fffff6666fffff44ffffffffff44ffff4444fff44fff44fffffff444ffff4444fffff6666fffff44ffffffffff44ffff444ffff44fff44fffffff44444444444fffff6666fffff44ffffffffff44ffff444ffff44fff44fffffff44444444444fffff6666fffff44ffffffffff44ffff4444ff444fff44fffffff444fffffffffffff6666fffff44ffffffffff44fffff44444444fff44fffffff4444444f44ffffff6666fffff44ffffffffff44ffffff444444ffff44ffffffff444444444ffffff6666ffff444ffffffffff44ffffffffffffffff44ffffffffffff44444ffffff6666ffff444ffffffffff44fffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666fff44fffffffffffffffffffffffffffffffffffffffffffffffffffffff6666fff444ffffffffffffffffffffffffffffffffffffffffffffffffffffff6666fff444ffffffffffffffffffffffffffffffffffffffffffffffffffffff6666fff444ffffffffffffffffffffffffffffffff44ffffffffffffffffffff6666fff444ffffffffffffffffffffffffffffffff44ffffffffffffffffffff6666fff444ffffffffffffffffffffffffffffffff44ffffffffffffffffffff6666fff444ffffffffffffffffffffffffffffffff44fff4444fffffffffffff6666fff444fffffffffffff44fffff44ffffffffff44ff444444ffffffffffff6666fff444fffff444444ff44fffff44fff444ffff44ff44ff44ffffffffffff6666fff444fffff4444444f44fffff44ff444444ff44ff44ffffffffffffffff6666fff444ffff444ff444f444fff444f4444444ff44ff444fffffffffffffff6666fff444ffff44444444ff44fff44ff444ff444f444ff444ffffffffffffff6666fff444ffff44444444fff44f44fff44444444f444fff4444ffffffffffff6666fff444ffff444ffffffff44444fff44444444ff44fffff444fffffffffff6666fff4444ffff444444fffff444ffff444fffffff44ffffff44fffffffffff6666fff444444ff444444ffffff4fffff4444444ffffff44ff444fffffffffff6666fff444444fffffffffffffffffffff444444ffffff444444ffffffffffff6666fffffffffffffffffffffffffffffffffffffffffff4444fffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666",
 "6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666000000000000000000000000000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000066660000000000000000000000000000000000000000000000000000000000006666000000000000000000000000000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000066660000000000000000000000000000000000000000000000000000000000006666000000000000000000000000000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000066660000000000000000000000000000000000000000000000000000000000006666000000000000000000000000000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000066660000000000000000000000000000000000000000000000000000000000006666000000000000000000000000000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000066660000000000000000000000000000000000000000000000000000000000006666000000000000000000000000000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000066660000000000000000000000888000000000000000000000000000000000006666000000000000000000000088800000000000000000000000000000000000666600000000000000000000008880000000000000000000000000000000000066660000000888000000000000888800000000000000000000000000000000006666000000088880000000000088880000000000000000000000000000000000666600000008888000000000000888000000000000000000000000000000000066660000000888880000000000088800000000000000000000000000000000006666000000088888000000000008880000000000000000000000000000000000666600000008888880000000000888800000000000000000000000000000000066660000000888888000000000088880000000000000000000000000000000006666000000088888880000000008888000000000000000000000000000000000666600000008888888800000000088800000000000000000000000000000000066660000000888088880000000008880000000000000000000000000000000006666000000088808888800000000888000000000000888800000000000000000666600000008880088888000000088800000000088888888800000000000000066660000000888000888800000008880000000088888888888000000000000006666000000088800088888000000888000000008888888888880000000000000666600000008880000888880000088800000008888800008888000000000000066660000000888000008888800008880000000888800000888880000000000006666000000088800000088880000888000000088880000008888000000000000666600000008880000008888800088800000008880000000888800000000000066660000000888000000088888008880000000888000000008880000000000006666000000088800000008888800888000000088800000000888000000000000666600000008880000000088888088800000008888008888888800008888000066660000000888000000000888888880000000888888888888880000888800006666000000088800000000008888888000000088888888888888000088880000666600000008880000000000888888800000000888888888880000008888000066660000000888000000000008888880000000000088888000000000000000006666000000088800000000000088888000000000000000000000000000000000666600000008880000000000008888800000000000000000000000000000000066660000000888000000000000088800000000000000000000000000000000006666000000088800000000000000000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000066660000000000000000000000000000000000000000000000000000000000006666000000000000000000000000000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000066660000000000000000000000000000000000000000000000000000000000006666000000000000000000000000000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000066660000000000000000000000000000000000000000000000000000000000006666000000000000000000000000000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000066660000000000000000000000000000000000000000000000000000000000006666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666",
 "6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666707000007070000070700000007070000070700000707000007070000070666670777770707777707077777777707077777070777770707777707077777066667000007070000070700000700000707000007070000070700000707000006666777770707777707077777070777770707777707077777070777770707777666600007070000070700000707070000070700000707000007070000070700066667770707777707077777070707077777070777770707777707077777070776666007070000070700000707000707000007070000070700000707000007070666670707777707077777070777770707777707077777070777770707777707066667075555555700000707000000070700000707000007070000070700000706666705777777757777070777777777070777770707777707077777070777770666675777777777500707000007000007070000070700000707000007555500066667577555555577070777770707777707077777070777770707777757757776666057750700000707000007070700000707005555570000550755005775000666675775077777070777770707070555770705777775077577557757555507766660577500000707000007070007577750075777777757057757775000070706666757755577070775570755577577777575777555777505777775075555070666675777775707005775057775057757750577777777750577775707577507066667577777750777577757777575775775757777777757057755770757757706666757755557000005777775570577777505775555550005775000075775000666675775770777770757775777057777570577775555577577577777577577766660577555555507057777757705775577075777777775057757000057750006666757777777775757775777570577577707055777777575775707775775077666600577777775075775057750057750000707055555570055070700555507066667075555555707755707557777550777770707777707077777070777770706666707000007070000070700000007070000070700000707000007070000070666670777770707777707077777777707077777070777770707777707077777066667000007070000070700000700000707000007070000070700000707000006666777770707777707077777070777770707777707077777070777770707777666600007070000070700000707070000070700000707000007070000070700066667770707777707077777070007077777070777770707777707077777070776666007070000070700000707777707700007070000070700000707000007070666670707777707077777070770000070777707077777070777770707777707066667070000070700000707000077707000070700000707000007070000070706666707777707077777070777707070777707077777070777770707777707077666670000070700000707000070777000070700000707000007070000070700066667777707077777070777707000007707077777070777770707777707077776666700000707000007070000770777770700000707000007070000070700000666670777770707777707077777070007077777070777770707777707077777066667070000070700000707000007070700000707000007070000070700000706666707077777070777770707777707077777070777770707777707077777070666600707000007070000070700000700000707000007070000070700000707066667770707777707077777070777777777070777770707777707077777070776666005570700055707005555570000550707000007055000070700000705500666675775070757750705777775077577570755770757757707055557075775766667577757057775075777777757057775057750055775570757777507577506666757777557777575777555777505777755775757777775057777775757750666675777777777750577777777750577777577505777777505775577575775066667577577775775757777777757057757777757755775577577575775577506666057755775577505775555550005775577775000577500057755777557750666675775055757750577775555577577575777577757757775777777775775766660577507005775075777777775057757057750075775000577777777577506666757750707577507055777777575775705775707577577075777757755577666675775070757750707055555570055070055070705500707055557550000066667055777070557770707777707070707777707077777070777770707777706666707000007070000070700000707070000070700000707000007070000070666670707777707077777070777770707777707077777070777770707777707066660070700000707000007070000070000070700000707000007070000070706666777070777770707777707077777777707077777070777770707777707077666600007070000070700000707000000070700000707000007070000070700066667777707077777070777770707777707077777070777770707777707077776666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666",
 aa,
}
-->8
--main loop/blocks

ver=.8
--availble blocks
a={}
-- blocks for levels

winner=true
mode="title" -- info screen flag
x=1 y=1 -- position (in tiles)
sx=0 sy=0 -- stored x/y for lock
lock=0 -- locked on block flag
w=0 -- wait
btype=""
g=0
cur=1
restart=0
dopamine=0
lpshift=1
lp=1
t_mode=0
ud=22
currwon=false
mselect=1

l={}
for i=1,#lvls do
		l[i]=0
end
b={}
ls_boxselect=1
ls_levelstart=1
ls_shift=-12
cspr=44
code = -1
elvl = {"your level!"}
col=0 --color select
fval=""
etxt="goal"
ttxt=""


function _init()
	cartdata("bens_tactic_toe")
	
	if dget(1)==1 then
		for i=3, #lvls+1 do
			l[i-1]=dget(i)
		end
	else
		dset(2,1)
	end
	lp=dget(2)
	lpshift=-1*(lp-1)*80
	
	--for i=2,#lvls do
	--	l[i]=#lvls[i]
	--end
	palt(0, false)
	palt(13, true)
end

function _draw()
 cls() 
 if mode=="title" then
		draw_title()
 elseif mode=="tutorial" then
 	draw_tutorial()
 elseif mode=="editor" then
 	draw_editor()
	elseif mode=="select" then
  draw_select()
	elseif mode=="lpack" then
		draw_lpack()
	elseif mode=="level" then
		draw_level()
	end
end

function _update()
	if mode=="title" then
		update_title()
	elseif mode=="select" then
		update_select()
 elseif mode=="lpack" then
  update_lpack()
	elseif mode=="tutorial" then
		update_tutorial()
	elseif mode=="editor" then
		update_editor()
	elseif mode=="level" then
		update_level()
	elseif mode=="hint" then
		if(btnp(❎)) mode="level"
	end
end


function blocks(bl)
	if(bl[3]==1) block_reg(bl[1],bl[2])
	if(bl[3]==2) block_rocket(bl[1],bl[2])
	if(bl[3]==3) block_knight(bl[1],bl[2])
	if(bl[3]==4) block_eye(bl[1],bl[2])
end


function dir8(bx,by)
	a={}
	for dx=-1,1 do 
		for dy=-1,1 do
				if inbounds(bx+dx,by+dy) and (dx!=0 or dy!=0)then
					if (contains(bx-dx,by-dy) or 
					((dy == 0) and (contains(bx-dx,by+1) and contains(bx-dx,by-1))) or
	    ((dx == 0) and (contains(bx+1,by-dy) and contains(bx-1,by-dy))) or
	    ((dx != 0 and dy != 0) and (contains(bx,by-dy) and contains(bx-dx,by))) ) then
	     add(a,{bx+dx,by+dy})
	    end
	   end
		end
	end	
end

function contains(px,py)
	for i=g+2,#b do
		if (b[i][1]==px and b[i][2]==py) return true
	end
	return false
end

function inbounds(px,py)
 if px>6 or px<1 or py>6 or py<1 then
 	return false
	end
 return true
end

function block_reg(bx,by)
	btype=""
	dir8(bx,by)
	for i=#a,1,-1 do
		if contains(a[i][1],a[i][2]) then
		 deli(a,i)
		end
	end
end
	

function block_rocket(bx,by)
	dir8(bx,by)
	block_reg(bx,by)
	btype="rocket"
	rb={}
	for i=1,#a do
		rb[i]={}
		rb[i][1]=a[i][1]
		rb[i][2]=a[i][2]
		local qx=a[i][1]-bx
		local qy=a[i][2]-by
		while (true) do
			if inbounds(a[i][1]+qx,a[i][2]+qy) and not contains(a[i][1]+qx,a[i][2]+qy) then
				a[i][1]+=qx
				a[i][2]+=qy
			else
				break				
			end
		end
	end
end

function block_knight(bx,by)
	btype="knight"
	dir8(bx,by)	
	k={} kx=0 ky=0
	for i=1, #a do
		kx=a[i][1]-x
		ky=a[i][2]-y
		if kx!=0 and ky!=0 then
			if(inbounds(x+kx,y+2*ky) and not contains(x+kx,y+2*ky)) add(k,{x+kx,y+2*ky})
			if(inbounds(x+2*kx,y+ky) and not contains(x+2*kx,y+ky)) add(k,{x+2*kx,y+ky})		
		elseif ky!=0 then
			if(inbounds(x+1,y+2*ky) and not contains(x+1,y+2*ky)) add(k,{x+1,y+2*ky})
			if(inbounds(x-1,y+2*ky) and not contains(x-1,y+2*ky)) add(k,{x-1,y+2*ky})		
		elseif kx!=0 then
			if(inbounds(x+2*kx,y+1) and not contains(x+2*kx,y+1)) add(k,{x+2*kx,y+1})
			if(inbounds(x+2*kx,y-1) and not contains(x+2*kx,y-1)) add(k,{x+2*kx,y-1})		
		end
	end
	a=k
end

function block_eye(bx,by)
	a={}
	btype="eye"
	for i=g+2,#b do
		if b[i][1]!=bx or b[i][2]!=by then
			local ex=2*bx-b[i][1]
			local ey=2*by-b[i][2]
			if inbounds(ex,ey) and not contains(ex,ey) then
				add(a,{ex,ey})
			end
			--nested loop for all others
			for j=g+2,i-1 do
				if b[j][1]!=bx or b[j][2]!=by then
					local tex=2*bx-(b[i][1]+b[j][1])/2
					local tey=2*by-(b[i][2]+b[j][2])/2
					if inbounds(tex,tey) and not contains(tex,tey) then
						add(a,{tex,tey})
					end
				end
			end
		end
	end
end

function setup_ls()
	ls_boxselect=min(3,cur)
	if abs(#lvls[lp]-cur) <= 1 then
		ls_boxselect=5-(#lvls[lp]-cur)
	end
 ls_levelstart=max(1,cur-2)
	if #lvls[lp]-cur <= 1 then
		ls_levelstart=#lvls[lp]-4
	end
 ls_shift=-ls_levelstart*12
end

function set_b(lev)
	un={}
	if (lev==nil) lev=lvls[lp][cur]
	b={}
	b[1]=lev[1]
	for i=2, #lev do
		b[i]={}
		b[i][1]=lev[i][1]
		b[i][2]=lev[i][2]
		b[i][3]=lev[i][3]
	end
	
	g=0
	for i=2,#b do
		if(b[i][3]!=-1) break
		g+=1	
	end
end

function won()
	local gnum=0
	
	for i=g+2, #b do
		for j = 2, g+1 do
			if (b[i][1]==b[j][1] and b[i][2]==b[j][2]) then
				gnum+=1
				if (gnum==g) return true
			end
		end
	end
	
	return false
end



-->8
--modes

function draw_title()
	
 cls(1)
 rectfill(0,103,128,128,14)
 print("ver:"..ver,98,3,13) 
 print("\^w\^t actic-toe",28,40,7)
 
 upd=2*(flr(time())%2)
 
 spr(2,17,28) spr(2,25,28)
 spr(2,33,28) spr(2,25,36)
 spr(2,25,44)
 
 spr(3,17-upd,28-upd) spr(3,25-upd,28-upd)
 spr(3,33-upd,28-upd) spr(3,25-upd,36-upd)
 spr(3,25-upd,44-upd) 
 print("by bens",50,55,14)

 if(t_mode==0) then
 	txt="start"
 elseif(t_mode==1) then
 	txt="create"
 end
 
 print("press c to ",42-#txt*2,112,7)
 print(txt,86-#txt*2,112,10)
 spr(ud,110,111)
 
 if restart>5 then
 	cls(1)
 	if restart<20 then
 	 col=10
 	elseif restart>40 then
 		col=8
 	else
 		col=9
 	end
 	print("hold x to delete", 33,70,6)
 	rectfill(34,60,94,65,6)
 	rectfill(34,60,34+restart,65,col)
 elseif restart==-1 then
 	cls(1)
 	print("save file deleted", 30,64,8)
 end
end

function update_title()
	if (restart==-1) then
		lp=1
		lpshift=0
		for i=3, #lvls+1 do
			l[i-1]=0
			dset(i,0)
		end
		if(wait())restart=0
	elseif btn(❎) then
		if (dget(1)==1) restart+=1
		if (restart>=60) dset(1,0) restart=-1
	else
		restart=0
	end
	
	if btnp(🅾️) then
		ud=22
		if t_mode==0 then
			mode="lpack"
		elseif t_mode==1 then
			mode="editor"
		end
	end
	if(btnp(⬆️)) t_mode-=1 ud=23
	if(btnp(⬇️)) t_mode+=1 ud=24
	if(t_mode==-1) t_mode=1
	if(t_mode==2) t_mode=0
end

function draw_tutorial()
	draw_level()
	for i=1,#btut do
		rectfill(btut[i][1],btut[i][2],btut[i][1]+15,btut[i][2]+15,1)
	end
	rectfill(0,16,15,64,0)
	spr(cf,x*16,y*16,2,2)
	print(ttxt,64-#ttxt*2,118,7)
	
	if restart>10 then
		cls()
 	print("hold x to exit", 36,70,7)
 	rectfill(34,60,94,65,6)
 	rectfill(34,60,34+restart,65,7)
 end
end

function update_tutorial()
	if btn(❎) then
		restart+=1
		if (restart>=60) mode="lpack" restart=0 
	else
		restart=0
	end
	local ttx=x
	local tty=y
	update_level()
	if(x==0)x=1
	if(t_step==13 and x!=4) lock=0
	if t_step==0 and not(x==2 and y==4) then
		deli(btut,1)
		ttxt="good! go to that block"
	elseif t_step==1 and x==1 and y==1 then
		ttxt="press c to select it"
	elseif t_step==2 and btnp(🅾️) then
	 t_lock=not t_lock
	 ttxt="uh oh! this block cant move"
	elseif t_step==3 and wait() then
		deli(btut,1)
		ttxt="we need a block on goal to win"
	elseif t_step==4 and wait() then
		deli(btut,1)
		ttxt="new block! press c!"
	elseif t_step==5 and btnp(🅾️) then
		t_lock=not t_lock
		ttxt="move to new block and press c!"
	elseif t_step==6 and btnp(🅾️) and x==2 and y==2 then
		t_lock=not t_lock
		ttxt="awesome! this block can move!"
	elseif t_step==7 and wait() then
		ttxt="wait why can this block move?"
	elseif t_step==8 and wait() then
		ttxt="its boosted by the first block"
	elseif t_step==9 and wait() then
	 t_lock=not t_lock
	 ttxt="neat! move to the dot"
	elseif t_step==10 and x==3 and y==3 then
	 t_lock=not t_lock
		ttxt="now press c!"		
	elseif t_step==11 and btnp(🅾️) then
		t_lock=not t_lock
		ttxt="you did it!!"
	elseif t_step==12 and wait() then
  deli(btut,1)
  ttxt="now press c on block 3"
	elseif t_step==13 and btnp(🅾️) and x==4 and y==3 then
		ttxt="then press c on the dot"		
	elseif t_step==14 and btnp(🅾️) and x==5 and y==3 then
		ttxt="you win!! press c to play!"
	elseif t_step==15 then
	 ttxt="you win!! press c to play!"
		t_step-=1
		if(btnp(🅾️)) mode="lpack" t_step=-1
	else
		t_step-=1
		if(t_lock) x=ttx y=tty
	end
	t_step+=1
end

function draw_editor()
 rectfill(16,16,111,111,1)
 for i=2,#elvl do
 	spr(elvl[i][4],elvl[i][1]*16,elvl[i][2]*16,2,2) 
 end
 

 print(etxt,64-#etxt*2,4,7)

 if cspr==36 then
 	print("del\nete",x*16+3,y*16+3,8)
 elseif (cspr!=64 and inbounds(x,y)) or cspr==64 then
  spr(cspr,x*16,y*16,2,2)
 end
 spr(38,x*16,y*16,2,2)
	
 if x==0 and y>0 and y<5 then
 	txt="press c to "
 	if (y==1) txt=txt.."exit"
 	if (y==2) txt=txt.."run"
 	if (y==3) txt=txt.."copy"
 	if (y==4) txt=txt.."erase"
 else
 	txt="c to change, x to place"
 end
 
 print(txt, 64-#txt*2, 118,6)
 print("bck",2,22,7)
 print("run",2,38,7)
 print("sav",2,54,7)
 print("clr",2,70,7)
end

function update_editor()
	if (btnp(🅾️)) editor_c()
	if (btnp(❎)) editor_x()
	if (btnp(⬅️) and x>0) x-=1
	if (btnp(➡️) and x<7) x+=1
	if (btnp(⬆️) and y>0) y-=1
	if (btnp(⬇️) and y<7) y+=1
end

function editor_c()
 if x==0 then
 	if y==1 then
 		mode="title"
 		lp=1
 		lpshift=0
 		ud=22	 
		elseif y==2 or y==3 then
			for i=1,#elvl do
				if(elvl[i][3]==-1) break
				if(i==#elvl) 	extcmd("needs goal") return
			end
			if(y==2) then
				mode="level"
				set_b(elvl)
			 lp=-1
			elseif(y==3) then
	 		estr="{name here,"
				for i=2,#elvl do
		 		estr=estr .. "{" .. tostr(elvl[i][1]) .. "," .. tostr(elvl[i][2]) .. "," .. tostr(elvl[i][3]) .. "},"
		  end
				estr= estr.."},"
				printh(estr, "@clip")
				extcmd("copied!")
			end
 	elseif(y==4) then
 		elvl={"your level!"}
 	end
 else
 	code+=1
 	if cspr==36 then
			cspr=44
			etxt="goal"
			code=-1
		elseif cspr==44 then
			cspr=64
			etxt="stone"
		elseif cspr==64 then
			cspr=66
			etxt="regular"
		elseif cspr==66 then
			cspr=68
			etxt="rocket"
		elseif cspr==68 then
			cspr=70
			etxt="knight"
		elseif cspr==70 then
			cspr=72
			etxt="eye"
		elseif cspr==72 then
			cspr=36
			etxt="delete"
		end
 end
end

function editor_x()
	for i=1,#elvl do
		if (x==elvl[i][1] and y==elvl[i][2]) then
			del(elvl,elvl[i])
			break
		end
	end
	if(cspr==36) return
	if(code==-1 and inbounds(x,y)) then
		add(elvl,{x,y,code,cspr},2)
	elseif (code!=0 and inbounds(x,y)) then
		add(elvl,{x,y,code,cspr})
	elseif (code==0) then
		add(elvl,{x,y,code,cspr})
	end
end

function draw_select()
	--draw all level tabs
	for i=1,#lvls[lp] do
	 print(i..". "..lvls[lp][i][1],16,69+12*i+ls_shift,6)
	end
	for i=l[lp]+2,#lvls[lp] do
	 spr(16,100,68+12*i+ls_shift)
	end
	--draw selected level tab
 rectfill(12,66+12*ls_boxselect-12,113,66+12*ls_boxselect-2,10)
	circfill(12,71+12*ls_boxselect-12,5,10)
	circfill(116,71+12*ls_boxselect-12,5,10)

	print(cur..". "..lvls[lp][cur][1],16,57+12*ls_boxselect,0)
	for i=1,l[lp] do
	 spr(21,100,67+12*i+ls_shift)
 end
 --draw preview level
 rectfill(0,0,128,64,0)
 rect(37,5,90,58,10)
	rectfill(39,7,88,56,1)
	lv=lvls[lp][cur]
 for i=2,#lv do	 
	 spr(lv[i][3]+2,(lv[i][1]+4)*8,lv[i][2]*8)
	end 
	rectfill(0,2,16,8,6)
	circfill(18,5,3,6)
	print("<<",3,3,0)
	print("x",14,3,0)
end

function update_select()
	if btnp(🅾️) then
		mode="level"
		set_b()
		x=b[2][1]
		y=b[2][2]
	end
	if (btnp(❎)) mode="lpack" lpshift=-80*(lp-1) 
 if btnp(⬆️) and cur>1 then
 	cur-=1
 	ls_boxselect-=1
 	if ls_boxselect<3 and ls_shift<=-24 and cur>1then
 		ls_shift+=12
 		ls_boxselect+=1
  end
 elseif btnp(⬇️) and cur<=min(l[lp],#lvls[lp]-1) then
 	cur+=1
 	ls_boxselect+=1
 	if ls_boxselect>3 and #lvls[lp]-cur>1then
 		ls_shift-=12
 		ls_boxselect-=1
 	end
 	if ls_levelstart+3>cur and ls_levelstart>1then
 	 ls_levelstart-=1
 	end
 end
end

	
function future(round,cha)
	if (round==-1) return false
	
	if round<3 then
		for q=2, g+1 do
			if (b[q][1]==b[cha][1] and b[q][2]==b[cha][2]) then
				if(won()) return true
			end
		end
	end
	
	for i=g+2,#b do
		local bt={}
		bt[1]=b[i][1]
		bt[2]=b[i][2]
		bt[3]=b[i][3]
		
		a={}
		blocks(bt)

		local ta={}
		for j=1,#a do
			ta[j]={}
			ta[j][1]=a[j][1]
			ta[j][2]=a[j][2]
		end
		
		for j=1,#ta do
			b[i][1]=ta[j][1]
			b[i][2]=ta[j][2]
			local zzz=future(round-1,i)
			b[i][1]=bt[1]
			b[i][2]=bt[2]
			if (zzz) return true
		end
	end
	
	return false
end

function draw_lpack()
	cls(1)	
	rectfill(0,2,16,8,6)
	circfill(18,5,3,6)
	print("<<",3,3,1)
	print("x",14,3,1)
	if lp==1 then
		print("press c to select",30,112,6)
	end
	if((lp-1)*-80>lpshift) lpshift+=6
	if((lp-1)*-80<lpshift) lpshift-=6	 
	
	ro=flr(lpshift/-80+1.5)
	
	for i=max(ro-1,1),min(ro+1,#lplogos) do
		lpack_square(lplogos[i],lpshift+32+(i-1)*80,32)
		print(tostr(l[i]).."/"..tostr(#lvls[i]),lpshift+56+(i-1)*80,100,7)		
		if i==lp then
			rect(lpshift+33+(i-1)*80,32,lpshift+96+(i-1)*80,95,10)
			rect(lpshift+34+(i-1)*80,33,lpshift+95+(i-1)*80,94,10)
		end
		if i!=1 and l[i]==#lvls[i] then
			spr(21,5+(i)*80+lpshift,35)
		end
	end
	rectfill(lpshift+47,98,lpshift+82,108,1)	
end

function update_lpack()
	if btnp(🅾️) then
		if lp==1 then
			mode="tutorial"
			cur=1
			btut={{16,16},{80,48},{32,32},{64,48}}
			set_b()
			t_lock=false
			ttxt="use arrow keys to explore"
			x=2 y=4 
			t_step=0 
		else
			mode="select"
			cur=min(l[lp]+1,#lvls[lp])
			setup_ls()
		end
	end
	if(btnp(❎)) mode="title"
	if(btnp(➡️)and lp<#lplogos) then
  lp+=1
 elseif(btnp(⬅️)and lp>1) then
  lp-=1
 end
end

function draw_level()
	map()
	rectfill(16,16,111,111,1)
	print("bck",2,22,12)
	print("hlp",2,38,10)
	print("clr",2,54,8)
	
	color(7)
	txt=cur..". "..b[1]
	if(lp==-1) txt=b[1]
	if(fval!="")txt=fval color(10)
	print(txt, 64-#txt*2, 4)
	
	txt=""
	if (lp==2) txt="press c to "
	if(x==0) then
		if (y==1) then
			txt=txt.."go to level select"
		elseif(y==2) then
			txt=txt.."see if close"
		elseif(y==3) then
			txt=txt.."restart level"
		end	
	elseif(lp==2) then
		txt=txt.."select, x to undo"
	else
		txt=""
	end
	print(txt,64-#txt*2,118,6)
		
	-- level sprites
	for i=2, #b do
		if lock==1 and sx==b[i][1] and sy==b[i][2] then
			-- selected block
			rectfill(sx*16,sy*16,(sx+1)*16-1,(sy+1)*16-1,14)
			rectfill(sx*16+2,sy*16+2,(sx+1)*16-3,(sy+1)*16-3,10)
			local sdx=4
			local sdy=4
			if (x<sx)sdx+=-1
			if (x>sx)sdx+=1
			if (y<sy)sdy+=-1
			if (y>sy)sdy+=1
			local upn={116,20}
			if(#a==0) upn={4,52}
			sspr(upn[1],upn[2],9,8,sx*16+sdx,sy*16+sdy)
		else
			local bbl=64+2*b[i][3]
			if (b[i][3]==-1) bbl=44
			spr(bbl,b[i][1]*16,b[i][2]*16,2,2)
		end
	end
	
	-- yellow dots
	if (lock==1) then
		for i=1,#a do
			local r=17
			local xflip=false
			local yflip=false
			local dx=a[i][1]
			local dy=a[i][2]
			if(btype=="rocket") then
				r=18
				dx=rb[i][1]
				dy=rb[i][2]
				
				if(dx==sx) r=20
				if(dy==sy) r=19
				if(dy<=sy) yflip=true
			 if(dx<=sx) xflip=true
			end
			spr(r,dx*16+4,dy*16+4,1,1,xflip,yflip)
		end
	end
	
		if(lp==6) exhandler(cur)

	spr(cf,x*16,y*16,2,2)
	if currwon then
		for z=g+2,#b do
			spr(46,b[z][1]*16,b[z][2]*16,2,2)
		end
	 dopamine+=1
	 if(lp==-1 or lp==1) dopamine=0
	 if(dopamine>=25) rect(33,49,95,83,5)
	 if(dopamine>=27) rectfill(34,50,94,82,0)
	 if dopamine>=30 then
			for i=1,3 do
	 		rectfill(36,42+10*i,92,50+10*i,5)
	 	end
			rectfill(36,42+10*mselect,92,50+10*mselect,10)
			txt="next level"
			
			if(cur>=#lvls[lp]) txt="continue"
			cola=6 colb=6 colc=6
			if(mselect==1) cola=0
			if(mselect==2) colb=0
			if(mselect==3) colc=0
			
			print(txt,38,54,cola)
			print("level select",38,64,colb)
			print("retry",38,74,colc)
		end
		parts_draw()
	end
end

function update_level()
	if (currwon) level_won() return
	if (lock==0) level_unlocked() return
	if (lock==1) level_locked() return
end

function level_unlocked()
 cf=38 sx=-1 sy=-1
	
	if (btnp(⬅️) and (x>1 or (x==1 and y<4))) x-=1
	if (btnp(➡️) and x!=6) x+=1
	if (btnp(⬆️) and y!=1) y-=1
	if (btnp(⬇️) and ((y<6 and x>0) or y<3)) y+=1
	
	
	if btnp(🅾️) then
		fval=""
		if (x==0) then
			if y==1 then
				if (lp==-1) mode="editor" return
					mode="select"
					setup_ls()
			elseif y==2 then
					btype=""
					if fval=="" then
						fval="not close"
						if (future(3)) fval="close!"
						end
			elseif y==3 then
				if (lp==-1) set_b(elvl) return
				set_b()
			end
			return
		end
		
		for i=g+2,#b do
			if (x==b[i][1] and y==b[i][2] and b[i][3]>0) then
				lock=1
				sx=x sy=y
				blocks(b[i])
				break
			end
		end
	end
	
	
	if btnp(❎) and #un>0 then
		fval=""
		b[un[#un][3]][1]=un[#un][1]
		b[un[#un][3]][2]=un[#un][2]
		deli(un,#un)
		lock=0
	end
end


function level_locked()
		rx=x ry=y
		if (btnp(⬆️)) ry=y-1
		if (btnp(⬅️)) rx=x-1
		if (btnp(➡️)) rx=x+1
		if (btnp(⬇️)) ry=y+1
		
		val=2
		if(btype=="knight") val=3
		if(btype=="eye") val=6
		if inbounds(rx,ry) and abs(sx-rx)<val and abs(sy-ry)<val	then
	 	x=rx y=ry
		end

	cf=38+2*(flr(time())%2)
	
	if btnp(🅾️) then
		for j=1,#a do	
			local dx=a[j][1] 
			local dy=a[j][2]
			if btype=="rocket" then
				dx=rb[j][1]
				dy=rb[j][2]
			end	 
			if x==dx and y==dy then
	 		for i=g+2,#b do
					if sx==b[i][1] and sy==b[i][2] then 
						add(un,{b[i][1],b[i][2],i})
						x=a[j][1]
						y=a[j][2] 
						b[i][1]=x
						b[i][2]=y
					end
				end
			 break
		 end
	 end
	 lock=0 btype=""
	 
		currwon=won()
		
		if currwon==true	then
			gnum=0
			cf=-20
			parts_init()
			mselect=1
			if lp!=-1 and l[lp]<cur then
				l[lp]+=1
				dset(lp+1,l[lp])
				dset(1,1)
			end	
			dset(2,lp)
			return
		end
	end
	if (btnp(❎)) lock=0 btype=""
end

function level_won()
	if(btnp(⬆️)and mselect>1) mselect-=1
	if(btnp(⬇️)and mselect<3) mselect+=1
	
	if (btnp(❎) and mode=="level") mselect=2
	
	if btnp(🅾️) or btnp(❎) then
		currwon=false
		dopamine=0
	 
	 if (lp==-1) mode="editor" return
	 
		if mselect==1 then
			if (cur==#lvls[lp]) then
				mode="lpack"
			else
				if (cur<#lvls[lp]) cur+=1
				set_b()
			end
		elseif mselect==2 then
			if (cur<#lvls[lp]) cur+=1
			mode="select"
			setup_ls()
		elseif mselect==3 then
			set_b()
		end
	else
		parts_update()
	end
end
-->8
--other
function parts_init()
 
 parts={}
	for i=1,100 do
		add(parts,{
		x=rnd(128),
		y=rnd(60)-60,
		c=rnd({8,10,12}),
		d=rnd(2)-1,
		t=rnd(1),
		})
	end
end

function parts_draw()
	for p in all(parts) do
		pset(p.x,p.y,p.c)
	end
end

function parts_update()
	for p in all(parts) do
		p.x+=((p.t>=0.25 or p.t<0.75) and cos(p.t) or -cos(p.t))
		p.t+=0.03
		p.t%=1
		p.y+=(sin(p.t)+1)/2
		if p.y >128  then
			del(parts,p)
		end
	end
end

function lpack_square(_pack,lpx,lpy)
 for yy=0,63 do
		for xx=1,64 do
			pset(lpx+xx,lpy+yy,tonum(_pack[xx+64*yy],1))
		end
	end
end

function wait()
	w+=1
	if(w==9)	w=0 return true
end



-->8
--experimental

function exhandler(meta)
	if (meta==1) key_block(3)
	if (meta==2) min_moves(2)
	if (meta==3) lose_to_win()
	if (meta==4) toggle_block(6)
end

function key_block(key)
	rect(b[key][1]*16,b[key][2]*16,b[key][1]*16+15,b[key][2]*16+15,10)
	rect(b[key][1]*16+1,b[key][2]*16+1,b[key][1]*16+14,b[key][2]*16+14,10)
	if b[key][1]==b[2][1] and b[key][2]==b[2][2] then
		currwon=true
	else
		currwon=false
	end	
end

lose2=0
function min_moves(mm)
	if (currwon and #un>mm) currwon=false
end

function lose_to_win()
	currwon=false
	
	local ta={}
	local ttype=btype
		for j=1,#a do
			ta[j]={}
			ta[j][1]=a[j][1]
			ta[j][2]=a[j][2]
	end
	for i=g+2,#b do
		blocks(b[i])
		if (#a!=0) a=ta btype=ttype return
	end
	
	currwon=true
end
__gfx__
00000000ddddddddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00000000dd6666dde111111ee666666eeccccccee888888ee777777edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00700700d6dddd6de111111ee666666eeccccccee888888ee777777edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00077000d6d66d6de111111ee666666eeccccccee888888ee777777edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00077000d6d66d6de111111ee666666eeccccccee888888ee777777edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00700700d6dddd6de111111ee666666eeccccccee888888ee777777edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00000000dd6666dde111111ee666666eeccccccee888888ee777777edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00000000ddddddddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dd6666ddddddddddddddddddddddddddddddddddddd00ddddddd7dddddddaddddddd7ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dd6dd6dddddddddddaaddddddddddadddddaaddddd0aa0ddddd7d7dddddadaddddd7d7ddd444444dd666666ddaaaaaaddddeedddddd11ddddddddddddddddddd
dd6dd6ddddaaaadddaaadddddddddaaddddaaddd000aa000dd7ddd7dddadddaddd7ddd7dd499994dd677776ddaeeeeaddddeedddddd11ddddddddddddddddddd
d666666dddaaaaddddaaadaddaaaaaaadddaaddd0aaaaaa0ddddddddddddddddddddddddd494494dd676676ddaeaaeaddeeeeeedd111111ddddddddddddddddd
d666666dddaaaadddddaaaaddaaaaaaadddaadddd0aaaa0dddddddddddddddddddddddddd494494dd676676ddaeaaeaddeeeeeedd111111ddddddddddddddddd
d666666dddaaaaddddddaaaddddddaaddaaaaaad0aaaaaa0dd7ddd7ddd7ddd7dddadddadd499994dd677776ddaeeeeaddddeedddddd11ddddddddddddddddddd
d666666ddddddddddddaaaaddddddaddddaaaadd0aa00aa0ddd7d7ddddd7d7dddddadaddd444444dd666666ddaaaaaaddddeedddddd11ddddddddddddddddddd
dddddddddddddddddddddddddddddddddddaaddd000dd000dddd7ddddddd7dddddddaddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddaaaaaaaaddddddddccccccddccdd88dddddddddddd8877777dddddd77777dddddddddddddddd6666666666666666ddddddddddddddddeeeeeeeeeeeeeeee
ddddaaaaaaaaddddddddccccccddccdd88dddddddddddd8877777dddddd77777dddddddddddddddd6666666666666666ddddddddddddddddeeeeeeeeeeeeeeee
ddaaddddddddaaddddccddddddccccdddd88dddddddd88dd77dddddddddddd77ddaaaaddddaaaadd66dddddddddddd66dddd66666666ddddeeaaaaaaaaaaaaee
ddaaddddddddaaddddccddddddccccdddd88dddddddd88dd77dddddddddddd77ddaaaaddddaaaadd66dddddddddddd66dddd66666666ddddeeaaaaaaaaaaaaee
aaddddaaaaddddaaccddddddccccccdddddd88dddd88dddd77dddddddddddd77ddaaddddddddaadd66dd66666666dd66dd66dddddddd66ddeeaaaaaaaaaaaaee
aaddddaaaaddddaaccddddddccccccdddddd88dddd88ddddddddddddddddddddddaaddddddddaadd66dd66666666dd66dd66dddddddd66ddeeaa17aaaa17aaee
aaddddddddddddaaccdddddddddddddddddddd88dddddddddddddddddddddddddddddddddddddddd66dd66dddd66dd66dd66dd6666dd66ddeeaa11aaaa11aaee
aaddddddddddddaaccdddddddddddddddddddd88dddddddddddddddddddddddddddddddddddddddd66dd66dddd66dd66dd66dd6666dd66ddeeaa11aaaa11aaee
aaddddaaaaddddaaccdddddddddddddddddddddd88dddddddddddddddddddddddddddddddddddddd66dd66dddd66dd66dd66dd6666dd66ddeeaaaaaaaaaaaaee
aaddddaaaaddddaaccdddddddddddddddddddddd88dddddddddddddddddddddddddddddddddddddd66dd66dddd66dd66dd66dd6666dd66ddeeaaaaaaaaaaaaee
aaddddaaaaddddaaccddddddddddddccdddd88dddd88ddddddddddddddddddddddaaddddddddaadd66dd66666666dd66dd66dddddddd66ddeeaaaa1aa1aaaaee
aaddddaaaaddddaaccddddddddddddccdddd88dddd88dddd77dddddddddddd77ddaaddddddddaadd66dd66666666dd66dd66dddddddd66ddeeaaaaa11aaaaaee
ddaaddddddddaaddddccddddddddccdddd88dddddddd88dd77dddddddddddd77ddaaaaddddaaaadd66dddddddddddd66dddd66666666ddddeeaaaaaaaaaaaaee
ddaaddddddddaaddddccddddddddccdddd88dddddddd88dd77dddddddddddd77ddaaaaddddaaaadd66dddddddddddd66dddd66666666ddddeeaaaaaaaaaaaaee
ddddaaaaaaaaddddddddccccccccdddd88dddddddddddd8877777dddddd77777dddddddddddddddd6666666666666666ddddddddddddddddeeeeeeeeeeeeeeee
ddddaaaaaaaaddddddddccccccccdddd88dddddddddddd8877777dddddd77777dddddddddddddddd6666666666666666ddddddddddddddddeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccccccccccceeee888888888888eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccccccccccceeee888888888888eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccccccccccceeee888888888888eeee771177771177eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeec1111cc1111ceeee881788881788eeee717717717717eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee616616616616eeeecc11cccc11cceeee881188881188eeee717717717717eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee661166661166eeeecccccccccccceeee881188881188eeee717717717717eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccccccccccceeee888888888888eeee771177771177eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccc1111cccceeee881811118188eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666661166666eeeeccc1cccc1ccceeee888188881888eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeeccccc11ccccceeee888888888888eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccccccccccceeee888888888888eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccccccccccceeee888888888888eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaaaaaaaaaaaaeeeeccccc00ccccceeee888888008888eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaaaaaaaaaaaaeeeecccc0880cccceeee888880708888eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaaaaaaaaaaaaeeeecccc0000cccceeee888880770888eeee777733337777eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaa17aaaa17aaeeeecccc0560cccceeee888807770088eeee777333333777eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaa11aaaa11aaeeeecccc5750cccceeee880070770088eeee773333333377eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaa11aaaa11aaeeeecccc0560cccceeee807777770088eeee773300733377eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaaaaaaaaaaaaeeeeccc006600ccceeee807777770888eeee773300033377eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaaaaaaaaaaaaeeeecc05066050cceeee800077770088eeee773300033377eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaaaaa11aaaaaeeeecccc0660cccceeee888807770088eeee777333333777eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaaaa1aa1aaaaeeeeccccc00ccccceeee888807770888eeee777733337777eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaaaaaaaaaaaaeeeecccc8998cccceeee888007777088eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeaaaaaaaaaaaaeeeeccccc88ccccceeee880000000008eeee777777777777eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111eeeeeeee1111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111e777777e1111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111e777777e1111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111e777777e1111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111e777777e1111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111e777777e1111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111e777777e1111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111eeeeeeee1111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111eeeeeeee111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111e777777e111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111e777777e111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111e777777e111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111e777777e111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111e777777e111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111e777777e111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111eeeeeeee111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111177eeee77111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111177777777166666611111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111e777777e161111611111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111e777777e161661611111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111e777777e161661611111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e1111111111111111e777777e161111611111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111177777777166666611111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111177eeee77111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
0000000e111111111111111111111111111111111111111111111111e00000000000000000000000000000000000000000000000000000000000000000000000
00000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000bbb00000bbb00bb00000bbb0bbb00bb0bbb0bbb0bbb0bbb0000000000000000000000000000000000000000000000000000000000000000000000000
00000000b0b000000b00b0b00000b0b0b000b0000b00b0b0b0b00b00000000000000000000000000000000000000000000000000000000000000000000000000
00000000bb0000000b00b0b00000bb00bb00bbb00b00bbb0bb000b00000000000000000000000000000000000000000000000000000000000000000000000000
00000000b0b000000b00b0b00000b0b0b00000b00b00b0b0b0b00b00000000000000000000000000000000000000000000000000000000000000000000000000
00000000b0b000000b00bb000000b0b0bbb0bb000b00b0b0b0b00b00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000777070707770077077707770000000707770707077707770700077700000707077707770700070000000000000000000000000000000000000000000
07000000700070707070707070700700000007007070707000700070700070000000707007007770700007000000000000000000000000000000000000000000
00700000770007007770707077000700000070007770707007000700700077000000777007007070700000700000000000000000000000000000000000000000
07000000700070707000707070700700000007007000707070007000700070000000707007007070700007000000000000000000000000000000000000000000
70000000777070707000770070700700000000707000077077707770777077700700707007007070777070000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606000666066600660666000000660666066606660606066606660000066600000600066606660666060000000666066606660066066600000000000000000
60606000600060606000600000006000606060600600606060606000000060600000600060606060600060000000600006006060600006000000000000000000
66606000660066606660660000006000666066600600606066006600000066600000600066606600660060000000660006006600666006000000000000000000
60006000600060600060600000006000606060000600606060606000000060600000600060606060600060000000600006006060006006000000000000000000
60006660666060606600666000000660606060000600066060606660000060600000666060606660666066600000600066606060660006000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000077077707070777000007770707077707770700077700000000000000000000000000000000000000000000000000000000000000000000000000000
07000000700070707070700000007070707000700070700070000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000777077707070770000007770707007000700700077000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000007070707770700000007000707070007000700070000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000770070700700777000007000077077707770777077700000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606660600066600000666060006660666066606600606000006660606066600660666006600000000000000000000000000000000000000000000000000000
60000600600060000000606060006060600060606060606000006000606006006000060060000000000000000000000000000000000000000000000000000000
66000600600066000000666060006600660066606060666000006600060006006660060066600000000000000000000000000000000000000000000000000000
60000600600060000000606060006060600060606060006000006000606006000060060000600000000000000000000000000000000000000000000000000000
60006660666066600000606066606060666060606660666000006660606066606600060066000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ee0e0e0eee0eee0e0e0eee0eee0eee0eee0eee00000ee00e0e000e0ee000ee00000000000000000000000000000000000000000000000000000000000000000
e0e0e0e0e000e0e0e0e0e0e00e000e00e00000e00000e000e0e00e00e0e000e00000000000000000000000000000000000000000000000000000000000000000
e0e0e0e0ee00ee00e0e0ee000e000e00ee000ee00000e000eee00e00e0e000e00000000000000000000000000000000000000000000000000000000000000000
e0e0eee0e000e0e0eee0e0e00e000e00e00000000000e00000e00e00e0e000e00000000000000000000000000000000000000000000000000000000000000000
ee000e00eee0e0e0eee0e0e0eee00e00eee00e000000ee00eee0e000e0e00ee00000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06606660660006606660600060006660660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60006060606060006000600060006000606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60006660606060006600600060006600606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60006060606060006000600060006000606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06606060606006606660666066606660666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000777070707770077077707770000000707770707077707770700077700000707077707770700070000000000000000000000000000000000000000000
07000000700070707070707070700700000007007070707000700070700070000000707007007770700007000000000000000000000000000000000000000000
00700000770007007770707077000700000070007770707007000700700077000000777007007070700000700000000000000000000000000000000000000000
07000000700070707000707070700700000007007000707070007000700070000000707007007070700007000000000000000000000000000000000000000000
70000000777070707000770070700700000000707000077077707770777077700700707007007070777070000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606000666066600660666000000660666066606660606066606660000066600000600066606660666060000000666066606660066066600000000000000000
60606000600060606000600000006000606060600600606060606000000060600000600060606060600060000000600006006060600006000000000000000000
66606000660066606660660000006000666066600600606066006600000066600000600066606600660060000000660006006600666006000000000000000000
60006000600060600060600000006000606060000600606060606000000060600000600060606060600060000000600006006060006006000000000000000000
60006660666060606600666000000660606060000600066060606660000060600000666060606660666066600000600066606060660006000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000777070707770077077707770000000707770707077707770700077700000707077707770700070000000000000000000000000000000000000000000
07000000700070707070707070700700000007007070707000700070700070000000707007007770700007000000000000000000000000000000000000000000
00700000770007007770707077000700000070007770707007000700700077000000777007007070700000700000000000000000000000000000000000000000
07000000700070707000707070700700000007007000707070007000700070000000707007007070700007000000000000000000000000000000000000000000
70000000777070707000770070700700000000707000077077707770777077700700707007007070777070000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000e00001010511105101050e1050e10612104141051410414106141051410514105141041410414104141001310013100121001210012100111000f1000e1000c1000a1000a1000a1000a300093000830008300
001000002c00027100261002510010000100002110022100221002410027100291002a1002b1002b1001b1001d1001f10021100231003110025100251002b1002810021100331001800000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
002000001885000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
