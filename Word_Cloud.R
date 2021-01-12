# -- Word Cloud --


# Installing the required packages and call librarys 

if("tm" %in% rownames(installed.packages()) == FALSE) {install.packages("tm")}
if("wordcloud" %in% rownames(installed.packages()) == FALSE) {install.packages("wordcloud")}


library(tm)
library(wordcloud)


# Word Cloud, Text içerisindeki kelimelerin kullanýlma sýklýðýna göre
# görselleþtirilmesi için kullanýlýr. 

# ggplot2 harici bir kütüphane olduðu için yüklü deðil ise yükle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)



# Görselleþtireceðimiz text verisini indirmek için;
dir.create("C:/Users/Berkay ABAY/Downloads/txtfiles/wordcloud")
download.file("https://ibm.box.com/shared/static/cmid70rpa7xe4ocitcga1bve7r0kqnia.txt",
              destfile = "C:/Users/Berkay ABAY/Downloads/txtfiles/wordcloud/churchill_speeches.txt", quiet = TRUE)


dirPath <- "C:/Users/Berkay ABAY/Downloads/txtfiles/wordcloud"
speech <- Corpus(DirSource(dirPath))  #Corpus ile dosya içerisindeki .txt ya da farklý uzantýlý dosyalarý R 'ye yükleyebilrisiniz.


# speech içerisine attýðýmýz dosyayý incelemek istersek;
inspect(speech)


# Text dosyasý içerisindeki yazýnýn hepsini küçük harf yapmak için;
speech <- tm_map(speech, content_transformer(tolower))


# Text içerisindeki rakamlarý silmek için;
speech <- tm_map(speech, removeNumbers)


# "the", "we" gibi ara kelimeleri silmek için;
speech <- tm_map(speech, removeWords, stopwords("english"))


# stopwords içerisindeki kelimeler dýþýnda baþka kelimeler silmek isterseniz spesifik kelimeleri silmek için;
speech <- tm_map(speech, removeWords, c("floccinaucinihilipification", "squirrelled")) 


# Remove punctuations
speech <- tm_map(speech, removePunctuation)


# Eliminate extra white spaces
speech <- tm_map(speech, stripWhitespace)

class(speech) # Sýnýfýna baktýðýmýzda "Corpus" yazdýðýný göreceðiz.


# Eðer bu dosyayý DocumentMatrix 'e çevirirsek; kelimelerin kullaným sýklýðýný bulunduran bir matris elde etmiþ oluruz.
dtm <- TermDocumentMatrix(speech)


# TermDocumetMatrix i iþlem yapabilmek için normal matrise çevirirsek;
m <- as.matrix(dtm)


# Kullaným sýklýðýna göre bu matrisi düzenlersek;
v <- sort(rowSums(m),decreasing=TRUE)


# Dataframe 'e dönüþtürmek için;
d <- data.frame(word = names(v),freq=v)

head(d, 10) # Ýlk 10 elemaný incelemek istersek.


# Wordcloud oluþturmak için;
wordcloud(words = d$word, freq = d$freq)



## Arguments of the word cloud generator function : `words` : The words to be plotted
# freq : The frequencies of the words.

# min.freq : The words with frequencies below this number will not be plotted.

# max.words : The maximum number of words to be plotted in the image.

# random.order : If true, plots word in a random order. If false, they will be plotted in decreasing frequency.

# rot.per : The proportion of words with 90 degree rotation (vertical text)

# colors : The color keywords (or values) from least to most frequent. To exemplify, colors=“black” will plot the cloud using only a single color.


wordcloud(words = d$word, freq = d$freq, min.freq=1) # 1kez kullanýlan kelimeleride dahil etmek için


wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words=250) # Wordcloud 'da maksimum görünecek kelime sayýsý "250"


wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words=250, colors=brewer.pal(8, "Dark2"))


# En çok kullananlarý ortaya alýp kullaným sýklýðýna göre dizersek; 
wordcloud(words = d$word, freq = d$freq, min.freq = 1,max.words=250, colors=brewer.pal(8, "Dark2"), random.order = FALSE )


# names(v) = d$word, v = d$freq
# wordcloud(words = names(v), freq = v, min.freq = 1,max.words=250, colors=brewer.pal(8, "Dark2"), random.order = FALSE )



