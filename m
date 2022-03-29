Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958C5C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAVBMTApEhumjhXOKH0YGwm9hAWEGIv9+jJ2QtwZnM0=; b=mfDdUQZB2RTMTt
	EvDu2+wZtj9eaHXHOC1vdFZ42iYBTDPFjvJFI+1Bi6SSc4W9bs52KpgBM8SeCxJDlV24pIa3U/ekj
	R/XiljIUIq/crxEBbNhsZyVl1AHMp1q8QNm26YWJ9UdEIcH8jDObHUuvfqzSx668BWk9+TJGlCtBy
	YNR4u5gt3nxsTCDT312i2pk3lp8OylpzxENKZZT5ZE61rDPuW/6yvpAgfzttnUL9wYYyT3DYTub23
	Y5bBDNGWsGDGyUbgu2KZsSWS+FyIovY8adE/VNarSAos6dJC5PBvjZrdh9rfq75pRRo/5tw/pROZP
	KVxdSYZiJS7A62+/V7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZEQj-00CrC6-5e; Tue, 29 Mar 2022 16:10:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZEQg-00CrBJ-Bg
 for linux-amlogic@lists.infradead.org; Tue, 29 Mar 2022 16:10:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id q20so10648065wmq.1
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Mar 2022 09:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5KGmATQjbYA+t55uqFGpr9FQL9ODvt7ipMp6+gLdwR0=;
 b=cTl9Z/Z2B7Zis3KdOrxkgb6rLWuK8OXOTKEVukyoy14MzjaVUOgidYcqGlBeXN3/E6
 gRQ1zHZJ+Go7tFeKRHrn3WvCudR1HQ3QEd2kps/5pOj73DFAHqIWyO8Tztdl0H4PFp/h
 wZwgN2nuKIaLkKml6sTalVL+qv9GazbFXvZKc8dQFD0GOXaVPohy1y1s5S2dnxRqyYAv
 xlpP5zY23rwrpFRIxtHcwT6QWTtn+okFiIYcLEbRYDygJbvmWP3hNF273+ClZgqVP4Q2
 y0H5zcSSJJNLIV8WAK2NVV0FI7zc+o158PrNWzOQQo6gCD0tTb5djvNiTfADBT/nWwsh
 uBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5KGmATQjbYA+t55uqFGpr9FQL9ODvt7ipMp6+gLdwR0=;
 b=TSPuy4n4ZYd0LP9q7OWiwdE+8NwHV+VHcd6SqiMMzT3MIX1oS8tgvfflfGM02Ae8gA
 j7NDzLnxJkjpD1Jfd+ZAf9bJKsofueX5a2A1SAhkQx4EqPuZpMjPeawYjT1Pa5UlsTx1
 slyeeqWI7OyVodILfs3ePf0Y3mrf+Z/0ZU3bEfUc0GwPAcHY9unGfko7Y7ulFqiDKqAc
 vYkNJJ5OZDVxkeoTwViwxjto8DKr3ZHSq1bDr+MDSzMJUMaCQbCYnBrglSun04go+NBy
 JOff+uA5lqH/XOEU1vCY90quR60MQfVKA+MgHSC1Ad/UgBf5gmRHWx67JHMK1zp1nWBx
 shvA==
X-Gm-Message-State: AOAM532JQI+pbYWUg7YUK5mpFlUBRbics83DeCJhhMDAerIcimRlXjar
 QTQ9lYyLpCv1c31BI2gDo3k4Dg==
X-Google-Smtp-Source: ABdhPJyMMortSDOevzw0MwKMNsxauJgQiSDN5PF4JM0VcTIixYewWhKKjOdSbKNzXDYclvxOx1qwOw==
X-Received: by 2002:a05:600c:20a:b0:38c:95bf:3289 with SMTP id
 10-20020a05600c020a00b0038c95bf3289mr514205wmi.134.1648570244412; 
 Tue, 29 Mar 2022 09:10:44 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a663:978b:3ffb:7dc3?
 ([2001:861:44c0:66c0:a663:978b:3ffb:7dc3])
 by smtp.gmail.com with ESMTPSA id
 i15-20020adffdcf000000b00203efad1d89sm21772577wrs.9.2022.03.29.09.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 09:10:43 -0700 (PDT)
Message-ID: <35708f5e-efe5-5948-181f-8adf7d466647@baylibre.com>
Date: Tue, 29 Mar 2022 18:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 10/13] pinctrl: meson: Enable COMPILE_TEST
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-11-andriy.shevchenko@linux.intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220329152926.50958-11-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_091046_411459_47D66C33 
X-CRM114-Status: GOOD (  14.82  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 29/03/2022 17:29, Andy Shevchenko wrote:
> Enable COMPILE_TEST for a better test coverage.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
> index d1955c65b4b6..64fb9e074ac6 100644
> --- a/drivers/pinctrl/meson/Kconfig
> +++ b/drivers/pinctrl/meson/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   menuconfig PINCTRL_MESON
>   	tristate "Amlogic SoC pinctrl drivers"
> -	depends on ARCH_MESON
> +	depends on ARCH_MESON || COMPILE_TEST
>   	depends on OF
>   	default y
>   	select PINMUX

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
