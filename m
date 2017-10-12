From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 11 Oct 2017 17:15:29 -0700
Subject: [PATCH v2 0/2] pinctrl: meson: prepare for new SoC
In-Reply-To: <20171011120230.30483-1-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Wed, 11 Oct 2017 14:02:28 +0200")
References: <20171011120230.30483-1-jbrunet@baylibre.com>
Message-ID: <7hshepfcgu.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The goal of this patchset is to prepare meson pinctrl driver to
> add a new meson SoC support. This new SoC will share the same pinconf/gpio
> registers but the pinmux part will be slightly different.
>
> First patch allows to compile and ship only the necessary pinctrl drivers,
> depending on the architecture and configuration needs. This should save
> a bit of memory.
>
> Second patch provide a way to deal with a different pinmux scheme, while
> reusing most of the meson pinctrl driver.
>
> Linus, FYI, this series depends on the meson changes you have already
> merged in this cycle.
>
> Change since v1: [0]
> * Use of_device_get_match_data() in patch
> * Change pmx naming scheme for the SoC parts
>
> [0]: https://lkml.kernel.org/r/20171009101747.16940-1-jbrunet at baylibre.com
>
> Jerome Brunet (2):
>   pinctrl: meson: separate soc drivers
>   pinctrl: meson: rework pinmux ops

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
