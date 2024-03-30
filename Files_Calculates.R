install.packages("digest")
library(digest)
folder<-"D:/LICOR"
myfiles<-list.files(path=folder, full.names = TRUE, recursive = TRUE, pattern = "\\.(jpg|jpeg|tiff|png)$")
print(myfiles)
md5sums <- vector("character", length = length(myfiles))
for (i in 1:length(myfiles)) {
  md5sums[i] <- digest(myfiles[i], file = TRUE)
}
my_files_result<-data.frame(FILE=basename(myfiles),md5=md5sums)
print(my_files_result)
print("total pictures")
print(length(myfiles))
Duplicated_pictures <- duplicated(my_files_result$md5)
print(length(Duplicated_pictures))
unique_md5_count <- length(unique(my_files_result$md5))
all_duplicated <- duplicated(my_files_result$md5) | duplicated(my_files_result$md5, fromLast = TRUE)
duplicated_md5_count <- length(unique(my_files_result$md5[all_duplicated]))
# Print the counts
print(paste("Total unique files:", unique_md5_count))
print(paste("Number of files that are duplicated:", duplicated_md5_count))