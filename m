From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 4 Jul 2018 16:20:32 +0200
Subject: dwc2 (on Meson8b) doesn't detect "hot-plugged" USB devices
In-Reply-To: <CAFBinCAfHPLa6qL1fwGq0ZOb15kDAp9TsvJcqhjWqh=Fa0sFuQ@mail.gmail.com>
References: <CAFBinCBEWb_2d7ypgS2uC2EXq_XSw67=zyPPqdRFZWi32aWPmA@mail.gmail.com>
 <410670D7E743164D87FA6160E7907A560113AFA2F2@am04wembxb.internal.synopsys.com>
 <CAFBinCCr-_H1ZJBn3pfmcEHBNVv8hiobttywP18VOUvS__WMeA@mail.gmail.com>
 <CAFBinCDVCdBDpZoLi=Kq5-f_oBVo3w=Jp5jQc1DuSPceXk5K+w@mail.gmail.com>
 <3AD91E696667BF4BA728303C178E8A6353125B2C@am04wembxb.internal.synopsys.com>
 <CAFBinCC2S9-NLV1WpF3JsEiHj=OEMyJhvn5ab==QBc9ESxWBLw@mail.gmail.com>
 <3AD91E696667BF4BA728303C178E8A6353125B89@am04wembxb.internal.synopsys.com>
 <CAFBinCAfHPLa6qL1fwGq0ZOb15kDAp9TsvJcqhjWqh=Fa0sFuQ@mail.gmail.com>
Message-ID: <CAFBinCD1JTii6O1u=WPZNuskiyCg1_imcQCS16kdoL+hp5F80Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Jul 4, 2018 at 4:16 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> unfortunately it seems that plugging in seems to fill the kmsg buffer
> instantly, so I cannot (at least I don't know how - do you have any
> idea how to get around this?) get the information from the second
> where I'm plugging in the thumb drive
> I attached everything I have
I forgot to mention: I switched boards this time - my previous logs
were from a Meson8m2 board
to rule out that the board itself is faulty I switched to an Odroid-C1
(Meson8b) this time -> there's a 4-port USB hub hard-wired on the
Odroid-C1 which you can see in the kernel logs (just in case you are
wondering)
