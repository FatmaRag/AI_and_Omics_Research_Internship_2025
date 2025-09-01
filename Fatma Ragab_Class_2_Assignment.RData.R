install.packages("downloader")   # install package
library(downloader)              #install library
url_DEGs_data1 <-"https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/DEGs_Data_1.csv"
url_DEGs_data2 <-"https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/DEGs_Data_2.csv"
file_urls <- c(url_DEGs_data1, url_DEGs_data2)
file_names <- c("DEGs_data1.csv", "DEGs_data2.csv")
# Download files
for (i in 1:length(file_urls)) {
  download(file_urls[i], file_names[i])
}
# Load the data
deg_data1 <- read.csv("DEGs_data1.csv")
deg_data2 <- read.csv("DEGs_data2.csv")
classify_gene <- function(data, log2FC_threshold = 1, padj_threshold = 0.05) {
  # Handle missing values by removing rows with NA in logFC or padj
  data <- na.omit(data)
  
  data$Regulation <- "Not_Significant"
  
  # Upregulated
  data$Regulation[data$log2FC >= log2FC_threshold & data$padj < padj_threshold] <- "Upregulated"
  
  # Downregulated
  data$Regulation[data$log2FC <= -log2FC_threshold & data$padj < padj_threshold] <- "Downregulated"
  
  return(data)
}
# 4. Process the datasets
processed_deg_data1 <- classify_gene(deg_data1)
processed_deg_data2 <- classify_gene(deg_data2)
# 5. Save the processed results
write.csv(processed_deg_data1, "processed_DEGs_data1.csv", row.names = FALSE)
write.csv(processed_deg_data2, "processed_DEGs_data2.csv", row.names = FALSE)
# 6. Generate summary counts
summary_counts1 <- table(processed_deg_data1$Regulation)
print("Summary counts for DEGs_data1:")
print(summary_counts1)

summary_counts2 <- table(processed_deg_data2$Regulation)
print("Summary counts for DEGs_data2:")
print(summary_counts2)
# 7. Save summary counts to a file
write.csv(as.data.frame(summary_counts1), "summary_counts_DEGs_data1.csv", row.names = FALSE)
write.csv(as.data.frame(summary_counts2), "summary_counts_DEGs_data2.csv", row.names = FALSE)
