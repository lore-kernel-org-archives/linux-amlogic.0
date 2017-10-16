From: linus.walleij@linaro.org (Linus Walleij)
Date: Mon, 16 Oct 2017 14:00:33 +0200
Subject: [PATCH v3 1/2] pinctrl: meson: separate soc drivers
In-Reply-To: <20171012124026.2111-2-jbrunet@baylibre.com>
References: <20171012124026.2111-1-jbrunet@baylibre.com>
 <20171012124026.2111-2-jbrunet@baylibre.com>
Message-ID: <CACRpkdavA_yLJb81K+-q0Bpd5Lt4DqiZyBaDX5xAbEyW-8ROWg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Oct 12, 2017 at 2:40 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> When meson pinctrl is enabled, all meson platforms pinctrl drivers are
> built in the kernel, with a significant amount of data.
>
> This leads to situation where pinctrl drivers targeting an architecture
> are also compiled and shipped on another one (ex: meson8 - ARM - compiled
> and shipped on ARM64 builds). This is a waste of memory we can easily
> avoid.
>
> This change makes 4 pinctrl drivers (1 per SoC) out the original single
> driver, allowing to compile and ship only the ones required.
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij
