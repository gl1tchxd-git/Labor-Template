#import "template.typ": cover, contents, header
#import "setup.typ": styling

#cover

#show: styling
#show: header

#contents.heading

#include "body.typ"

#contents.image

//TODO Make Cover nicer (adjust margins, add info, add Abteilung)
//TODO Add nice header and footer
//TODO Add rules for things like code blocks and short math blocks