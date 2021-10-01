filename = '09-14-21_Muon_Thresh0p010_DerThresh0p005.txt'; # loading in the data
data =importdata(filename); # importing the file

bins = linspace(0,1,100);
allbins = NaN(100-1,1);


# settin up a linear scale
binedges = linspace(0,1,100); # finding the binedges in linear scale
allbinsl = histc (data+(100*(10^-9)), binedges); # finding the counts in each bin
allbinsl = allbinsl(1:end-1); # correcting the bin due to hist c
totalb = sum(allbinsl); # sum of all bins
altbinsl = (1/totalb)*allbinsl./(diff(binedges'));
bincenter = binedges(1:end-1) + (diff(binedges))/2;
error = sqrt(allbinsl)./(diff(binedges'))*(1/totalb);
figure(3); clf
plot(bincenter,altbinsl,'.','markersize',20);
hold on
errorbar(bincenter, altbinsl, error);
#set(h,"markersize = 20")
#for i = 1:length(allbins);
 # bincount = 0;
 # tic
 # for j = 1:length(data);
 #   if data(j) > bins(i) && data(j) < bins(i+1);
  #    bincount = bincount + 1;
  #  endif
 # endfor
 # allbins(i) = bincount;
 # toc
#endfor

#save myfile.array allbins
#tbins = sum(allbins);
#altbins = (1/tbins)*allbins*(1/0.01)
#figure;
#ylim([-5,25])
#plot(bins,altbins,'.','markersize',20)

#figure;
#hist(data);

% logarithmic plot

binedges = logspace(-7,1,100);
#allbinsl = NaN(100-1,1);
#for i = 1:length(allbinsl);
 # bincount = 0;
  #tic
  #for j = 1:length(data);
   # if data(j) > binsl(i) && data(j) < binsl(i+1);
   #   bincount = bincount + 1;
    #endif
 # endfor
  #allbinsl(i) = bincount;
  #toc
 #endfor

tbinsl = sum(allbinsl);

altbinsl = (1/tbinsl)*allbinsl./(diff(binsl'))
figure;
plot(binsl,altbinsl,'.','markersize',20)

# muon statistics
counts = length(data);
time = sum(data);
Rate = counts/time;

t = logspace(-7,0,100);

poisson = Rate*e.^(-Rate*t);



# settin up a logarithmic scale
binedges = logspace(-7,0,100); # finding the binedges in logarithmic scale
allbinsl = histc (data+(100*(10^-9)), binedges); # finding the counts in each bin
allbinsl= allbinsl(1:end-1); # correcting the bin due to hist c
totalb = sum(allbinsl); # sum of all bins
altbinsl = (1/totalb)*allbinsl./(diff(binedges'));
bincenter = binedges(1:end-1) + (diff(binedges))/2;

errory = (1./allbinsl)*(log10(e)).*(sqrt(allbinsl));

figure(4);clf
#plot(bincenter,altbinsl,'.','markersize',20);
hold on
plot(t,log10(poisson),'b--','linewidth',2);
hold on
errorbar (bincenter, log10(altbinsl), errory,'.r');
set(gca,'xscale','log')%,'yscale','log')