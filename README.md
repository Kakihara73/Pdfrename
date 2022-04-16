# UNDER CONSTRUCTION

# Pdfrename
Simple script in bash to rename (move) PDF files based on matching content words or phrase
## What is this?
This is my first and complicated bash script, write it more simple as possible. I have created because we had some PDF files about PC provisioning (usually laptop), signed and assigned from our Company.
## How to use
Simply put the `pdfrename.sh` script to a prefered location, like option you can give it an executable permission with
```
chmod +x pdfrename.sh
```
Also you must modify the fisrt line contains the variables like path where the script must check PDF files and then process to find right words will be renamed at the end.
```
Temp=/tmp/pdftxtmp.txt
Dest=/root/Scan
Pdf=/var/lib/paperless/media/documents/archive/*.pdf
NOW=$(date "+%d%m%Y_%H.%M")
Log=/var/log/pdfrename_$NOW.log
```
* **Temp**. This variable point to temporary file that `pdftotext` save text and layout find into PDF file, so it can be leave as it is.
* **Dest**. This variable is the path where PDF files will be moved and renamed. In my case was into a root account for testing and it must be changed by your needs (the folder must be exist).
* **Pdf**. This variable is the right path where the PDF files exixt and must be moved and renamed. In my case point to folder into paperles-ng software store the PDF files passed on his OCR scans. You must modify by your needs because this script is not depending only to paperless-ng but works with PDF files that contains text.
* **NOW**. This is a simple variable to make the variable date into tail name of log file as indicate the next variable as *pdfrename_DayMonthYear_Hour_Minute.log*.
* **Log**. As previuosly say, this variable show where the logs are stored and in whitch format. Default point to `/var/lag/` folder and can be modified by your needs.





.......................................


