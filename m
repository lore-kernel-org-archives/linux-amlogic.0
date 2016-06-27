From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 27 Jun 2016 12:53:20 +0200
Subject: [v2] media: rc: fix Meson IR decoder
In-Reply-To: <5770C74B.9000000@baylibre.com>
References: <20160626210622.5257-1-martin.blumenstingl@googlemail.com>
 <5770C74B.9000000@baylibre.com>
Message-ID: <CAFBinCCyx3gnYUc2uLD6OnwK3GfJ4rGn8zq80MG4H6dYqH4jcA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Jun 27, 2016 at 8:27 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> I'm quite sure the registers are good for meson6 actually, and
> it seems reasonable Amlogic made the HW evolve for the Meson8 and GXBB platforms.
OK, then from now on I will NOT assume anymore that the reference code
also works on Meson6 platforms. Thanks for clarifying this.

> Since we are using devicetree, the correct way to achieve this fix is not
> to drop support for meson6 (what you do) but add a logic to select the correct
> register for meson8 and gxbb if their compatible string are encountered.

> I made this fix already but lacked time to actually test it on HW :
> https://github.com/torvalds/linux/compare/master...superna9999:amlogic/v4.7/ir
>
> My patch is missing the meson8b support, and may need a supplementary compatible check or
> a separate dt match table.
I can test it on GXBB (only, I do not have Meson8b hardware, but
according to the datasheet the registers are the same).
If you want I can start based on your patch series. Should we add only
a binding for amlogic,meson8b and re-use that in meson-gxbb.dtsi or
should we add both (8b and gxbb) bindings instead?

> PS: BTW could you format the cover letter using the git format-patch --cover-letter instead and
> add the v2 using the -subject-prefix like :
> # git format-patch --cover-letter --signoff --subject-prefix "PATCH v2" -2
sounds like this is what other devs are using as well - thanks for
letting me know
