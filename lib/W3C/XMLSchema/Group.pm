use strict;
use warnings;

package W3C::XMLSchema::Group;
BEGIN {
  $W3C::XMLSchema::Group::VERSION = '0.0.1';
}
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema Group Definition


has 'name' => (
    traits      => ['XPathValue'],
    xpath_query => './@name',
);


has 'ref' => (
    traits      => ['XPathValue'],
    xpath_query => './@ref',
);


has 'sequence' => (
    isa         => 'W3C::XMLSchema::Sequence',
    traits      => ['XPathObject'],
    xpath_query => './xsd:sequence',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;


__END__
=pod

=encoding utf-8

=head1 NAME

W3C::XMLSchema::Group - XMLSchema Group Definition

=head1 VERSION

version 0.0.1

=head1 DESCRIPTION

Groups, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

=head1 ATTRIBUTES

=head2 name

Name given to group.

=head2 ref

Name of other group this group references.

=head2 sequence

The sequence this group requires. Instance of L<W3C::XMLSchema::Sequence>.

=head1 AUTHOR

  Robin Smidsrød <robin@smidsrod.no>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Robin Smidsrød.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

