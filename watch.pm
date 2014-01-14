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

package watch;

use MooseX::Declare;
use Moose::Util::TypeConstraints;
use strict;
use warnings;
use Carp 'croak';


class watch {
    subtype 'hourInterval', as 'Int', where { $_ >= 0 && $_ < 24},
                                      message { "The number you provided, $_, was not a valid hour (1-23).\n" };

    subtype 'minutesInterval', as 'Int', where { $_ >= 0 && $_ < 59},
                                         message { "The number you provided, $_, was not a valid minute (1-59).\n" };

    has 'hours'                => (isa => 'hourInterval',    is => 'rw', required => 1);
    has 'minutes'              => (isa => 'minutesInterval', is => 'rw', required => 1);
    has 'hoursPointerAngle'    => (isa => 'Num',             is => 'rw');
    has 'minutesPointerAngles' => (isa => 'Num',             is => 'rw');

    method clear {
        $self->hours  (0);
        $self->minutes(0);
    }

    method calcAngles {
        $self->calcHoursAngle;
        $self->calcMinutesAngle;
    }

    method hoursPointerPosition {
        ($self->hours < 12) ? return ($self->hours) : return ($self->hours - 12);
    }

    method calcHoursAngle   {
        $self->hoursPointerAngle    ($self->hoursPointerPosition * 360.0 / 12.0);
    }

    method calcMinutesAngle {
        $self->minutesPointerAngles ($self->minutes              * 360.0 / 60.0);
    }

    method printAngles {
        print "At " . $self->hours . " hours and " . $self->minutes . " minutes the pointers positon is:\n";
        print " - minutes\' pointer is " . $self->minutesPointerAngles . "º from vertical; and\n";
        print " - hours\' pointer is "   . $self->hoursPointerAngle    . "º from vertical.\n";
    }
}
