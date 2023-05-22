library(dplyr)
#library(readr)

#needs to be run within the /ggsashimi/ folder

time_thru_1<-0 
for (gID in GO_attached$GeneID[124]) {
  time_thru_1<-time_thru_1+1
  gene <- filter(GO_attached, GeneID == gID) #Isolates all isoforms of gene
  min_cord<-min(gene[,c(11:18,27:36)], na.rm = T) #Finds min coords of all isoforms
  max_cord<-max(gene[,c(11:18,27:36)], na.rm = T) #Max coords of all isoforms
  chrom<-gene[9]
  if (nrow(unique(chrom)) == 1) {
    chrom<-chrom[1,]
    coords<-paste(chrom, ":",min_cord, "-", max_cord, sep = "") #Coords in format required by ggsashsimi command

    df_list<-c() #Empty list for each unique .bam set required
    for (DF in unique(gene$Original_DF)) { 
      #Below creates the file containing the path to the bam files
      if (DF == "MLVvsMSV_SP") {
        bam_list="MLV_SP_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MLV16SP_BS54_F.bam	MLV_SP
MLV_SP_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MLV05SP_BS50b_F.bam	MLV_SP
MLV_SP_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MLV01SP_BS44_M.bam	MLV_SP
MSV_SP_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MSV04SP_BS43_M.bam	MSV_SP
MSV_SP_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MSV03SP_BS49_F.bam	MSV_SP
MSV_SP_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MSV01SP_BS45_F.bam	MSV_SP"
        if (length(df_list)==0) {
          df_list=bam_list
        } 
        else if (length(df_list>0)) {
          if (DF %in% df_list) {
            next
          }
          else{
            df_list=append(df_list, bam_list)
            }
        }
      }
      if (DF == "MLVvsMSV_HK") {
        bam_list="MLV_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MLV16HK_BS54_F.bam	MLV_HK
MLV_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MLV05HK_BS50b_F.bam	MLV_HK
MLV_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MLV01HK_BS44_M.bam	MLV_HK
MLV_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MLV02HK_BS48_M.bam	MLV_HK
MLV_REP_5	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MLV10HK_BS46_F.bam	MLV_HK
MSV_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MSV04HK_BS43_M.bam	MSV_HK
MSV_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MSV03HK_BS49_F.bam	MSV_HK
MSV_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MSV01HK_BS45_F.bam	MSV_HK
MSV_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MSV13HK_BS53_F.bam	MSV_HK
MSV_REP_5	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MSV05HK_BS47_M.bam	MSV_HK
MSV_REP_6	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MSV07HK_BS51_M.bam	MSV_HK"
        if (length(df_list)==0) {
          df_list=bam_list
        } 
        else if (length(df_list>0)) {
          if (DF %in% df_list) {
            next
          }
          else{
            df_list=append(df_list, bam_list)
          }
        }
      }
      if (DF == "GPSvsMA_HK") {
        bam_list="GPS_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS06HK_BS4_M.bam\tGPS_HK
GPS_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS10HK_BS6_M.bam\tGPS_HK
GPS_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS11HK_BS12_M.bam\tGPS_HK
GPS_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS02HK_BS10_F.bam\tGPS_HK
GPS_REP_5	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS03HK_BS02_F.bam\tGPS_HK
GPS_REP_6	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS09HK_BS8_F.bam\tGPS_HK
MA_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MA02HK_BS09_M.bam\tMA_HK
MA_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MA03HK_BS01_F.bam\tMA_HK
MA_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MA06HK_BS03_M.bam\tMA_HK
MA_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MA09HK_BS07_F.bam\tMA_HK
MA_REP_5	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MA10HK_BS05_M.bam\tMA_HK"
        if (length(df_list)==0) {
          df_list=bam_list
        } 
        else if (length(df_list>0)) {
          if (DF %in% df_list) {
            next
          }
          else{
            df_list=append(df_list, bam_list)
          }
        }
      }
      if (DF == "GPSvsMA_SP") {
        bam_list="GPS_SP_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS06SP_BS4_M.bam\tGPS_SP
GPS_SP_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS10SP_BS6_M.bam\tGPS_SP
GPS_SP_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS11SP_BS12_M.bam\tGPS_SP
GPS_SP_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS02SP_BS10_F.bam\tGPS_SP
GPS_SP_REP_5	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS03SP_BS02_F.bam\tGPS_SP
GPS_SP_REP_6	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/GPS09SP_BS8_F.bam\tGPS_SP
MA_SP_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MA02SP_BS09_M.bam\tMA_SP
MA_SP_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MA06SP_BS03_M.bam\tMA_SP
MA_SP_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MA09SP_BS07_F.bam\tMA_SP
MA_SP_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MA10SP_BS05_M.bam\tMA_SP
MA_SP_REP_5	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/MA11SP_BS11_F.bam\tMA_SP"
        if (length(df_list)==0) {
          df_list=bam_list
        } 
        else if (length(df_list>0)) {
          if (DF %in% df_list) {
            next
          }
          else{
            df_list=append(df_list, bam_list)
          }
        }
      }
      if (DF == "WSvsEI_HK") {
        bam_list="WS_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS01HK_BS14_F.bam\tWS_HK
WS_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS03HK_BS16_M.bam\tWS_HK
WS_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS05HK_BS18_M.bam\tWS_HK
WS_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS06HK_BS24_F.bam\tWS_HK
WS_REP_5	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS07HK_BS20_F.bam\tWS_HK
WS_REP_6	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS10HK_BS22_M.bam\tWS_HK
EI_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI01HK_BS13_M.bam\tEI_HK
EI_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI03HK_BS15_F.bam\tEI_HK
EI_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI05HK_BS17_M.bam\tEI_HK
EI_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI06HK_BS23_F.bam\tEI_HK
EI_REP_5	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI07HK_BS19_F.bam\tEI_HK
EI_REP_6	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI11HK_BS21_M.bam\tEI_HK"
        if (length(df_list)==0) {
          df_list=bam_list
        } 
        else if (length(df_list>0)) {
          if (DF %in% df_list) {
            next
          }
          else{
            df_list=append(df_list, bam_list)
          }
        }
      }
      if (DF == "WSvsEI_SP") {
        bam_list="WS_SP_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS01SP_BS14_F.bam\tWS_SP
WS_SP_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS03SP_BS16_M.bam\tWS_SP
WS_SP_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS05SP_BS18_M.bam\tWS_SP
WS_SP_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS06SP_BS24_F.bam\tWS_SP
WS_SP_REP_5	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS07SP_BS20_F.bam\tWS_SP
WS_SP_REP_6	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/WS10SP_BS22_M.bam\tWS_SP
EI_SP_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI01SP_BS13_M.bam\tEI_SP
EI_SP_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI03SP_BS15_F.bam\tEI_SP
EI_SP_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI05SP_BS17_M.bam\tEI_SP
EI_SP_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI06SP_BS23_F.bam\tEI_SP
EI_SP_REP_5	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI07SP_BS19_F.bam\tEI_SP
EI_SP_REP_6	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/EI11SP_BS21_M.bam\tEI_SP"
        if (length(df_list)==0) {
          df_list=bam_list
        } 
        else if (length(df_list>0)) {
          if (DF %in% df_list) {
            next
          }
          else{
            df_list=append(df_list, bam_list)
          }
        }
      }
      if (DF == "SKLvsSKR_SP") {
        bam_list="SKL_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKL50SP_BS58b_F.bam	SKL_SP
SKL_SP_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKL33SP_BS66_F.bam	SKL_SP
SKL_SP_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKL28SP_BS62_M.bam	SKL_SP
SKL_SP_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKL26SP_BS60_M.bam	SKL_SP
SKR_SP_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKR29SP_BS55_M.bam	SKR_SP
SKR_SP_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKR30SP_BS59_M.bam	SKR_SP
SKR_SP_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKR38SP_BS65_F.bam	SKR_SP
SKR_SP_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKR31SP_BS57_F.bam	SKR_SP"
        if (length(df_list)==0) {
          df_list=bam_list
        } 
        else if (length(df_list>0)) {
          if (DF %in% df_list) {
            next
          }
          else{
            df_list=append(df_list, bam_list)
          }
        }
      }
      if (DF == "SKLvsSKR_HK") {
        bam_list="SKL_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKL50HK_BS58b_F.bam	SKL_HK
SKL_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKL33HK_BS66_F.bam	SKL_HK
SKL_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKL28HK_BS62_M.bam	SKL_HK
SKL_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKL26HK_BS60_M.bam	SKL_HK
SKR_REP_1	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKR29HK_BS55_M.bam	SKR_HK
SKR_REP_2	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKR30HK_BS59_M.bam	SKR_HK
SKR_REP_3	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKR38HK_BS65_F.bam	SKR_HK
SKR_REP_4	/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/SKR31HK_BS57_F.bam	SKR_HK"
        if (length(df_list)==0) {
          df_list=bam_list
        } 
        else if (length(df_list>0)) {
          if (DF %in% df_list) {
            next
          }
          else{
            df_list=append(df_list, bam_list)
          }
        }
      }
      
      #If the list is complete, write the bam file and create/run the ggsashimi bash command
      if (length(df_list)==length(unique(gene$Original_DF))) {
        write(df_list, file= "bam_folder/eg_bam.txt")
        print(paste("Len df_list",as.character(length(df_list)), "/",gID,"/", chrom, ":", min_cord, "-", max_cord, "// time thru:", time_thru_1))
        sashimi_obj<-paste('BF=/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/ \
G=/Users/jonathanforsyth/Documents/UMass/Research/Files/Reference_Genome \
B=/Users/jonathanforsyth/Documents/UMass/Research/Programming/ggsashimi/bam_folder/ \
docker run -w $PWD -v $PWD:$PWD -v $G:$G -v $B:$B -v $BF:$BF guigolab/ggsashimi -b $B/eg_bam.txt -g $G/stickleback_gtf.gtf -c ',
                           as.character(paste(coords)),
                           as.character(paste(" -o Sashimi_Outputs/", gID, sep = "")),
                           ' -O 3 -C 3 --alpha .25 --fix-y-scale -A mean_j -M 4', sep = "")
        
        #cat(sashimi_obj) #This just tests to get through the code, if it looks right, run system(sashimi_obj)
        system(sashimi_obj) 
        }
      }
    }
  #Decided to do this because the ggsashimi only takes one set of coords (i think)
  #Also, this will help me figure out which ones have NA errors
  else {
    print(paste(gID, "Multiple Chrom's"))
  }
}

#Below was used to index the .bam files (.bai files required to be in same folder for ggsashimi)
time_thru<-0 
#total of 77
for (i in list.files()) {
  time_thru<-time_thru+1
  sam_obj <- paste("samtools index", i)
  cat(sam_obj, time_thru,'\n')
  system(sam_obj)
}



NA_genes<-data.frame()
for (gID in unique(both_new$GeneID)) {
  gene <- filter(both_new, GeneID == gID)
  chrom<-gene[9]
  if (nrow(unique(chrom)) != 1){
    if (is.null(NA_genes)){
      new_NA_genes<-gene
    }
    else{
      NA_genes<-bind_rows(new_NA_genes, gene)
    }
  }
}
