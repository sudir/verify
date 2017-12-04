<p align="center"><h1>verify - v0.0.1</h1></p>
<p align="center"><i>Validate language syntax for unit testing along with added Chef features for custom resources. 
<br />Compatible with python 2.7 above</i></p>


## Basic Overview
[![Verify License](https://img.shields.io/badge/Licensed-Matt%20Trotter-orange.svg)](https://github.com/sudir/verify/blob/master/License.txt)
[![Matt Trotter Code Gaurantee](https://img.shields.io/badge/Fully%20Tested-v0.0.1-red.svg)]()

<ul> Required Prerequisites 
<li> <i>For any bash or python scripts under validation, ensure the proper shebang is declared within script</i>
<li> <i>For any custom written Chef recipe under validation, do not mix custom language resources within the same recipe</i>
</ul> 

<br />
Using verify is easy, simply download verify, assign executable permissions and move it to /usr/loca/bin, 
<br>you can begin by typing <i>verify --help</i> to get started.

##### Declared logic within functions called from Menu arguments for ex:
```python

# run tests on native scripts
parser.add_argument("-b", "--bash", action="store_true",    help="validate native bash scripts")



# Function to match
def bash_native(fileinput, absolutepaths):  
  with open(fileinput) as codefile:
    if '#!/bin/bash' in codefile.read():
         # If no error is found?
         FNULL = open(os.devnull, 'w')
         resout=subprocess.Popen("bash -n " + fileinput, shell=True, stderr=subprocess.PIPE, stdout=FNULL)
         out, err = resout.communicate()
         if err == "":
          print('Pass, no bash syntax errors detected for:'+' '+fileinput)
         else:
         # If theres a problem, tell me what it is
          with open(fileinput+'.testcase','w') as codefile:
           subprocess.call('echo Test case report inititated $(date) '+'\n'+"echo Fail, bash syntax errors detected for: "+ fileinput+"\n"+"bash -n " + fileinput, shell=True, stderr=codefile, stdout=codefile)
          with open(fileinput+'.testcase', 'r') as aiostream:
           print aiostream.read()

```

<i>More to come soon....</i>
<br />Invented By: <i>Matthew Trotter</i>
