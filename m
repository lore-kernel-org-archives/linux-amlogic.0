From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Tue, 23 May 2017 19:37:34 +0200
Subject: [PATCH] pwm: silently error on EPROBE_DEFER
In-Reply-To: <20170523160503.16920-1-jbrunet@baylibre.com>
References: <20170523160503.16920-1-jbrunet@baylibre.com>
Message-ID: <022f830b-2c43-c31c-9b03-eb36919045ca@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 23.05.2017 um 18:05 schrieb Jerome Brunet:
> In of_pwm_chip, if we fail to get the pwm chip due to probe defer, we
> shouldn't print an error message. Just be silent in this case.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Andreas F?rber <afaerber@suse.de>

Those messages are indeed irritating.

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
