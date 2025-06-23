cat sample.list | awk '{print "sh /RBM20/03.expression/01.hisat2.stringtie/call.hisat2.stringtie.sh  "$3"\t"$4"\t"$2"\t/RBM20/03.expression/01.hisat2.stringtie"}' > submit.all.sh
