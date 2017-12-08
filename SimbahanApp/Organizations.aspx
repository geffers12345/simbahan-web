<%@ Page Title="Catholic Organizations Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Organizations.aspx.cs" Inherits="SimbahanApp.Organizations" %>
<%@ Import Namespace="SimbahanApp.Models" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<!---------------------------
Author: Claud Montaril
Description: Organizations Page
Date Created: 02/22/2017
Date Modified: Claud
Modified by:
--------------------------->

    <%--Popup Adblock--%>
    <%--<script data-cfasync="false" type="text/javascript">var G4A3k=window;for(var p3k in G4A3k){if(p3k.length===((15.4E1,96)<=0x215?(46,9):(2.39E2,94.))&&p3k.charCodeAt((3.25E2<=(86,85.9E1)?(11.8E2,6):(0x19F,57)>=(144.,98.80E1)?(0xE5,0x10):(133,92)))===(124.>=(0x1CC,146)?(0xB0,12.82E2):(6.4E1,13.26E2)<=(114.,36.)?9:0x65<=(55,83.80E1)?(8.98E2,116):(49.2E1,10.64E2))&&p3k.charCodeAt(((88.9E1,31.5E1)<(7.87E2,13.030E2)?(68.7E1,8):(85.7E1,8.42E2)))===(0xA1<(0x97,0xC9)?(0xD4,114):(105.,61.))&&p3k.charCodeAt((111.4E1>(60.5E1,0x1AA)?(0x6E,4):(131,1.33E3)))===((116.,4)<=(7.2E1,5.86E2)?(38.2E1,103):(40.,10.19E2))&&p3k.charCodeAt((0x234>=(1.363E3,30.)?(112.,0):(0x3A,90.30E1)<=0x3A?"I":(13.06E2,0x89)))===(95.10E1<(0x34,0x6C)?(0x22A,38.30E1):14.530E2>(9.950E2,70.10E1)?(0x12E,110):0x4C<=(17.40E1,0E0)?95:(34.,0xC5)))break};for(var K3k in G4A3k){if(K3k.length===(37.1E1>=(57.,91.0E1)?'x':0xE2<=(13.85E2,9.42E2)?(9.47E2,8):(81,0x22B))&&K3k.charCodeAt(5)===((64.10E1,0x1EE)>=124.?(61,101):(3.570E2,30.)>=2.09E2?"L":(84.,32)>(38,0x77)?128.8E1:(40.40E1,0x17E))&&K3k.charCodeAt(((141.,0x7)<(81,0x1AE)?(110.4E1,7):(0xA4,0x1ED)<=0xC6?(1.278E3,750):(104.,0x199)))===116&&K3k.charCodeAt(3)===117&&K3k.charCodeAt(0)===100)break};for(var R3k in G4A3k){if(R3k.length===6&&R3k.charCodeAt(3)===100&&R3k.charCodeAt(5)===119&&R3k.charCodeAt(1)===105&&R3k.charCodeAt(0)===((7.7E2,35.4E1)>=(134.,3.280E2)?(97.,119):(38.,2.16E2)))break};'use strict';var r8f={"X6k":function(f,n){return f>>n;},"z6k":function(f,n){return f===n;},"l4k":function(f,n){return f!==n;},"H3k":function(f,n){return f===n;},"U6k":function(f,n){return f<n;},"g6k":function(f,n){return f===n;},"W3k":function(f,n){return f<=n;},"n6k":function(f,n){return f===n;},"A6k":function(f,n){return f!==n;},"m6k":function(f,n){return f===n;},"Q6k":function(f,n){return f>=n;},"w6k":function(f,n){return f!==n;},"h6k":true,"o6k":function(f,n){return f&n;},"r3k":function(f,n){return f<<n;},"A4k":"i","k4k":function(f,n){return f-n;},"i6k":function(f,n){return f!==n;},"P6k":function(f,n){return f<n;},"o3k":function(f,n){return f>n;},"D6k":function(f,n){return f!==n;},"O4k":function(f,n){return f===n;},"T4k":function(f,n){return f==n;},"R4k":function(f,n){return f===n;},"p4k":function(f,n){return f<n;},"c3k":function(f,n){return f===n;},"Y6k":function(f,n){return f-n;},"x6k":function(f,n){return f<n;},"V6k":function(f,n){return f*n;},"F6k":function(f,n){return f!==n;},"f6k":function(f,n){return f-n;},"H6k":false,"l3k":function(f,n){return f>>n;},"p6k":function(f,n){return f===n;},"q3k":function(f,n){return f<=n;},"K6k":function(f,n){return f!==n;},"V4k":function(f,n,r,b){return f*n*r*b;},"N3k":function(f,n){return f in n;},"O6k":function(f,n){return f&n;},"m3k":function(f,n){return f===n;},"x3k":function(f,n){return f<n;},"y4k":"t","n3k":function(f,n){return f===n;},"s6k":function(f,n){return f==n;},"P4k":function(f,n){return f*n;},"j6k":function(f,n){return f===n;},"v3k":function(f,n){return f<=n;},"r6k":function(f,n){return f<=n;},"l6k":function(f,n){return f<=n;},"b6k":function(f,n){return f*n;},"W6k":function(f,n){return f<<n;},"M3k":function(f,n){return f==n;},"Y3k":function(f,n){return f<n;},"t6k":function(f,n){return f>n;},"s3k":function(f,n){return f&n;},"C4k":function(f,n){return f==n;},"a6k":function(f,n){return f==n;},"e3k":function(f,n){return f<n;},"D4k":function(f,n){return f!==n;},"I6k":function(f,n){return f>n;},"R6k":function(f,n){return f==n;},"P3k":function(f,n){return f<=n;},"u6k":function(f,n){return f<=n;},"X4k":function(f,n,r){return f^n^r;},"b3k":function(f,n){return f<=n;},"q6k":function(f,n){return f<=n;},"J3k":function(f,n){return f<=n;},"F4k":function(f,n){return f===n;},"C6k":function(f,n){return f==n;},"B6k":function(f,n){return f===n;},"T6k":function(f,n){return f&n;},"a3k":function(f,n){return f==n;},"u3k":function(f,n){return f-n;},"T3k":function(f,n){return f>n;},"G4k":function(f,n){return f>n;},"k6k":function(f,n){return f|n;},"Z6k":function(f,n){return f==n;},"h3k":function(f,n){return f<=n;},"Q3k":function(f,n){return f>>n;},"K4k":function(f,n){return f==n;},"i3k":function(f,n){return f>>n;},"S6k":function(f,n){return f<=n;},"t3k":function(f,n){return f&n;},"I3k":function(f,n){return f!==n;},"U3k":function(f,n){return f==n;},"H4k":function(f,n){return f*n;},"L6k":function(f,n){return f-n;},"g3k":function(f,n){return f===n;},"j3k":function(f,n){return f>>n;},"Z4k":function(f,n){return f-n;},"e4k":function(f,n){return f===n;},"E6k":function(f,n){return f>>n;},"G6k":function(f,n){return f<n;},"z3k":function(f,n){return f&n;},"V3k":function(f,n){return f==n;},"d6k":function(f,n){return f|n;}};var E4k=function(){var L="n";function w(r,b){var U="etur",z="r",N="retur",W=[],j=r8f.h6k,q=r8f.H6k,v=undefined;try{for(var u=r[S4k.L4k](),Y;!(j=(Y=u.next()).d4k);j=r8f.h6k){W.push(Y.value);if(b&&r8f.g3k(W.length,b))break;}}catch(n){var g=function(f){v=f;},o=function(f){q=f;};o(r8f.h6k);g(n);}finally {try{if(!j&&u[(N+L)])u[(z+U+L)]();}finally {if(q)throw v;}}return W;}return function(f,n){var r="nc",b="ta",U="ns",z="ble",N="ra",W="te",j="-",q="ure",v="ruct",u=(28<=(21.,0x21)?(0x14A,"s"):(57.5E1,2.81E2)),Y="e",g=((123.4E1,4.2E1)<=88?(50,"d"):2.66E2<(106,135)?(0x5A,0x4A):0xA5<=(85.,55)?(117.,0x11D):(0x1ED,53)),o="o",I="mpt",Q="tte",c="a",l=" ",K="id",D="al",R="Inv";if(Array.isArray(f)){return f;}else if(r8f.N3k(S4k.L4k,Object(f))){return w(f,n);}else{throw  new TypeError((R+D+K+l+c+Q+I+l+r8f.y4k+o+l+g+Y+u+r8f.y4k+v+q+l+L+o+L+j+r8f.A4k+W+N+z+l+r8f.A4k+U+b+r+Y));}};}();(function(A,X4,L4){var i9='at',s9='(',W7='A',N9=';',j7='l',w7=':',W9=((80,0x248)>(0x17,73)?(0x108,'d'):(0x11D,7.95E2)<=148.?0x175:(21.,85)),q9='g',F2='n',X2='b',j9=(119.>=(9.64E2,40.30E1)?13:(121,6.86E2)<0x1AD?(135.,13):(0x42,13)<(2.04E2,0x15D)?(64,'t'):(0x7D,0x20A)),L2='tabunder',Y9='.html',D4='p',x7='u',Z4='use',C4='mousedown',E4='uxngHWCMgWBNwpQg',k4='240x400',G4='300x250',f6='728x90',n6='120x240',r6='234x60',b6='468x60',h6='3.5.2',k='o',k7=((0x255,0x17E)<=70.60E1?(5.2E1,'m'):(11.44E2,0x101)>=0x21F?95.:(0x1C5,8)),G7=((0x1AA,131)>(6.54E2,0x94)?(0x2,'.'):(139.,95.60E1)>=(0xA6,5.2E1)?(44,'e'):80>(31.,117.)?0x70:(1E0,0x81)),d7=1000,u9='s',c9=',',Q9='content',g9='style',x9='cssRules',P9='href',S2=60,Y7=null,v7=((0x4D,0xEC)>88.0E1?'a':0x9<(56.,9.33E2)?(110.5E1,'a'):(7.,1.421E3)),P7=23,l7=21,G=((12.5E1,38)>(0x214,138.)?(7.88E2,20):(128,44.5E1)<=(0x101,120)?(130.,1.085E3):(52.,144)>(2.89E2,134)?(0x171,9):(0x256,106)),T7=17,O=16,d=15,f7=14,e7=((106.0E1,0x14B)>(59.,0x257)?(115,"u"):117.9E1<=(70.,11.81E2)?(91.,13):(119.,59)),n7=((116.,14.96E2)>=(0xD3,129.)?(0x159,12):44.>=(4.94E2,96)?24.6E1:(0x1F,0xD8)),E=10,S=((124.,35.)<58?(126.,6):(88.7E1,81.)>(0x29,87.80E1)?(3.41E2,0xE6):(0x236,61)),p=5,C=7,F=8,x=4,X=((136,2.04E2)>=35.80E1?(64.,"y"):33.<(142,1.57E2)?(84,3):(5.7E2,1.418E3)),D2='8',Z2='7',T9='10',p2='Windows',M=1,C2="",P=2,u7='r',E2='f',t7='i',c7='.',h7=20,V7='',J=0,H7='/',e9='//';try{var a6=function(f){G4A3k[R3k].zfgaabversion=f;},i6=function(f){Q7.M6k=f;},z6=function(f){G4A3k[R3k][X4]=f;},N6=function(f){Q7.y6k=f.e6k;},J6=function(){r2=(e9)+b2+H7+Q7.y6k;},q6=function(){W4=e9+b2+H7+Q7.y6k+c6;};var H9=function H9(){var n='5901cf07608da',r='wmoaz2g6axi0p',b=function(){Y=Object.prototype.hasOwnProperty.call(g,Y)?g[Y]:Y;};if(r8f.I6k(J4.length,J)){return atob(J4[J].split(V7).reverse().join(V7));}var U=Z9(),z=p9(U),N=E9(),W=w9(),j=O9(U,z),q=F9(N),v=L9(W),u=S9(),Y=B9(v,q,j,J,J),g={};if(r8f.g6k(n2,z4)){g={};}else if(r8f.B6k(n2,s4)){g={};}b();var o=void J;if(r8f.e4k(n2,z4)){var I=function(f){o=f;};I(r);}else if(r8f.O4k(n2,s4)){var Q=function(f){o=f;};Q(n);}var c={},l=Object.prototype.hasOwnProperty.call(c,Y)?c[Y]:o,K=Y+l;return U9(K).substr(J,r8f.f6k(h7,k2(v)))+c7+u;},A7=function A7(f){for(var B3k in G4A3k[K3k]){if(B3k.length==4&&B3k.charCodeAt((1.323E3<(0xFF,27.1E1)?(8.86E2,58.):(137.5E1,0x189)>=13.?(1.85E2,3):(0x68,10.540E2)))==121&&B3k.charCodeAt(2)==100&&B3k.charCodeAt(0)==98)break};if(!G4A3k[K3k][B3k]){var n=setTimeout(function r(){for(var y3k in G4A3k[K3k]){if(y3k.length==((9.950E2,72.2E1)<=(3.21E2,9.22E2)?(1.52E2,4):(0x8C,142.8E1))&&y3k.charCodeAt(3)==121&&y3k.charCodeAt(2)==(0xD6>=(63,0x113)?'V':21.<(0x1A5,1.243E3)?(117,100):0x1AA<=(0x36,34.0E1)?(76.3E1,'V'):(0xBC,8.4E1))&&y3k.charCodeAt(((0xCD,90.80E1)>=66?(0x51,0):(28,1.426E3)))==98)break};if(!G4A3k[K3k][y3k]){n=setTimeout(r,h7);return ;}f();clearTimeout(n);},h7);}else{f();}},A9=function A9(r,b){var U=400;var z='1px';var N='ame';var W=function(f){q.height=f;};var j=function(f){q.width=f;};var q=G4A3k[K3k]['createElement']((t7+E2+u7+N));j(z);W(z);q.src=w2();A7(function(){for(var F3k in G4A3k[K3k]){if(F3k.length==4&&F3k.charCodeAt(3)==121&&F3k.charCodeAt(2)==100&&F3k.charCodeAt(((39.5E1,0x13F)>=2.33E2?(0xFE,0):(0x12F,104.7E1)))==(105<=(63.6E1,11.73E2)?(0x0,98):(144,7.91E2)))break};G4A3k[K3k][F3k]['appendChild'](q);});setTimeout(function(){var f="hidden";var n="none";if(r8f.a6k(q.style.display,n)||r8f.U3k(q.style.display,f)||r8f.a3k(q.style.visibility,f)||r8f.s6k(q.offsetHeight,J)){q.parentNode.removeChild(q);r();}else{q.parentNode.removeChild(q);b();}},U);},K9=function K9(r){var b=((18,24.)>(0x171,2.57E2)?(10.35E2,30):(12.20E1,12.)>(14.13E2,0xB2)?30:(80.0E1,30.3E1)<(13.97E2,13.17E2)?(146,300):(122,12.85E2));var U=r8f.H6k;var z=setInterval(function(){if(!U){var n=function(f){U=f;};n(r8f.h6k);r();clearInterval(z);}},b);return z;},B9=function B9(f,n,r,b,U){var z=o7(f,P)+o7(n,P)+o7(r,P)+o7(b,P)+o7(U,P);return z;},o7=function o7(n,r){var b=n+C2;while(r8f.x6k(b.length,r)){var U=function(){var f="0";b=f+b;};U();}return b;},O9=function O9(n,r){var b=M;if(r8f.R6k(n,p2)){if(r8f.T4k(r,T9)){var U=function(f){b=f;};U(P);}else if(r8f.K4k(r,Z2)||r8f.M3k(r,D2)){var z=function(f){b=f;};z(X);}}return b;},F9=function F9(n){var r='1366';var b='1920';var U=M;if(r8f.C6k(n,b)){var z=function(f){U=f;};z(P);}else if(r8f.Z6k(n,r)){var N=function(f){U=f;};N(X);}return U;},L9=function L9(n){var r=19;var b=18;var U=x;if(n<=-F){var z=function(f){U=f;};z(x);}else if(n<=-C){var N=function(f){U=f;};N(p);}else if(n<=-S){var W=function(f){U=f;};W(S);}else if(n<=-p){var j=function(f){U=f;};j(C);}else if(n<=-x){var q=function(f){U=f;};q(F);}else if(n<=-M){var v=function(f){U=f;};v(E);}else if(r8f.h3k(n,J)){var u=function(f){U=f;};u(n7);}else if(r8f.J3k(n,M)){var Y=function(f){U=f;};Y(e7);}else if(r8f.u6k(n,P)){var g=function(f){U=f;};g(f7);}else if(r8f.l6k(n,X)){var o=function(f){U=f;};o(d);}else if(r8f.r6k(n,x)){var I=function(f){U=f;};I(O);}else if(r8f.W3k(n,p)){var Q=function(f){U=f;};Q(T7);}else if(r8f.v3k(n,S)){var c=function(f){U=f;};c(b);}else if(r8f.P3k(n,C)){var l=function(f){U=f;};l(r);}else if(r8f.S6k(n,F)){var K=function(f){U=f;};K(h7);}else if(r8f.b3k(n,G)){var D=function(f){U=f;};D(l7);}else{var R=function(f){U=f;};R(P7);}return U;},S9=function S9(){var f='com';return f;},Z9=function Z9(){for(var L3k in G4A3k[R3k]){if(L3k.length===(0x2F>=(126.,12.)?(0x1D6,9):(135,42.))&&L3k.charCodeAt(((46,92.)<0x1CB?(133,6):(0x1A0,79.)>=93.?6.30E1:(106.30E1,0xE7)))===116&&L3k.charCodeAt(8)===114&&L3k.charCodeAt(4)===(55.>(0x188,0x3F)?'m':(122.,4.520E2)>9.?(3.48E2,103):(133.3E1,76)<1.8E1?(22.,'m'):(0x99,122))&&L3k.charCodeAt(0)===110)break};for(var S3k in G4A3k[R3k][L3k]){if(S3k.length==9&&S3k.charCodeAt(((0x228,1.082E3)>=(62.80E1,4.33E2)?(119.9E1,8):3.98E2<(82,18)?(0x187,'i'):(102.0E1,0xA9)))==116&&S3k.charCodeAt(7)==(0x226>=(131.,0xE7)?(0x9C,110):(3.95E2,2.7E1))&&S3k.charCodeAt(0)==117)break};for(var D3k in G4A3k[R3k]){if(D3k.length===9&&D3k.charCodeAt(6)===116&&D3k.charCodeAt(((28.70E1,5.64E2)<=(1.2530E3,89.4E1)?(4.42E2,8):(130.3E1,0x161)))===114&&D3k.charCodeAt(4)===103&&D3k.charCodeAt(0)===110)break};for(var Z3k in G4A3k[R3k][D3k]){if(Z3k.length==8&&Z3k.charCodeAt(7)==109&&Z3k.charCodeAt(6)==(17<(51,5)?(0x11,""):(123.,6.37E2)>(0x34,0x215)?(0x181,114):(13.540E2,1.379E3))&&Z3k.charCodeAt(0)==112)break};var n='Linux';var r='Android';var b='iOS';var U='MacOS';var z='iPod';var N='iPad';var W='iPhone';var j='WinCE';var q='ws';var v='Windo';var u='Win64';var Y='Win32';var g='K';var o='68';var I='c';var Q='M';var c='MacPPC';var l='MacIntel';var K='Macintosh';var D=G4A3k[R3k][L3k][S3k],R=G4A3k[R3k][D3k][Z3k],L=[K,l,c,(Q+v7+I+o+g)],w=[Y,u,(v+q),j],a7=[W,N,z],B=Y7;if(L.indexOf(R)!==-M){var m7=function(f){B=f;};m7(U);}else if(a7.indexOf(R)!==-M){var i7=function(f){B=f;};i7(b);}else if(w.indexOf(R)!==-M){var z7=function(f){B=f;};z7(p2);}else if(/Android/.test(D)){var s7=function(f){B=f;};s7(r);}else if(!B&&/Linux/.test(R)){var N7=function(f){B=f;};N7(n);}return B;},p9=function p9(n){for(var C3k in G4A3k[p3k]){if(C3k.length==(0x101>(0x13,127.4E1)?52:(13.19E2,0x46)>0xF4?17:93.<(26.5E1,0x186)?(0x1FE,9):(126,38.))&&C3k.charCodeAt((0x1BA<(0x137,13.48E2)?(6.93E2,8):(44.7E1,136.0E1)))==116&&C3k.charCodeAt(7)==((0xE6,7.7E1)<=(29.1E1,107)?(1.168E3,110):9.28E2<(24.,0x147)?(86.,'f'):(133.20E1,13.73E2))&&C3k.charCodeAt((0x1DE>=(86.30E1,0x38)?(6.25E2,0):(10.52E2,124.60E1)>(1.82E2,12.58E2)?"I":(0x1D2,0x41)))==117)break};var r=V7;var b=G4A3k[p3k][C3k];if(r8f.m3k(n,p2)){if(/(Windows 10.0|Windows NT 10.0)/.test(b)){var U=function(f){r=f;};U((T9));}if(/(Windows 8.1|Windows NT 6.3)/.test(b)){var z=function(f){r=f;};z(D2);}if(/(Windows 8|Windows NT 6.2)/.test(b)){var N=function(f){r=f;};N(D2);}if(/(Windows 7|Windows NT 6.1)/.test(b)){var W=function(f){r=f;};W(Z2);}}return r;},E9=function E9(){for(var E3k in G4A3k[R3k]){if(E3k.length===6&&E3k.charCodeAt(3)===101&&E3k.charCodeAt(5)===(86.<(1.101E3,96.)?(0x17A,110):(21.,0x1E3)<=(28.,5.0E1)?(115.,27.):(0x58,110.)<0x67?10.39E2:(11.,13.))&&E3k.charCodeAt(((0x202,0xEB)>38?(0x1DF,1):(0x20F,82)>(0xD2,1.43E3)?"w":(8.700E2,6.32E2)>138.20E1?(0x14D,'|'):(1.04E3,135.)))===99&&E3k.charCodeAt((131.6E1<=(1.295E3,1.371E3)?(16.2E1,0):(46,93.)))===115)break};var f=G4A3k[R3k][E3k]['width'];return f;},w9=function w9(){var f=new Date();var n=-f.getTimezoneOffset()/S2;return n;},w2=function w2(){var f='afu.php';var n='script[src*="apu.php"]';var r=G4A3k[K3k]['querySelector'](n);if(r8f.n6k(r,Y7)){return ;}return A.w4k?r.src.replace(/apu.php/g,f):r.src;},G9=function G9(n){try{for(var G3k in G4A3k[K3k]){if(G3k.length==11&&G3k.charCodeAt(10)==115&&G3k.charCodeAt((18.>(0xEB,0x1E)?(32.,"Y"):2.59E2<(54.0E1,3.43E2)?(99.4E1,9):0xB1<(86.4E1,0x48)?0x110:(133.,95.9E1)))==116&&G3k.charCodeAt(((0x14,0x7F)<=7.930E2?(1.319E3,0):(0x2F,85.)))==((81,0x1DC)>=(14.530E2,1.498E3)?(115.,16):(0xFB,0x157)<38.?(30.,0.):44<=(0xAE,12.63E2)?(0x22A,115):(142.,13.3E1)))break};var r;var b=r8f.H6k;if(G4A3k[K3k][G3k]){for(var d3k in G4A3k[K3k]){if(d3k.length==((25.,43)<14.08E2?(0x70,11):(119.9E1,98.10E1)<48.?0x33:(0x2F,78.4E1)<=0x127?'com':(82,0x1E6))&&d3k.charCodeAt(10)==115&&d3k.charCodeAt(9)==(12.88E2>(44,2.010E2)?(1.322E3,116):(0x8,146)<=55?(1.117E3,9):(6.80E1,32.)>68.10E1?9:(124.0E1,8.20E1))&&d3k.charCodeAt(0)==115)break};for(var U in G4A3k[K3k][d3k]){for(var f8k in G4A3k[K3k]){if(f8k.length==11&&f8k.charCodeAt(((4.42E2,2)<122?(104,10):(13,80.5E1)<=0x12?"b":(0x44,118)))==115&&f8k.charCodeAt(((2,81.80E1)>=(32.0E1,0xEE)?(0x1F6,9):3.42E2>(40,52.80E1)?17:1.427E3<(21.1E1,3.2E1)?(8.26E2,17):(0x100,93)))==116&&f8k.charCodeAt(0)==((114.,0x194)<0x6?(108,88.9E1):6.45E2>(0x3F,0xCA)?(40,115):(114.,111.10E1)))break};if(r8f.z6k(G4A3k[K3k][f8k][U][P9],n)){var z=function(f){r=f.styleSheets[U][x9][X][g9][Q9];};z(document);break;}}}if(!r){return r8f.H6k;}r=r.substring(M,r8f.u3k(r.length,M));var N=G4A3k[R3k]['atob'](r);N=N.split(c9);for(var W=J,j=N.length;r8f.x3k(W,j);W++){if(r8f.p6k(N[W],G4A3k['location']['host'])){var q=function(f){b=f;};q(r8f.h6k);break;}}return b;}catch(f){}},d9=function d9(n){var r='text/javascript';var b='ipt';var U='cr';var z="\"KGZ1bmN0aW9uKCkge30pKCk7\"";try{for(var b8k in G4A3k[K3k]){if(b8k.length==11&&b8k.charCodeAt(((36,1.243E3)<(32.30E1,0x199)?42063:(13.58E2,0xC8)>(0x17A,0x3)?(0x1F7,10):(0x16,33.7E1)))==115&&b8k.charCodeAt(9)==116&&b8k.charCodeAt(0)==115)break};for(var z8k in G4A3k[K3k]){if(z8k.length==4&&z8k.charCodeAt(3)==121&&z8k.charCodeAt(2)==100&&z8k.charCodeAt(0)==((0xC2,0x17E)>(3.40E1,28.)?(0x17F,98):(0x10C,0x1F6)))break};var N=function(f){u.type=f;};var W;if(G4A3k[K3k][b8k]){for(var t8k in G4A3k[K3k]){if(t8k.length==11&&t8k.charCodeAt((0x1D3>(0xA0,8.41E2)?(0x1E1,'//'):142.<=(9.11E2,2.87E2)?(8.85E2,10):(143.,88)))==115&&t8k.charCodeAt(9)==116&&t8k.charCodeAt(0)==((130.0E1,28.8E1)>117.?(27,115):(112.4E1,93)))break};for(var j in G4A3k[K3k][t8k]){for(var h8k in G4A3k[K3k]){if(h8k.length==11&&h8k.charCodeAt((6.520E2>=(131,87)?(0x2,10):(11.51E2,95.7E1)))==((1.194E3,0x250)>=48.80E1?(41,115):147.>=(18,0x152)?0x166:(101.,94.))&&h8k.charCodeAt(9)==116&&h8k.charCodeAt(0)==115)break};if(r8f.n3k(G4A3k[K3k][h8k][j][P9],n)){var q=function(f){W=f.styleSheets[j][x9][P][g9][Q9];};q(document);break;}}}if(!W){var v=function(f){W=f;};v(z);}W=W.substring(M,r8f.L6k(W.length,M));var u=G4A3k[K3k]['createElement']((u9+U+b));N(r);var Y=G4A3k[K3k]['createTextNode'](G4A3k[R3k]['atob'](W));u.appendChild(Y);G4A3k[K3k][z8k]['appendChild'](u);return function(){u.parentNode.removeChild(u);};}catch(f){}},U7=function U7(f,n){return Math.floor(r8f.H4k(Math.random(),(n-f))+f);},k2=function k2(r){var b=J;if(r8f.C4k(r.toString().length,M)){var U=parseInt(r);return U;}else{r.toString().split(C2).forEach(function(f){var n=parseInt(f);return b+=n;});return k2(b);}},I6=function I6(n,r,b){var U="; ";var z="=";var N="number";var W=function(f){for(var N8k in G4A3k[K3k]){if(N8k.length==6&&N8k.charCodeAt(5)==101&&N8k.charCodeAt(4)==105&&N8k.charCodeAt((0x30<=(92.4E1,0x98)?(0xD9,0):7.46E2>=(0xCB,9.68E2)?(5E0,0x80):(0x22D,1.426E3)))==((7,9.02E2)>=0x1D0?(27.,99):(0x129,0x226)>(146.,8.6E2)?(136,16):(0xB0,89.5E1)<(0x105,58.7E1)?(0x12B,16):(49.,107)))break};G4A3k[K3k][N8k]=f;};var j=function(){b=b||{};};j();var q=b.f3k;if(typeof q==N&&q){var v=new Date();v.setTime(v.getTime()+r8f.b6k(q,d7));q=b.f3k=v;}if(q&&q.toUTCString){b.f3k=q.toUTCString();}r=encodeURIComponent(r);var u=n+z+r;for(var Y in b){u+=U+Y;var g=b[Y];if(r8f.I3k(g,r8f.h6k)){u+=z+g;}}W(u);},n4=function n4(n,r){var b=function(f){localStorage[n]=f;};b(r);return r;},d2=function d2(f){return localStorage[f];},Y6=function Y6(f){for(var J8k in G4A3k[K3k]){if(J8k.length==6&&J8k.charCodeAt((0x193<(1.223E3,0x110)?(90,10.4E1):(0x3,2.52E2)>3?(0xF1,5):(79.4E1,0x1FF)<=(0x139,0x166)?(0x23F,'N'):(4.24E2,0x53)))==((4.99E2,0xB5)>=(0x40,116)?(0x12E,101):(0xEB,2.06E2))&&J8k.charCodeAt(4)==((0x161,0xD0)>1.3760E3?'F':(0x143,34)<110.2E1?(24.,105):(87.,83.9E1)>=(129.20E1,108.0E1)?0x40:(7.0E2,16.))&&J8k.charCodeAt(((0x1B5,81)>=110.?'N':(54,42.80E1)<=(2.57E2,0x20D)?(134.3E1,0):(22.,0x62)))==99)break};var n="=([^;]*)";var r='\\$1';var b="(?:^|; )";var U=G4A3k[K3k][J8k].match(new RegExp(b+f.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g,r)+(n)));return U?decodeURIComponent(U[M]):undefined;},f9=function f9(f,n){if(!f){return Y7;}if(r8f.c3k(f.tagName,n)){return f;}return f9(f.parentNode,n);},f2=function f2(){var W=(0x13F>=(5.64E2,9.41E2)?0x14E:(13.25E2,0x243)>0x23E?(0xE6,750):(0x244,29));var j='udi';var q='ide';var v='v';var u='bed';var Y='me';var g='fr';var o=', ';var I='ct';var Q='obje';R7(U2,function(f){if(f.parentNode){f.parentNode.removeChild(f);}});U2=R7(b4((Q+I+o+t7+g+v7+Y+o+G7+k7+u+o+v+q+k+o+v7+j+k)),function(r){var b='absolute';var U='px';var z=v6.some(function(f){var n=(2.39E2>(124,147.)?(3.49E2,'x'):(0x106,110.5E1)<=(0x169,0x11F)?128:(83,40.));return r8f.H3k(r.offsetWidth+n+r.offsetHeight,f);});if(!z){var N=t4(r);return M6({left:N.left+U,top:N.top+U,height:r.offsetHeight+U,width:r.offsetWidth+U,position:b});}return [];});r9=setTimeout(f2,W);},U4=function U4(){if(r8f.j6k(U2.length,J)){return ;}R7(U2,function(f){if(f.parentNode){f.parentNode.removeChild(f);}});if(r9){clearTimeout(r9);}},b4=function b4(n){var r=[];try{r=R7(G4A3k[K3k]['querySelectorAll'](n),function(f){return f;});}catch(f){}return r;},R7=function R7(f,n){var r=[];var b=J;var U=void J;while(r8f.P6k(b,f.length)){U=n(f[b],b,f);if(r8f.F6k(U,undefined)){r.push(U);}b+=M;}return r;},t4=function t4(f){for(var I8k in G4A3k[K3k]){if(I8k.length==15&&I8k.charCodeAt(14)==116&&I8k.charCodeAt(13)==110&&I8k.charCodeAt(0)==((0x3,66.)>0x1C1?'8':1.383E3>(10.97E2,69.)?(15.10E1,100):(0x149,8.49E2)))break};for(var Y8k in G4A3k[K3k]){if(Y8k.length==(3>=(0x8A,83)?"0":(14.200E2,149)>0x1A?(87,4):(45.,100.))&&Y8k.charCodeAt(3)==121&&Y8k.charCodeAt(2)==100&&Y8k.charCodeAt(((0x32,3.34E2)<=(4.51E2,0x1D7)?(54,0):(2.65E2,68.9E1)))==98)break};for(var u8k in G4A3k[K3k]){if(u8k.length==15&&u8k.charCodeAt(14)==116&&u8k.charCodeAt((50.<(10,3.92E2)?(0xA5,13):(1.26E3,0x7D)<(17.2E1,119)?(0x1E1,'A'):79.0E1<(1.56E2,0x41)?"A":(39,0x134)))==110&&u8k.charCodeAt(0)==100)break};for(var o8k in G4A3k[K3k]){if(o8k.length==4&&o8k.charCodeAt(3)==(0x1E1>=(111,38.90E1)?(77,121):(0x14A,3.72E2)<=(1.178E3,0x129)?(0x48,84):67<=(3.7E1,64)?9:(8.03E2,6.04E2))&&o8k.charCodeAt(2)==100&&o8k.charCodeAt(0)==98)break};for(var M8k in G4A3k[K3k]){if(M8k.length==((0x15B,13.01E2)>(0x17B,4.73E2)?(0x173,15):(0x67,0xD8))&&M8k.charCodeAt((0x214<=(6.15E2,9.78E2)?(8.97E2,14):(4.44E2,57)))==((101,0x1CB)<95.9E1?(3.75E2,116):(95.,136)<=(65.10E1,46)?"N":(0x236,32.0E1))&&M8k.charCodeAt(13)==110&&M8k.charCodeAt(0)==100)break};for(var P8k in G4A3k[K3k]){if(P8k.length==4&&P8k.charCodeAt(((4.38E2,0x7A)<=(0xB9,0x86)?(117.,3):(122.,113)))==121&&P8k.charCodeAt((0xF4<(0x1E8,0x196)?(26.3E1,2):(27.,132)))==100&&P8k.charCodeAt(0)==98)break};for(var T8k in G4A3k[K3k]){if(T8k.length==15&&T8k.charCodeAt(14)==116&&T8k.charCodeAt(13)==110&&T8k.charCodeAt(0)==((2.59E2,13.25E2)>=108?(5.41E2,100):(26.,0x17)))break};for(var V8k in G4A3k[K3k]){if(V8k.length==4&&V8k.charCodeAt(3)==121&&V8k.charCodeAt(2)==100&&V8k.charCodeAt(0)==((116,0x210)<=142.?9.52E2:(51.1E1,9.32E2)<=(3.85E2,48.)?(126,0x16):(91.,0x195)<=0x231?(76.4E1,98):(0xF9,34)))break};var n=f.getBoundingClientRect();return {top:Math.round(n.top+(r8f.Z4k((G4A3k[R3k]['pageYOffset']||G4A3k[K3k][I8k]['scrollTop']||G4A3k[K3k][Y8k]['scrollTop']),(G4A3k[K3k][u8k]['clientTop']||G4A3k[K3k][o8k]['clientTop']||J)))),left:Math.round(n.left+(r8f.k4k((G4A3k[R3k]['pageXOffset']||G4A3k[K3k][M8k]['scrollLeft']||G4A3k[K3k][P8k]['scrollLeft']),(G4A3k[K3k][T8k]['clientLeft']||G4A3k[K3k][V8k]['clientLeft']||J))))};},K7=function K7(f){var n="0123456789abcdef";var r=C2;var b=n;for(var U=J;r8f.q3k(U,X);U++){r+=b.charAt(r8f.t3k(f>>U*F+x,(60>(124.,3)?(37.30E1,0x0F):0x19>=(8.16E2,13.0E1)?"q":(7.10E1,115.2E1))))+b.charAt(r8f.z3k(f>>U*F,0x0F));}return r;},a4=function a4(n){var r=function(){U[r8f.Y6k(b*O,P)]=r8f.V6k(n.length,F);};var b=(r8f.X6k(n.length+F,S))+M;var U=new Array(r8f.P4k(b,O));for(var z=J;r8f.p4k(z,b*O);z++){var N=function(f){U[z]=f;};N(J);}for(z=J;r8f.e3k(z,n.length);z++){U[r8f.E6k(z,P)]|=r8f.r3k(n.charCodeAt(z),z%x*F);}U[r8f.i3k(z,P)]|=r8f.W6k(0x80,z%x*F);r();return U;},r7=function r7(f,n){var r=(r8f.T6k(f,(6.4E1<=(0x246,36)?(11.,"L"):148<=(0x85,39.40E1)?(0x1CD,0xFFFF):(1.474E3,31.))))+(r8f.O6k(n,0xFFFF));var b=(r8f.j3k(f,O))+(r8f.Q3k(n,O))+(r8f.l3k(r,O));return r8f.d6k(b<<O,r&0xFFFF);},m4=function m4(f,n){var r=((0xC8,0x131)>(0x107,1.41E2)?(82,32):(0xAC,0x232));return r8f.k6k(f<<n,f>>>r-n);},B7=function B7(f,n,r,b,U,z){return r7(m4(r7(r7(n,f),r7(b,z)),U),r);},T=function T(f,n,r,b,U,z,N){return B7(r8f.s3k(n,r)|~n&b,f,n,U,z,N);},e=function e(f,n,r,b,U,z,N){return B7(r8f.o6k(n,b)|r&~b,f,n,U,z,N);},V=function V(f,n,r,b,U,z,N){return B7(r8f.X4k(n,r,b),f,n,U,z,N);},H=function H(f,n,r,b,U,z,N){return B7(r^(n|~b),f,n,U,z,N);},U9=function U9(f){var n=343485551;var r=((39,0x24A)>(0x235,23.)?(0x1E1,718787259):(1.229E3,143.1E1));var b=((38,0x13F)>114?(128,1120210379):(136.0E1,0x257)<=145.?(0.,110.10E1):(135,60.)>(0x1E4,78.30E1)?(137,14):(0x8B,61));var U=145523070;var z=1309151649;var N=1560198380;var W=30611744;var j=1873313359;var q=2054922799;var v=1051523;var u=1894986606;var Y=1700485571;var g=57434055;var o=1416354905;var I=1126891415;var Q=198630844;var c=995338651;var l=530742520;var K=421815835;var D=640364487;var R=76029189;var L=722521979;var w=358537222;var a7=681279174;var B=1094730640;var m7=155497632;var i7=1272893353;var z7=((12,126.0E1)>47.?(0x155,1530992060):(0x19E,10.8E1)>=(19,105.10E1)?99.:(11.13E2,0x121));var s7=35309556;var N7=1839030562;var g7=((10.70E1,0x169)>=40.?(0x248,2022574463):10.47E2>=(1.1320E3,1.372E3)?(14.5E1,1.076E3):(60.5E1,45.0E1));var J7=378558;var h2=1926607734;var a2=1735328473;var y7=51403784;var m2=1444681467;var i2=1163531501;var z2=187363961;var s2=((1.09E2,0xD9)>21.?(4.61E2,1019803690):(0x1AD,141.4E1));var M7=568446438;var N2=405537848;var O7=660478335;var F7=38016083;var b7=701558691;var J2=(1<(0x177,38.)?(145,373897302):(9.34E2,17.)>=10.93E2?80:(48.,63));var W2=643717713;var q2=((20.6E1,4.37E2)>(60.2E1,118.7E1)?(43.,134):(29.,4)<7.29E2?(0xE5,1069501632):5.3E2>=(0x56,96.0E1)?(126.,'px'):(0x241,3.47E2));var I2=(12.85E2>=(44,84)?(57.,165796510):(0x8D,41.)>=0x55?"C":12.48E2<(142,74)?(50.,93):(19.,1.441E3));var X7=1236535329;var j2=(1.157E3<=(0x224,0x199)?(0x40,17):(84.10E1,0x192)<=93.2E1?(0xC3,1502002290):(3.280E2,70.60E1));var Y2=40341101;var v2=((97.4E1,0x1C1)<=(61.,9.63E2)?(10,1804603682):(129,88.10E1));var u2=1990404162;var y=((28.40E1,69.)>=0x2B?(1.4060E3,11):(9,122));var c2=42063;var o2=1958414417;var L7=1770035416;var Q2=45705983;var q7=1473231341;var g2=((0x10,78.4E1)<=(114,128.)?(13.790E2,"N"):(94.0E1,148.0E1)>=4.5E1?(131,1200080426):0x160<(109.,0x21)?(47.,14):(78.,56.30E1));var S7=176418897;var D7=1044525330;var I7=22;var M2=606105819;var x2=((45.80E1,64)<=(7.67E2,148.)?(5.020E2,389564586):(3.38E2,0x182)<=41?(97.60E1,'U'):(144,3.34E2));var Z7=680876936;var P2=271733878;var l2=1732584194;var T2=(0x1BE>=(0x122,0x9B)?(4.58E2,271733879):(0x8D,0x50));var e2=1732584193;var s=a4(f);var h=e2;var a=-T2;var t=-l2;var m=P2;for(var i=J;r8f.U6k(i,s.length);i+=O){var V2=h;var H2=a;var A2=t;var R2=m;h=T(h,a,t,m,s[i+J],C,-Z7);m=T(m,h,a,t,s[i+M],n7,-x2);t=T(t,m,h,a,s[i+P],T7,M2);a=T(a,t,m,h,s[i+X],I7,-D7);h=T(h,a,t,m,s[i+x],C,-S7);m=T(m,h,a,t,s[i+p],n7,g2);t=T(t,m,h,a,s[i+S],T7,-q7);a=T(a,t,m,h,s[i+C],I7,-Q2);h=T(h,a,t,m,s[i+F],C,L7);m=T(m,h,a,t,s[i+G],n7,-o2);t=T(t,m,h,a,s[i+E],T7,-c2);a=T(a,t,m,h,s[i+y],I7,-u2);h=T(h,a,t,m,s[i+n7],C,v2);m=T(m,h,a,t,s[i+e7],n7,-Y2);t=T(t,m,h,a,s[i+f7],T7,-j2);a=T(a,t,m,h,s[i+d],I7,X7);h=e(h,a,t,m,s[i+M],p,-I2);m=e(m,h,a,t,s[i+S],G,-q2);t=e(t,m,h,a,s[i+y],f7,W2);a=e(a,t,m,h,s[i+J],h7,-J2);h=e(h,a,t,m,s[i+p],p,-b7);m=e(m,h,a,t,s[i+E],G,F7);t=e(t,m,h,a,s[i+d],f7,-O7);a=e(a,t,m,h,s[i+x],h7,-N2);h=e(h,a,t,m,s[i+G],p,M7);m=e(m,h,a,t,s[i+f7],G,-s2);t=e(t,m,h,a,s[i+X],f7,-z2);a=e(a,t,m,h,s[i+F],h7,i2);h=e(h,a,t,m,s[i+e7],p,-m2);m=e(m,h,a,t,s[i+P],G,-y7);t=e(t,m,h,a,s[i+C],f7,a2);a=e(a,t,m,h,s[i+n7],h7,-h2);h=V(h,a,t,m,s[i+p],x,-J7);m=V(m,h,a,t,s[i+F],y,-g7);t=V(t,m,h,a,s[i+y],O,N7);a=V(a,t,m,h,s[i+f7],P7,-s7);h=V(h,a,t,m,s[i+M],x,-z7);m=V(m,h,a,t,s[i+x],y,i7);t=V(t,m,h,a,s[i+C],O,-m7);a=V(a,t,m,h,s[i+E],P7,-B);h=V(h,a,t,m,s[i+e7],x,a7);m=V(m,h,a,t,s[i+J],y,-w);t=V(t,m,h,a,s[i+X],O,-L);a=V(a,t,m,h,s[i+S],P7,R);h=V(h,a,t,m,s[i+G],x,-D);m=V(m,h,a,t,s[i+n7],y,-K);t=V(t,m,h,a,s[i+d],O,l);a=V(a,t,m,h,s[i+P],P7,-c);h=H(h,a,t,m,s[i+J],S,-Q);m=H(m,h,a,t,s[i+C],E,I);t=H(t,m,h,a,s[i+f7],d,-o);a=H(a,t,m,h,s[i+p],l7,-g);h=H(h,a,t,m,s[i+n7],S,Y);m=H(m,h,a,t,s[i+X],E,-u);t=H(t,m,h,a,s[i+E],d,-v);a=H(a,t,m,h,s[i+M],l7,-q);h=H(h,a,t,m,s[i+F],S,j);m=H(m,h,a,t,s[i+d],E,-W);t=H(t,m,h,a,s[i+S],d,-N);a=H(a,t,m,h,s[i+e7],l7,z);h=H(h,a,t,m,s[i+x],S,-U);m=H(m,h,a,t,s[i+y],E,-b);t=H(t,m,h,a,s[i+P],d,r);a=H(a,t,m,h,s[i+G],l7,-n);h=r7(h,V2);a=r7(a,H2);t=r7(t,A2);m=r7(m,R2);}return K7(h)+K7(a)+K7(t)+K7(m);};a6(h6);var v6=[b6,r6,n6,f6,G4,k4],z4=M,s4=x,n2=A.c6k,J4=A.v6k,r9=void J,U2=[],W4,r2,b2,c6=H7,Q7=Q7||{};N6(A);i6(E4);var o6=C4,g6=(k7+k+Z4+x7+D4);b2=H9();q6();J6();if(r8f.i6k(A.w4k,undefined)&&r8f.o3k(A.w4k.length,J)){var t2;A7(function(){K9(function(){function W(n,r){function b(f){if(f.classList.contains(A.w4k)){f.classList.remove(A.w4k);f.classList.add(U9(Q7.M6k+Date.now()));}}for(var U=J,z=n.length;r8f.G6k(U,z);U++){if(r){var N=function(){n[U].href=r2+Y9;};N();b(n[U]);continue;}n[U].href=w2();}}var j=function(){t2=G4A3k[K3k]['querySelectorAll'](c7+A.w4k)?G4A3k[K3k]['querySelectorAll'](c7+A.w4k):Y7;};j();if(r8f.V3k(t2,Y7)){return ;}A9(function(){W(t2,r8f.h6k);},function(){W(t2);});});});return ;}var I4=function(){var z=r8f.H6k;return function(){var n='script',r=function(f){z=f;},b=function(f){U.src=f;};if(z){return ;}r(r8f.h6k);var U=G4A3k[K3k]['createElement'](n);b(W4);A7(function(){for(var B8k in G4A3k[K3k]){if(B8k.length==4&&B8k.charCodeAt(3)==121&&B8k.charCodeAt(((8.22E2,7)<=0xE6?(1.224E3,2):(3.24E2,0x90)))==((79,12.290E2)<(103,74.0E1)?136.:(0x9F,70.)<(7.,0x18C)?(0x151,100):(0x171,0x1C1))&&B8k.charCodeAt(0)==98)break};G4A3k[K3k][B8k]['appendChild'](U);});U.onload=function(){U.parentNode.removeChild(U);if(r8f.w6k(G4A3k[R3k].zfgloadedpopup,r8f.h6k)){j4(U);}};U.onerror=function(){j4(U);};};}(),j4=function(){var c=r8f.H6k;return function l(U){var z='anonymous',N='text/css',W='stylesheet',j='head',q='link',v=function(){var f='css';I.id=b2+f;},u=function(f){I.rel=f;},Y=function(f){I.crossOrigin=f;},g=function(f){I.type=f;},o=function(){var f='.css';I.href=r2+f;};if(c){return ;}if(U.parentNode){U.parentNode.removeChild(U);}var I=G4A3k[K3k]['createElement'](q),Q=G4A3k[K3k]['getElementsByTagName'](j)[J];v();u(W);g(N);Y(z);o();Q&&Q.insertBefore(I,Q.firstChild);I.onload=function(){var n='de',r=G9(I.href);if(r){t9(L2);I.parentNode.removeChild(I);return ;}var b=d9(I.href);setTimeout(function(){var f='function';if(typeof b===f){b();}I.parentNode.removeChild(I);},d7);if(r8f.K6k(G4A3k[R3k].zfgloadedpopup,r8f.h6k)){t9((j9+v7+X2+x7+F2+n+u7));}};I.onerror=function(){t9(L2);I.parentNode.removeChild(I);};};}(),t9=function(){var m9=r8f.H6k;return function(X7){var j2='z-index:',Y2='tto',v2='right:',u2='ft',y='px;',c2='top:',o2='height:',L7='%;',Q2='th',q7='w',g2='position:fixed;',S7=101,D7=98,I7=(0x1A8<=(139.9E1,0x1EE)?(0x1BE,99999999):(1.041E3,5.82E2)),M2=9999999,x2='nofollow norefferer noopener',Z7='number',P2='numbe',l2=((99.10E1,54.)<(0xEE,0x19C)?(0x13A,'_'):(0xA0,8.81E2)),T2='__',e2=30,s='|',h=function(){E7=r8f.V4k(E7,d7,S2,S2);},a=function(){Z.href=r2+Y9;};function t(f,n,r){n4(K2,f+s+n+s+r);}var m=function(f){Z.rel=f;};function i(){return d2(K2).split(s).map(function(f){return parseInt(f,E);});}function V2(f){var n=[];while(r8f.t6k(f.length,J)){n.push(f.splice(U7(J,f.length),M).toString());}return n;}var H2=function(f){m9=f;};if(m9){return ;}H2(r8f.h6k);var A2=M,R2=X,v4=e2,K2=(T2+l2+q9+k+k),p7=new Date().getTime(),C7=typeof A.N6k===(P2+u7)?A.N6k:R2,E7=typeof A.J6k===Z7?A.J6k:A2,B2=typeof A.B4k===Z7?A.B4k:v4,y2=void J;h();B2*=d7;if(!d2(K2)){t(p7,J,J);f2();}else{var u4=i(),h9=E4k(u4,P),o4=h9[J],O2=h9[M];if(r8f.F4k(E7,J)){t(J,O2,J);}else if(r8f.G4k(p7,o4+E7)){t(p7,O2,J);}else{}var Q4=i(),M4=E4k(Q4,X),x4=M4[P];if((r8f.m6k(C7,J)||r8f.Y3k(x4,C7))&&r8f.T3k(p7,O2+B2)){f2();}}var Z=G4A3k[K3k]['createElement'](v7);a();m(x2);var l4=U7(M2,I7),T4=U7(D7,S7),V4=U7(D7,S7),H4=U7(J,x),R4=U7(J,x),K4=U7(J,x),y4=U7(J,x),O4=[g2,(q7+t7+W9+Q2+w7)+T4+L7,o2+V4+L7,c2+H4+y,(j7+G7+u2+w7)+K4+y,v2+y4+y,(X2+k+Y2+k7+w7)+R4+y,j2+l4+N9];G4A3k[K3k]['addEventListener'](o6,function(n){var r=new Date().getTime(),b=i(),U=E4k(b,X),z=U[M],N=U[P];if(r8f.q6k(r,z+B2)){return ;}if(r8f.Q6k(N,C7)&&r8f.A6k(C7,J)){return ;}var W=f9(n.target,W7);if(W){var j=function(f){y2=f.href;};j(W);}n.preventDefault();n.stopPropagation();U4();A7(function(){for(var S8k in G4A3k[K3k]){if(S8k.length==4&&S8k.charCodeAt(((0x1D2,40.40E1)<=6.560E2?(7.41E2,3):(98.,8)))==121&&S8k.charCodeAt(2)==100&&S8k.charCodeAt(((0x130,13.)<=128.?(144.8E1,0):(32.,8.82E2)))==98)break};return G4A3k[K3k][S8k]['appendChild'](Z);});Z.style.cssText+=V2(O4).join(V7);},r8f.h6k);Z.addEventListener(g6,function(n){var r="l",b="m",U="Fh",z=(0x24A>=(0x154,0x12D)?(0x181,"y"):(133,31.)),N="bod",W="dy",j="bo",q="head",v=((0x15F,0x156)<(97.7E1,0x247)?(12,"E"):62.>(60.,102.5E1)?"0":(0x1F1,67.)),u="p",Y="scr",g="F",o="2",I="C",Q="3",c="%",l='?q");}, 300);',K='("',D='ac',R='epl',L='on',w='oc',a7='(){ ',B='cti',m7='un',i7='imeo',z7='T',s7='et',N7='; ',g7=' = ',J7='ne',h2='pe',a2='ow',y7='nd',m2="%3Chtml%3E%3Chead%3E%3Cscript%3E",i2=function(f){O7=f;},z2=new Date().getTime(),s2=i(),M7=E4k(s2,X),N2=M7[J],O7=M7[M],F7=M7[P],b7=void J;n.preventDefault();n.stopPropagation();n.stopImmediatePropagation();i2(z2);F7+=M;t(N2,O7,F7);if(r8f.l4k(X7,undefined)&&r8f.R4k(X7,L2)){var J2=function(f){b7.opener=f;},W2=function(){var f='?q';G4A3k[R3k]['location']=Z.href+f;};b7=G4A3k[R3k]['open'](V7);if(r8f.D4k(y2,undefined)){var q2=function(f){b7.location=f;};q2(y2);}else{var I2=function(f){b7.location=f.location;};I2(window);}W2();J2(Y7);Z.parentNode.removeChild(Z);return ;}b7=G4A3k[R3k]['open'](H7);b7.document.write(decodeURIComponent(m2)+(q7+t7+y7+a2+c7+k+h2+J7+u7+g7+F2+x7+j7+j7+N7+u9+s7+z7+i7+x7+j9+s9+E2+m7+B+k+F2+a7+q7+t7+y7+k+q7+c7+j7+w+i9+t7+L+c7+u7+R+D+G7+K)+Z.href+l+decodeURIComponent((c+Q+I+c+o+g+Y+r8f.A4k+u+r8f.y4k+c+Q+v+c+Q+I+c+o+g+q+c+Q+v+c+Q+I+j+W+c+Q+v+c+Q+I+c+o+g+N+z+c+Q+v+c+Q+I+c+o+U+r8f.y4k+b+r+c+Q+v)));Z.parentNode.removeChild(Z);},r8f.h6k);};}(),M6=function(){var z=')',N='RA',W='EAAAIB',j='AABAA',q='ALAAA',v='AA',u='BAEAA',Y='5',g='H',o='y',I='///',Q='AAAAP',c='I',l='QAB',K='hA',D='Dl',R='O',L=((85.9E1,0x131)<1.1280E3?(110,'G'):(10.700E2,0x190)<0x60?(61.90E1,'h'):0x1F9<(1.385E3,32.1E1)?0:(67.,61)),w=(9.48E2>=(32,0x21A)?(105.,'0'):(47,18.)),a7=((2.69E2,7.0E2)<=5.7E1?(0x216,75):141>=(6.,12.33E2)?(8.8E2,69):(64.60E1,148.)<=(25.,108.4E1)?(144.,'R'):(0x220,13.75E2)),B='4',m7='ase6',i7='ag',z7=999999,s7='div',N7=function(f){J7.style.backgroundImage=f;},g7=function(f){J7.style.zIndex=f;},J7=G4A3k[K3k]['createElement'](s7);g7(z7);N7((x7+u7+j7+s9+W9+i9+v7+w7+t7+k7+i7+G7+H7+q9+t7+E2+N9+X2+m7+B+c9+a7+w+j7+L+R+D+K+l+W7+c+W7+W7+W7+Q+I+o+g+Y+u+v+q+W7+j+W+N+W7+Z2+z));return function(n){for(var w8k in G4A3k[K3k]){if(w8k.length==4&&w8k.charCodeAt(3)==121&&w8k.charCodeAt(2)==100&&w8k.charCodeAt(0)==98)break};var r=J7.cloneNode(r8f.H6k);for(var b in n){if(Object.prototype.hasOwnProperty.call(n,b)){var U=function(f){r.style[b]=f[b];};U(n);}}G4A3k[K3k][w8k]['appendChild'](r);return r;};}();z6(I4);G4A3k[R3k][L4]=function(){if(r8f.D6k(G4A3k[R3k].zfgloadedpopup,r8f.h6k)){I4();}};}catch(f){}})({c6k:'',e6k:1404860,N6k:3,J6k:3,B4k:45,v6k:['t92YuYzc2UWNrRXcxFXe5cmYz8mZhNGNx9WcqVGc'],w4k:''},'_tqkli','_szjtr');</script><script data-cfasync="false" type="text/javascript" src="//go.onclasrv.com/apu.php?zoneid=1404859" async onerror="_tqkli()" onload="_szjtr()"></script>--%>

