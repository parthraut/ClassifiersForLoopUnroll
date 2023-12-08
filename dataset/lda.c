#include <stdio.h>

int main() {
    // This is a simplified example; a real implementation would use a library.
    // Assume topics and word distributions are provided externally.
    char topics[] = "Topic1 Topic2 Topic1 Topic3 Topic2";
    char words[] = "word1 word2 word3 word4 word5";

    char *topicToken = strtok(topics, " ");
    char *wordToken = strtok(words, " ");

    while (topicToken != NULL && wordToken != NULL) {
        printf("Topic: %s, Word: %s\n", topicToken, wordToken);
        topicToken = strtok(NULL, " ");
        wordToken = strtok(NULL, " ");
    }

    return 0;
}