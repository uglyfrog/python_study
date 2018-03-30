#! /usr/bin/env python
from socket import *
from time import ctime
from platform import python_version


HOST = 'localhost'
PORT = 21567
BUFSIZ = 1024
ADDR = (HOST,PORT)
notice = "This is server callback: "

tcpSerSock = socket(AF_INET,SOCK_STREAM)
tcpSerSock.bind(ADDR)
tcpSerSock.listen(5)

''''
test comment
'''

comment = ',  '.join(python_version())

while True:
    print python_version() > '2.6.2'
#    print comment
    print 'he is a very good man'.replace('is','was')
    tcpCliSock,addr = tcpSerSock.accept()
    print '...connected from:',addr

    while True:
        data = tcpCliSock.recv(BUFSIZ)
        if not data:
            break
        tcpCliSock.send('This is a server callback: [%s] %s' % (ctime(),data))

    tcpCliSock.close()
tcpSerSock.close()