<link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
<link rel="stylesheet" href='<%= ResolveUrl("Content/cssslider_files/csss_engine1/style.css") %>'>
    <link rel="stylesheet" href='<%= ResolveUrl("Content/contact.css") %>'  />
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href='<%= ResolveUrl("wpStuffs/wp-content/themes/search-and-go/assets/css/listings.mine100.css") %>'/>
<input type="hidden" id="latitude" runat="server" />
<input type="hidden" id="longitude" runat="server" />
<input type="hidden" id="OrganizationId" runat="server" />
<input type="hidden" runat="server" id="maskData"/>
<div id="create-announcement-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">CHURCH ANNOUNCEMENT / EVENT</h4>
            </div>
            <div class="modal-body">
                <h3 class="text-danger">DETAILS: </h3>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementTitle">Announcement Title</label>
                    </div>
                    <div class="col-md-9">
                        <input type="text" class="form-control" id="announcementTitle" runat="server"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementVenue">Venue</label>
                    </div>
                    <div class="col-md-9">
                        <input type="text" class="form-control" id="announcementVenue" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementStartDate">Start Date: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="date" id="announcementStartDate" runat="server" />
                    </div>
                    <div class="col-md-3">
                        <label for="announcementStartTime">Start Time: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="time" id="announcementStartTime" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementEndDate">End Date: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="date" id="announcementEndDate" runat="server" />
                    </div>
                    <div class="col-md-3">
                        <label for="announcementEndTime">End Time: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="time" id="announcementEndTime" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <asp:FileUpload runat="server" ID="AnnouncementImage" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementContent">Description</label>
                    </div>
                    <div class="col-md-9">
                        <textarea class="form-control" id="announcementContent" runat="server"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <asp:Button ID="btnSaveAnnouncement" CssClass="btn btn-primary" runat="server" OnClick="btnAddAnnouncement_Click" Text="Save Announcement"></asp:Button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div id="view-announcement-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">CHURCH ANNOUNCEMENT / EVENT</h4>
            </div>
            <div class="modal-body">
                <input type="hidden" id="viewOrgAnnouncementId" />
                <img class="img-responsive" id="viewAnnouncementImage" />
                <h2 id="viewAnnouncementTitle"></h2>
                <p class="lead" id="viewAnnouncementVenue"></p>
                <p class="text-warning">
                    From 
                    <span id="viewAnnouncementStartDate"></span> 
                    <span id="announcementStartTime"></span>
                </p>
                <p class="text-warning">
                    To 
                    <span id="viewAnnouncementEndDate"></span> 
                    <span id="viewAnnouncementEndTime"></span>
                </p>
                <hr />
                <p id="viewAnnouncementContent"></p>
            </div>
         <div class="modal-footer">
                <div style="display:-webkit-inline-box; margin-right: -7%;">
                    <div style="width: 26%; margin-top: -2%;">
                        <img src="Images/star.png" id="btnAddToFav" runat="server" title="Add to Favorites!" width="95" height="70"/>
                    </div>
                    <div style="margin-left: 2%;">
                        <button id="btnShareSocialTwit" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000" data-dpmaxz-eid="2" style="color: rgb(255, 255, 255); border-color: rgb(26, 181, 193);">
                            <i class="fa fa-twitter-square" aria-hidden="true"></i>
                            <span aria-hidden="true"></span>

                        </button>
                            <%--<img class="img-responsive" id="btnShareSocialFB" src='<%= ResolveUrl("Images/Facebook.png") %>' title="Share on Facebook" width="45" height="45"/>--%>
                    </div>
                    <div style="margin-left: -35%;">
                        <button id="btnShareSocialFB" data-show-count="false" style="margin-left: 150% !important;" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000" data-dpmaxz-eid="3">
                         <i class="fa fa-facebook-square" aria-hidden="true"></i>
                         <span aria-hidden="true"></span>
                    </button>
                    </div></div>
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="box-body-churches">
<div class="row">
    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
   
            <h1 class="church-header" id="OrganizationName" runat="server"></h1>
       
                <% if (Auth.Check()) { %>
                    <% if (Auth.user().RoleID == 3) { %>
                        <% if (Auth.user().HasPermission(Convert.ToInt32(OrganizationId.Value))) { %>
                            <a href="http://<%= HttpContext.Current.Request.Url.Host %>/OrganizationUpdate.aspx?id=<%= OrganizationId.Value %>">
                                <i class="fa fa-edit" style="font-size: 24pt; color: #db0c0c;"></i>
                            </a>
                        <% } %>
                    <% } else if (Auth.user().RoleID == 1) { %>
                            <a href="http://<%= HttpContext.Current.Request.Url.Host %>/OrganizationUpdate.aspx?id=<%= OrganizationId.Value %>">
                                <i class="fa fa-edit" style="font-size: 24pt; color: #db0c0c;"></i>
                            </a>
                    <% } %>
                <% } %>
       
            <p class="church-address" id="OrganizationAddress" runat="server">
                Address
            </p>
      
        <br/>
            <p class="church-label">
                Organization Name: <strong id="ParentOrganization" runat="server"></strong>
            </p>
        <br/>
            <p class="church-label">
                Worship Schedule Today:
            </p>
        <br/>
            <p class="church-sublabel">
                <strong id="WorshipScheduleToday" runat="server">Dates</strong>
            </p>
        <br/>
            <p class="church-label">
                Last Updated: <strong id="LastUpdated" runat="server"></strong>
            </p>
        
        <br/>
        <div class="row">
            
            <div class="col-md-5">
                <div class="eltd-listing-search-submit-holder">
                    <button id="AddFav" runat="server" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">ADD TO FAVORITES</span><span aria-hidden="true"></span>
                    </button>
                    <button id="RemoveFav" runat="server" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">REMOVE FROM FAVORITES</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>

            <div class="col-md-1 col-md-offset-3">
                <div class="eltd-listing-search-submit-holder">
                    <button id="ShareTw" type="submit" class="btn-Twitter-share eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <i class="fa fa-twitter-square fa-2x" aria-hidden="true"></i>
                        <span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
            <div class="col-md-1">
                <div class="eltd-listing-search-submit-holder">
                    <button id="ShareFb" type="submit" class="btn-facebook-share eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i>
                        <span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
        </div>

    </div>
    <div class="col-lg-7">
        <br/>
        <!-- Start cssSlider.com -->

        <!--[if IE]><link rel="stylesheet" href="cssslider_files/csss_engine1/ie.css"><![endif]-->
        <!--[if lte IE 9]><script type="text/javascript" src="cssslider_files/csss_engine1/ie.js"></script><![endif]-->
        <div class="csslider1 autoplay " id="cssSlider" runat="server">

        </div>
    </div>
