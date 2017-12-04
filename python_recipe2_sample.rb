python 'cleanup' do
 user 'root'
 cwd '/tmp'
  code <<-EOH

print('Hello World')

EOH
end
