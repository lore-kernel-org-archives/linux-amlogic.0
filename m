From: linus.walleij@linaro.org (Linus Walleij)
Date: Fri, 9 Jun 2017 09:30:19 +0200
Subject: [PATCH v6 1/9] pinctrl: meson: add interrupts to pinctrl data
In-Reply-To: <897a1982-2bfb-d250-94bc-262a745109a3@gmail.com>
References: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
 <897a1982-2bfb-d250-94bc-262a745109a3@gmail.com>
Message-ID: <CACRpkdZJQSmepQx2g28RxhYeF_A699e4M3Nq0V_mKevz9YDmiw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jun 8, 2017 at 9:37 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> From: Jerome Brunet <jbrunet@baylibre.com>
> Add GPIO interrupt information to pinctrl data. Added to the original
> version from Jerome was data for Meson GXL.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - no changes
> v3:
> - no changes
> v4:
> - no changes
> v5:
> - added Acked-by
> v6:
> - no changes
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

I've applied this patch to the pin control tree, as there is nothing
controversial at all about it, just encoding hardware information into
the tables as is custom.

I don't know about how to handle the rest of the series, at least
you have one less patch in your patch stack.

Yours,
Linus Walleij
