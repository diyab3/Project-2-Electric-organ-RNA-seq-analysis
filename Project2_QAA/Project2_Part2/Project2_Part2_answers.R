# Load packages
library(dplyr)
library(ggplot2)

# Load dataset 1
CcoxCrh_comrhy62_EO_6cm_1_1_trimmed_read_length_dist = read.table("CcoxCrh_comrhy62_EO_6cm_1_1_trimmed_read_length_dist.txt", header = FALSE, col.names = c("Frequency_1", "Length"))

# Make sure dataframe 1 looks ok
head(CcoxCrh_comrhy62_EO_6cm_1_1_trimmed_read_length_dist)

# Load dataframe 2
CcoxCrh_comrhy62_EO_6cm_1_2_trimmed_read_length_dist = read.table("CcoxCrh_comrhy62_EO_6cm_1_2_trimmed_read_length_dist.txt", header = FALSE, col.names = c("Frequency_2", "Length"))

# Make sure dataframe 2 looks ok
head(CcoxCrh_comrhy62_EO_6cm_1_2_trimmed_read_length_dist)

# Join the two dataframes together
CcoxCrh_comrhy62_EO_6cm_1_trimmed_read_length_dist = full_join(CcoxCrh_comrhy62_EO_6cm_1_1_trimmed_read_length_dist, CcoxCrh_comrhy62_EO_6cm_1_2_trimmed_read_length_dist, by = "Length")

# Make sure the combined dataframe looks ok
head(CcoxCrh_comrhy62_EO_6cm_1_trimmed_read_length_dist)

# Plot it!
CcoxCrh_comrhy62_EO_6cm_1_trimmed_read_length_dist_plot = CcoxCrh_comrhy62_EO_6cm_1_trimmed_read_length_dist |>
  ggplot(aes(x = Length)) +
  geom_col(aes(y = Frequency_1, fill = "CcoxCrh_comrhy62_EO_6cm_1_1_trimmed.fastq"), alpha = 0.3) +
  geom_col(aes(y = Frequency_2, fill = "CcoxCrh_comrhy62_EO_6cm_1_2_trimmed.fastq"), alpha = 0.3) +
  labs(
    x = "Read Length",
    y = "Frequency",
    color = "CcoxCrh_comrhy62_EO_6cm_1_1 or CcoxCrh_comrhy62_EO_6cm_1_2"
  ) +
  coord_cartesian(xlim = c(110, 150)) +
  theme_classic()

# Save it!
ggsave("CcoxCrh_comrhy62_EO_6cm_1_trimmed_read_length_dist_plot.pdf")


# Repeat those steps for CcoxCrh_comrhy111_EO_adult_2

CcoxCrh_comrhy111_EO_adult_2_1_trimmed_read_length_dist = read.table("CcoxCrh_comrhy111_EO_adult_2_1_trimmed_read_length_dist.txt", header = FALSE, col.names = c("Frequency_1", "Length"))

head(CcoxCrh_comrhy111_EO_adult_2_1_trimmed_read_length_dist)

CcoxCrh_comrhy111_EO_adult_2_2_trimmed_read_length_dist = read.table("CcoxCrh_comrhy111_EO_adult_2_1_trimmed_read_length_dist.txt", header = FALSE, col.names = c("Frequency_2", "Length"))

head(CcoxCrh_comrhy111_EO_adult_2_2_trimmed_read_length_dist)

CcoxCrh_comrhy111_EO_adult_2_trimmed_read_length_dist = full_join(CcoxCrh_comrhy111_EO_adult_2_1_trimmed_read_length_dist, CcoxCrh_comrhy111_EO_adult_2_2_trimmed_read_length_dist, by = "Length")

head(CcoxCrh_comrhy111_EO_adult_2_trimmed_read_length_dist)

CcoxCrh_comrhy111_EO_adult_2_trimmed_read_length_dist |>
  ggplot(aes(x = Length)) +
  geom_col(aes(y = Frequency_1, fill = "CcoxCrh_comrhy111_EO_adult_2_1_trimmed_read_length_dist"), alpha = 0.3) +
  geom_col(aes(y = Frequency_2, fill = "CcoxCrh_comrhy111_EO_adult_2_2_trimmed_read_length_dist"), alpha = 0.3) +
  
  labs(
    x = "Read Length",
    y = "Frequency",
    color = "Ccox_comrhy111_EO_adult_2_1 or Ccox_comrhy111_EO_adult_2_2"
  ) +
  coord_cartesian(xlim = c(80, 150)) +
  theme_classic()

ggsave("CcoxCrh_comrhy111_EO_adult_2_trimmed_read_length_dist_plot.pdf")
