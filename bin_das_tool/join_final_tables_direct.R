args = commandArgs(trailingOnly=TRUE)
if (length(args) != 8){
    stop("USAGE: Rscript join_final_tables_direct.R prokka quast checkm trna rrna classify coverage out")
}

prokka_f=args[1]
quast_f=args[2]
checkm_f=args[3]
trna_f=args[4]
rrna_f=args[5]
classify_f=args[6]
coverage_f=args[7]
out_f=args[8]

# print('1')
prokka= read.table(prokka_f, sep = '\t', header = T, comment.char = '', quote = '', row.names = NULL)
# print('2')
quast = read.table(quast_f, sep = '\t', header = T, comment.char = '', quote = '', row.names = NULL)
# print('3')
checkm = read.table(checkm_f, sep = '\t', header = T, comment.char = '', quote = '', row.names = NULL)
# print('4')
trna = read.table(trna_f, sep = '\t', header = T, comment.char = '', quote = '', row.names = NULL)
# print('5')
rrna = read.table(rrna_f, sep = '\t', header = T, comment.char = '', quote = '', row.names = NULL)
# print('6')
classify = read.table(classify_f, sep = '\t', header = T, comment.char = '', quote = '', row.names = NULL)
# print('7')
coverage = read.table(coverage_f, sep = '\t', header = T, comment.char = '', quote = '', row.names = NULL)
# print('8')

out = prokka

out = merge(out, quast, all.x = T)
out = merge(out, checkm, all.x = T)
out = merge(out, trna, all.x = T)
out = merge(out, rrna, all.x = T)
out = merge(out, classify, all.x = T)
out = merge(out, coverage, all.x = T)

out[is.na(out)] = 0

write.table(out, out_f, sep = "\t", quote = F, row.names = F)
