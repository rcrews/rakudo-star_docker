#!/usr/bin/env perl6
use XML::LibXML:from<Perl5>;

# A Perl 6 version of the SYNOPSIS script from the XML::LibXML perldoc
# at https://metacpan.org/pod/distribution/XML-LibXML/LibXML.pod

my $dom = XML::LibXML.load_xml(string => q :to<EOT>);
<some-xml/>
EOT

my $Version_String = XML::LibXML::LIBXML_DOTTED_VERSION;
my $Version_ID = XML::LibXML::LIBXML_VERSION;
my $DLL_Version = XML::LibXML::LIBXML_RUNTIME_VERSION;
# my $libxmlnode = XML::LibXML.import_GDOME( $node, $deep );
# my $gdomenode = XML::LibXML.export_GDOME( $node, $deep );

my $fh = open "/project/version-string.txt", :w;
$fh.say($Version_String);
$fh.close;

put $Version_String;
