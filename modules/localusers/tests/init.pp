#By including the class we declare it; 
#Use the same filename as the manifs that we wrote: init.pp

include localusers
include localusers::groups::finance
include localusers::groups::wheel
