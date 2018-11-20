From: ccaione@baylibre.com (Carlo Caione)
Date: Tue, 20 Nov 2018 14:06:24 +0000
Subject: [PATCH u-boot 10/19] pinctrl: meson: add axg support
In-Reply-To: <1541777218-472-11-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
 <1541777218-472-11-git-send-email-narmstrong@baylibre.com>
Message-ID: <348976107da522ffe1546706b8429f8d3f14b3b1.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, 2018-11-09 at 16:26 +0100, Neil Armstrong wrote:
> From: Jerome Brunet <jbrunet@baylibre.com>
> 
> This adds support for the Amlogic AXG SoC pinctrl and GPIO controller
> using a specific set of pinctrl functions which differs from the GX
> SoCs.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

/cut
> +static int meson_axg_gpio_request(struct udevice *dev,
> +				  unsigned int offset, const char
> *label)
> +{
> +	return meson_axg_pmx_update_function(dev, offset, 0);
> +}

Hey Neil,
this should be:

meson_axg_pmx_update_function(dev->parent, offset, 0);

since you want to pass the pinctrl udevice (not the gpio one) otherwise
you get a Synchronous Abort when trying to access the pinctrl priv data
(and you can crash the board with `=> gpio input aobus-banks10`).

Cheers,

--
Carlo Caione
