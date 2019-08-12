# Comment from BM
## BM The code is readible for someone with basic programming experience but needs work with regards to commenting to describe 
## BM key workflow steps. Being unfamiliar with the work makes this difficult to follow in certain spots.
################################################################################
#
# plot_nmds.R # BM Title of R script
#
# Here we take in the *.nmds.axes file from the mouse stability analysis and
# plot it in R as we did in Figure 4 of Kozich et al. # BM Description of what this R script will accomplish
#
#
# Dependencies... # BM Need a description of what this file is. R tools are not listed in the dependencies.
# * data/process/*/*.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.an.unique_list.thetayc.0.03.lt.ave.nmds.axes
#
# Produces...
# * results/figures/*.figure4.png # BM Should describe what this figure is.
#
################################################################################

plot_nmds <- function (axes_file){
    axes <- read.table(file=axes_file, header=T, row.names=1)
    day <- as.numeric(gsub(".*D(\\d*)$", "\\1", rownames(axes)))
    # BM This first chunk of code appears to load the file and tidy the data
    # BM I'm not familiar with this research and do not know what "axes" means

    early <- day <= 10
    late <- day >= 140 & day <= 150
    # BM Appears to define days in the study that were initially looked at vs those that came much later.

    plot.axes <- axes[early | late, ]
    plot.day <- day[early | late]
    plot.early <- early[early | late]
    plot.late <- late[early | late]
    # BM This portion of the code is confusing to me, but it appears to be plotting variables based on early vs late 
    # timepoints.

    pch <- vector()
    pch[plot.early] <- 21
    pch[plot.late] <- 19
    # BM Creating a vector file called pch, and inserting information into it.
    # BM I am not sure what pch stands for

    output_file_stub <- strsplit(axes_file, split="\\/")[[1]][3]
    output_file <- paste0("results/figures/", output_file_stub, ".figure4.png")
    # BM This appears to split out key variables inorder to produce the figure. However, we cannot see what variables those 
    # BM are based on the current code and lack of comments.

    png(file=output_file)
    plot(plot.axes$axis2~plot.axes$axis1, pch=pch, xlab="PCoA Axis 1", ylab="PCoA Axis 2")
    legend(x=max(plot.axes$axis1)-0.125, y=min(plot.axes$axis2)+0.125, legend=c("Early", "Late"), pch=c(21,19))
    dev.off()
    # BM This porition of the code produces the final figure. It provides label information and creates a legend.
}
# Notes from BM
## Pros
### 1 Heading at the top is descriptive about the overall goal
### 2 Spacing between each chunk of code is easy to read
### 3 Variables such as "day" are easy to understand
## Cons
### 1 Each chunk of code has no description of what it is for
### 2 No list of what R tools are required to run the code
### 3 Mathematical opperators do not have a space and are hard to read
