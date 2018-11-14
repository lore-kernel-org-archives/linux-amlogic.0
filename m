From: jagan@amarulasolutions.com (Jagan Teki)
Date: Wed, 14 Nov 2018 18:39:59 +0530
Subject: [U-Boot] [PATCH u-boot v3 2/3] test: regmap: add
 regmap_read_poll_timeout test
In-Reply-To: <20181114102520.25346-3-narmstrong@baylibre.com>
References: <20181114102520.25346-1-narmstrong@baylibre.com>
 <20181114102520.25346-3-narmstrong@baylibre.com>
Message-ID: <CAMty3ZA_BfUg=ntD4hedqUF7zjETHACoVUAXGXnnjHiqPzsrXA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Nov 14, 2018 at 3:57 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add test to regmap_read_poll_timeout() helper to check the timeout works
> properly but cannot test proper condition matching since read/write calls
> are not executed in sandbox.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Acked-by: Jagan Teki <jagan@openedev.com>
