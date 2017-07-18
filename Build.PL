use strict;
use warnings FATAL => 'all';
use Module::Build;

my $builder = Module::Build->new(
	module_name    => 'Imgur::API',
   	license        => 'perl',
   	dist_author    => ['Michael Hollenbeck'],
   	configure_requires => {
   		'Config::AutoConf'   => '0.14',
   		'ExtUtils::CBuilder' => '0.27',
   		'ExtUtils::LibBuilder' => '0.01',
   		'Module::Build'      => '0.3603',
	},
	requires=>{
		'HTTP::Message'=>0,
		'HTTP::Request'=>0,
		'JSON::XS'=>0,
		'URI::Escape'=>0,
   	},
	libdir   => "./lib",
);

$builder->create_build_script();

