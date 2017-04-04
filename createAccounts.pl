#!/usr/bin/perl

use warnings;
use strict;

open my $fh, '< accounts.conf' or die "Could not open 'accounts.conf'";
my @conf= <$fh>;
close $fh;


my $server;
foreach (@conf) {
    next if /^\s*$/ || /^#/;
    s/\r?\n$//;
    next unless $_;

    my @parts= split /\s+/, $_, 4;
    $server= shift @parts || $server;
    my $localUser= shift @parts;
    my $remoteUser= shift @parts;
    my $password= shift @parts;

    die "Error in line '$_'" unless $server && $localUser && $remoteUser && $password;

    my $dir= $remoteUser . '@' . $server;
    mkdir $dir unless -d $dir;
    my $file= <<EOT;
set syslog
set postmaster "postmaster"
set bouncemail
set no spambounce
set properties ""
set daemon 300

poll $server with proto IMAP timeout 10
       user '$remoteUser' there with password '$password' is '$localUser' here ssl options fetchall dropdelivered expunge 1 idle
EOT

    open $fh, '>', $dir . '/fetchmailrc' or die "Could not create file '$dir/fetchmailrc'";
    print $fh $file;
    close $fh;
}
