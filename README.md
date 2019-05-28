# Logs Script

A Ruby implementation of a script which accepts a log file, and provides the user with information on website and IP address visits.

## Getting Started

To use this app first clone the app, and bundle locally.

git clone https://github.com/nicgiles/SP.git

From the root of the repo run rspec.
There are 10 tests in total which provide 100% coverage across the 2 classes.
The Weblogs class creates a hash from the webserver log and the order sites/order ips methods sort this information into the correct order.

The printer method is then called within Weblogs in order to correctly format the results to be used in the script.  

### Using the script.

To use the script please enter the following:


```
$ cd bin
$ chmod +x script_argv.rb
$ ./script_argv.rb webserver.log

```
This runs the script, specifying that webserver.log is the desired file.
This will deliver the user the required information, namely a list of websites by total visits and a list of websites by unique visitors (identified by IP adress).

```
List of Websites by total visits:

/about/2 has 90 visits.
/contact has 89 visits.
/index has 82 visits.
/about has 81 visits.
/help_page/1 has 80 visits.
/home has 78 visits.

List of Websites by unique visitors:

/index has been visited by 23 people or bots.
/home has been visited by 23 people or bots.
/contact has been visited by 23 people or bots.
/help_page/1 has been visited by 23 people or bots.
/about/2 has been visited by 22 people or bots.
/about has been visited by 21 people or bots.

```

### Edge Cases

The app considers a few potential edge cases.
If the user passes an incorrect path name to the script they are warned that the file does not exist.

```Ruby
def create_sites_hash(filename)
  raise 'File does not exist.' unless File.file?(filename);
```
```
File does not exist. (RuntimeError)

```

Similarly if a user tries to run the script with an empty log file, they are provided a warning and asked to try creating a new sites hash, from a different log file.

```Ruby
fail "Log file empty. Try creating new sites hash." if @sitelist.empty?
```
```
Log file empty. Try creating new sites hash. (RuntimeError)

```
Both of these edge cases are tested within web_logs_spec.rb

```Ruby
context 'Incorrect file path provided.' do
  it 'Warns user if incorrect file path.' do
    expect { subject.create_sites_hash('./spec/fake_log.log') }.to raise_error 'File does not exist.'
  end
end
```

```Ruby
context 'Empty file uploaded.' do
  before do
    subject.create_sites_hash('./spec/empty_log.log')
  end

  describe '#order_sites' do
    it 'Warns user if trying to order an empty hash' do
      expect { subject.order_sites }.to raise_error 'Log file empty. Try creating new sites hash.'
    end
  end
```

### Contributing

As this repo is a tech test, I would prefer not to receive contributions, thank you.

### Licensing

This repo is licensed under the MIT License.
