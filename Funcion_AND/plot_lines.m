function h1=plot_lines(W)

len=length(W);
X= sym('x%d%d',[len-1,1], 'real');  %genero vector simbolico de len x 1 
X=[X;1];


h1=fimplicit(W*X ==0);
set(gca,'XAxisLocation','origin','YAxisLocation','origin')
xlim('manual')
xlim([-5 5])
ylim('manual')
ylim([-5 5])