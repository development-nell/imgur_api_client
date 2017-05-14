
use strict;
use feature qw(say);
use Web::Scraper;
use URI;
use Data::Dumper;
use JSON::XS;
use HTML::TreeBuilder::LibXML;
use LWP::UserAgent;
use HTTP::Message;
use Template;

my $template = Template->new();

my @pages = qw(account account_settings album basic comment conversation custom_gallery gallery_album gallery_image gallery_profile image meme_metadata message notification tag tag_vote topic vote);
my $models = {};

foreach my $model (@pages) {
	say $model;
	my $tree = get_page("https://api.imgur.com/models/$model");
	my @options;
	$models->{$model} = [];
	my ($main) = $tree->look_down(_tag=>'div',id=>'gallery_images');
	next if (!$main);
	my ($fields_table) = $main->find("table");
	next if (!$fields_table);
	foreach my $fields_row (($fields_table->find("tr"))) {
		if ($fields_row->attr('class') ne "header") {
			my ($name,$type,$desc) = map {$_->as_text} $fields_row->find("td");
			push(@{$models->{$model}},{
				name=>$name,
				type=>$type,
				desc=>$desc,
			});
		}
	}
}

my $json =  JSON::XS->new->pretty;
say $json->encode($models);


sub get_page {
	my ($url) = @_;

	my $ua = LWP::UserAgent->new();	
	$ua->agent('Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/4.0.202.0 Safari/532.0');
    my $res = $ua->get($url,'Accept-Encoding'=>HTTP::Message::decodable);
    if ($res->code == 200) {
    	my $content = HTML::TreeBuilder::LibXML->new_from_content($res->decoded_content);
    	return $content->elementify;
	}
	return undef;
}