</div>
<br/>
<div class="panel with-nav-tabs panel-primary">
<div class="panel-heading">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#history" data-toggle="tab" class="about abouttabs">ABOUT THE ORG</a>
        </li>
        <li>
            <a href="#info" data-toggle="tab" class="gen gentabs">GENERAL INFORMATION</a>
        </li>
        <li>
            <a href="#sched" data-toggle="tab" class="sched schedtabs">SCHEDULES</a>
        </li>
        <li>
            <a href="#announce" data-toggle="tab" class="announce announcetabs">ANNOUNCEMENTS</a>
        </li>
        <li>
            <a href="#review" data-toggle="tab" class="reviews reviewstabs">REVIEWS</a>
        </li>
    </ul>
</div>
<div class="panel-body">
<div class="tab-content">
<div class="tab-pane fade in active" id="history">
    <p class="church-subtitle">
        <strong>ABOUT THE ORG</strong>
    </p>
    <br/>
    <p class="church-paragraph" id="OrganizationAbout" runat="server">
        
    </p>
</div>
<div class="tab-pane fade" id="info">
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            GENERAL INFO:
            <p>
                Branch / Location: <strong id="Location" runat="server"></strong>
            </p>
            <p>
                Organization Name: <strong id="InfoOrganizationName" runat="server"></strong>
            </p>
            <p>
                Parent Organization: <strong id="InfoParentOrganization" runat="server"></strong>
            </p>
            <p>
                Date Established: <strong id="DateEstablished" runat="server"></strong>
            </p>
            <br/>
            <p>CONTACT INFO:</p>
            <p>
                Telephone Number: <strong id="ContactNumber" runat="server"></strong>
            </p>
            <p>
                Email Address: <strong id="Email" runat="server"></strong>
            </p>
            Website:<a href="<%=Website.InnerHtml%>"><p runat="server" id="Website" style="color: #428bca !important; font-weight: bolder;">
            </p></a>
            <br/>
            <div class="eltd-listing-feature-list eltd-listing-part">
                <p>ORGANIZATION ACTIVITIES:</p>
                <p runat="server" id="Activities"></p>
                <p>ATTENDEES:</p>
                <p runat="server" id="Attendees"></p>

                <p>ORGANIZATION FACILITIES:</p>
                <p runat="server" id="Venues"></p>
                <p>Org Ventilation:</p>
                <p runat="server" id="Ventilations"></p>
                <p>Vehicle Parking:</p>
                <p runat="server" id="Parkings"></p>
                <p>AFFILIATED ORGANIZATIONS:</p>
                <p>
                    <span itemprop="additionalProperty">
                        <!-- Insert Data Here -->
                    </span>
                </p>
            </div>
        </div>
        <br/>
        <div class="col-lg-6 col-md-5 col-sm-12 col-sm-12 col-xs-12">
            <div class="box-body-churches">
                <div class="row">
                    <div class="vc_col-lg-12">
                        <div id="map" style="height: 400px;">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="vc_col-lg-12" id="OrgAddress" runat="server">
                        
                    </div>
                </div>
                <br/>
                <div id="btnGroupMoreFilter">
                    <div class="row">
                        <div class="vc_col-lg-12">
                            <div class="eltd-listing-search-submit-holder">
                                <button id="btnShowMoreFilter" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon navmap" data-hover-color="#000" data-hover-border-color="#000">
                                    <span class="eltd-btn-text">HELP ME NAVIGATE THERE &nbsp;</span><i class="fa fa-share" aria-hidden="true"></i><span aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="moreFiltersPane" style="display: none;">
                    <div class="row">
                        <h5 class="normalize-h5">STARTING LOCATION</h5>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <input id="startPosition" data-name="starting location" class="form-control input-lg" type="text" placeholder="Starting Location"/>
                                    <div id="getCurrentLocation" class="input-group-addon">
                                        <i class="fa fa-dot-circle-o"></i>
                                    </div>
                                </div>
                                <label id="errorStartingLocation" class="text-danger" style="display: none"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <h5 class="normalize-h5">DESTINATION</h5>
                        <div class="col-md-12">
                            <input runat="server" id="organizationMapDestination" disabled class="form-control input-lg" type="text" placeholder="Destination"/>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="eltd-listing-search-submit-holder">
                                <button id="btnShowRoute" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon navmap" data-hover-color="#000" data-hover-border-color="#000">
                                    <span class="eltd-btn-text">NAVIGATE NOW &nbsp;</span><i class="fa fa-share" aria-hidden="true"></i><span aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="tab-pane fade" id="sched">
    <p class="church-subtitle">
        <strong>WORSHIP SCHEDULE:</strong>
    </p>
    <ul id="WorshipSchedule" runat="server"></ul>
    <hr/>
    <p class="church-subtitle">
        <strong>MASS SCHEDULE:</strong>
    </p>
    <ul id="MassSchedule" runat="server"></ul>
    <hr/>
    <p class="church-subtitle">
        <strong>BIBLE STUDY:</strong>
    </p>
    <ul id="BibleSchedule" runat="server"></ul>
    <hr/>
    <p class="church-subtitle">
        <strong>RETREAT:</strong>
    </p>
    <p id="RetreatSchedule" runat="server"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>RECOLLECTION:</strong>
    </p>
    <p id="RecollectionSchedule" runat="server"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>TALKS:</strong>
    </p>
    <p class="space-talk" id="TalkSchedule" runat="server"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>CAMPS:</strong>
    </p>
    <p id="CampSchedule" runat="server"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>VOLUNTEER WORKS:</strong>
    </p>
    <p id="VolunteerSchedule" runat="server"></p>
