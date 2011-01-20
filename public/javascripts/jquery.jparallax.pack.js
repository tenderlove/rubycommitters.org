// jquery.events.frame.js
// 1.1 - lite
// Stephen Band
//
// Project home:
// webdev.stephband.info/events/frame/
//
// Source:
// http://github.com/stephband/jquery.event.frame

eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('(3(d,e){6 f;3 m(a,b){6 c=2,7;3 h(){c.8++;a.n(c)}2.i=b||w;2.8=-1;2.o=3(){h();7=x(h,2.i)};2.p=3(){y(7);7=q}}3 r(){6 a=d.4.j.9.s,4=d.z("9"),5=2.5,l=5.k;4.8=2.8;u(l--){a.n(5[l],4)}}g(!d.4.j.9){d.4.j.9={A:3(a,b){g(f){f.5.B(2)}C{f=D m(r,a&&a.i);f.5=[2];6 t=E(3(){f.o();F(t);t=q},0)}v},G:3(a){6 b=f.5,l=b.k;u(l--){g(b[l]===2){b.H(l,1);I}}g(b.k===0){f.p();f=e}v},s:3(a){d.4.J.K(2,L)}}}})(M);',49,49,'||this|function|event|array|var|clock|frameCount|frame|||||||if|update|frameDuration|special|length||Timer|call|start|stop|null|callHandler|handler||while|return|25|setInterval|clearInterval|Event|setup|push|else|new|setTimeout|clearTimeout|teardown|splice|break|handle|apply|arguments|jQuery'.split('|'),0,{}))

// jquery.jparallax.js
// 1.0
// Stephen Band
//
// Project and documentation site:
// webdev.stephband.info/jparallax/
//
// Repository:
// github.com/stephband/jparallax
//
// Dependencies:
// jquery.event.frame
// webdev.stephband.info/events/frame/

eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('(6(h,j){m k="q";m l={H:\'1N\',O:P,Q:P,18:0.5,19:0.5,n:0.1O,1P:1Q,1a:\'t\'},1b={E:0,F:0,1R:0.5,1S:0.5,1T:1,1U:1},1c={1d:/^\\d+\\s?1d$/,1n:/^\\d+\\s?%$/},I=\'1V.\'+k,14=1W.14,4=[0,0];6 1o(a){R 3.1p[a]}1o.1p=1b;6 S(x){R 1q x==="1X"?x:!!(1r(x))}6 T(x){R(1c.1n.1Y(x))?1r(x)/1e:x}6 U(d,e){m f=[S(d.O),S(d.Q)];3.G=V;3.n=d.n;3.4=e||[0.5,0.5];3.u=6(a,b){8(3.G){3.4=a}B 8((!f[0]||14(a[0]-3.4[0])<b[0])&&(!f[1]||14(a[1]-3.4[1])<b[1])){3.G=P;3.4=a}B{m c=[],x=2;W(x--){8(f[x]){c[x]=a[x]+3.n*(3.4[x]-a[x])}}3.4=c}}}6 1s(c,d){m f=3,z=c 1t h?c:h(c),q=[S(d.O),S(d.Q)],J=0,15;3.4=[0,0];3.X=V;3.1u=(d&&d.1u)||V;3.u=6(a){m b=3.16,C=3.C,4=[],x=2;8(J>0){8(J===2){J=0;8(15){a=15}}W(x--){8(q[x]){4[x]=(a[x]-b[x])/C[x];4[x]=4[x]<0?0:4[x]>1?1:4[x]}}3.X=P;3.4=4}B{3.X=V}};3.1f=6(){m a=z.1v(),Y=z.Y();f.C=[a,Y];f.1g=[1/a,1/Y]};3.1h=6(){m a=z.K()||{E:0,F:0},E=Z(z.r(\'1Z\'))+Z(z.r(\'20\')),F=Z(z.r(\'21\'))+Z(z.r(\'22\'));f.16=[a.E+E,a.F+F]};h(23).v(\'1w.\'+k,f.1f).v(\'1w.\'+k,f.1h);z.v(\'1x.\'+k,6(e){J=1}).v(\'24.\'+k,6(e){J=2;15=[e.1y,e.1z]});3.1f();3.1h()}6 1A(e,f){m g=[],q=[],K=[],D=[];3.u=6(a){m b=[],10,11,x=2,r={};W(x--){8(q[x]){b[x]=q[x]*a[x]+K[x];8(g[x]){10=D[x];11=b[x]*-1}B{10=b[x]*1e+\'%\';11=b[x]*3.C[x]*-1}8(x===0){r.E=10;r.25=11}B{r.F=10;r.26=11}}}e.r(r)};3.1B=6(a,b,c,d){m p=[a||f.O,b||f.Q],A=[c||f.18,d||f.19],i=2,r={};W(i--){g[i]=1c.1d.27(p[i]);8(1q A[i]===\'28\'){A[i]=A[i]===j?1:1b[A[i]]||T(A[i])}8(g[i]){q[i]=Z(p[i]);K[i]=A[i]*(3.C[i]-q[i]);D[i]=A[i]*1e+\'%\'}B{q[i]=p[i]===P?1:T(p[i]);K[i]=q[i]?A[i]*(1-q[i]):0}}};3.1C=6(){m a=e.29(),16=e.D(),D=[],4=[],i=2;W(i--){8(g[i]){D[i]=0}B{D[i]=16[i===0?\'E\':\'F\']/(a[i===0?\'1D\':\'1E\']()-3.C[i])}4[i]=(D[i]-K[i])/q[i]}R 4};3.1F=6(x,y){3.C=[x||e.1D(),y||e.1E()]};3.1F(f.1v,f.Y);3.1B(f.O,f.Q,f.18,f.19)}6 u(e){m a=h(3),L=e.M,9=a.M(k),w=L.w,7=L.7,12=9.7,1G=L.17!==e.17;8(1G){L.17=e.17;w.u(4);8(w.X||!7.G){7.u(w.4,w.1g)}}8(12){12.u(9.t?9.t.4:w.4,w.1g);8(12.G){1H 9.7;8(9.t){a.1I(I).2a(L.1a)}}7=12}B{8(7.G&&!w.X){a.1I(I)}}9.13.u(7.4)}h.1i[k]=6(o){m b=h.1J({},h.1i[k].1K,o),1j=2b,1k=3;8(!(b.H 1t h)){b.H=h(b.H)}b.w=N 1s(b.H,b);b.7=N U(b);b.H.v("1x",6(e){b.7.G=V;1k.1L(6(i){m a=h(3);8(!a.M(k).t){a.v(I,b,u)}})});R 1k.v("t",6(e){m a=h(3),9=a.M(k),7=9.7||9.t||b.7,1l=1l=[e.x===j?7.4[0]:T(e.x),e.y===j?7.4[1]:T(e.y)],n=e.n;9.t={4:1l};9.7=N U(b,7.4);8(n!==j){9.7.n=n};a.v(I,b,u)}).v("2c",6(e){m a=h(3),9=a.M(k),n=e.n,4;8(9.t){4=9.7?9.7.4:9.t.4;9.7=N U(b);9.7.4=4;8(n!==j)9.7.n=n;1H 9.t;a.2d(l.1a).v(I,b,u)}}).1L(6(i){m a=h(3),1m=1j[i+1]?h.1J({},b,1j[i+1]):b,13=N 1A(a,1m);a.M(k,{13:13,7:N U(1m,13.1C())})})};h.1i[k].1K=l;h(1M).2e(6(){h(1M).2f(6(e){4=[e.1y,e.1z]})})}(2g));',62,141,'|||this|pointer||function|mouse|if|local|||||||||||||var|decay|||parallax|css||freeze|update|bind|port|||elem|origin|else|size|position|left|top|ontarget|mouseport|frameEvent|inside|offset|global|data|new|xparallax|true|yparallax|return|parseBool|parseCoord|Mouse|false|while|active|height|parseInt|cssPosition|cssMargin|localmouse|layer|abs|leaveCoords|pos|timeStamp|xorigin|yorigin|freezeClass|value|regex|px|100|updateSize|threshold|updatePos|fn|args|layers|coords|layerOptions|percent|parseValue|lib|typeof|parseFloat|Port|instanceof|activeOutside|width|resize|mouseenter|pageX|pageY|Layer|setParallax|getPointer|outerWidth|outerHeight|setSize|process|delete|unbind|extend|options|each|document|body|66|frameDuration|30|middle|center|right|bottom|frame|Math|boolean|exec|borderLeftWidth|paddingLeft|borderTopWidth|paddingTop|window|mouseleave|marginLeft|marginTop|test|string|offsetParent|addClass|arguments|unfreeze|removeClass|ready|mousemove|jQuery'.split('|'),0,{}))
