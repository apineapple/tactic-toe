pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- puzzle demo
-- by bens

#include levels.p8

ver="ver:0.7"
--availble blocks
a={{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1},{-1,-1}}
-- blocks for levels
cf=38
cft=0
mode="title" -- info screen flag
sx=0 sy=0 -- stored x/y for lock
lock = 0 -- locked on block flag
x=1 y=1 -- position (in tiles)
w=0 -- wait
un={} -- undo
btype=""
g=0
cur=1
restart=0
dopamine=0
lpshift=0
lp=1
t_mode=0
l={}
ud=22
currwon=false
mselect=1
for i=1,#lvls do
		l[i]=0
end
b={}
speed_t=0
ls_boxselect=1
ls_levelstart=1
ls_shift=-12
t_step=0
cspr=44
code = -1
elvl = {"your level!"}
col=0 --color select


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
	elseif mode=="hint" then
		draw_hint()
	elseif mode=="lpack" then
		draw_lpack()
	elseif mode=="level" then
		draw_level()
	elseif mode=="speed" then
		draw_speed()
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
		update_hint()
	elseif mode=="speed" then
		update_speed()
	end
end

--reg block behavior
function arrows()
	i=0
	for dx=-1,1 do 
		for dy=-1,1 do
			if not(dx==0 and dy==0) then
				i+=1
				if inbounds(x+dx,y+dy) and (not contains(x+dx,y+dy) or btype=="knight") then
					if (contains(x-dx,y-dy) or 
					((dy == 0) and (contains(x-dx,y+1) and contains(x-dx,y-1))) or
	    ((dx == 0) and (contains(x+1,y-dy) and contains(x-1,y-dy))) or
	    ((dx != 0 and dy != 0) and (contains(x,y-dy) and contains(x-dx,y))) ) then
	     a[i][1]=x+dx
						a[i][2]=y+dy
	    end
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

function rocket()
	qx=0 qy=0
	if (x<sx) qx=-1
	if (x>sx) qx=1
	if (y<sy) qy=-1 
	if (y>sy) qy=1
	
	while(true) do
		if inbounds(x+qx,y+qy) and not contains(x+qx,y+qy) then
			x+=qx y+=qy				
		else
			break
		end
	end
end


function knight()
	k={} kx=0 ky=0
	for i=1, #a do
		if a[i][1]!=-1 then
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
	end
	a=k
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


function wait()
	--90
	w+=1
	if(w==90) then
		w=0 
		return true
	end
end


-->8
--modes

--title
function draw_title()
 cls(1)
 
 
 rectfill(0,103,128,128,14)
 print(ver,97,5,6) 
 print("\^w\^ttactic-toe",27,40,7)
 
 spr(2,17,26) spr(2,25,26)
 spr(2,33,26) spr(2,25,34)
 spr(2,25,42) spr(3,15,24)
 spr(3,23,24) spr(3,31,24)
 spr(3,23,32) spr(3,23,40)
 print("by bens",50,55,14)

 if(t_mode==0) then
 	txt="start"
 elseif(t_mode==1) then
 	txt="create"
 elseif(t_mode==2) then
 	txt="speedrun"
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
		elseif t_mode==2 then
			mode="speed"
			speed_t=time()
			cur=1
			lp=2
			set_b()
		end
	end
	if(btnp(⬆️)) t_mode-=1 ud=23
	if(btnp(⬇️)) t_mode+=1 ud=24
	if(t_mode==-1) t_mode=2
	if(t_mode==3) t_mode=0
end

