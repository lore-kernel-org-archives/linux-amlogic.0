From: sjg@chromium.org (Simon Glass)
Date: Mon, 26 Nov 2018 18:02:59 -0700
Subject: [PATCH u-boot v3 1/3] regmap: add regmap_read_poll_timeout()
 helper
In-Reply-To: <20181122100105.14829-2-narmstrong@baylibre.com>
References: <20181122100105.14829-1-narmstrong@baylibre.com>
 <20181122100105.14829-2-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ1c2CMTy7H1bt_Dh6MWEiyvTkoDvqHC3H3YbqiQoxOqnQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

On Thu, 22 Nov 2018 at 03:01, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the regmap_read_poll_timeout() macro based on the Linux implementation
> to simplify register polling with configurable timeout and sleep.
>
> Acked-by: Jagan Teki <jagan@openedev.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/regmap.h | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>

Is there a change log somewhere? This is v3.

Regards,
Simon
