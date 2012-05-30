include_recipe "php::pear"

channels = [ 
    "pear.survivethedeepend.com",
    "hamcrest.googlecode.com/svn/pear"
]

channels.each do |chan|
  php_pear_channel chan do
    action :discover
  end
end


mockeryCmd = <<CMD
pear install --alldeps deepend/Mockery
CMD

execute "install-Mockery-manually-with-pear" do
  command mockeryCmd
  not_if "phpunit --version | grep PHPUnit"
end