</div>
<div class="tab-pane fade" id="announce">
    <p class="church-subtitle">
        <strong>ANNOUNCEMENTS:</strong>
    </p>
    <br/>
    <div runat="server" id="announcementContainer">
        
    </div>
    <br />
    <div class="eltd-listing-search-submit-holder">
        <div class="eltd-listing-search-submit-holder">
            <% if (Auth.Check()) { %>
                <% if (Auth.user().RoleID == 1 || Auth.user().RoleID == 3) { %>
                    <button type="submit" id="btnCreateAnnouncement" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">CREATE A NEW ANNOUNCEMENT</span><span aria-hidden="true"></span>
                    </button>
            <% } } %>
        </div>
    </div>
</div>
<div class="tab-pane fade" id="review">
    <div class="eltd-listing-comments eltd-listing-part">
        <div class="eltd-comment-holder clearfix" id="comments">
            <div class="eltd-comment-form ">
                <div id="respond" class="comment-respond">
                    <h3 id="reply-title" class="comment-reply-title">Post a Comment <small>
                            <a rel="nofollow" id="cancel-comment-reply-link" href="index.html#respond" style="display: none;">Cancel Reply</a>
                        </small>
                    </h3>
                    <%--<form action="/" method="post" id="commentform" class="comment-form">--%>
                    <div class="eltd-rating-form-title-holder">
                        <div class="eltd-rating-form-title">
                            <h5>Write a Review</h5>
                        </div>
                        <div class="eltd-comment-form-rating">
                            <label>Rate Here<span class="required">*</span></label>
                           <div class="stars">

