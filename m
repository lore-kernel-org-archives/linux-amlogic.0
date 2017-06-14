From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 14 Jun 2017 10:38:05 -0700
Subject: [PATCH v2 2/3] pwm: meson: add compatible for the gxbb ao pwms
In-Reply-To: <20170608122416.1993-3-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Thu, 8 Jun 2017 14:24:15 +0200")
References: <20170608122416.1993-1-jbrunet@baylibre.com>
 <20170608122416.1993-3-jbrunet@baylibre.com>
Message-ID: <m21sqm4ghu.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On the gxbb (and gxl) family, the PWMs of the AO domain require a
> specific compatible because the possible input clocks are different
> from the EE PWMs input clocks.
>
> Since the number of possible input clocks is also different, the
> 'num_parents' field is added to all the meson pwm data.
>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
