clear all;close all;clc
hex = hexagon(5,0,0);
[hex_trans,T] = translation(hex,10);
[hex_Euc,E]= Euclidian(hex,pi*(45/180),10);
[hex_sim,S] = similarity(hex,pi*(45/180),0.5,10);
[hex_aff,Aff] = affine(hex,0.5,0.8,0.5,0.7,0.6,0.5);
[hex_pro,P] = projective(hex,0.5,0.8,0.5,0.7,0.6,0.5,0.1,0.1);
hex_cart_pro = [hex_pro(1,:)./hex_pro(3,:);hex_pro(2,:)./hex_pro(3,:)];

tri = equtri(5,0,0);
[tri_trans,~] = translation(tri,10);
[tri_Euc,~]= Euclidian(tri,pi*(45/180),10);
[tri_sim,~] = similarity(tri,pi*(45/180),0.5,10);
[tri_aff,~] = affine(tri,0.5,0.8,0.5,0.7,0.6,0.5);
[tri_pro,~] = projective(tri,0.5,0.8,0.5,0.7,0.6,0.5,0.1,0.1);
tri_cart_pro = [tri_pro(1,:)./tri_pro(3,:);tri_pro(2,:)./tri_pro(3,:)];

squ = square(5,0,0);
[squ_trans,~] = translation(squ,10);
[squ_Euc,~]= Euclidian(squ,pi*(45/180),10);
[squ_sim,~] = similarity(squ,pi*(45/180),0.5,10);
[squ_aff,~] = affine(squ,0.5,0.8,0.5,0.7,0.6,0.5);
[squ_pro,~] = projective(squ,0.5,0.8,0.5,0.7,0.6,0.5,0.1,0.1);
squ_cart_pro = [squ_pro(1,:)./squ_pro(3,:);squ_pro(2,:)./squ_pro(3,:)];

%%
fig1=figure('color','w');
    plot(hex(1,:)./hex(3,:),hex(2,:)./hex(3,:),'-k',hex_trans(1,:)./hex_trans(3,:),hex_trans(2,:)./hex_trans(3,:),'-r');
    legend('Original','Translation','Location','northwest')
    title('Hexagon-Translation')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;
%     plot(hex(1,:),hex(2,:),'o')
%     hold on 
%     
%     for i=1:6
%         text(hex(1,i)+0.5,hex(2,i)+0.5,int2str(i))
%     end
    

%%
fig2=figure('color','w');
    plot(hex(1,:)./hex(3,:),hex(2,:)./hex(3,:),'-k',hex_Euc(1,:)./hex_Euc(3,:),hex_Euc(2,:)./hex_Euc(3,:),'-r');
    legend('Original','Euclidian','Location','northwest')
    title('Hexagon-Euclidian')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig3=figure('color','w');
    plot(hex(1,:)./hex(3,:),hex(2,:)./hex(3,:),'-k',hex_sim(1,:)./hex_sim(3,:),hex_sim(2,:)./hex_sim(3,:),'-r');
    legend('Original','Similarity','Location','northwest')
    title('Hexagon-Similarity')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig4=figure('color','w');
    plot(hex(1,:)./hex(3,:),hex(2,:)./hex(3,:),'-k',hex_aff(1,:)./hex_aff(3,:),hex_aff(2,:)./hex_aff(3,:),'-r');
    legend('Original','Affine','Location','northwest')
    title('Hexagon-Affine')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig5=figure('color','w');
    plot(hex(1,:)./hex(3,:),hex(2,:)./hex(3,:),'-k',hex_pro(1,:)./hex_pro(3,:),hex_pro(2,:)./hex_pro(3,:),'-r');
    legend('Original','Projective','Location','northwest')
    title('Hexagon-Projective')
    xlabel('x')
    ylabel('y')
    %xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig6=figure('color','w');
    plot(tri(1,:)./tri(3,:),tri(2,:)./tri(3,:),'-k',tri_trans(1,:)./tri_trans(3,:),tri_trans(2,:)./tri_trans(3,:),'-r');
    hold on 
    legend('Original','Translation','Location','northwest')
    title('Equilateral Triangle-Translation')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;
%     plot(tri(1,:),tri(2,:),'o')
%     for i=1:3
%         text(tri(1,i)+0.5,tri(2,i)+0.5,int2str(i))
%     end
%     hlod on

