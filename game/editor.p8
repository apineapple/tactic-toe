pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
estr = ""
cspr = 42
code = -1
elvl = {}
eg=0


function draw_editor()
 rectfill(16,16,112,112,1)
 for i=1,#elvl do
 	spr(elvl[i][4],elvl[i][1]*16,elvl[i][2]*16,2,2) 
 end
 
 spr(cspr,0,16,2,2)
 
 spr(cspr,x*16,y*16,2,2)
 spr(38,x*16,y*16,2,2)
  
 color(7)
 
 txt="c to place, x for controls"
 print(txt, 64-#txt*2, 118,7)
 print("bck", 2, 6, 7)
 print("run", 2, 38, 7)
 print("cpy", 2, 54, 7)
 print("clr", 2, 70, 7)
end

function update_editor()
		if (btnp(⬅️) and x>0) x-=1
		if (btnp(➡️) and x<7) x+=1
		if (btnp(⬆️) and y>0) y-=1
		if (btnp(⬇️) and y<7) y+=1
		
end

function editor_x()
 if (x==0) then
 	if(y==0) then
 		mode="title"
 	elseif(y==1) then
 	 if (cspr == 36) then
			cspr = 42
			code=-1
			elseif (cspr == 42) then
				cspr = 64
				code+=1
			elseif (cspr == 64) then
				cspr = 66
				code+=1
			elseif (cspr == 66) then
				cspr = 68
				code+=1
			elseif (cspr == 68) then
				cspr = 36
			end
		elseif((y==2 or y==3) and eg==0) then
 		extcmd("needs goal")
		elseif(y==3 and eg==1) then
 		estr = "{"
			for i=1,#elvl do
	 		estr=estr .. "{" .. tostr(elvl[i][1]) .. "," .. tostr(elvl[i][2]) .. "," .. tostr(elvl[i][3]) .. "},"
	  end
			estr= estr.."},"
			printh(estr, "@clip")
			extcmd("copied!")
		elseif(y==2) then
		 lp=6
			add(lvls[lp],elvl,1)
			ml[lp]+=1
   b=lvls[lp]
			mode="select"
			setup_ls()
 	elseif(y==4) then
 		elvl={}
 	end
 end
end

function editor_c()
		if(cspr==36) then
		 for i=1,#elvl do
  		if (x==elvl[i][1] and y==elvl[i][2]) then
  			del(elvl,elvl[i])
  			break
  		end
   end
		else
			for i=1,#elvl do
  		if (x==elvl[i][1] and y==elvl[i][2] and code!=elvl[i][3]) then
  			del(elvl,elvl[i])
  			break
  		end
  	end
  	if (code==-1) then
  		eg=1
  		add(elvl,{x,y,code,cspr},1)
  	else
  	 add(elvl,{x,y,code,cspr})
  	end
	 end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
