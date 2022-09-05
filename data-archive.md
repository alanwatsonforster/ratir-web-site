# RATIR: Data Archive

* [Servers](#servers)
* [Access](#access)
* [Contents](#contents)
* [Log Files](#log-files)
* [Proposal Identifier Files](#proposal-identifier-files)
* [Public Image Files](#public-image-files)
* [Proprietary Image Files](#proprietary-image-files)
* [Examples](#examples)

<p><hr/>
<a name="servers"/></p>

## Servers

The data archive is available from

* ratir.astroscu.unam.mx
* mira.la.asu.edu

The examples below use ratir.astroscu.unam.mx, but you could equally use one of the other servers.

<p><hr/>
<a name="access"/></p>

## Access

The data archive is accessed using the <a href="http://rsync.samba.org">rsync</a> program, which is installed by default on Mac OS X and Ubuntu. If it isn&#8217;t installed on your computer, consult your computer support staff.

<p><hr/>
<a name="contents"/></p>

## Contents

The data archive contains the following files:

* log files;
* proposal identifier files;
* image header files; and
* image FITS files. 

The image header files are the FITS headers with newlines inserted every 80 characters.

The image FITS and header files are named for the UTC time of the start of the exposure (as an <a href="https://en.wikipedia.org/wiki/ISO_8601">IS0-8601</a> basic combined date and time), followed by the detector identifier (“C0”, “C1”, “C2”, “C3”, or “C4”), followed by a letter indicating the image type (“o” for object images, “b” for biases, “d” for darks, and “f” for flats).

The image FITS files are compressed losslessly using <a href="http://en.wikipedia.org/wiki/Bzip2">bzip2</a> and can be uncompressed using the bunzip2 program, which is installed by default on Mac OS X and Ubuntu. If it isn&#8217;t installed on your computer, consult your computer support staff.

<p><hr/>
<a name="log-files"/></p>

## Log Files

The log files list all science and calibration images take by the instrument in chronological order.

The log files are available as a plain text file with fixed-width column (for humans) and a [CSV file](http://en.wikipedia.org/wiki/Comma-separated_values) (for spreadsheets and other programs). 

To obtain the log files, use:

    rsync rsync://ratir.astroscu.unam.mx/public/log.txt .
    

or

    rsync rsync://ratir.astroscu.unam.mx/public/log.csv .
    

In both files, the columns are:

1. The UTC date and time of the start of the exposure.
1. The proposal identifier.
1. The visit identifier.
1. The name of the image FITS file.
1. The camera (C0, C1, C2, or C3).
1. The image type (object, bias, dark, flat).
1. The exposure time, in seconds.
1. The filter name.
1. The J2000 RA at the start of the exposure, in degrees.
1. The J2000 declination at the start of the exposure, in degrees.
1. The hour angle at the start of the exposure, in degrees.
1. The airmass at the start of the exposure.
1. Whether the data is public (&#8220;true&#8221;) or not (&#8220;false&#8221;).

In both files, the rows are ordered by the date and time of the start of the exposure.

The log files contain only limited information on the images; for more detailed information, you can download the public image header files.

<p><hr/>
<a name="proposal-identifier-files"/></p>

## Proposal Identifier Files

The proposal identifier files list all science and calibration proposal identifiers.

The proposal identifier files as a plain text file with fixed-width column (for humans) and a [CSV file](http://en.wikipedia.org/wiki/Comma-separated_values) (for spreadsheets and other programs). 

To obtain the proposal identifier files, use:

rsync rsync://ratir.astroscu.unam.mx/public/proposalidentifiers.txt .

or

rsync rsync://ratir.astroscu.unam.mx/public/proposalidentifiers.csv .

In both files, the columns are:

1.  The proposal identifier.
2.  Whether the data have a proprietary period (&#8220;true&#8221;) or not (&#8220;false&#8221;).
3.  The name of the PI.
4.  The title of the proposal.

<p><hr/>
<a name="public-image-files"/></p>

## Public Image Files

Public image files are:

* All image FITS files from calibration proposals.
* All image FITS files from science proposals after the propriety period of two years.
* All image header files, even those from science proposals during the propriety period of two years.

Anyone can obtain public files using:

    rsync -av rsync://ratir.astroscu.unam.mx/public/&lt;proposalid&gt; .
    

The files organized into directories as:

&lt;proposalid&gt;/&lt;visitid&gt;/&lt;file&gt;

in which &lt;proposalid&gt; is a proposal identifier and &lt;visitid&gt; is a visit identifier.

<p><hr/>
<a name="proprietary-image-files"/></p>

## Proprietary Image Files

Proprietary image files are:

* All image FITS files from science proposals during the propriety period of two years.

Science proposal PIs can access all files obtained for their proposals (both proprietary files and public files) using:

    rsync -av rsync://<proposalid>@ratir.astroscu.unam.mx/<proposalid> .

Here, &lt;proposalid&gt; is a proposal identifier. rsync will prompt for a password. This password will be distributed to the PI by Carlos Román (<a href="croman@astro.unam.mx">croman@astro.unam.mx</a>). The PIs can then distribute the password as they wish.

The files organized into directories as:

&lt;proposalid&gt;/&lt;visitid&gt;/&lt;file&gt;

in which &lt;proposalid&gt; is a proposal identifier and &lt;visitid&gt; is a visit identifier.

<p><hr/>
<a name="examples"/></p>

## Examples

To obtain all image files for proposal 2017A-1003:

    rsync -av rsync://2017A-1003@ratir.astroscu.unam.mx/2017A-1003 .
    

To obtain all image files for 2017 March 12 UTC for proposal 2017A-1003:

    rsync -av rsync://2017A-1003@ratir.astroscu.unam.mx/2017A-1003/2017A-1003/2017A-1003/*/20170312* .

To obtain all image files for 2017 March 12 UTC and visit whose visit identifier (specified in [Phase 2](phase2.html)) is &#8220;4&#8221; for proposal 2017A-1003:

    rsync -av rsync://2017A-1003@ratir.astroscu.unam.mx/2017A-1003/2017A-1003/4/20170312* .
    

One useful tip for using rsync is that if you do not give it a destination location, then it will list the files at the specified source locations rather than copying them. This allows you to quickly see what given rsync options do. For example, if the final &#8220;.&#8221; is omitted from the previous commands, they will list the files in the archive rather than download them.
