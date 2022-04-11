Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC44C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQpplAIMWANVAiigauyV+zKbO3lSaGMTp+BMVrEJpvI=; b=QR6/FTZFF2J+zi
	eW5UNEhUtxxKZojlmZql2AI8PirfhRzLtHwhsBO5SZI/3LLuK3wl1JdmmYO+DnD4H4qk1YXlhTb+J
	HPAprvgMONDY5u/h+FLIPHjSORtx4ZKQyIdhSuomw53yhBW9wYxxkTgxNejCxCbHxsJoeuhiNvduQ
	0fwgRuL0eTrjKNEyzaEn0UGS3c5NOgUYRoedMMPFo7x/6mbTcDEE2YJ1CC9HtKBIFqEusBIZfL8sl
	7o/ujqfMFAV35rCbPkHrrgY4ZY2v1MS67058REKr9quynoS/g6MwPgilZjleMNIe/Z+LNJBgzOvlE
	R/HWlbf9hzi9wjcnwHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndt2n-008xAX-H9; Mon, 11 Apr 2022 12:21:21 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndt2W-008x49-2j
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 12:21:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id ks6so5836940ejb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RWDiMWfhIWr53FwXEogy4euvp8PAvtGehm8/baIndcM=;
 b=zQpR9VZ+woJvNm5syngZCOBKwr61vOpjGU9a4vz+/8zEiU57r4DunLKIktFy6+XJOY
 rHZC+TmG68NnXuKeXCGRNoJeyGNbsVWhdcjj8WjAsQmCLb4dp9ysubH/dHqKRovadDlE
 x0FujnVPvMz5nyYyxT98DpK2RyMqbKeKIRRCABEm5v7fsb6W1u/w7QXoWMSngRY7jIUU
 /xCqP+AYXVqsQ7sRPyRMuRJ8u3OLMMY2bW9p+5wjBVlXXpB9t3DLN0Q/W6xBPK/3c8rc
 dQwFZ0V/hsyYTs9Gaw8hhxTMrAnzyuZltzbKevnbBsYWBfIwY1tDyOAd1jRHFX4Q5IKY
 qvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RWDiMWfhIWr53FwXEogy4euvp8PAvtGehm8/baIndcM=;
 b=vJru+o9wtUgAjP5vEwU+4G9C0kISH58j1zZLcaxlDS//0OqedCGm6uNZAhx+5DtC3p
 pKkD/hqRrhMCgQejzBvZbLJZLJxLoW9wE0XeTmLY6xcn6BphtcgngFy4r04oWSqSR7Cf
 ITAzgCYMGovhSDKLv9XFNL3UuM6eAF8+FukN3UU5dVFJWa+j7In4vfNCDRZydjVyz4tE
 bx5YU0hR/sm49/9L9bfIqsHrYI6nfdO8gXtiYxdnXuDolAnL2I1q3kTz24OVpCdh7HlR
 zmaGY8z0u84ua3SgsolqZBP8vF0xKCGkHyBWgL4Gz1VM52tJO+xTngdYuKqzZFnNdtn5
 r3IQ==
X-Gm-Message-State: AOAM533PDXfy42k7WCy5Rr9zEEg5qzigFCmqkWt0C5HwekZTz1w4DxtU
 R4If/Vu4uPgGHUMw1qFXBy2VDg==
X-Google-Smtp-Source: ABdhPJzoWPcAyK9l16OvBAmj/RtOilX6prVo8h/I1VXPgagIcmmB9cRqHlnw49UNvIPQhNfGzSvvNA==
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id
 y2-20020a17090668c200b006b49f26c099mr30356381ejr.41.1649679662257; 
 Mon, 11 Apr 2022 05:21:02 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 w6-20020a170906d20600b006ca00cb99e0sm11790596ejz.34.2022.04.11.05.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 05:21:01 -0700 (PDT)
Message-ID: <4513324d-3dba-fd21-2a7f-9f1b9ef535cc@linaro.org>
Date: Mon, 11 Apr 2022 14:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_052104_171924_603EC536 
X-CRM114-Status: GOOD (  10.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/04/2022 12:35, Andy Shevchenko wrote:
> Switch the code to use for_each_gpiochip_node() helper.
> 
> While at it, in order to avoid additional churn in the future,
> switch to fwnode APIs where it makes sense.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c  |  8 +++---
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c |  2 +-
>  drivers/pinctrl/samsung/pinctrl-s3c64xx.c |  4 +--
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 30 +++++++++++------------
>  drivers/pinctrl/samsung/pinctrl-samsung.h |  2 +-
>  5 files changed, 22 insertions(+), 24 deletions(-)
> 


Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
