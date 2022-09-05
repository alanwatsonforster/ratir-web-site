# RATIR: Calibration Data

*Note: RATIR was removed from the telescope in June 2022.*

<hr/>
Calibration data are taken most nights, as the weather and schedule permit.

## Biases

Biases with C0 and C1 are taken as in visit 0 of program 2012A-0006.

## Darks

Darks with C0 and C1 with exposure times of 60 seconds are taken in visit 0 of program 2012A-0007.

## Flats

Evening twilight flats with C0, C1, C2, and C3 are taken in program 2012A-0008. Visit 0 is bright flats and visit 1 is faint flats.

## Obtaining Calibration Data

Calibration data can be obtained from the [data archive](data-archive.html).

Observers are often interested in the calibration file for specific nights. These can be obtained by using globbing in rsync.

For example, to list all of the biases (2012A-0006), darks (2012A-0007), bright flats (2012A-0008/0), and faint flats (2012A-0008/1) for the night of 2017 March 17 UTC, use:

    rsync rsync://ratir.astroscu.unam.mx/public/2012A-000[678]/*/20170317*.fits
    

and to download them use:

    rsync rsync://ratir.astroscu.unam.mx/public/2012A-000[678]/*/20170317*.fits .
