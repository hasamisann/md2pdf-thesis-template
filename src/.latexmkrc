#!/usr/bin/env perl
$latex = 'uplatex';
$bibtex = 'upbibtex';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'upmendex';
$pdf_mode = 3; # DVI経由でPDFを作成するモード