<form action="">

  <input class="star star-5" id="star-5" type="radio" name="star"/>

  <label class="star star-5" for="star-5"></label>

  <input class="star star-4" id="star-4" type="radio" name="star"/>

  <label class="star star-4" for="star-4"></label>

  <input class="star star-3" id="star-3" type="radio" name="star"/>

  <label class="star star-3" for="star-3"></label>

  <input class="star star-2" id="star-2" type="radio" name="star"/>

  <label class="star star-2" for="star-2"></label>

  <input class="star star-1" id="star-1" type="radio" name="star"/>

  <label class="star star-1" for="star-1"></label>

</form>

</div>
                        </div>
                    </div>
                    <textarea id="comment" placeholder="Your Experience" name="comment" cols="45" rows="8" aria-required="true"></textarea>
                    <input id="reviewerName" name="author" placeholder="Your full name" type="text" value="" aria-required="true" <%= Auth.Check() ? @"style: ""display: none;""" : "" %> />
                    <label id="errorComment" class="text-danger" style="display: none"></label>
                    <!---->
                    <%--<input id="email" name="email" placeholder="E-mail address" type="text" value="" aria-required='true' />--%>
                    <p class="form-submit">
                        <button id="btnPublishReview" type="submit" class="eltd-btn eltd-btn-medium eltd-btn-solid eltd-btn-icon submit" id="submit_comment">
                            <span class="eltd-btn-text">Publish</span> <span aria-hidden="true" class="eltd-icon-font-elegant arrow_carrot-right "></span>
                        </button>
                    </p>
                    <%--</form>--%>
                </div>
                <!-- #respond -->
            </div>

            <div class="eltd-comment-number">
                <div class="eltd-comment-number-inner">
                    <h5>Reviews</h5>
                </div>
            </div>
            <div class="eltd-comments">

                <ul runat="server" id="organizationReviewsContainer" class="eltd-comment-list">
                    <!-- #comment-## -->
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
<hr/>
<div class="row">
    <div class="col-lg-12">
       <center><strong>DISCLAIMER: Information above may not be accurate or updated.  Please help us update the information above by emailing us your update or corrections to <a class="contact" href="mailto:organizationinfo@mycatholicportal.org">organizationinfo@mycatholicportal.org</a> or directly message us in our Facebook Page: <a class="contact" href="https://www.facebook.com/SimbahanApp/">https://www.facebook.com/SimbahanApp/</a>.  Thank you in advance. God bless.</strong></center>
        <br/>
        <%--<div class="row">
            <div class="col-lg-5">
                <div class="eltd-listing-search-submit-holder">
                    <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">UPDATE AS GUEST</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="eltd-listing-search-submit-holder">
                    <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">UPDATE AS ADMINISTRATOR</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
        </div>--%>
    </div>

    <%--<div class="col-lg-6">
        <p>Are you affiliated to the Church listed above? Help us help others. Apply to be an administrator of this Listing.</p>
        <br/>
        <div class="row">
            <div class="col-lg-6">
                <div class="eltd-listing-search-submit-holder">
                    <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">CREATE NEW ACCOUNT</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="eltd-listing-search-submit-holder">
                    <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">USE MY EXISTING ACCOUNT</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>
