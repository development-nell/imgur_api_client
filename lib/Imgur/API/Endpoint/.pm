package Imgur::API::Endpoint::Conversation;

use strict;
use Moo;

has engine=>(is=>'ro',isa=>'Imgur::API');
with 'Imgur::API::URL';

sub conversationList {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/conversations,[],,%p),
		'get',
	);
}

sub conversation {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/conversations/%s,[],'page','offset',%p),
		'get',
	);
}



1;
__PACKAGE__->meta->make_immutable;

package Imgur::API::Endpoint::Album;

use strict;
use Moo;

has engine=>(is=>'ro',isa=>'Imgur::API');
with 'Imgur::API::URL';

sub album {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/album/%s,[],,%p),
		'get',
	);
}

sub albumImages {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/album/%s/images,[],,%p),
		'get',
	);
}

sub albumImage {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/album/%s/image/%s,[],,%p),
		'get',
	);
}

sub albumUpload {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/album,[],,%p),
		'post',
	);
}

sub albumUpdate {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/album/%s,[],,%p),
		'post or put',
	);
}

sub albumDelete {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/album/%s,[],,%p),
		'delete',
	);
}

sub albumFavorite {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/album/%s/favorite,[],,%p),
		'post',
	);
}

sub albumSetTo {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/album/%s,[],,%p),
		'post',
	);
}

sub albumAddTo {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/album/%s/add,[],,%p),
		'put',
	);
}

sub albumRemoveFrom {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/album/%s/remove_images,[],,%p),
		'delete',
	);
}



1;
__PACKAGE__->meta->make_immutable;

package Imgur::API::Endpoint::Image;

use strict;
use Moo;

has engine=>(is=>'ro',isa=>'Imgur::API');
with 'Imgur::API::URL';

sub image {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/image/%s,[],,%p),
		'get',
	);
}

sub imageUpload {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/image,[],,%p),
		'post',
	);
}

sub imageDelete {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/image/%s,[],,%p),
		'delete',
	);
}

sub imageUpdate {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/image/%s,[],,%p),
		'post',
	);
}

sub imageFavorite {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/image/%s/favorite,[],,%p),
		'post',
	);
}



1;
__PACKAGE__->meta->make_immutable;

package Imgur::API::Endpoint::Custom_gallery;

use strict;
use Moo;

has engine=>(is=>'ro',isa=>'Imgur::API');
with 'Imgur::API::URL';

sub customGallery {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/g/custom,[],'sort','page',%p),
		'get',
	);
}

sub customGalleryImage {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/g/custom/%s,[],,%p),
		'get',
	);
}

sub customGalleryAdd {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/g/custom/add_tags,[],,%p),
		'put',
	);
}

sub customGalleryRemove {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/g/custom/remove_tags,[],,%p),
		'delete',
	);
}



1;
__PACKAGE__->meta->make_immutable;

package Imgur::API::Endpoint::Gallery;

use strict;
use Moo;

has engine=>(is=>'ro',isa=>'Imgur::API');
with 'Imgur::API::URL';

sub gallery {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery,[],'section','sort','page',%p),
		'get',
	);
}

sub memeSubgallery {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/g/memes,[],'sort','page',%p),
		'get',
	);
}

sub memeSubgalleryImage {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/g/memes/%s,[],,%p),
		'get',
	);
}

sub subreddit {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/r/%s,[],'sort','page',%p),
		'get',
	);
}

sub subredditImage {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/r/%s/%s,[],,%p),
		'get',
	);
}

sub galleryTag {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/t/%s,[],'sort','page',%p),
		'get',
	);
}

sub galleryTagImage {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/t/%s/%s,[],,%p),
		'get',
	);
}

sub galleryItemTags {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/image/%s/tags,[],,%p),
		'get',
	);
}

sub galleryTagVote {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s/vote/tag/%s/%s,[],,%p),
		'post',
	);
}

sub updateGalleryTags {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/tags/%s,[],,%p),
		'post',
	);
}

sub gallerySearch {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/search,[],'sort','window','page',%p),
		'get',
	);
}

sub galleryRandom {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/random/random,[],'page',%p),
		'get',
	);
}

sub toGallery {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s,[],,%p),
		'post | put',
	);
}

sub fromGallery {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s,[],,%p),
		'delete',
	);
}

sub album {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/album/%s,[],,%p),
		'get',
	);
}

sub image {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/image/%s,[],,%p),
		'get',
	);
}

sub galleryReporting {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url(",[],,%p),
		'post',
	);
}

sub galleryVotes {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s/votes,[],,%p),
		'get',
	);
}

sub galleryVoting {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s/vote/%s,[],,%p),
		'post',
	);
}

sub galleryComments {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s/comments,[],'sort',%p),
		'get',
	);
}

sub galleryComment {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s/comment/%s,[],,%p),
		'get',
	);
}

sub galleryCommentCreation {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s/comment,[],,%p),
		'post',
	);
}

