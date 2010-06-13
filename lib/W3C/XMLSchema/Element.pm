use strict;
use warnings;

package W3C::XMLSchema::Element;
BEGIN {
  $W3C::XMLSchema::Element::VERSION = '0.0.1';
}
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema Element Definition


has 'name' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@name',
);


has 'type' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@type',
);


has 'ref' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@ref',
);


has 'minOccurs' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@minOccurs',
);


has 'maxOccurs' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@maxOccurs',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;


__END__
=pod

=encoding utf-8

=head1 NAME

W3C::XMLSchema::Element - XMLSchema Element Definition

=head1 VERSION

version 0.0.1

=head1 DESCRIPTION

Element, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

=head1 ATTRIBUTES

=head2 name

Name given to attribute.

=head2 type

Type given of attribute.

=head2 ref

Identifier of the element this element refers to.

=head2 minOccurs

Minimum amount of occurences.

=head2 maxOccurs

Maximum amount of occurences. 'unbounded' means no upper limit.

=head1 AUTHOR

  Robin Smidsrød <robin@smidsrod.no>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Robin Smidsrød.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

