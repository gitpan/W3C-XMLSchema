use strict;
use warnings;

package W3C::XMLSchema;
BEGIN {
  $W3C::XMLSchema::VERSION = '0.0.2';
}
use Moose;
with 'XML::Rabbit::RootNode';

# ABSTRACT: Parser for W3C XML Schema Definition (XSD)

use 5.008;


has '+namespace_map' => (
    default => sub { {
        'xsd' => 'http://www.w3.org/2001/XMLSchema',
    } }
);


has 'target_namespace' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@targetNamespace',
);


has 'attribute_groups' => (
    isa         => 'ArrayRef[W3C::XMLSchema::AttributeGroup]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:attributeGroup',
);


has 'groups' => (
    isa         => 'ArrayRef[W3C::XMLSchema::Group]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:group',
);


has 'complex_types' => (
    isa         => 'ArrayRef[W3C::XMLSchema::ComplexType]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:complexType',
);


has 'elements' => (
    isa         => 'ArrayRef[W3C::XMLSchema::Element]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:element',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;


__END__
=pod

=encoding utf-8

=head1 NAME

W3C::XMLSchema - Parser for W3C XML Schema Definition (XSD)

=head1 VERSION

version 0.0.2

=head1 SYNOPSIS

    use W3C::XMLSchema;

    my $xsd=W3C::XMLSchema->new( file => shift );
    print "Target namespace: " . $xsd->target_namespace . "\n";

    print "Attribute groups:\n";
    foreach my $attr_group ( @{ $xsd->attribute_groups } ) {
        print $attr_group->name . "\n";
        foreach my $attr ( @{ $attr_group->attributes } ) {
            print "\t"
                 . $attr->name
                 . " (" . $attr->type . ") "
                 . ( $attr->use eq 'required' ? '*' : '-' )
                 . "\n";
        }
    }

=head1 DESCRIPTION

This is a module that makes it easy to iterate over and extract information
from an XML Schema definition (aka XSD), as defined by the W3C.

=head1 ATTRIBUTES

=head2 namespace_map

Namespace map for XMLSchema definition.

=head2 target_namespace

The namespace the schema definition targets.

=head2 attribute_groups

A list of all the attribute groups defined. Instances of L<W3C::XMLSchema::AttributeGroup>.

=head2 groups

A list of all the groups defined. Instances of L<W3C::XMLSchema::Group>.

=head2 complex_types

A list of all the complex types defined. Instances of L<W3C::XMLSchema::ComplexType>.

=head2 elements

A list of all the elements defined. Instances of L<W3C::XMLSchema::Element>.

=head1 INCOMPLETE IMPLEMENTATION / WORK-IN-PROGRESS

This implementation is incomplete and should be considered a
work-in-progress. Please file bug reports (or provide patches) if something
you need is not extractable with the current API.

=head1 SEMANTIC VERSIONING

This module uses semantic versioning concepts from L<http://semver.org/>.

=head1 ACKNOWLEDGEMENTS

The following people have helped to review or otherwise encourage
me to work on this module.

Chris Prather (perigrin)

=head1 SEE ALSO

=over 4

=item *

L<XML::Rabbit>

=item *

L<XML::Toolkit>

=item *

L<Moose>

=item *

L<XML::LibXML>

=back

=for :stopwords CPAN AnnoCPAN RT CPANTS Kwalitee diff

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

  perldoc W3C::XMLSchema

=head2 Websites

=over 4

=item *

Search CPAN

L<http://search.cpan.org/dist/W3C-XMLSchema>

=item *

AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/W3C-XMLSchema>

=item *

CPAN Ratings

L<http://cpanratings.perl.org/d/W3C-XMLSchema>

=item *

CPAN Forum

L<http://cpanforum.com/dist/W3C-XMLSchema>

=item *

RT: CPAN's Bug Tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=W3C-XMLSchema>

=item *

CPANTS Kwalitee

L<http://cpants.perl.org/dist/overview/W3C-XMLSchema>

=item *

CPAN Testers Results

L<http://cpantesters.org/distro/W/W3C-XMLSchema.html>

=item *

CPAN Testers Matrix

L<http://matrix.cpantesters.org/?dist=W3C-XMLSchema>

=item *

Source Code Repository

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

L<git://github.com/robinsmidsrod/W3C-XMLSchema.git>

=back

=head2 Bugs

Please report any bugs or feature requests to C<bug-w3c-xmlschema at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=W3C-XMLSchema>.  I will be
notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 AUTHOR

  Robin Smidsrød <robin@smidsrod.no>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Robin Smidsrød.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

