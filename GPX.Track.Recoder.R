#Script to add an hour to all times in a Strava track. Copes with Daylight Savings GPS bug.

#read in GPX track from Strava
track<-readLines("/PATH_To_GPX_File/File.gpx")

#Look at first lines of file
head(track)

#turn hours of activity to numeric, add one hour, reconvert to character, recombine, write as new track
for(i in 1:length(track))
{
	if(strsplit(track[i],">")[[1]][1]=="  <time") {item1<-strsplit(track[i],"T")[[1]][1]; item2<-strsplit(track[i],"T")[[1]][2]; item2.2<-strsplit(item2,":")[[1]][2]; item2.3<-strsplit(item2,":")[[1]][3]; item2.1<-as.character(as.numeric(strsplit(item2,":")[[1]][1])+1); 	item2.new<-paste(item2.1,item2.2,item2.3,sep=":"); revisedtrackline<-paste(item1,item2.new,sep="T")} else revisedtrackline<-track[i]
	
	write(revisedtrackline,file="/PATH_To_GPX_File/newtesttrack.gpx",append=TRUE)	
}