--tutorial
function draw_tutorial()
	rectfill(16,16,111,111,1)
	color(7)
	print("tutorial",48,6)
	txt=""
	if(t_step>3 and t_step<15) spr(44,80,48,2,2)
	if(t_step>5) spr(66,16,16,2,2)
	if(t_step>11) spr(66,48,48,2,2)
	if(t_step==0) then
		txt="use arrow keys to explore"
	elseif(t_step==1) then
		spr(66,16,16,2,2)
		txt="good! go to that block"
	elseif(t_step==2) then
		x=1 y=1
		spr(66,16,16,2,2)
		txt="press c to select it"
	elseif(t_step==3) then
		x=1 y=1
		spr(46,16,16,2,2)
		txt="uh oh! this block cant move"
	elseif(t_step==4) then
		x=1 y=1
		spr(46,16,16,2,2)
		txt="we need a block on goal to win"
	elseif(t_step==5) then
		x=1 y=1
		spr(46,16,16,2,2)
		spr(66,32,32,2,2)
		txt="new block! press c!"
	elseif(t_step==6) then
		spr(66,32,32,2,2)
		txt="move to new block and press c!"
	elseif(t_step==7) then
		x=2 y=2
		spr(46,32,32,2,2)
		spr(17,52,52)
		txt="awesome! this block can move!"
 elseif(t_step==8) then
		x=2 y=2
		spr(46,32,32,2,2)
		spr(17,52,52)
		txt="wait why can this block move?"
 elseif(t_step==9) then
		x=2 y=2
		spr(46,32,32,2,2)
		spr(17,52,52)
		txt="its boosted by the first block"
 elseif(t_step==10) then
		x=min(x,3) y=min(y,3)
		spr(46,32,32,2,2)
		spr(17,52,52)
		txt="neat! move to the dot"
 elseif(t_step==11) then
		x=3 y=3
		spr(46,32,32,2,2)
		spr(17,52,52)
		txt="now press c!"		
	elseif(t_step==12) then
		x=3 y=3
		txt="you did it!!"
	elseif(t_step==13) then
		spr(66,64,48,2,2)
		txt="now press c on block 3"
	elseif(t_step==14) then
		if(x!=5) x=4
	 y=3
		spr(46,64,48,2,2)
		spr(17,84,52)
		txt="then press c on the dot"		
	elseif(t_step==15) then
		x=5 y=3
		spr(66,80,48,2,2)
		parts_init()
		txt="you win!! press c to play!"
	elseif(t_step==16) then
		x=5 y=3
		spr(66,80,48,2,2)
		parts_draw()
		txt="you win!! press c to play!"
	end
	if (t_step!=16) spr(38,x*16,y*16,2,2)
	print(txt,64-#txt*2,118,7)
	
	if restart>10 then
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
	
	if (btnp(⬅️) and x>1) x-=1
	if (btnp(➡️) and x!=6) x+=1
	if (btnp(⬆️) and y!=1) y-=1
	if (btnp(⬇️) and y<6) y+=1
	
	if t_step==0 and (x==1 or x==3 or y==6 or y==2) then
		t_step=1
	elseif t_step==1 and x==1 and y==1 then
		t_step=2
	elseif t_step==2 and btnp(🅾️) then
	 t_step=3
	elseif t_step==3 and wait() then
		t_step=4
	elseif t_step==4 and wait() then
		t_step=5
	elseif t_step==5 and btnp(🅾️) then
		t_step=6
	elseif t_step==6 and btnp(🅾️) and x==2 and y==2 then
		t_step=7
	elseif t_step==7 and wait() then
		t_step=8
	elseif t_step==8 and wait() then
		t_step=9
	elseif t_step==9 and wait() then
	 t_step=10
	elseif t_step==10 and x==3 and y==3 then
		t_step=11
	elseif t_step==11 and btnp(🅾️) then
		t_step=12	
	elseif t_step==12 and wait() then
  t_step=13
	elseif t_step==13 and btnp(🅾️) and x==4 and y==3 then
		t_step=14
	elseif t_step==14 then
		if(btnp(🅾️) and x==5 and y==3) t_step=15
	elseif t_step==15 then
	 t_step=16
	elseif t_step==16 then
		parts_update()
		if(btnp(🅾️)) mode="lpack"
	end
end

--editor
function draw_editor()
 rectfill(16,16,111,111,1)
 for i=2,#elvl do
 	spr(elvl[i][4],elvl[i][1]*16,elvl[i][2]*16,2,2) 
 end
 
 if cspr==36 then
 	print("del",x*16+2,y*16+6,8)
 else
  spr(cspr,x*16,y*16,2,2)
 end
 spr(38,x*16,y*16,2,2)
	
 if x==0 then
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
			code=-1
		elseif cspr==44 then
			cspr=64
		elseif cspr==64 then
			cspr=66
		elseif cspr==66 then
			cspr=68
		elseif cspr==68 then
			cspr=70
		elseif cspr==70 then
			cspr=36
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
	--need goal first
	if(code==-1 and inbounds(x,y)) then
		add(elvl,{x,y,code,cspr},2)
	elseif (code!=0 and inbounds(x,y)) then
		add(elvl,{x,y,code,cspr})
	elseif (code==0) then
		add(elvl,{x,y,code,cspr})
	end
end

--select
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
	circfill(5,5,3,6)
	rectfill(6,2,16,8,6)
	circfill(18,5,3,6)
	print("<<",4,3,0)
	print("x",15,3,0)
end

function update_select()
	if btnp(🅾️) then
		mode="level"
		set_b()
		x=b[2][1]
		y=b[2][2]
	end
	if (btnp(❎)) mode="lpack" lpshift=-80*(lp-1)
 if (lp==1) mode="tutorial" x=2 y=4 t_step=0 
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

--hint
function draw_hint()
	cls(1)
	rectfill(110,27,119,36,6)
	rectfill(110,42,119,51,6)
	spr(21,111,28)
	color(7)
	print("hint options",40,10)	
	line(35, 18, 93, 18)
	print("three moves left", 10, 30)
	print("show winning block", 10, 45)
	print("back",56,110)
end
	
function update_hint()
	if(btnp(🅾️)) mode="level"
end

--llpack
function draw_lpack()
	cls(1)
	circfill(5,5,3,6)
	rectfill(6,2,16,8,6)
	circfill(18,5,3,6)
	print("<<",4,3,1)
	print("x",15,3,1)
	if lp==1 then
		print("press c to select",30,112,6)
	end
	if(-1*(lp-1)*80>lpshift) lpshift += 4
	if(-1*(lp-1)*80<lpshift) lpshift -= 4	 
	--fix so only shows relevant squares
	for i=max(1,lp-1),min(#lplogos,lp+1) do
		lpack_square(lplogos[i],lpshift+32+(i-1)*80,32)
		print(tostr(l[i]).."/"..tostr(#lvls[i]),lpshift+56+(i-1)*80,100,6)		
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
		mode="select"
		cur=min(l[lp]+1,#lvls[lp])
		setup_ls()
	end
	if(btnp(❎)) mode="title"
	--lpshift==-1*(lp-1)*80
	if(btnp(➡️)and lp<#lplogos) then
  lp+=1
 elseif(btnp(⬅️)and lp>1) then
  lp-=1
 end
end

--level
function draw_level()
	map()
	rectfill(16,16,111,111,1)
	print("bck",2,22,12)
	print("hlp",2,38,10)
	print("clr",2,54,8)
	
	color(7)
	txt=cur..". "..b[1]
	if(lp==-1) txt=b[1]
	print(txt, 64-#txt*2, 4)
	
	if(x==0) then
		txt=""
		if (lp==2) txt="press c to "
		if (y==1) then
			txt=txt.."exit to level select"
		elseif(y==2) then
			txt=txt.."get a hint"
		elseif(y==3) then
			txt=txt.."restart level"
		end	
	elseif(lp==2) then
		txt="c to select, x to undo"
	else
		txt=""
	end
	print(txt,64-#txt*2,118,6)
		
	-- level sprites
	for i=2, #b do
		if lock==1 and sx==b[i][1] and sy==b[i][2] then
			bbl=46 -- selected block
		elseif b[i][3]==-1 then
			bbl=44
		else
			bbl=64+2*b[i][3]
		end
			spr(bbl,b[i][1]*16,b[i][2]*16,2,2)
	end
		
	-- yellow dots
	if (lock==1) then
		for i = 1,#a do
			if a[i][1]!=-1 then
				r=17
				xflip=false
				yflip=false
				if(btype=="rocket") then
					r=18
					if(a[i][1]==sx) r=20
					if(a[i][2]==sy) r=19
					if(a[i][2]<=sy) yflip=true
				 if(a[i][1]<=sx) xflip=true
				end
			spr(r,a[i][1]*16+4,a[i][2]*16+4,1,1,xflip,yflip)
			end
		end
	end
	
	spr(cf,x*16,y*16,2,2)
	
	if currwon then
	 dopamine+=1
	 if(lp==-1) dopamine=0
	 if(dopamine>=25) rect(33,53,95,87,5)
	 if(dopamine>=27) rectfill(34,54,94,86,0)
	 if dopamine>=30 then
			for i=1,3 do
	 		rectfill(36,46+10*i,92,54+10*i,5)
	 	end
			rectfill(36,46+10*mselect,92,54+10*mselect,10)
			txt="next level"
			
			if(cur>=#lvls[lp]) txt="continue"
			cola=6 colb=6 colc=6
			if(mselect==1) cola=0
			if(mselect==2) colb=0
			if(mselect==3) colc=0
			
			print(txt,38,58,cola)
			print("level select",38,68,colb)
			print("retry",38,78,colc)
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
		if (x==0) then
			if y==1 then
				if (lp==-1) mode="editor" return
					mode="select"
					setup_ls()
			elseif y==2 then
					mode="hint"
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
				a={}
				for i=1,8 do
					add(a,{-1,-1})
				end
				
				if(b[i][3]==2) btype="rocket"
				if(b[i][3]==3) btype="knight"
				arrows()
				if(b[i][3]==3) knight()

				break
			end
		end
	end
	
	if btnp(❎) and #un>0 then
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
		if inbounds(rx,ry) and abs(sx-rx)<val and abs(sy-ry)<3	then
	 	x=rx y=ry
		end
		
	cft+=1
	if(cft==20 and cf==38) cft=0 cf=40
	if(cft==20 and cf==40) cft=0 cf=38
	
	if btnp(🅾️) then
		for j=1,#a do		 
			if (x==a[j][1] and y==a[j][2]) then
	 		for i=g+2,#b do
					if sx==b[i][1] and sy==b[i][2] then 
						add(un,{b[i][1],b[i][2],i})
						if (b[i][3]==2) rocket() 
						b[i][1]=x
						b[i][2]=y
					end
				end
			 break
		 end
	 end
	 lock=0 btype=""
	 
	 gnum=0
		for i=g+2, #b do
			for j = 2, g+1 do
				if (b[i][1]==b[j][1] and b[i][2]==b[j][2]) then
					gnum+=1
				end
			end
		end
		
		if (gnum==g)	then
			currwon=true
			gnum=0
			parts_init()
			mselect=1
			if lp!=-1 and l[lp]<cur then
				l[lp]+=1
				dset(lp+1,l[lp])
				dset(2,lp)
				dset(1,1)
			end	
			return
		end
	end
	if (btnp(❎)) lock=0 btype=""
end

function level_won()
	cf=12
	parts_update()
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
	end
end

function draw_speed()
	draw_level()
	rectfill(0,113,128,128,0)
	--use sub function?
	txt=time()-speed_t
	print(txt,64-8,118,6)
end

function update_speed()
	update_level()
	mode="speed"
	if (x==0 and btnp(🅾️)) then
		if (y==1) mode="title" lp=1 lpshift=0 return
		lp=2
		cur=1
		set_b()
	end
	
	if (cur==#lvls[lp]) then
		lp+=1
		cur=1
		set_b()
	end
end
-->8

parts={}

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
		if p.y >128 then
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


__gfx__
00000000ddddddddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00000000dd6666dde111111ee666666eeccccccee888888edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00700700d6dddd6de111111ee666666eeccccccee888888edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00077000d6d66d6de111111ee666666eeccccccee888888edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00077000d6d66d6de111111ee666666eeccccccee888888edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00700700d6dddd6de111111ee666666eeccccccee888888edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00000000dd6666dde111111ee666666eeccccccee888888edddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
00000000ddddddddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dd6666ddddddddddddddddddddddddddddddddddddd00ddddddd7dddddddaddddddd7ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dd6dd6dddddddddddaaddddddddddadddddaaddddd0aa0ddddd7d7dddddadaddddd7d7ddd444444dd666666ddaaaaaaddddddddddddddddddddddddddddddddd
dd6dd6ddddaaaadddaaadddddddddaaddddaaddd000aa000dd7ddd7dddadddaddd7ddd7dd499994dd677776ddaeeeeaddddddddddddddddddddddddddddddddd
d666666dddaaaaddddaaadaddaaaaaaadddaaddd0aaaaaa0ddddddddddddddddddddddddd494494dd676676ddaeaaeaddddddddddddddddddddddddddddddddd
d666666dddaaaadddddaaaaddaaaaaaadddaadddd0aaaa0dddddddddddddddddddddddddd494494dd676676ddaeaaeaddddddddddddddddddddddddddddddddd
d666666dddaaaaddddddaaaddddddaaddaaaaaad0aaaaaa0dd7ddd7ddd7ddd7dddadddadd499994dd677776ddaeeeeaddddddddddddddddddddddddddddddddd
d666666ddddddddddddaaaaddddddaddddaaaadd0aa00aa0ddd7d7ddddd7d7dddddadaddd444444dd666666ddaaaaaaddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddaaddd000dd000dddd7ddddddd7dddddddaddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddaaaaaaaaddddddddccccccddccdd88dddddddddddd8877777dddddd77777dddddddddddddddd6666666666666666ddddddddddddddddeeeeeeeeeeeeeeee
ddddaaaaaaaaddddddddccccccddccdd88dddddddddddd8877777dddddd77777dddddddddddddddd6666666666666666ddddddddddddddddeeeeeeeeeeeeeeee
ddaaddddddddaaddddccddddddccccdddd88dddddddd88dd77dddddddddddd77ddaaaaddddaaaadd66dddddddddddd66dddd66666666ddddeeaaaaaaaaaaaaee
ddaaddddddddaaddddccddddddccccdddd88dddddddd88dd77dddddddddddd77ddaaaaddddaaaadd66dddddddddddd66dddd66666666ddddeeaaaaaaaaaaaaee
aaddddaaaaddddaaccddddddccccccdddddd88dddd88dddd77dddddddddddd77ddaaddddddddaadd66dd66666666dd66dd66dddddddd66ddeeaaaaaaaaaaaaee
aaddddaaaaddddaaccddddddccccccdddddd88dddd88ddddddddddddddddddddddaaddddddddaadd66dd66666666dd66dd66dddddddd66ddeeaaaaaaaaaaaaee
aaddddddddddddaaccdddddddddddddddddddd88dddddddddddddddddddddddddddddddddddddddd66dd66dddd66dd66dd66dd6666dd66ddeeaaaaaaaaaaaaee
aaddddddddddddaaccdddddddddddddddddddd88dddddddddddddddddddddddddddddddddddddddd66dd66dddd66dd66dd66dd6666dd66ddeeaaaaaaaaaaaaee
aaddddaaaaddddaaccdddddddddddddddddddddd88dddddddddddddddddddddddddddddddddddddd66dd66dddd66dd66dd66dd6666dd66ddeeaaaaaaaaaaaaee
aaddddaaaaddddaaccdddddddddddddddddddddd88dddddddddddddddddddddddddddddddddddddd66dd66dddd66dd66dd66dd6666dd66ddeeaaaaaaaaaaaaee
aaddddaaaaddddaaccddddddddddddccdddd88dddd88ddddddddddddddddddddddaaddddddddaadd66dd66666666dd66dd66dddddddd66ddeeaaaaaaaaaaaaee
aaddddaaaaddddaaccddddddddddddccdddd88dddd88dddd77dddddddddddd77ddaaddddddddaadd66dd66666666dd66dd66dddddddd66ddeeaaaaaaaaaaaaee
ddaaddddddddaaddddccddddddddccdddd88dddddddd88dd77dddddddddddd77ddaaaaddddaaaadd66dddddddddddd66dddd66666666ddddeeaaaaaaaaaaaaee
ddaaddddddddaaddddccddddddddccdddd88dddddddd88dd77dddddddddddd77ddaaaaddddaaaadd66dddddddddddd66dddd66666666ddddeeaaaaaaaaaaaaee
ddddaaaaaaaaddddddddccccccccdddd88dddddddddddd8877777dddddd77777dddddddddddddddd6666666666666666ddddddddddddddddeeeeeeeeeeeeeeee
ddddaaaaaaaaddddddddccccccccdddd88dddddddddddd8877777dddddd77777dddddddddddddddd6666666666666666ddddddddddddddddeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeeccccc00ccccceeee888888008888eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccc0880cccceeee888880708888eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccc0000cccceeee888880700888eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccc0560cccceeee888807770088eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccc5750cccceeee880070770088eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccc0560cccceeee807777770088eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeeccc006600ccceeee807777770888eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecc05066050cceeee800077770088eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccc0660cccceeee888807770088eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeeccccc00ccccceeee888807770888eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeecccc8998cccceeee888007777088eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ee111111111111eeee666666666666eeeeccccc88ccccceeee880000000008eedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
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