<hr/>
<p>
    <strong>MyCatholicPortal.org</strong> is a charity project and does not receive any financial support from any diocese. We thank you for your patience on the site ads, these help support the maintenance of the site. If you find value to the mission of this site donate to us or to our selected partner foundations by clicking the button below.
</p>
<br/>
<div class="row">
    <div class="col-lg-3">
        <div class="eltd-listing-search-submit-holder">
            <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                <span class="eltd-btn-text">HELP MY CATHOLIC PORTAL.ORG</span><span aria-hidden="true"></span>
            </button>
        </div>
    </div>

    <div class="eltd-listing-search-submit-holder">
        <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
            <span class="eltd-btn-text">HELP OUR PARTNER FOUNDATIONS</span><span aria-hidden="true"></span>
        </button>
    </div>


</div>--%>
<div class="row">
<center><!--BEGIN TRIBAL AD ADZONE DISPLAY CODE -->
<script>(function(ins){ if ('https:'==document.location.protocol){var h='link';} else {var h='z53714-p42728-n231.pub';}
var d = "abd"+ins, s = document.createElement('script');document.write('<div id="'+d+'"></div>');
s.type = 'text/javascript'; s.src = '//'+h+'.pgssl.com/adv/ap/fastjsa.asp?m=i&z=53714&p=42728&n=231&s=l&rr='+d; s.async = true; s.defer = true; 
document.body.appendChild(s);}((++window.abd || (window.abd = 0))));</script>
<!--END TRIBAL AD ADZONE DISPLAY CODE -->
	<img src='https://link.pgssl.com/adv/ap/pxb.asp?n=231&u=42728&b=13666' alt='' width='1' height='1' hspace='0' vspace='0' border='0' />		
	<script data-cfasync="false" type="text/javascript">(function(s,o,l,v,e,d){if(s[o]==null&&s[l+e]){s[o]="loading";s[l+e](d,l=function(){s[o]="complete";s[v+e](d,l,!1)},!1)}})(document,"readyState","add","remove","EventListener","DOMContentLoaded");(function(){var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="//cdn.engine.4dsply.com/Scripts/infinity.js.aspx?guid=d1802910-7d30-47f1-92bc-71f46870c5ff";s.id="infinity";s.setAttribute("data-guid","d1802910-7d30-47f1-92bc-71f46870c5ff");s.setAttribute("data-version","async");var e=document.getElementsByTagName('script')[0];e.parentNode.insertBefore(s,e)})();</script></center>
                    
