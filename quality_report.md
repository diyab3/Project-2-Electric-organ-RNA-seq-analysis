All of my data was Illumina sequencing. 0 sequences were flagged as poor quality. All data had high per base quality in general, and a high average quality per read.

All of the data had bad per base sequence content but that is likely due to adapters which can be trimmed in the future.

All the data seemed to have fairly normal GC content.

There were basically no Ns in any of the data, yay!

There were problems with sequence duplication level, it was flagged as bad in every file, but FastQC was not created for RNA, so I am guessing higher duplication levels indicates that certain genes are being expressed more and this hopefully should not be an issue. 

CcoxCrh_comrhy111_EO_adult_2 does appear to be predicting Illumina Universal Adapter, while no adapter is being predicted for CcoxCrh_comrhy62_EO_6cm_1.

Due to all of this, I think my data is of high enough quality to use for further analysis.