#!/usr/bin/perl


#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#
# © Ricardo Cristóvão Miranda, 2013, mail@ricardomiranda.com

use strict;
use warnings;
use watch;
use Carp 'croak';

sub mainWatch{
    my @inputHours    = split(/:/, "@_");
    croak "Argument should be hours:minutes!\n" unless (length(@inputHours == 2));

    my $myWatch = watch->new(hours => $inputHours[0], minutes => $inputHours[1]);

    $myWatch->calcAngles;
    $myWatch->printAngles;
    }




mainWatch @ARGV
