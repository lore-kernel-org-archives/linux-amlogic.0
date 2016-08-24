From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 24 Aug 2016 12:19:56 +0200
Subject: USB PHY documentation
In-Reply-To: <1472029412.2322.13.camel@baylibre.com>
References: <CAFBinCASOLYOfsRC7+kVA8eZ+o1OsyqKEUDOUgfRBKuhsYnuYA@mail.gmail.com>
 <4cc6ec9ce62649c283fb633b26d5cffe@codethink.co.uk>
 <1472029412.2322.13.camel@baylibre.com>
Message-ID: <CAFBinCDFXZUUB2AaQU9v_DjsLN+6ciLRBv4_cBgtBu8++OT2Ww@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

On Wed, Aug 24, 2016 at 11:03 AM, jbrunet <jbrunet@baylibre.com> wrote:
>> > In case anyone is interested how my changes look exactly, you can
>> > find
>> > the code here: [1]
> @Martin: I tried your patch and just done a few corrections, mainly
> interrupt numbers in the device tree and otg_cap in amlogic_params in
> dwc2 driver. the code is here [2]
>
> The host controller seems to be working well on the p200, I'm still
> checking the otg controller.
oh, interrupt numbering is different in the reference kernel! Many
thanks for testing and figuring this out!

I can continue working on this on Friday / Saturday.
But if you want to go ahead and finish the patches: feel free to do so.
