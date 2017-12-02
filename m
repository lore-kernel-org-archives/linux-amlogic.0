From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 2 Dec 2017 18:14:42 +0100
Subject: [PATCH] net: phy: realtek: fix RTL8211F interrupt mode
In-Reply-To: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
References: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
Message-ID: <CAFBinCC-wJ6QsC1ufjfR-875OnBbCoUiWOT+00MvFMX3Z4CZxw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Heiner,

On Sun, Nov 12, 2017 at 4:16 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> After commit b94d22d94ad22 "ARM64: dts: meson-gx: add external PHY
> interrupt on some platforms" ethernet stopped working on my Odroid-C2
> which has a RTL8211F phy.
>
> It turned out that no interrupts were triggered. Further analysis
> showed the register INER can't be altered on page 0.
> Because register INSR needs to be accessed via page 0xa43 I assumed
> that register INER needs to be accessed via some page too.
> Some brute force check resulted in page 0xa42 being the right one.
unfortunately there's no public datasheet for the RTL8211F.
I contacted Realtek to see if we could get a datasheet. unfortunately
an NDA is required for that
however, they were kind enough to share some information from the
RTL8211F datasheet with me

RTL821x_INER is called INER (Interrupt Enable Register) in the datasheet.
it is located at page 0xa42, address (the register after selecting the
page) 0x12 (RTL821x_INER is also 0x12)

in other words: your findings were correct!
(I know that my mail is too late to make it into the commit message -
but with this mail it's "documented" online now)

RTL8211E also uses RTL821x_INER (0x12) register, but according to the
information I got from Realtek it is located in page 0x0 (so no
special page has to be selected before changing that register on
RTL8211E)


Regards
Martin
