From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 27 Aug 2016 23:32:51 +0200
Subject: USB PHY documentation
In-Reply-To: <CAO9vn2P8vPwFFpz-VN3WKV_BNhwXWW=NkjTEhoGvYShbrZMwsA@mail.gmail.com>
References: <CAFBinCASOLYOfsRC7+kVA8eZ+o1OsyqKEUDOUgfRBKuhsYnuYA@mail.gmail.com>
 <4cc6ec9ce62649c283fb633b26d5cffe@codethink.co.uk>
 <1472029412.2322.13.camel@baylibre.com>
 <CAFBinCCx4X_Lsd9NsFd-9aHL67EvCJDebdzc8zdSP9Hcw__BOA@mail.gmail.com>
 <CAO9vn2P8vPwFFpz-VN3WKV_BNhwXWW=NkjTEhoGvYShbrZMwsA@mail.gmail.com>
Message-ID: <CAFBinCDuuw+J3BynPW+6Q3JvgvXcJi4+3ioSr6i43ONpm=DH9A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Aug 26, 2016 at 12:55 PM, J?r?me Brunet <jbrunet@baylibre.com> wrote:
> I did some test on the otg controller. I had to remove the reset in the PHY
> because it was reseting both of them, so the reset intended for the 2nd PHY
> was breaking the configuration of the 1st.
I am getting the following error when 1) removing the reset and 2)
booting the mainline kernel directly (without booting the stock
Android kernel first):
[    1.297507] dwc2 c9000000.usb-controller: dwc2_core_reset() HANG!
AHB Idle GRSTCTL=0
[    1.305116] dwc2 c9000000.usb-controller: Bad value for GSNPSID: 0x00000000