sub galleryCommentReply {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s/comment/%s,[],,%p),
		'post',
	);
}

sub galleryCommentIds {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s/comments/ids,[],,%p),
		'get',
	);
}

sub galleryCommentCount {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/gallery/%s/comments/count,[],,%p),
		'get',
	);
}



1;
__PACKAGE__->meta->make_immutable;

package Imgur::API::Endpoint::Notification;

use strict;
use Moo;

has engine=>(is=>'ro',isa=>'Imgur::API');
with 'Imgur::API::URL';

sub notifications {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/notification,[],,%p),
		'get',
	);
}

sub notification {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/notification/%s,[],,%p),
		'get',
	);
}

sub notificationViewed {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/notification/%s,[],,%p),
		'put or post or delete',
	);
}



1;
__PACKAGE__->meta->make_immutable;

package Imgur::API::Endpoint::Topic;

use strict;
use Moo;

has engine=>(is=>'ro',isa=>'Imgur::API');
with 'Imgur::API::URL';

sub defaults {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/topics/defaults,[],,%p),
		'get',
	);
}

sub galleryTopic {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/topics/%s,[],'sort','page',%p),
		'get',
	);
}

sub galleryTopicItem {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/topics/%s/%s,[],,%p),
		'get',
	);
}



1;
__PACKAGE__->meta->make_immutable;

package Imgur::API::Endpoint::Account;

use strict;
use Moo;

has engine=>(is=>'ro',isa=>'Imgur::API');
with 'Imgur::API::URL';

sub account {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s,[],,%p),
		'get',
	);
}

sub accountGalleryFavorites {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/gallery_favorites,[],'page','sort',%p),
		'get',
	);
}

sub accountFavorites {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/favorites,[],'page','sort',%p),
		'get',
	);
}

sub accountSubmissions {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/submissions/%s,[],,%p),
		'get',
	);
}

sub accountSettings {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/settings,[],,%p),
		'get',
	);
}

sub updateSettings {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url(",[],,%p),
		'put | post',
	);
}

sub accountProfile {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/gallery_profile,[],,%p),
		'get',
	);
}

sub verifyEmail {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/verifyemail,[],,%p),
		'get',
	);
}

sub sendVerifyEmail {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/verifyemail,[],,%p),
		'post',
	);
}

sub albums {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/albums,[],'page',%p),
		'get',
	);
}

sub album {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/album/%s,[],,%p),
		'get',
	);
}

sub albumIds {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/albums/ids,[],'page',%p),
		'get',
	);
}

sub albumCount {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/albums/count,[],,%p),
		'get',
	);
}

sub albumDelete {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/album/%s,[],,%p),
		'delete',
	);
}

sub comments {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/comments,[],'sort','page',%p),
		'get',
	);
}

sub comment {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/comment/%s,[],,%p),
		'get',
	);
}

sub commentIds {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/comments/ids,[],'sort','page',%p),
		'get',
	);
}

sub commentCount {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/comments/count,[],,%p),
		'',
	);
}

sub commentDelete {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/comment/%s,[],,%p),
		'delete',
	);
}

sub images {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/images/%s,[],,%p),
		'get',
	);
}

sub image {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/image/%s,[],,%p),
		'get',
	);
}

sub imageIds {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/images/ids,[],'page',%p),
		'get',
	);
}

sub imageCount {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/images/count,[],,%p),
		'get',
	);
}

sub imageDelete {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/image/%s,[],,%p),
		'delete',
	);
}

sub replies {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/account/%s/notifications/replies,[],,%p),
		'get',
	);
}



1;
__PACKAGE__->meta->make_immutable;

package Imgur::API::Endpoint::Comment;

use strict;
use Moo;

has engine=>(is=>'ro',isa=>'Imgur::API');
with 'Imgur::API::URL';

sub comment {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/comment/%s,[],,%p),
		'get',
	);
}

sub commentCreate {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/comment,[],,%p),
		'post',
	);
}

sub commentDelete {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/comment/%s,[],,%p),
		'delete',
	);
}

sub commentReplies {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/comment/%s/replies,[],,%p),
		'get',
	);
}

sub commentReplyCreate {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/comment/%s,[],,%p),
		'post',
	);
}

sub commentVote {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/comment/%s/vote/%s,[],,%p),
		'post',
	);
}

sub commentReport {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/comment/%s/report,[],,%p),
		'post',
	);
}



1;
__PACKAGE__->meta->make_immutable;

package Imgur::API::Endpoint::Memegen;

use strict;
use Moo;

has engine=>(is=>'ro',isa=>'Imgur::API');
with 'Imgur::API::URL';

sub defaults {
	my ($self,%p) = @_;

	return $self->engine->dispatch_request(
		$self->format_url("/3/memegen/defaults,[],,%p),
		'get',
	);
}



1;
__PACKAGE__->meta->make_immutable;

