use strict;
use warnings;

package W3C::XMLSchema::Sequence;
BEGIN {
  $W3C::XMLSchema::Sequence::VERSION = '0.0.1';
}
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema Sequence Definition


has 'items' => (
    traits      => ['XPathObjectList'],
    xpath_query => './*',
    isa_map     => {
        'xsd:group'   => 'W3C::XMLSchema::Group',
        'xsd:element' => 'W3C::XMLSchema::Element',
    },
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;


__END__
=pod

=encoding utf-8

=head1 NAME

W3C::XMLSchema::Sequence - XMLSchema Sequence Definition

=head1 VERSION

version 0.0.1

=head1 DESCRIPTION

Sequence, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

=head1 ATTRIBUTES

=head2 items

List of items in this sequence. Instances of L<W3C::XMLSchema::Group> or
L<W3C::XMLSchema::Element>.

=head1 AUTHOR

  Robin Smidsrød <robin@smidsrod.no>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Robin Smidsrød.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

