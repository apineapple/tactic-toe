pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- puzzle demo
-- by bens

l=1  -- level num

--availble blocks
a={{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1}}
-- blocks for levels
b={
	{{2,2},{3,3}},
	{{4,3},{3,4},{3,5}},
	{{3,2},{4,2},{5,1},{6,3}},
	{{2,2},{1,2},{2,1},{4,4}},
	{{3,3},{3,4},{4,4}},
	{{6,4},{3,4},{4,3},{4,4}},
	{{2,4},{2,5},{2,6},{3,6}},
	{{3,3},{3,4},{4,3},{4,4}},
	{{3,3},{4,4},{6,4},{4,5},{5,6}},
	{{3,3},{3,4},{3,5},{4,3}},
	{{4,2},{3,3},{3,4},{2,5}},
	{{5,2,1},{3,3},{4,3},{3,4},{2,5},{5,5}},
	{{1,1},{2,1},{4,2},{5,4},{4,5},{2,4}},
	{{1,5},{2,5},{3,5},{2,6},{3,6}},
	{{1,1},{3,1},{2,2},{4,3},{5,4},{2,4}},
	{{2,5},{3,4},{4,4},{5,5}},
	{{3,3},{3,4},{4,4},{4,5}},
	{{2,2},{2,3},{2,4},{3,3},{4,3,1}},
	{{6,4},{7,4,1},{6,3},{4,3},{2,2}},
	{{3,3},{3,4},{3,5},{4,3}},
	{{1,2},{2,2},{1,3},{2,3},{3,3},{5,3},{4,4},{5,4,1},{5,5,1}},
	{{1,1},{5,1},{1,2},{2,2},{4,2},{5,2}},
	{{1,1},{4,1},{1,2},{2,2},{4,2},{5,2}},
	{{1,1},{1,2},{2,2},{5,1},{5,2},{4,2}},
	{{1,5},{2,5},{3,5},{2,6},{3,6}},
	{{2,4},{3,3},{5,3},{5,1},{5,4}},
	{{4,1},{3,2},{4,2},{3,3},{5,3},{6,4}},
	{{4,1},{3,2},{4,2},{1,3},{3,3},{2,5},{4,5},{6,5}},
	{{3,3},{4,3},{3,4},{3,5}}
}
--goals for levels
g={
	{{4,4}},
	{{4,5}},
	{{4,3}},
	{{5,5}},
	{{1,5}},
	{{4,6}},
	{{5,6}},
	{{6,5}},
	{{3,6},{4,6}},
	{{2,3},{2,5},{4,5}},
	{{2,6},{4,1}},
	{{5,1}},
	{{1,3}},
	{{6,4}},
	{{1,4}},
	{{5,1}},
	{{6,1}},
	{{6,3}},
	{{1,1}},
	{{2,6}},
	{{6,6}},
	{{4,6}},
	{{3,6}},
 	{{6,1}}, --made by ben
	{{5,1}},
	{{2,2}},
	{{1,2},{5,1},{4,3}},
	{{1,2},{5,1},{4,3}},
	{{5,1}}
	}

cf=1 -- cursor flashing
mode="title" -- info screen flag
sx=0 sy=0 -- stored x/y for lock
lock = 0 -- locked on block flag
gf = 2 -- goal flashing
x=16 y=16 -- position (in tiles)
t=0 -- timer
ml=#b+1 -- max level+1
re={} -- restart
un={} -- undo
ls_boxselect=1
ls_levelstart=1
ls_shift=-12
ls_unlocked=1

