From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Aug 2016 18:25:32 +0200
Subject: USB PHY documentation
In-Reply-To: <CAFBinCDuuw+J3BynPW+6Q3JvgvXcJi4+3ioSr6i43ONpm=DH9A@mail.gmail.com>
References: <CAFBinCASOLYOfsRC7+kVA8eZ+o1OsyqKEUDOUgfRBKuhsYnuYA@mail.gmail.com>
 <4cc6ec9ce62649c283fb633b26d5cffe@codethink.co.uk>
 <1472029412.2322.13.camel@baylibre.com>
 <CAFBinCCx4X_Lsd9NsFd-9aHL67EvCJDebdzc8zdSP9Hcw__BOA@mail.gmail.com>
 <CAO9vn2P8vPwFFpz-VN3WKV_BNhwXWW=NkjTEhoGvYShbrZMwsA@mail.gmail.com>
 <CAFBinCDuuw+J3BynPW+6Q3JvgvXcJi4+3ioSr6i43ONpm=DH9A@mail.gmail.com>
Message-ID: <CAFBinCDJttiVZLtCWDPFqMJTdcHs2MS1uZQy9pvOFHdgz2ko-g@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Aug 27, 2016 at 11:32 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> On Fri, Aug 26, 2016 at 12:55 PM, J?r?me Brunet <jbrunet@baylibre.com> wrote:
>> I did some test on the otg controller. I had to remove the reset in the PHY
>> because it was reseting both of them, so the reset intended for the 2nd PHY
>> was breaking the configuration of the 1st.
> I am getting the following error when 1) removing the reset and 2)
> booting the mainline kernel directly (without booting the stock
> Android kernel first):
> [    1.297507] dwc2 c9000000.usb-controller: dwc2_core_reset() HANG!
> AHB Idle GRSTCTL=0
> [    1.305116] dwc2 c9000000.usb-controller: Bad value for GSNPSID: 0x00000000
I added the reset back along with some code that ensures it only calls
the reset once.
That made the error go away on my board.

Additionally I forced the first USB controller to "host" mode (which
was also not working without the reset) due to the OTG problems you
have mentioned.
I did some basic tests with both USB controllers - everything looks good!
While doing that I found out that quite a lot bits in REG_ADP_BC are
readonly - one of them is REG_ADP_BC_DRV_VBUS so I removed the code
which set that bit.

Finally I added our signed-off-by's to the patches and improved the
patch subjects and descriptions.
You can find my updated tree here: [0] (or if you only care about the
USB patches: [1])

PS: I will only have limited access to my S905 device in the next two weeks.
Feel free to submit the patches once you think they are ready - having
USB (host) support in 4.9 would be awesome!


Regards,
Martin


[0] https://github.com/xdarklight/linux/commits/meson-gxbb-integration-4.8-20160827
[1] https://github.com/torvalds/linux/compare/0ff577bf040b312301920f8589fc9fcea84a86b8...6aebadf13dcfb631399e7717c5eec0e80d72c9a7
