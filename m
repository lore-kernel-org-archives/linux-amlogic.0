From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 06 Oct 2017 16:15:35 -0700
Subject: [PATCH] pinctrl: meson: remove unused pin_base
In-Reply-To: <20171006085407.27905-1-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Fri, 6 Oct 2017 10:54:07 +0200")
References: <20171006085407.27905-1-jbrunet@baylibre.com>
Message-ID: <7hd15z7trc.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> While removing the need to have pin_base defined in meson pinctrl
> drivers, I forgot to remove the corresponding field from the
> pinctrl_data structure.
>
> Fixing this now.
>
> Fixes: 70e5ecb1b994 ("pinctrl: meson: get rid of pin_base")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