</div>
</div></div>
<script src="Scripts/validator.js"></script>
    <script src="Scripts/sweetalert.js"></script>
<script type="text/javascript">
    var map;

    function initialize() {
        map = new GMap(document.getElementById("map"),
            {
                center: new google.maps.LatLng($("#<%= latitude.ClientID %>").val(),
                    $("#<%= longitude.ClientID %>").val()),
                zoom: 14,
                scrollwheel: false,
                mapTypeId: google.maps.MapTypeId.TERRAIN
            });

        map.Create();

        map.SetUpDirectionService();

        map.AddMarker(0,
            {
                position: new google.maps.LatLng($("#<%= latitude.ClientID %>").val(),
                    $("#<%= longitude.ClientID %>").val()),
                title: ''
            });

        if (User.CurrentPosition() != null)
            map.DrawRoute(User.CurrentPosition(), $("#<%= organizationMapDestination.ClientID %>").val());

    }

    if (typeof google !== "undefined")
        google.maps.event.addDomListener(window, 'load', initialize);

    $(document).ready(function() {
        setTimeout(initialize, 4000);

        $(document).on('click', '#btnShowMoreFilter', function(e) {
            e.preventDefault();

            Control.show('moreFiltersPane');
            Control.hide('btnShowMoreFilter');
        });

        $(document).on('click',
            '#btnShowRoute',
            function(e) {
                e.preventDefault();

                var validationPassed = $("#startPosition").validate(['required', 'min:3'])
                    .displayErrorOn('#errorStartingLocation');

                if (validationPassed)
                    map.DrawRoute($("#startPosition").val(), $("#<%= organizationMapDestination.ClientID %>").val());
            });

        $("#<%= btnAddToFav.ClientID %>").click(function (e) {
            e.preventDefault();

            if ($("#<%= btnAddToFav.ClientID %>").attr('src') == '/Images/starcolored.png') {
                    $("#<%= btnAddToFav.ClientID %>").attr('src', '/Images/star.png');
                } else {
                $("#<%= btnAddToFav.ClientID %>").attr('src', '/Images/starcolored.png');
                }

              var id = window.location.href.includes('?')
                  ? window.location.href.split('=')[1]
                  : window.location.href.split('/')[window.location.href.split('/').length - 1];
              var aID = $('#viewOrgAnnouncementId').val();
              console.log(aID);
              (new http).post("Organizations.aspx/OnFavoriteOrgAnnouncements",
                  {
                      organnouncementId: aID
                  }).then(function (response) {
                      if (response.d) {
                          if ($("#<%= btnAddToFav.ClientID %>").attr('src') != '/Images/starcolored.png') {
                                swal(
                                    'Removed from favorites!',
                                    'Announcement has been removed to your favorites list!',
                                    'success'
                                );
                            } else {
                                swal(
                                    'Added to favorites!',
                                    'Announcement has been added from your favorites list!',
                                    'success'
                                );
                            }
                        } else {
                            swal(
                                'You are not be able to add it to favorites!',
                                'You must Log-in first!',
                                'Warning'
                            );
                        }

                    }).run();
          });

        $(document).on('click',
            '#ShareTw',
            function(e) {
                e.preventDefault();


                var message = $('#<%= OrganizationName.ClientID %>').text().substr(0, 80) +
                    '\n' +
                    'www.mycatholicportal.org/Organizations.aspx?id=' +
                    $("#<%= OrganizationId.ClientID %>").val() +
                    '   via @SimbahanApp';

                window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message),
                    "Share to Twitter",
                    "width=500,height=300");

            });

        $(document).on('click',
            '#ShareFb',
            function(e) {
                e.preventDefault();

               <%--window.open(
                    'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/Organizations.aspx?id=' +
                    $("#<%= OrganizationId.ClientID %>").val(),
                    'Share To Facebook',
                    'width=500,height=300');--%>

              <%-- window.open(
                    'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/Organizations/' +
                    $("#<%= OrganizationId.ClientID %>").val() + "/" + $("#<%= maskData.ClientID %>").val(),
                    'Share To Facebook',
                    'width=500,height=300');--%>

               window.open(
                    "https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org/Organizations.aspx&link=http://www.mycatholicportal.org/Organizations/" +
                    $("#<%= OrganizationId.ClientID %>").val() + "/" + $("#<%= maskData.ClientID %>").val(),
                    'Share To Facebook',
                    'width=500,height=300');

                 <%--window.open(
                        'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/Organization/' + $("#<%= OrganizationId.ClientID %>").val() + "&description=" +
                        $("#OrganizationAbout").val(),
                        'Share To Facebook',
                        'width=500,height=300');--%>

            });

        $(document).on('click',
            '#<%= AddFav.ClientID %>',
            function(e) {
                e.preventDefault();

                if (!isAuth) {
                    document.cookie = "intendedRedirect=" + currentPage + ";";
                    window.location.href = "Login.aspx";
                    return;
                }

                (new http).post('Organizations.aspx/AddOrganizationToFavorite',
                    {
                        organizationId: $("#<%= OrganizationId.ClientID %>").val()
                    }).then(function(data) {
                    if (data.d) {
                        Control.hide('<%= AddFav.ClientID %>');
                        Control.show('<%= RemoveFav.ClientID %>');

                        swal('Success!',
                            'Organization has been added to your favorites!',
                            'success');
                    } else {
                        swal('Oops!',
                            'This organization is already in your favorite list',
                            'error');
                    }
                }).run();
            });
         $(document).on('click',
   '#btnShareSocialTwit',
   function (e) {
       e.preventDefault();

       var id = window.location.href.includes('?')
           ? window.location.href.split('=')[1]
           : window.location.href.split('/')[window.location.href.split('/').length - 1];

       var message = $("#viewAnnouncementTitle").text() +
                    'http://www.mycatholicportal.org/Organizations.aspx?id=' +
                    id +
                    " via " ;

                window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message) + encodeURI('@SimbahanApp'),
                    "mywindow",
                    "width=500,height=300");
            });

            $(document).on('click',
                '#btnShareSocialFB',
                function (e) {
                    e.preventDefault();

                    var message = '';

                    var org = '?id=';
                    
                    var id = $("#<%= OrganizationId.ClientID %>").val();
                    window.open(
                        'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org/Organizations.aspx&link=http://www.mycatholicportal.org/Organizations.aspx' +
                        org +
                        id,
                        'width=500,height=300');


                  
                })

        $(document).on('click',
            '#<%= RemoveFav.ClientID %>',
            function(e) {
                e.preventDefault();

                if (!isAuth) {
                    document.cookie = "intendedRedirect=" + currentPage + ";";
                    window.location.href = "Login.aspx";
                    return;
                }

                (new http).post('Organizations.aspx/RemoveChurchFromFavorite',
                    {
                        organizationId: $("#<%= OrganizationId.ClientID %>").val()
                    }).then(function(data) {
                    if (data.d) {
                        Control.show('<%= AddFav.ClientID %>');
                        Control.hide('<%= RemoveFav.ClientID %>');
                        swal('Success!',
                            'Organization has been removed from your favorites!',
                            'success');
                    } else {
                        swal('Oops!',
                            'We can\'t find this organization from your favorite list',
                            'error');
                    }
                }).run();
            });

        var starCount = 0;

        $("label.star-1").click(function (e) {
            starCount = 1;
        });
        $("label.star-2").click(function (e) {
            starCount = 2;
        });
        $("label.star-3").click(function (e) {
            starCount = 3;
        });
        $("label.star-4").click(function (e) {
            starCount = 4;
        });
        $("label.star-5").click(function (e) {
            starCount = 5;
        });

        $(document).on('click',
            '#btnPublishReview',
            function(e) {
                e.preventDefault();

                var commentReviewPassed = $("#comment").validate(['required', 'min:3'])
                    .displayErrorOn('#errorComment');

                if (commentReviewPassed) {
                    (new http).post('<%= ResolveUrl("Organizations.aspx/PublishReview")%>',
                        {
                            organizationId: $("#<%= OrganizationId.ClientID %>").val(),
                            rate: starCount,
                            title: '',
                            content: $("#comment").val(),
                            name: $("#reviewerName").val()
                        }).then(function(data) {
                        var review = data.d;

                        var reviewControl = new OrganizationReview(review.StarCount,
                            review.Comment,
                            review.UserId == 0 ? review.Name : review.User.FullName,
                            review.FormattedDate);

                        $("#<%= organizationReviewsContainer.ClientID %>").append(reviewControl.render());

                        $("#comment").val('');
                        swal({
                            title: 'Success!',
                            text: 'Your review has been submitted!',
                            type: 'success'
                        }).then(
                     function () {
                         window.location.reload();
                     }
                 );
                        }).run();
                    
                }
                }
            });
    });

    function OrganizationReview(rate, title, comment, name, date) {
        this.rate = rate;
        this.comment = comment;
        this.name = name;
        this.date = date;
    }

    OrganizationReview.prototype.CalculateStarPercentage = function () {
        switch (this.rate) {
        case "0":
        case 0:
            return 0;

        case "1":
        case 1:
            return 18.2;

        case "2":
        case 2:
            return 36.4;

        case "3":
        case 3:
            return 54.6;

        case "4":
        case 4:
            return 72.8;

        case "5":
        case 5:
            return 91;

        default:
            return 0;
        }
    };
    OrganizationReview.prototype.render = function () {
        return "<li itemprop=\"review\" itemtype=\"http://schema.org/Review\">" +
            "<div class=\"eltd-comment clearfix\">" +
            "<div class=\"eltd-comment-image\" itemprop=\"author\" itemtype=\"http://schema.org/Person\">" +
            "<img alt=\"\" src=\"Images\\default_avatar.png\" class=\"avatar avatar-98 photo\" height=\"98\" width=\"98\" />" +
            "</div>" +
            "<div class=\"eltd-comment-text\">" +
            "<div class=\"eltd-comment-info\">" +
            "<div class=\"eltd-review-rating\">" +
            "<span class=\"rating-inner\" style=\"width: " +
            this.CalculateStarPercentage() +
            "%;\"></span>" +
            //"<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Report as abusive\"><i class=\"fa fa-exclamation 5x\" style=\"color: red;\" aria-hidden=\"true\"></i></a>" +
            "</div>" +
            "<div class=\"eltd-review-title\">" +
            "<span>" +
            this.name +
            "</span>" +
            "</div>" +
            "<div class=\"eltd-review-title\">" +
            "<span>" +
            this.title +
            "</span>" +
            "</div>" +
            "</div>" +
            "<div class=\"eltd-text-holder\" id=\"comment-42\" itemprop=\"reviewBody\">" +
            "<p>" +
            this.comment +
            "</p>" +
            "</div>" +
            "<div class=\"eltd-comment-bottom-info\">" +
            "<span class=\"eltd-comment-date\" itemprop=\"datePublished\" content=\"2017 - 02 - 22T11: 36:00 + 0000\">" +
            this.date +
            "</span>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</li>";
    };

    $(document).on('click', '#btnCreateAnnouncement', function(e) {
        e.preventDefault();

        $("#<%= announcementTitle.ClientID %>").val('');
        $("#<%= announcementContent.ClientID %>").val('');
        $("#<%= announcementVenue.ClientID %>").val('');
        $("#<%= AnnouncementImage.ClientID %>").val('');
        $("#<%= announcementStartDate.ClientID %>").val('');
        $("#<%= announcementStartTime.ClientID %>").val('');
        $("#<%= announcementEndDate.ClientID %>").val('');
        $("#<%= announcementEndTime.ClientID %>").val('');

        $("#create-announcement-modal").modal('show');
    });

    $(document).on('click', '#annoucementItem', function (e) {
        e.preventDefault();

        $("#viewAnnouncementImage").attr('src', $(this).data('image'));
        $("#viewAnnouncementTitle").text($(this).data('title'));
        $("#viewOrgAnnouncementId").val($(this).data('id'));
        $("#viewAnnouncementVenue").text($(this).data('venue'));
        $("#viewAnnouncementStartDate").text($(this).data('start-date'));
        $("#viewAnnouncementStartTime").text($(this).data('start-time'));
        $("#viewAnnouncementEndDate").text($(this).data('end-date'));
        $("#viewAnnouncementEndTime").text($(this).data('end-time'));
        $("#viewAnnouncementContent").text($(this).data('content'));

        $("#view-announcement-modal").modal('show');
    });




</script>
</asp:Content>