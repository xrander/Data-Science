#!/usr/bin/env python
# coding: utf-8

# In[ ]:


print ('Welcome to Current affairs game')


# In[ ]:


playing = input ('do you want to play? ' )


# In[ ]:


if playing.lower == 'yes':
    print ("Great, let's play")
else:
    print ('woops, okay')
    quit()


# In[ ]:


name= input('player name ')


# In[ ]:


print (name+ ' ' + "let's have some fun")


# In[ ]:


score = 0


# In[ ]:


question = input ('Who is the richest man in the world as at january 2022? ')


# In[ ]:


if question.lower == 'Elon musk':
    print ('that is correct')
    score += 1
else:
    print ('that is wrong')


# In[ ]:


question = input ('Who is the current president in the United States of America? ')


# In[ ]:


if question.lower == 'Joe Biden':
    print ('that is the correct answer')
    score += 1
else:
    print ('that is wrong')


# In[ ]:


question = input ('Who is the highest scoring footballer of all time in the English Premier League? ')


# In[ ]:


if question == 'Alan Shearer':
    print ('correct')
    score += 1
else:
    print ('that is wrong')


# In[ ]:


print (name + ' ' + 'scored' + ' ' + str((score/3)*100)


# In[ ]:




