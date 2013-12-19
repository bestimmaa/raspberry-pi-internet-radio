#!/usr/bin/python
# -*- coding: utf-8 -*-
 
import os
import random
 
img_folder="/home/pi/pics" # Anpassen, Ordner mit Pics darin
                             # AM ENDE KEIN /
walker = os.walk(img_folder,True,None)
pics = [] # leer lassen
 
def give_random_pic(self):
        for i in walker:
                if len(i[2]) > 0:
                        for j in i[2]:
                                if j.split(".")[-1] == "png": # Pruefe ob die Endung .png ist
                                        pics.append(i[0]+"/"+j)
        rn = random.randrange(0,len(pics),1)
        return pics[rn]
