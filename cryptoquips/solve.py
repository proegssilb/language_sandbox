#! usr/bin/env python

import itertools

from string import maketrans

import create

min_word_dict = create.min_word_dict()

def cryptoquip(cryptoquip):
    
    words = cryptoquip.split(' ')

    #organize, sort incoming cryptoquip by largest -> smallest
    pos_len = [(i, len(word)) for (i, word) in enumerate(words)]
    pos_len.sort(key=lambda x: x[-1], reverse=True)          
    sorted_words = [words[i] for i in [x[0] for x in pos_len]]
    min_transform = [create.min_replacement(w) for w in sorted_words]
    #use lowered words to denote a "solution", or in this case, a candidate
    candidates = [min_word_dict.get(word, None) for word in min_transform]
    candidates = [[i.lower() for i in c if i is not None] for c in candidates]

    for candidate in itertools.product(*candidates):
        this_attempt = last_attempt = ''
        hits_post_attempt = len(cryptoquip)

        still_valid = True

        for (i, word) in enumerate(candidate):
            pre_attempt = maketrans(sorted_words[i], word)
            this_attempt = cryptoquip.translate(pre_attempt)

            hits_pre_attempt = len([x for x in this_attempt if x.isupper()])

            print hits_pre_attempt, hits_post_attempt
            if hits_pre_attempt > hits_post_attempt:
                #we've retranslated something: it's no good
                still_valid = False
                break
            else:
                hits_post_attempt = hits_pre_attempt

                #switch the translation table listing to go back
                post_attempt = maketrans(word, sorted_words[i])
                last_attempt = this_attempt.translate(post_attempt)
                hits_pre_attempt = len([x for x in last_attempt if x.isupper()])

        if still_valid:
            original_positions = [i[0] for i in pos_len]
            arranged = zip(original_positions, candidate)
            yield ' '.join([word[1] for word in sorted(arranged)])
                 