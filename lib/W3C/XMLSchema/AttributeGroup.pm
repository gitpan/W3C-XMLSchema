use strict;
use warnings;

package W3C::XMLSchema::AttributeGroup;
BEGIN {
  $W3C::XMLSchema::AttributeGroup::VERSION = '0.0.2';
}
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema Attribute Group Definition


has 'name' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@name',
);


has 'ref' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@ref',
);


has 'attribute_groups' => (
    isa         => 'ArrayRef[W3C::XMLSchema::AttributeGroup]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:attributeGroup',
);


has 'attributes' => (
    isa         => 'ArrayRef[W3C::XMLSchema::Attribute]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:attribute',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;


__END__
=pod

=encoding utf-8

=head1 NAME

W3C::XMLSchema::AttributeGroup - XMLSchema Attribute Group Definition

=head1 VERSION

version 0.0.2

=head1 DESCRIPTION

AttributeGroups, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

=head1 ATTRIBUTES

=head2 name

Name given to attribute group.

=head2 ref

Name of other AttributeGroup this attribute group references.

=head2 attribute_groups

Child AttributeGroup of this AttributeGroup. Mostly used for referencing other AttributeGroups.

=head2 attributes

List of attributes associated with this attribute group. Instance type L<W3C::XMLSchema::Attribute>.

=head1 AUTHOR

  Robin Smidsrød <robin@smidsrod.no>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Robin Smidsrød.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