%%
fig7=figure('color','w');
    plot(tri(1,:)./tri(3,:),tri(2,:)./tri(3,:),'-k',tri_Euc(1,:)./tri_Euc(3,:),tri_Euc(2,:)./tri_Euc(3,:),'-r');
    legend('Original','Euclidian','Location','northwest')
    title('Equilateral Triangle-Euclidian')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig8=figure('color','w');
    plot(tri(1,:)./tri(3,:),tri(2,:)./tri(3,:),'-k',tri_sim(1,:)./tri_sim(3,:),tri_sim(2,:)./tri_sim(3,:),'-r');
    legend('Original','Similarity','Location','northwest')
    title('Equilateral Triangle-Similarity')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig9=figure('color','w');
    plot(tri(1,:)./tri(3,:),tri(2,:)./tri(3,:),'-k',tri_aff(1,:)./tri_aff(3,:),tri_aff(2,:)./tri_aff(3,:),'-r');
    legend('Original','Affine','Location','northwest')
    title('Equilateral Triangle-Affine')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig10=figure('color','w');
    plot(tri(1,:)./tri(3,:),tri(2,:)./tri(3,:),'-k',tri_pro(1,:)./tri_pro(3,:),tri_pro(2,:)./tri_pro(3,:),'-r');
    legend('Original','Projective','Location','northwest')
    title('Equilateral Triangle-Projective')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig11=figure('color','w');
    plot(squ(1,:)./squ(3,:),squ(2,:)./squ(3,:),'-k',squ_trans(1,:)./squ_trans(3,:),squ_trans(2,:)./squ_trans(3,:),'-r');
    hold on
    legend('Original','Translation','Location','northwest')
    title('Square-Translation')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 18]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;
%     plot(squ(1,:),squ(2,:),'o')
%     for i=1:4
%         text(squ(1,i)+0.5,squ(2,i)+0.5,int2str(i))
%     end
%     hlod on

%%
fig12=figure('color','w');
    plot(squ(1,:)./squ(3,:),squ(2,:)./squ(3,:),'-k',squ_Euc(1,:)./squ_Euc(3,:),squ_Euc(2,:)./squ_Euc(3,:),'-r');
    legend('Original','Euclidian','Location','northwest')
    title('Square-Euclidian')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 18]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig13=figure('color','w');
    plot(squ(1,:)./squ(3,:),squ(2,:)./squ(3,:),'-k',squ_sim(1,:)./squ_sim(3,:),squ_sim(2,:)./squ_sim(3,:),'-r');
    legend('Original','Similarity','Location','northwest')
    title('Square-Similarity')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig14=figure('color','w');
    plot(squ(1,:)./squ(3,:),squ(2,:)./squ(3,:),'-k',squ_aff(1,:)./squ_aff(3,:),squ_aff(2,:)./squ_aff(3,:),'-r');
    legend('Original','Affine','Location','northwest')
    title('Square-Affine')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;

%%
fig15=figure('color','w');
    plot(squ(1,:)./squ(3,:),squ(2,:)./squ(3,:),'-k',squ_pro(1,:)./squ_pro(3,:),squ_pro(2,:)./squ_pro(3,:),'-r');
    legend('Original','Projective','Location','northwest')
    title('Square-Projective')
    xlabel('x')
    ylabel('y')
    xlim([-8 18]);ylim([-5 15]);grid on;
    set(gca,'linewidth',1,'FontSize',18,'fontname','Times New Roman','GridLineStyle','-','MinorGridLineStyle','-')
    grid on;
%%
% fig1_savename=['./','Hex_Trans.tif'];
% h=getframe(fig1);
% imwrite(h.cdata,fig1_savename);
% fig2_savename=['./','Hex_Euc.tif'];
% h=getframe(fig2);
% imwrite(h.cdata,fig2_savename);
% fig3_savename=['./','Hex_Sim.tif'];
% h=getframe(fig3);
% imwrite(h.cdata,fig3_savename);
% fig4_savename=['./','Hex_Aff.tif'];
% h=getframe(fig4);
% imwrite(h.cdata,fig4_savename);
% fig5_savename=['./','Hex_Pro.tif'];
% h=getframe(fig5);
% imwrite(h.cdata,fig5_savename);
% fig6_savename=['./','Tri_Trans.tif'];
% h=getframe(fig6);
% imwrite(h.cdata,fig6_savename);
% fig7_savename=['./','Tri_Euc.tif'];
% h=getframe(fig7);
% imwrite(h.cdata,fig7_savename);
% fig8_savename=['./','Tri_Sim.tif'];
% h=getframe(fig8);
% imwrite(h.cdata,fig8_savename);
% fig9_savename=['./','Tri_Aff.tif'];
% h=getframe(fig9);
% imwrite(h.cdata,fig9_savename);
% fig10_savename=['./','Tri_Pro.tif'];
% h=getframe(fig10);
% imwrite(h.cdata,fig10_savename);
% fig11_savename=['./','Squ_Trans.tif'];
% h=getframe(fig11);
% imwrite(h.cdata,fig11_savename);
% fig12_savename=['./','Squ_Euc.tif'];
% h=getframe(fig12);
% imwrite(h.cdata,fig12_savename);
% fig13_savename=['./','Squ_Sim.tif'];
% h=getframe(fig13);
% imwrite(h.cdata,fig13_savename);
% fig14_savename=['./','Squ_Aff.tif'];
% h=getframe(fig14);
% imwrite(h.cdata,fig14_savename);
% fig15_savename=['./','Squ_Pro.tif'];
% h=getframe(fig15);
% imwrite(h.cdata,fig15_savename);
