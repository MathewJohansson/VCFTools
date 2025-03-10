# VCFtools = manipulate, analyse, and filter Variant Calling Format files. 
# These files store genetic information such as SNPS, Indels, and other types of sequence variants. 

# Variant Calling = a process that identifies differences between a sequenced genome and a reference genome. 
# Identifies variants. 


# Key Features:
# Filtering variants (by quality, depth, missing data, etc.). 
# Calculating population genetic metrics. 
# Converting VCF to other formats. 
# Merging or comparing VCF files. 
# Summarising genetic variation. 
# Estimating nucleotide diversity (n). 



# Steps of using VCFtools (including for nucleotide diversity).

# 1. Install VCFtools
        sudo apt-get install vcftools



# 2. Load a VCF File
        vcftools --vcf input_file.vcf [options] --out output_file



# 3. Filtering VCF file (specifying filtering criteria based on desired parameters like 
#      chromosome, position, allele frequency, and quality score):

#   E.g.1 - Quality Score Filtering
        vcftools --vcf input.vcf --minQ 30 --recode --out filtered
#           --minQ: Minimum quality score (e.g., 30).
#           --recode: To generate a new VCF file with filtered data. 

#   E.g.2 - Chromosome and Position Filtering
        vcftools --vcf input.vcf --chr --chr1 --from-bp 100000 --to-bp 200000

#   E.g.3 - Minor Allele Frequency Filtering
        vcftools --vcf input.vcf --maf 0.05 --recode --out filtered_maf

#   E.g.4 - Maximum Missing Data Threshold (80% completeness)
        vcftools --vcf input.vcf --max-missing 0.8 --recode - -out filtered_missing



# 4. Select the Desired Analysis Function (to analyse the filtered VCF file). 
#   Common functions include:

#   1. Allele Frequency Calculation
        vcftools --vcf filtered.vcf --freq --out allele_frequencies	

#   2. Hardy-Weinberg Equilibrium
        vcftools --vcf filtered.vcf --hardy --out hardy_weinberg

#   3. Population Differentiation Statistics (Fst)
        vcftools --vcf filtered.vcf --weir-fst-pop population1.txt --weir-fst-pop population2.txt --out fst_results

#   4. Linkage Disequilibrium (LD) Between SNPs
        ftools --vcf filtered.vcf --geno-r2 --out ld_results



# 5. Calculate Nucleotide Diversity (n) 
#       - measures the average number of nucleotide differences per site between two 
#           randomly chosen sequences.

#   Option 1. Site-Specific Nucleotide Diversity
        vcftools --vcf filtered.vcf --site-pi --out nucleotide_diversity --site-pi: computes n for each SNP site. 

#   Option 2. Sliding Window Analysis (Genome-Wide)
        vcftools --vcf filtered.vcf --window.pi 10000 --window-pi-step 1000 --out sliding_window_pi
#           --window-pi 10000: Uses a 10,000bp window size. 
#           --window-pi step 1000: Moves the window 1,000bp at a time. 



# 6. Output the results to a new file (saved as text files, e.g.):

#   - Allele Frequencies:
        allele_frequencies.frq

#   - Nucleotide Diversity:
        nucleotide_diversity.sites.pi

#   - Sliding Window Diversity:
        sliding_window_pi.windowed.pi

# Further processing possible with R, Python, or Excel for visualisation and deeper interpretation. 

