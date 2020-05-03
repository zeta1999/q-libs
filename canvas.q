/

\l utf8.q
\l canvas.q

.canvas.genj[40;40]{0=div[;2](x*/:y)mod 13}
.canvas.print[]

.canvas.genf[40;40]{0.25>(x-.5){(x*x)+y*y}/:y-.5}
.canvas.print[]

.canvas.new[80;41]
.canvas.plotxf[.5*.5+key 160]{20*1+sin pi*x%40};
.canvas.print[]

\

\d .canvas

//new
new:{[w;h]d:4 2 xbar'(h+3;w+1);data::d#prd[d]#0b}
//generate, long x,y
genj:{[w;h;f]data::reverse f[key 2 xbar w+1;key 4 xbar h+3]}
//getrarte, float x,y
genf:{[w;h;f]s:1%w&h;data::reverse f[s*.5+key 2 xbar w+1;s*.5+key 4 xbar h+3]}

h:{count data}
w:{count data 0}

//plot, [0;0] is bottom left
plot:{x:floor x;y:(c:count data)-1+floor y;
 if[(0<=y)&y<c;if[(0<=x)&x<count data 0;data[y;x]:1b]]}

plotxf:{[x;f]plot'[x;f'[x]]}

//U+2800..., i.e. Braille chars
char:(256 sv 0x2800)+ 0 1 8 2 16 4 32 64 128 wsum flip 2 vs/:256+key 256

blocks:{flip ({2 sv raze x} each 4 cut) each flip(2 cut)each data}
print:{-1 .utf8.enJ each char blocks[];}

new[80;40]