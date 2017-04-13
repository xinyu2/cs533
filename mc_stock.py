import numpy as np

B=[]     
for k in range(1000):
     H=[]
     for n in range(50):
         h=0
         for m in range(30):
             p=np.random.rand()
             if p>=0.25:
                 h+=1
         H.append(h)
     B.append(np.max(H))

