#!/usr/bin/env python
# coding=utf-8

from easygui import *
from pyPdf import PdfFileWriter, PdfFileReader
import os
import sys

    
def getUserInformation():
    file  = fileopenbox('DHl PDF auswählen', 'PDF crop Tool',"*.pdf")
    return file

def resizePdf(filename):
    
    output = PdfFileWriter()
    input1 = PdfFileReader(file(filename, "rb"))

    page = input1.getPage(0)

    page.mediaBox.lowerRight = (
        page.mediaBox.getUpperRight_x(),
        page.mediaBox.getUpperRight_y()/2
    )

    output.addPage(page)
    outputfile = filename.replace('.pdf', 'a5-hochformat.pdf')


    outputStream = file(outputfile, "wb")
    output.write(outputStream)
    outputStream.close()

def main():
    userInformation = getUserInformation()
    if userInformation is None:
        msgbox("Fehler: Keine Datei ausgewählt!")
    else:
        resizePdf(userInformation)
        sys.exit(0)

if __name__ == "__main__":
    main()