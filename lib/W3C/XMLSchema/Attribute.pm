use strict;
use warnings;

package W3C::XMLSchema::Attribute;
BEGIN {
  $W3C::XMLSchema::Attribute::VERSION = '0.0.1';
}
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema Attribute Definition


has 'name' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@name',
);


has 'type' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@type',
);


has 'use' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@use',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;


__END__
=pod

=encoding utf-8

=head1 NAME

W3C::XMLSchema::Attribute - XMLSchema Attribute Definition

=head1 VERSION

version 0.0.1

=head1 DESCRIPTION

Attribute, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

=head1 ATTRIBUTES

=head2 name

Name given to attribute.

=head2 type

Type given of attribute.

=head2 use

If the attribute is required or not. A string with the value 'required' or 'optional';

=head1 AUTHOR

  Robin Smidsrød <robin@smidsrod.no>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Robin Smidsrød.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