function _init()
	cls()
	palt(0, false)
	palt(13, true)
	for i=1,#b[l] do
		if(#b[l][i]==2) then
			re[i]={0,0}
			re[i][1]=b[l][i][1]
			re[i][2]=b[l][i][2]
		elseif(#b[l][i]==3) then
			re[i]={0,0,0}
			re[i][1]=b[l][i][1]
			re[i][2]=b[l][i][2]
			re[i][3]=b[l][i][3]
		end
	end
end

function _draw()
 cls()
 if (mode=="title") then
 	cls(1)
 	color(7)
 	txt="working title here"
 	print(txt,64-#txt*2,30)
 	color(10)
 	txt="press c to start"
 	print(txt,64-#txt*2,100)
	elseif (mode=="select") then

 --draw all level tabs
	 for i=1,ml-1 do
	 	circfill(7,5+12*i+ls_shift,5,6)
			circfill(70,5+12*i+ls_shift,5,6)
	 	rectfill(7,12*i+ls_shift,70,10+12*i+ls_shift,6)
	 	print("level: "..i,16,3+12*i+ls_shift,0)
	 end
	 for i=ls_unlocked+1,ml-1 do
	  spr(15,60,2+12*i+ls_shift)
	 end
	 
	 --draw selected level tab
	 rectfill(7,12*ls_boxselect-12,70,12*ls_boxselect-2,10)
	 circfill(7,5+12*ls_boxselect-12,5,10)
		circfill(70,5+12*ls_boxselect-12,5,10)

	 print("level: "..l,16,-9+12*ls_boxselect,5)
	 
	 
	 --draw preview level
	 rectfill(80,32,128,80,1)
	 for i=1,#g[l] do
	  	spr(8,72+g[l][i][1]*8,24+g[l][i][2]*8)
	 end
	 for i=1,#b[l] do
	  if #b[l][i]==2then
	  	spr(7,72+b[l][i][1]*8,24+b[l][i][2]*8)
	  elseif#b[l][i]==3and b[l][i][3]==1 then 
	  	spr(14,72+b[l][i][1]*8,24+b[l][i][2]*8)	  
	  end
	 end	 
	elseif (mode=="tutorial") then
		tutorial_design()
	elseif(l==ml) then
		cls()
		print("yow win!", 0, 10)
	else
		cls()
		map()
		color(7)
		txt="level "..l
		print(txt, 64-#txt*2, 4)
		
		-- goal sprite
		for i=1, #g[l] do
			spr(gf,g[l][i][1]*16,g[l][i][2]*16)
			spr(gf,g[l][i][1]*16+8,g[l][i][2]*16,1,1,true,false)
			spr(gf,g[l][i][1]*16,g[l][i][2]*16+8,1,1,false,true)
			spr(gf,g[l][i][1]*16+8,g[l][i][2]*16+8,1,1,true,true)
		end
		
		-- block sprite
		for i=1, #b[l] do
			bbl=5
			if(sx/16==b[l][i][1] and sy/16==b[l][i][2]) then
				bbl=12 -- lock
			elseif(#b[l][i]==3 and b[l][i][3]==1) then
				bbl=13 -- stone
			end
			spr(bbl,b[l][i][1]*16,b[l][i][2]*16)
			spr(bbl,b[l][i][1]*16+8,b[l][i][2]*16,1,1,true,false)
			spr(bbl,b[l][i][1]*16,b[l][i][2]*16+8,1,1,false,true)
			spr(bbl,b[l][i][1]*16+8,b[l][i][2]*16+8,1,1,true,true)
		end
		
		-- yellow dots
		if (lock==1) then
			for i = 1,#a do
				if(a[i][1]!=0 and a[i][1]!=0) then
					spr(11,a[i][1]*16,a[i][2]*16)
					spr(11,a[i][1]*16+8,a[i][2]*16,1,1,true,false)
					spr(11,a[i][1]*16,a[i][2]*16+8,1,1,false,true)
					spr(11,a[i][1]*16+8,a[i][2]*16+8,1,1,true,true)
				end
			end
		end
		spr(cf,x,y)
		spr(cf,x+8,y,1,1,true,false)
		spr(cf,x,y+8,1,1,false,true)
		spr(cf,x+8,y+8,1,1,true,true)
	end
end

function _update()

 if mode=="select" then
 	if btnp(4) then press_c()return end
 	if btnp(2)and l>1 then
 	 l-=1
 	 ls_boxselect-=1
 	 if ls_boxselect<3 and ls_shift<=-12and l>2then
 			ls_shift+=12
 			ls_boxselect+=1
   end
 	elseif btnp(3)and l<ml-1 and l<ls_unlocked then
 	 l+=1
 	 ls_boxselect+=1
 	 if ls_boxselect>7 and ml-l>2then
 			ls_shift-=12
 			ls_boxselect-=1
 		end
 	 if ls_levelstart+3>l and ls_levelstart>1then
 	  ls_levelstart-=1
 	 end
 	end
 	return
 end

	if (l==ml) return -- done
	t+=1-- framecount
	
	-- all win check stuff
	gnum=0
		for i = 1, #b[l] do
			for j = 1, #g[l] do
				if (b[l][i][1]==g[l][j][1] and b[l][i][2]==g[l][j][2]) then
					gnum+=1
				end
			end
		end
		
	if (gnum==#g[l])	then
		l+=1
		if l>ls_unlocked then
			ls_unlocked=l
		end
		if (l==ml) then 
			return
		end
			x=g[l][1][1]*16
			y=g[l][1][2]*16
			b[l-1]=re
			re={}
			un={}
			for i=1,#b[l] do
				if(#b[l][i]==2) then
					re[i]={0,0}
					re[i][1]=b[l][i][1]
					re[i][2]=b[l][i][2]
				elseif(#b[l][i]==3) then
					re[i]={0,0,0}
					re[i][1]=b[l][i][1]
					re[i][2]=b[l][i][2]
					re[i][3]=b[l][i][3]
				end
			end
	end
	
	--movement not locked
	if(mode=="select") then
		if (btnp(⬆️) and l-1!=0) l-=1
		if (btnp(⬇️) and l+1!=ml) l+=1		
	elseif (lock == 0) then
		if (btnp(⬅️) and (x/16>1 or (x/16==1 and y/16<4))) x-=16
		if (btnp(➡️) and x/16!=6) x+=16
		if (btnp(⬆️) and y/16!=1) y-=16
		if (btnp(⬇️) and ((y/16<6 and x/16>0) or y/16<3)) y+=16
	
		if (btnp(⬅️) or btnp(➡️) or btnp(⬆️) or btnp(⬇️)) then
			if (gf==2) then gf = 3
			elseif (gf==3) then gf = 2
			end
		end
	
	--movement locked	
	else
		gf=2
  		rx=x ry=y
		if (btnp(⬆️)) ry=y-16
		if (btnp(⬅️)) rx=x-16
		if (btnp(➡️)) rx=x+16
		if (btnp(⬇️) ) ry=y+16
			
		if((sx/16!=1 and rx==sx-16)or(rx==sx)or(sx/16!=6 and rx==sx+16))and((sy/16!=1 and ry==sy-16)or(ry==sy)or(sy/16!=6 and ry==sy+16)) then
			x=rx y=ry
		end

		-- cursor flashing
		if (t%20==0) then
			t=0
			if (cf==1) then 
				cf = 10
			elseif (cf==10) then 
				cf = 1
			end
		end
	end
	
	--undo
	if (btnp(5) and mode=="level") then
			press_x()
	end
	
	--select
	if (btnp(4)) then
		press_c()
end


--reg block behavior
function arrows()

	two=0
	-- top left
	if x/16!=1 and y/16!=1 then
		for i = 1,#b[l] do
			tx=b[l][i][1]*16
			ty=b[l][i][2]*16
			
			if x-16==tx and y-16==ty then
				two = 0 
				break
			elseif x+16==tx and y+16==ty then
				two=2	
			elseif x+16==tx and y==ty then
				two+=1
			elseif x==tx and y+16==ty then
				two+=1
			end
		end
		if (two>=2) then 
			a[1][1]=(x-16)/16 
			a[1][2]=(y-16)/16 
		end
	end
	
	two=0
	-- top middle
	if y/16!=1 then
		for i = 1,#b[l] do
			tx=b[l][i][1]*16
			ty=b[l][i][2]*16
			
			if x==tx and y-16==ty then
				two=0 
				break
			elseif x==tx and y+16==ty then
				two=2	
			elseif x-16==tx and y+16==ty then
				two+=1
			elseif x+16==tx and y+16==ty then
				two+=1
			end
		end
		if (two>=2) then
			a[2][1]=x/16
			a[2][2]=(y-16)/16
		end
	end
	
	two=0
	-- top right
	if x/16!=6 and y/16!=1 then
		for i = 1,#b[l] do
			tx=b[l][i][1]*16
			ty=b[l][i][2]*16
			
			if x+16==tx and y-16==ty then
				two = 0 
				break
			elseif x-16==tx and y+16==ty then
				two=2	
			elseif x-16==tx and y==ty then
				two+=1
			elseif x==tx and y+16==ty then
				two+=1
			end
		end
		if (two>=2) then
			a[3][1]=(x+16)/16
			a[3][2]=(y-16)/16
		end
	end
	
	two=0
	-- middle left
	if  x/16!=1 then
		for i = 1,#b[l] do
			tx=b[l][i][1]*16
			ty=b[l][i][2]*16
			
			if x-16==tx and y==ty then
				two = 0 
				break
			elseif x+16==tx and y==ty then
				two=2	
			elseif x+16==tx and y-16==ty then
				two+=1
			elseif x+16==tx and y+16==ty then
				two+=1
			end
		end
		if (two>=2) then
			a[4][1]=(x-16)/16
			a[4][2]=y/16
		end
	end
	
	two=0
	-- middle right
	if  x/16!=6 then
		for i = 1,#b[l] do
			tx=b[l][i][1]*16
			ty=b[l][i][2]*16
			
			if x+16==tx and y==ty then
				two = 0 
				break
			elseif x-16==tx and y==ty then
				two=2	
			elseif x-16==tx and y-16==ty then
				two+=1
			elseif x-16==tx and y+16==ty then
				two+=1
			end
		end
		if (two>=2) then
			a[5][1]=(x+16)/16
			a[5][2]=y/16
		end
	end
	
	two=0
	-- bottom left
	if  x/16!=1 and y/16!=6 then
		for i = 1,#b[l] do
			tx=b[l][i][1]*16
			ty=b[l][i][2]*16
			
			if x-16==tx and y+16==ty then
				two = 0 
				break
			elseif x+16==tx and y-16==ty then
				two=2	
			elseif x==tx and y-16==ty then
				two+=1
			elseif x+16==tx and y==ty then
				two+=1
			end
		end
		if (two>=2) then
			a[6][1]=(x-16)/16
			a[6][2]=(y+16)/16
		end
	end

	two=0
	-- bottom middle
	if  y/16!=6 then
		for i = 1,#b[l] do
			tx=b[l][i][1]*16
			ty=b[l][i][2]*16
			
			if x==tx and y+16==ty then
				two = 0 
				break
			elseif x==tx and y-16==ty then
				two=2	
			elseif x-16==tx and y-16==ty then
				two+=1
			elseif x+16==tx and y-16==ty then
				two+=1
			end
		end
		if (two>=2) then
			a[7][1]=x/16
			a[7][2]=(y+16)/16
		end
	end
	
	two=0
	-- bottom right
	if  x/16!=6 and y/16!=6 then
		for i = 1,#b[l] do
			tx=b[l][i][1]*16
			ty=b[l][i][2]*16
			
			if x+16==tx and y+16==ty then
				two = 0 
				break
			elseif x-16==tx and y-16==ty then
				two=2	
			elseif x-16==tx and y==ty then
				two+=1
			elseif x==tx and y-16==ty then
				two+=1
			end
		end
		if (two>=2) then
			a[8][1]=(x+16)/16
			a[8][2]=(y+16)/16
		end
	end
end

function tutorial_design()
	cls()
	color(7)
	print("goal: get a bl to all g", 10, 10)
	print("   are pushed by neighbors", 10, 24)	
	print("becomes    >",40,38)
	print("use arrow keys to move", 10, 66)
	print("press x to undo", 10, 80)
	color(11)
	print("press c to select/push", 10, 100)
	spr(8,96,8)
	spr(7,58,8)
	spr(7,10,22)
	spr(7,20,36)
	spr(7,28,36)
	spr(7,72,36)
	spr(7,90,36)
	spr(7,102,98)
end
	
function buttons()
	--restart button
	if(x/16==0 and y/16==1)then
		for i=1,#b[l] do
			b[l][i][1]=re[i][1]
			b[l][i][2]=re[i][2]
		end
		cf=1
		lock=0
		sx=-1 sy=-1
		return 1
	--tutorial button
	elseif(x/16==0 and y/16==2)then
		mode="tutorial"
		cf=1
		lock=0
		sx=-1 sy=-1
		return 1
	--level select button	
	elseif(x/16==0 and y/16==3)then
		mode="select"
		b[l]=re
		ls_boxselect=min(7,l)
  ls_levelstart=max(1,l-6)
  ls_shift=-ls_levelstart*12
		cf=1
		lock=0
		sx=-1 sy=-1
	end
	return 0
end

function press_c()
if (mode=="title") then
	mode="select"
elseif(mode=="tutorial" or mode=="select")then
			mode="level"
			re={}
			x=g[l][1][1]*16
			y=g[l][1][2]*16
			for i=1,#b[l] do
				if(#b[l][i]==2) then
					re[i]={0,0}
					re[i][1]=b[l][i][1]
					re[i][2]=b[l][i][2]
				elseif(#b[l][i]==3) then
					re[i]={0,0,0}
					re[i][1]=b[l][i][1]
					re[i][2]=b[l][i][2]
					re[i][3]=b[l][i][3]
				end
			end
		elseif (lock==1) then
		 for j=1,#a do		 
		 	if (x/16==a[j][1] and y/16==a[j][2]) then
				 for i = 1,#b[l] do
						if sx==b[l][i][1]*16 and sy==b[l][i][2]*16 then
							add(un,{b[l][i][1],b[l][i][2],i})
							b[l][i][1]=(x/16)
							b[l][i][2]=(y/16)
						end
					end
					break
				end
			end
			cf=1 lock=0
			sx=-1 sy=-1
		else
			if (buttons()!=1) then
			for i = 1,#b[l] do
				if (x==b[l][i][1]*16 and y==b[l][i][2]*16 and #b[l][i]==2) then
					lock=1
					sx=x sy=y
					a={{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1}}
					if (#b[l][i]==2) then
						arrows()
					end
					break
				end
			end
			end
		end
	end
end

function press_x()
		if(#un>0) then
			b[l][un[#un][3]][1]=un[#un][1]
			b[l][un[#un][3]][2]=un[#un][2]
			deli(un,#un)
			cf=1
			lock=0
			sx=-1 sy=-1
		end
end
__gfx__
0000000077777ddd111111116666666611111111eeeeeeee00000000eeeeeeee6666666600000000ddddddddddddddddeeeeeeeeeeeeeeeeeeeeeeee66000066
0000000077777ddd111111116666666611111111eeeeeeee00000000e666666e6111111600000000ddddddddddddddddeeeeeeeeeeeeeeeee000000e66066066
0070070077dddddd111166666611111111111111ee66666600000000e666666e6166661600000000ddaaaaddddddddddeeaaaaaaee111111e000000e66066066
0007700077dddddd111166666611111111111111ee66666600000000e666666e6161161600000000ddaaaaddddddddddeeaaaaaaee111111e000000e60000006
0007700077dddddd116611116611666611111111ee66666600000000e666666e6161161600000000ddaaddddddddddddeeaaaaaaee111111e000000e60000006
00700700dddddddd116611116611666611111111ee66666600000000e666666e6166661600000000ddaaddddddddddddeeaaaaaaee111111e000000e60000006
00000000dddddddd116611666611661111111111ee66666600000000e666666e6111111600000000ddddddddddddddaaeeaaaaaaee111111e000000e60000006
00000000dddddddd116611666611661111111111ee66666600000000eeeeeeee6666666600000000ddddddddddddddaaeeaaaaaaee111111eeeeeeee66666666
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaaaaaa00000000cccccc00cc00000800000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaaaaaa00000000cccccc00cc00008800000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aa00000000aa0000cc000000cccc00088800000000888000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aa00000000aa0000cc000000cccc00888880000008888800000000000000000000000000000000000000000000000000000000000000000000000000000000
aa0000aaaa0000aacc000000cccccc00000888000088800000000000000000000000000000000000000000000000000000000000000000000000000000000000
aa0000aaaa0000aacc000000cccccc00000088800888000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aa000000000000aacc00000000000000000008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aa000000000000aacc00000000000000000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aa0000aaaa0000aacc00000000000000000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aa0000aaaa0000aacc00000000000000000008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aa0000aaaa0000aacc000000000000cc000088800888000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aa0000aaaa0000aacc000000000000cc000888000088800000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aa00000000aa0000cc00000000cc00888880000008888800000000000000000000000000000000000000000000000000000000000000000000000000000000
00aa00000000aa0000cc00000000cc00088800000000888000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaaaaaa00000000cccccccc0000008800000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaaaaaa00000000cccccccc0000000800000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

__map__
1215151515151526262626262626262600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606262600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2223040404040404040404040404262600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3233040404040404040404040404262600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2021040404040404040404040404262600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3031040404040404040404040404262600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2425040404040404040404040404262600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3435040404040404040404040404262600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606040404040404040404040404262600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0006040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0006040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0006040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
