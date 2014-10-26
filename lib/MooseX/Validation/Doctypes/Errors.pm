package MooseX::Validation::Doctypes::Errors;
BEGIN {
  $MooseX::Validation::Doctypes::Errors::AUTHORITY = 'cpan:DOY';
}
{
  $MooseX::Validation::Doctypes::Errors::VERSION = '0.01';
}
use Moose;
# ABSTRACT: error class for MooseX::Validation::Doctypes



has errors => (
    is        => 'ro',
    predicate => 'has_errors',
);


has extra_data => (
    is        => 'ro',
    predicate => 'has_extra_data',
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__
=pod

=head1 NAME

MooseX::Validation::Doctypes::Errors - error class for MooseX::Validation::Doctypes

=head1 VERSION

version 0.01

=head1 SYNOPSIS

  use MooseX::Validation::Doctypes;

  doctype 'Person' => {
      id    => 'Str',
      name  => 'Str',
      title => 'Str',
  };

  use JSON;

  my $data = decode_json('{"id": "1234-A", "name": "Bob", "title": "CIO"}');

  use Moose::Util::TypeConstraints;

  my $person = find_type_constraint('Person');
  my $errors = $person->validate($data);

  use Data::Dumper;

  warn Dumper($errors->errors)     if $errors->has_errors;
  warn Dumper($errors->extra_data) if $errors->has_extra_data;

=head1 DESCRIPTION

This class holds the errors that were found when validating a doctype. There
are two types of errors: either an existing piece of data didn't validate
against the given type constraint, or extra data was provided that wasn't
listed in the doctype. These two types correspond to the C<errors> and
C<extra_data> attributes described below.

=head1 ATTRIBUTES

=head2 errors

Returns the errors that were detected. The return value will be a data
structure with the same form as the doctype, except only leaves corresponding
to values that failed to match their corresponding type constraint. The values
will be an appropriate error message.

=head2 extra_data

Returns the extra data that was detected. The return value will be a data
structure with the same form as the incoming data, except only containing
leaves for data which was not represented in the doctype. The values will be
the values from the actual data being validated.

=head1 METHODS

=head2 has_errors

Returns true if any errors were found when validating the data against the type
constraints.

=head2 has_extra_data

Returns true if any extra data was found when comparing the data to the
doctype.

=head1 AUTHOR

Jesse Luehrs <doy at cpan dot org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Jesse Luehrs.

This is free software, licensed under:

  The MIT (X11) License

=cut

