{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": [],
      "authorship_tag": "ABX9TyNNiPMJUYrrK5zkXfYqUC0F",
      "include_colab_link": true
    },
    "kernelspec": {
      "name": "ir",
      "display_name": "R"
    },
    "language_info": {
      "name": "R"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/RafaelMeirellesJ/R_Project/blob/main/R_Project.R\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "library(ggplot2)\n",
        "library(dplyr)"
      ],
      "metadata": {
        "id": "63qI_RWWVrwt"
      },
      "execution_count": 2,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "#Loading the dataset\n",
        "path <- 'C:\\\\Users\\\\rafae\\\\OneDrive\\\\Documentos\\\\GameRelease\\\\GR.csv'\n",
        "df <- read.csv(path)"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 217
        },
        "id": "Xtl1q2f1VuLq",
        "outputId": "da3911e5-8bdb-45ab-cbae-248e6799aca8"
      },
      "execution_count": 14,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stderr",
          "text": [
            "Warning message in file(file, \"rt\"):\n",
            "“cannot open file 'C:\\Users\\rafae\\OneDrive\\Documentos\\GameRelease\\GR.csv': No such file or directory”\n"
          ]
        },
        {
          "output_type": "error",
          "ename": "ERROR",
          "evalue": "ignored",
          "traceback": [
            "Error in file(file, \"rt\"): cannot open the connection\nTraceback:\n",
            "1. read.csv(path)",
            "2. read.table(file = file, header = header, sep = sep, quote = quote, \n .     dec = dec, fill = fill, comment.char = comment.char, ...)",
            "3. file(file, \"rt\")"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "#Converting the 'release' column to date format\n",
        "df$release <- as.Date(df$release, format='%b %d %Y')"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 96
        },
        "id": "ppE6qouXVw2R",
        "outputId": "14e9d3da-c759-4ee1-bfcf-4256cd092ac4"
      },
      "execution_count": 5,
      "outputs": [
        {
          "output_type": "error",
          "ename": "ERROR",
          "evalue": "ignored",
          "traceback": [
            "Error in df$release: object of type 'closure' is not subsettable\nTraceback:\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "#Sorting the DataFrame by the 'release' column\n",
        "df_sorted <- df[order(df$release), ]"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 96
        },
        "id": "zFF3j49XVx1Y",
        "outputId": "896b281b-80b4-495d-c5f2-a5fea60ee3ab"
      },
      "execution_count": 7,
      "outputs": [
        {
          "output_type": "error",
          "ename": "ERROR",
          "evalue": "ignored",
          "traceback": [
            "Error in df$release: object of type 'closure' is not subsettable\nTraceback:\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "#Filtering the DataFrame to select only the first 10,000 values\n",
        "df_cut <- head(df_sorted, 10000)"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 130
        },
        "id": "AM4apq0MVy1m",
        "outputId": "e8ca2be8-8f97-4367-b02f-14576d776dcf"
      },
      "execution_count": 8,
      "outputs": [
        {
          "output_type": "error",
          "ename": "ERROR",
          "evalue": "ignored",
          "traceback": [
            "Error in eval(expr, envir, enclos): object 'df_sorted' not found\nTraceback:\n",
            "1. head(df_sorted, 10000)"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "#Removing commas from values in the 'positive_reviews' column\n",
        "df$positive_reviews <- gsub(',', '', df$positive_reviews)"
      ],
      "metadata": {
        "id": "9aM3WP8oV08x"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "#Removing commas from values in the 'negative_reviews' column\n",
        "df$negative_reviews <- gsub(',', '', df$negative_reviews)"
      ],
      "metadata": {
        "id": "6WHVM-ukV32N"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "#Converting the columns to integers\n",
        "df$positive_reviews <- as.integer(df$positive_reviews)\n",
        "df$negative_reviews <- as.integer(df$negative_reviews)"
      ],
      "metadata": {
        "id": "kRIkeZz7V4__"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "#Calculating the sum of the rows in the 'positive_reviews' and 'negative_reviews' columns\n",
        "df$total_reviews <- df$positive_reviews + df$negative_reviews"
      ],
      "metadata": {
        "id": "6YhKZXEuV7OX"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "#Converting the columns to numeric\n",
        "df$peak_players <- as.numeric(df$peak_players)\n",
        "df$positive_reviews <- as.numeric(df$positive_reviews)\n",
        "df$negative_reviews <- as.numeric(df$negative_reviews)\n",
        "df$total_reviews <- as.numeric(df$total_reviews)\n",
        "df$rating <- as.numeric(sub('%', '', df$rating))"
      ],
      "metadata": {
        "id": "f--Bi0BSV8uf"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "#Sorting the DataFrame by the 'release' column\n",
        "df_cut <- df_cut[order(df_cut$release), ]"
      ],
      "metadata": {
        "id": "RYgd1VFyV9ra"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "#Plotting the line graph\n",
        "ggplot(df_cut, aes(x = release, y = peak_players)) +\n",
        "  geom_line() +\n",
        "  labs(title = 'Peak Players Over Time',\n",
        "       x = 'Release Date',\n",
        "       y = 'Peak Players')\n"
      ],
      "metadata": {
        "id": "Jd1h-BuLV-lV"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "#Listing the columns to be plotted\n",
        "columns <- c('peak_players', 'positive_reviews', 'negative_reviews', 'total_reviews', 'rating')"
      ],
      "metadata": {
        "id": "M8epGGJiV_Y3"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "for (col in columns) {\n",
        "  ggplot(df_cut, aes_string(x = col)) +\n",
        "    geom_histogram(binwidth = 20, color = 'black', fill = 'lightblue') +\n",
        "    labs(title = paste0('Distribution of ', col),\n",
        "         x = col,\n",
        "         y = 'Count') +\n",
        "    theme_bw() +\n",
        "    theme(plot.title = element_text(hjust = 0.5))\n",
        "}"
      ],
      "metadata": {
        "id": "SCfd__2RWBkR"
      },
      "execution_count": null,
      "outputs": []
    }
  ]
}