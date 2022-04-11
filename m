Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DF9C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOIfzoImo5PNSmrXtK02M7VGb+dYVZ3VM8Rf/voIlPw=; b=E1D6GQ2BbE6UNv
	MinKOdS4qxWDg3gwWnkMtMqJ7WEJI+eO6AWDnrd9qUqd5JjsHI0gORpbn8gwBiAWQaZe4XWBe+CUy
	WOMI5JioRvX0floRyHbyjWSEG6Zu+qVA953GxhYkwpsQwpL+iuw7rt2Y2fWIvTVpUst9HO2Ez1Iw4
	co+HirUnvV/5g9swyZuOHBzB6Ca5cSbUtAX/g7q1vmqCod3GL6cCU2aGosKLLFkdvUFdNeU8fqJch
	fqtNYujljwJTYaA2srPtHFgijlqWDdgaSxpkGnYrlDG7e6OQGNs0ypzmYG5l+48j61jjULO6oP5/j
	BMz8PynAeXF5GFcI+1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndslT-008qQo-R7; Mon, 11 Apr 2022 12:03:27 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndslQ-008qNL-57
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 12:03:25 +0000
Received: by mail-ed1-x531.google.com with SMTP id b24so18049836edu.10
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 05:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sryDvYgEFOGv4IJF4K9rpE4qtbHpyGvRB0BObkRxaW8=;
 b=ZeuqxHL/xUOhw5sAPzbxJiW+mJhv3tLnVd1zttqHoikIexQgEMDzM+4xsDCWR2apar
 oI7AhLc2by1lLL6ho7hSn8JKR0sJPmgqjVyY6s4nvpRusOCaM6VuF8awJGJy5DwRtODF
 aHOKshJCRPSvu3Rw3gD5QAC2273wgiNYnNUnXFnSIlgev7KYQOMwOhwS20E+aF/Z2FHW
 egUy+D/7mLCVl6M3fTm2PM15/ePGufZF1kt8lTTt20B25HTcm7jCI6sZhOiteX40Nqpk
 UdJMYBTyZ78iouZsh8cblU2innmiGIr3OJGCPQwRU9bLivSpl2avqwiu5C6YQ7aBxsqb
 afIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sryDvYgEFOGv4IJF4K9rpE4qtbHpyGvRB0BObkRxaW8=;
 b=v/DTrad2KAd4ytg9ofGnLu5tDmpxE8VkO/Yy4/A9XjKmcUjBnuRJMJ5B5PLqQcu/RE
 s0Bxx/VpuqtnWbyMbV0cPr/pZVPtSQnVli0G54HTZJ3ZzfWymadV2sx6jj8MYAaBoM/B
 UaMFCuIyqCiMagpzDqbgJdKjRHdH2G4rqD5uGmQgHtCjIjJWJxocFr6HJsw4n8G1YgcS
 zXv/i4NX4QAdW14QgVpHMpGqgS+K1j/C8RBKNvI48pjIfh+35minPXzFaf4EztgEcFO8
 cGwcLcqjdcjVaqixJSMlVmG+TMyCBtetZ3l3SWQpFLiFulq/YNzoEOFROHHIaSFUi/qS
 FZUQ==
X-Gm-Message-State: AOAM530c1NVEJAQ2QIXpvjPcCTMTTF+v59/JZ0ygUrIKKO+a51U+QrXE
 BbTapxEvY12UmOX7HM/xVn1WHA==
X-Google-Smtp-Source: ABdhPJwfxX3gqy6wbrPbt0StZfR/zFoOxk9BdsKT3mp55beZn2LBapIU+Ud3zwIytSzkgcRx+Htamg==
X-Received: by 2002:a05:6402:1941:b0:413:2b7e:676e with SMTP id
 f1-20020a056402194100b004132b7e676emr33445108edz.114.1649678600506; 
 Mon, 11 Apr 2022 05:03:20 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 vz13-20020a17090704cd00b006e86ff07609sm2854334ejb.33.2022.04.11.05.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 05:03:19 -0700 (PDT)
Message-ID: <9e168479-9fcd-d3ea-3c06-8d186e53a18b@linaro.org>
Date: Mon, 11 Apr 2022 14:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
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
 <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
 <YlBXSVyj88CqjGj4@smile.fi.intel.com>
 <3b527700-444e-1f6e-fee1-5cd6ed2ef7f9@linaro.org>
 <YlQXZ3Ye13rObMy8@smile.fi.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YlQXZ3Ye13rObMy8@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_050324_289319_384E2033 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

On 11/04/2022 13:56, Andy Shevchenko wrote:
>>
>> Makes this change smaller so it's easier to review.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/log/?h=review-andy
> 
> That's how it looks like. Tell me if it is what you have had in mind.

Yes, thanks.


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
