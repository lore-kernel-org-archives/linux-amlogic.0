From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 15 Jan 2018 13:36:10 +0100
Subject: [RFT net-next v4 2/5] net: stmmac: dwmac-meson8b: simplify
 generating the clock names
In-Reply-To: <CAFBinCCMaV+KO2dNAUFqoYSLtg10-QR_mvY1vTgDgB3iHzf3kw@mail.gmail.com>
References: <20180114214858.7217-1-martin.blumenstingl@googlemail.com>
 <20180114214858.7217-3-martin.blumenstingl@googlemail.com>
 <1516016807.2608.13.camel@baylibre.com>
 <CAFBinCCMaV+KO2dNAUFqoYSLtg10-QR_mvY1vTgDgB3iHzf3kw@mail.gmail.com>
Message-ID: <1516019770.2608.18.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, 2018-01-15 at 13:02 +0100, Martin Blumenstingl wrote:
> > Here you'd allocate memory for each string which will remain until the driver
> > unload. It's not much, but still, it is wasted memory.
> 
> good catch, thank you!
> maybe I should drop this patch for now and clean up the clock
> registration in another series - I can try to get rid of the
> "unneeded" members in struct meson8b_dwmac in a new patch. what do you
> think?

I think it would be wise, yes.

Cheers
Jerome
