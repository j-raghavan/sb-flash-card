====================================
Samskrita Bharati Flash Card Project
====================================

*Samskrita Bharati USA*


.. image:: https://www.samskritabharatiusa.org/images/san.png
    :target: https://www.samsrkitabharatiusa.org

*Flash Card Generation Project*

.. image:: https://img.shields.io/badge/License-MIT-yellow.svg
    :target: https://opensource.org/licenses/MIT
    


.. image:: https://github.com/j-raghavan/sb-flash-card/workflows/sb-master-branch/badge.svg
    :target: https://github.com/actions/upload-release-asset

---------------------------------------------------------------

*Dependencies*

To be able to generate the PDF version of the flash cards
you will need the following programs insalled on a LINUX
or POSIX compliant platform.

-- cmake >= 3.5.X
-- Image Magick (to convert pdf to png file)
-- skt  (https://github.com/wilx/sanskrit.git)
   git clone https://github.com/wilx/sanskrit.git
   cd sanskrit
   mkdir build
   cd build;cmake ..
   make
   cp skt $(HOME)/bin/.

-- texlive-latex-recommended
-- texlive-fonts-extra
-- texlive-extra-utils
-- pdflatex
   sudo apt install texlive-latex-recommended texlive-fonts-extra
   sudo apt install texlive-extra-utils pdflatex


*Generating Flash Cards*

The sb-flash-card uses various opensource tools to generate
the Flash cards. The LaTeX package *skt* is Amazing and feature
rich to produce Fine Typeset fonts in sanskrit. You will find 
a PDF document from *skt* package that talks about the various
features it provides. 

To Generate the respective Flash Card, have a look at the 
sample_gunitha.sh file that generates Gunithaksharas for &#2325. 
You can play around with this file to generate other Gunithaksharas.

*NOTE*

ImageMagic by default prohibits converting PDF file to PNG file
In order to overcome that, you will need to edit the 
/etc/ImageMagick*/policy.xml  File and find the line that says
*<policy domain="coder" rights="none pattern="{PDF" />*
Wrap this line with <!--  and --> (Comment this line out) so you can
generate a PNG file out of the LaTeX PDF output.

More information look here 

https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion

*Contributing*

You are more than welcome to participate and contribute to the
project. Please send me your Email address so i can add you to 
be a Contributor. Do go through the CODE_OF_CONDUCT.md file that
has more details about General guidelines expected of the Contributors.
