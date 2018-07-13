use WWW::YouTube::Download;
use Email::Send;
use Email::Send::Gmail;
use Email::Simple::Creator;
 
my $client = WWW::YouTube::Download->new;
my $video_id = "j3elIEZlOao"; # change video id here (http://www.youtube.com/watch?v=j3elIEZlOao)
 
my $video_url = $client->get_video_url($video_id);
my $title     = $client->get_title($video_id);     # maybe encoded utf8 string.
my $fmt       = $client->get_fmt($video_id);       # maybe highest quality.
my $suffix    = $client->get_suffix($video_id);    # maybe highest quality file suffix

print "Downloading video '$title.$suffix'\n";

$client->download($video_id, {
    filename => '{title}.{suffix}', # maybe `video_title.mp4`
});

print "Downloading video '$title.$suffix' complete...\n";

my $email = Email::Simple->create(
    header => [
        From    => 'shajiindia@gmail.com', #provide your gmail username here
        To      => 'shajiindia@yahoo.com',
        Subject => 'Youtube video download complete.',
    ],
    body => "Youtube video download '$title.$suffix' completed successfully.",
);
 
my $sender = Email::Send->new(
    {   mailer      => 'Gmail',
        mailer_args => [
            username => 'shajiindia@gmail.com', #provide your gmail username here
            password => 'XXXXX', #provide your gmail password here
        ]
    }
);

eval { $sender->send($email) };

if($@) {
	die "Error sending email\n";
} else {
	print "Email sent\n";
}	 		
