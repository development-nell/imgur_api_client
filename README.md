## Imgur::API - A Minimal Client for Imgur

Minimal client for Imgur's REST api. A work in progress. Currently only anonymous calls are supported.

## Install

cpan .

## Usage

```perl 
my $imgur = Imgur::API->new(api_key=><your_api_key>);

my $ret = $imgur->image->upload(image=>"http://site.com/image.jpg");
my $ret = $imgur->image->upload(image=>$imgur->content("../images/temp/something.jpg");
```

## More information

https://apidocs.imgur.com/
