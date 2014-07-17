#!/usr/bin/perl 
# mk 2004  feel free to distribute
#  mklein@nmedia.net, _Vile
#  perl script to reboot phones
#  try telnetting to your phone, first.
#
use Net::Telnet ();

$phone_ip = shift; 

# Your Cisco 79xx prompt
$prompt = "Enter Your Prompt Here";

# Your Password
$password = "xxxxxx";

# Reset Command
$command = "reset";

if ($phone_ip eq "all")
{
	reboot("xxx.xx.x.xx",$password,$command,$prompt); 
	reboot("xxx.xx.x.xx",$password,$command,$prompt); 
	reboot("xxx.xx.x.xx",$password,$command,$prompt); 
	reboot("xxx.xx.x.xx",$password,$command,$prompt); 
} elsif ($phone_ip eq "") {
	print "Enter an IP or 'all' for All.";
} else {
	reboot($phone_ip,$password,$command,$prompt); 
}

exit;

sub reboot{ 

    my ($ip,$password,$command,$prompt) = @_;

    $t = new Net::Telnet;
    $t->open($ip);

    $t->waitfor('/Password :.*$/');
    $t->print($password);

    $t->waitfor('/'.$prompt.'>.*$/');
    $t->print($command);

} 


