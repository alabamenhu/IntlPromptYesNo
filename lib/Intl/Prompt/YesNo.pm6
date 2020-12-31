unit module YesNo;

use Intl::UserLanguage;
use Intl::CLDR;

#| Prompt the user for confirmation using a localized yes/no prompt
sub prompt-yes-no(
        $message = '',             #= Message to accompany the prompt
        :$long = False,            #= If true, prefer longer forms (yes/no) over default short forms (y/n)
        :$language = user-language #= The language to use in the prompt
        --> Bool
) is export {

    my \messages = cldr{$language}.posix.messages;

    # split into each version
    my @yes = messages.yesstr.split: ':';
    my @no  = messages.nostr.split:  ':';

    # Get the display versions by sorting by length
    my $sort-order = $long ?? -1 !! 1;
    my $yes = @yes.sort($sort-order * *.chars).head;
    my $no  = @no.sort( $sort-order * *.chars).head;

    # Add a space if there's a message and it doesn't end with one already
    my $spacer = $message && $message.substr(*-1).uniprop ne 'Zs' ?? ' ' !! '';

    # Initial message to allow for a pure loop later ^_^
    print $message ~ $spacer;

    my $response;

    # CLDR standard says for cased languages that comparisons should be done on the
    # lower case version of strings
    $response = (prompt "[$yes/$no]: ").lc
        while $response ∉ @yes ∪ @no;

    # True  == yes
    # False == no
    $response ∈ @yes
}