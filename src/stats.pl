#!/usr/bin/perl
# Script for collecting simple stats

#   Copyright 2005 Benjamin Livshits
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
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