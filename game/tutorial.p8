pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
w=0

function draw_tutorial()
	
	rectfill(16,16,112,112,1)
	color(7)
	print("tutorial",48,6)
	
	if(x==0) x=1
	txt=""
	if(t_step==0) then
		spr(38,x*16,y*16,2,2)
		txt="press arrows to explore"
	elseif(t_step==1) then
		spr(66,16,16,2,2)
		spr(38,x*16,y*16,2,2)
		txt="good! go to that block"
	elseif(t_step==2) then
		x=1 y=1
		spr(66,16,16,2,2)
		spr(38,x*16,y*16,2,2)
		txt="press c to select it"
	elseif(t_step==3) then
		x=1 y=1
		spr(46,16,16,2,2)
		spr(38,x*16,y*16,2,2)
		txt="uh oh! this block cant move"
	elseif(t_step==4) then
		x=1 y=1
		spr(46,16,16,2,2)
		spr(42,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="we need a block on goal to win"
	elseif(t_step==5) then
		x=1 y=1
		spr(46,16,16,2,2)
		spr(66,32,32,2,2)
		spr(42,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="new block! press c!"
	elseif(t_step==6) then
		spr(66,16,16,2,2)
		spr(66,32,32,2,2)
		spr(42,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="move to new block and press c!"
	elseif(t_step==7) then
		x=2 y=2
		spr(66,16,16,2,2)
		spr(46,32,32,2,2)
		spr(17,52,52)
		spr(42,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="awesome! this block can move!"
 elseif(t_step==8) then
		x=2 y=2
		spr(66,16,16,2,2)
		spr(46,32,32,2,2)
		spr(17,52,52)
		spr(42,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="wait why can this block move?"
 elseif(t_step==9) then
		x=2 y=2
		spr(66,16,16,2,2)
		spr(46,32,32,2,2)
		spr(17,52,52)
		spr(42,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="its pushed by the first block"
 elseif(t_step==10) then
		x=min(x,3) y=min(y,3)
		spr(66,16,16,2,2)
		spr(46,32,32,2,2)
		spr(17,52,52)
		spr(42,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="neat! move to the dot"
 elseif(t_step==11) then
		x=3 y=3
		spr(66,16,16,2,2)
		spr(46,32,32,2,2)
		spr(17,52,52)
		spr(42,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="now press c!"		
	elseif(t_step==12) then
		x=3 y=3
		spr(66,16,16,2,2)
		spr(66,48,48,2,2)
		spr(42,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="you did it!!"
	elseif(t_step==13) then
		spr(66,16,16,2,2)
		spr(66,48,48,2,2)
		spr(66,64,48,2,2)
		spr(42,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="now press c on block 3"
	elseif(t_step==14) then
		if(x!=5) x=4
	 y=3
		spr(66,16,16,2,2)
		spr(66,48,48,2,2)
		spr(46,64,48,2,2)
		spr(42,80,48,2,2)
		spr(17,84,52)
		spr(38,x*16,y*16,2,2)
		txt="then press c on the dot"		
	elseif(t_step==15) then
		x=5 y=3
		spr(66,16,16,2,2)
		spr(66,48,48,2,2)
		spr(66,80,48,2,2)
		spr(38,x*16,y*16,2,2)
		txt="you win!!"
end
	
	print(txt, 64-#txt*2, 118)
	
end

function update_tutorial()
	if(t_step==0) then
		if(x==1 or x==3 or y==6 or y==2) t_step=1
	elseif(t_step==1) then
		if(x==1 and y==1) t_step=2
	elseif(t_step==2) then
		if(btnp(4)) t_step=3
	elseif(t_step==3) then
		if(wait()) t_step=4
	elseif(t_step==4) then
		if(wait()) t_step=5
	elseif(t_step==5) then
		if(btnp(4)) t_step=6
	elseif(t_step==6) then
		if(btnp(4) and x==2 and y==2) t_step=7
	elseif(t_step==7) then
		if(wait()) t_step=8
	elseif(t_step==8) then
		if(wait()) t_step=9
	elseif(t_step==9) then
		if(wait()) t_step=10
	elseif(t_step==10) then
		if(x==3 and y==3) t_step=11
	elseif(t_step==11) then
		if(btnp(4)) t_step=12	
	elseif(t_step==12) then
		if(wait()) t_step=13
	elseif(t_step==13) then
		if(btnp(4) and x==4 and y==3) t_step=14
	elseif(t_step==14) then
		if(btnp(4) and x==5 and y==3) t_step=15
	
	end
	
end

function wait()
	w+=1
	if(w==90) then
		w=0 
		return true
	end
		
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
