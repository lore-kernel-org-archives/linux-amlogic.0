From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 5 Jun 2018 18:25:46 +0200
Subject: Odroid-C2 solid green screen on "echo c > /proc/sysrq-trigger" on
 Arch 4.16/4.17rc6
In-Reply-To: <1528214861.10642.59.camel@baylibre.com>
References: <84bc747f58f648e1b209bc0005804bc5@wppexc12.purdue.lcl>
 <5d1512ae-51eb-7e05-ad8b-b8e851aee90e@baylibre.com>
 <CAERgokn-JU9JxHibaWF8w9-roz-wVukey2c7RKVNJoSV=Y+Q3g@mail.gmail.com>
 <1a951abcb7be4e93945613afcdcd96f3@wppexc12.purdue.lcl>
 <f9058ba905344938a09e967b039ed857@wppexc12.purdue.lcl>
 <1f8eaec9-e3a2-1b9b-1cef-ed3567a96aa2@baylibre.com>
 <179a8a16-30a9-73fc-7f07-beeab3a981dc@poczta.onet.pl>
 <176f036c3d2f49a4b5bde68bdee68e6a@wppexc12.purdue.lcl>
 <6353008e-35a9-bb3e-f52c-97191ddb60a3@baylibre.com>
 <ca351a5029b843709950d8fe4be505d2@wppexc12.purdue.lcl>
 <1528214861.10642.59.camel@baylibre.com>
Message-ID: <5f22d451-8451-25b9-525f-25797cb1a203@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 05/06/2018 18:07, Jerome Brunet wrote:
> On Tue, 2018-06-05 at 13:48 +0000, Swabey, Matthew A wrote:
>> I'm not happy with the Raspberry Pi 3B, never really have been happy with any of their products due to their weird bootloader (just google netbooting Rpis - their implementation is badly broken), their overall hardware architecture etc. I much prefer the Odroid-c2, except for the 3.14 kernel. So when it went mainline I was very happy.
>>
>> However the reboot-greenscreen is problematic for my usecase, and I believe indicative of a possible race somewhere in the software stack, probably bootloader.
> 
> I don't think so.
> My guess would be that your screen somehow read raw '0x00' on link while the
> board resets. If your display is configured in YUV mode, you would see a green
> screen. 0,0,0 is green in YUV
> 
> If you were using RGB instead YUV, I suspect you would have a black screen,
> which is sad compared to 'funky green' but it is matter of taste I suppose.
> 

As I explained in a previous answer, the Watchog reset stops the whole SoC at a single point and reboots.
There is no way to handle this in software since it's designed to reset the SoC when the software is stuck.

As Jerome explained, the HDMI PHY is probably still sending some TMDS data but half of the SoC must in reset state,
thus sending data from YUV '0's. The HDMI on GXBB is configured to always send RGB, but the video converter must
still work when the reset occurs, thus seeing the last zero frame on the screen.

In watchdog reset, the fix is quite limited. As I replied earlier, it may be necessary to reset the HDMI
PHY in early code, but this code is in the control of Amlogic, and maybe HardKernel.
Anyway this SoC is no longer supported by Amlogic, so anything related to Firmware won't be fixed.
It should be interesting to see if the issue remains on the S905X/S905D SoCs.

Finally, if you see the same green screen after a normal shutdown/reboot command, this is another issue
and it means the HDMI disabling misses some code to avoid sending bad TMDS to the monitor.
This could be fixed for sure.

Neil
