# -- Word Cloud --


# Installing the required packages and call librarys 

if("tm" %in% rownames(installed.packages()) == FALSE) {install.packages("tm")}
if("wordcloud" %in% rownames(installed.packages()) == FALSE) {install.packages("wordcloud")}


library(tm)
library(wordcloud)


# Word Cloud, Text i�erisindeki kelimelerin kullan�lma s�kl���na g�re
# g�rselle�tirilmesi i�in kullan�l�r. 

# ggplot2 harici bir k�t�phane oldu�u i�in y�kl� de�il ise y�kle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)



# G�rselle�tirece�imiz text verisini indirmek i�in;
dir.create("C:/Users/Berkay ABAY/Downloads/txtfiles/wordcloud")
download.file("https://ibm.box.com/shared/static/cmid70rpa7xe4ocitcga1bve7r0kqnia.txt",
              destfile = "C:/Users/Berkay ABAY/Downloads/txtfiles/wordcloud/churchill_speeches.txt", quiet = TRUE)


dirPath <- "C:/Users/Berkay ABAY/Downloads/txtfiles/wordcloud"
speech <- Corpus(DirSource(dirPath))  #Corpus ile dosya i�erisindeki .txt ya da farkl� uzant�l� dosyalar� R 'ye y�kleyebilrisiniz.


# speech i�erisine att���m�z dosyay� incelemek istersek;
inspect(speech)


# Text dosyas� i�erisindeki yaz�n�n hepsini k���k harf yapmak i�in;
speech <- tm_map(speech, content_transformer(tolower))


# Text i�erisindeki rakamlar� silmek i�in;
speech <- tm_map(speech, removeNumbers)


# "the", "we" gibi ara kelimeleri silmek i�in;
speech <- tm_map(speech, removeWords, stopwords("english"))


# stopwords i�erisindeki kelimeler d���nda ba�ka kelimeler silmek isterseniz spesifik kelimeleri silmek i�in;
speech <- tm_map(speech, removeWords, c("floccinaucinihilipification", "squirrelled")) 


# Remove punctuations
speech <- tm_map(speech, removePunctuation)


# Eliminate extra white spaces
speech <- tm_map(speech, stripWhitespace)

class(speech) # S�n�f�na bakt���m�zda "Corpus" yazd���n� g�rece�iz.


# E�er bu dosyay� DocumentMatrix 'e �evirirsek; kelimelerin kullan�m s�kl���n� bulunduran bir matris elde etmi� oluruz.
dtm <- TermDocumentMatrix(speech)


# TermDocumetMatrix i i�lem yapabilmek i�in normal matrise �evirirsek;
m <- as.matrix(dtm)


# Kullan�m s�kl���na g�re bu matrisi d�zenlersek;
v <- sort(rowSums(m),decreasing=TRUE)


# Dataframe 'e d�n��t�rmek i�in;
d <- data.frame(word = names(v),freq=v)

head(d, 10) # �lk 10 eleman� incelemek istersek.


# Wordcloud olu�turmak i�in;
wordcloud(words = d$word, freq = d$freq)



## Arguments of the word cloud generator function : `words` : The words to be plotted
# freq : The frequencies of the words.

# min.freq : The words with frequencies below this number will not be plotted.

# max.words : The maximum number of words to be plotted in the image.

# random.order : If true, plots word in a random order. If false, they will be plotted in decreasing frequency.

# rot.per : The proportion of words with 90 degree rotation (vertical text)

# colors : The color keywords (or values) from least to most frequent. To exemplify, colors=�black� will plot the cloud using only a single color.


wordcloud(words = d$word, freq = d$freq, min.freq=1) # 1kez kullan�lan kelimeleride dahil etmek i�in


wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words=250) # Wordcloud 'da maksimum g�r�necek kelime say�s� "250"


wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words=250, colors=brewer.pal(8, "Dark2"))


# En �ok kullananlar� ortaya al�p kullan�m s�kl���na g�re dizersek; 
wordcloud(words = d$word, freq = d$freq, min.freq = 1,max.words=250, colors=brewer.pal(8, "Dark2"), random.order = FALSE )


# names(v) = d$word, v = d$freq
# wordcloud(words = names(v), freq = v, min.freq = 1,max.words=250, colors=brewer.pal(8, "Dark2"), random.order = FALSE )



