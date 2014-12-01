#!/usr/bin/perl
# Script for collecting simple stats
# $Id: stats.pl,v 1.1 2005/11/28 05:16:55 livshits Exp $

$prefix = "securibench/micro";
$LINE = ('-' x 60) . "\n";

opendir D, $prefix or die;
@_ = grep {!/^\./ && !/CVS/ && -d "$prefix/$_"} readdir D;
print $LINE;
foreach(@_){
	&process_dir($prefix, $_);
}
closedir D;


print $LINE;
printf "%40s\t%3d \n", 'Total', $COUNT;
print $LINE;
	
sub process_dir(){
	my $prefix = shift; $dir = shift;
	my $count = 0;
	print "Processing $dir \n" if $VERBOSE;
	
	while(<$prefix/$dir/*.java>){
		++$count;
	}
	
	printf "%40s\t%3d \n", $dir, $count;

	$COUNT += $count;
}