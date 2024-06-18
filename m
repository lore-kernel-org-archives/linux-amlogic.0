Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A67C27C4F
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jun 2024 11:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYpFDzWV1RIHYaYsaJfbUO92GWkBDQ8zOKCjP9FwWwk=; b=XB76Yfql/Zv3as
	hBKB7PTx4ZU1cc5Na+BirdUYhwvZVm9IVP+IJEdP91/zjh7XzvSbv3eylpL8TlHW7UIK4Rloyd9DU
	g7YlfGvHYaZg+ElofztbyJlwEcPZEr+REs4YzWCWs8FDwtmStwkcsrGeI6TSLUeFAq0//te1pmK14
	F6Urxxj+D/TzSgOtLlqdv2bfwB9U0QGH1RYfHWLHeTlk+7qaO2+QWhmr/C/GizO6cKH+8sP8Jp+do
	Ta73Y8UbTOdIJUbJtQs+6NLTi64DtsgRrDg5CE0/gTxPpMUBrZTfN3ws7NYpWGPKg9ZI+vkOxyGqR
	Jm+WxWyz3ChUhk6J6EWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWlB-0000000EYNY-19x1;
	Tue, 18 Jun 2024 11:12:21 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWl1-0000000EYII-0ScZ
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Jun 2024 11:12:16 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ebd421a931so50205711fa.1
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Jun 2024 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718709124; x=1719313924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG/iPLr/BAQwM9/XiN9cLBGNZu40KP9nRuNjYsIk9yg=;
        b=qX7BsvrTyaHvCywivfFv45dZSdk3vb62v9QbWaz7+JNy3SbGAeG+jcgZt0i+hFdOWN
         BylXwsiL+WK3B2ZyshfllHS9IbIaZJEtfThFwWs1gynh9RJE+kEXb46oHtMgL8uDQMG2
         btOpFsudLo7JEX5FTb6XI4TiAsGIPOGvfc2X/bPoLoXVtooiwV7h504iE/+6/xMs4Xfk
         vyPqz+1Lo7fr27lr5Mt/ckn0jZeshZg5JMl2blMdH400QEvYVS8b4mXA8eaLEl0VLDBH
         DN0sDpiuKusAyLn16/fXyCN1p4xMogn2PVJ3bNDLCulfr7RUjkP8GsEEqeqyNfBtAcHh
         iw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709124; x=1719313924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QG/iPLr/BAQwM9/XiN9cLBGNZu40KP9nRuNjYsIk9yg=;
        b=JEGs4WxxUznx3n8bRkLQw5bne8Pc7HnoJx3hLKVGF0WovXdXuUZm1Hn764/4gCYLPy
         NjELo819hO3IhWZLXWDAP7ZDBYQ5hbazqw0kn85Ok39XS7dsnqf0LWK1mnHqJFwvuArN
         qEky4MntSqY7EO5+CwwjBJJObu3oxzAgBprVBP9gT6z05s8FmqMMc3tTxmjb7jY7g65D
         z8nkMTJqkjjJn160B8QJ5Z3TnYUfOLRVfCxDy/s6SXVPDaVwbMcKcY6jgw+hZb4bd0sK
         RGc9h8HlPSPtTJsmA1Hbb6jDAhUkWIZVZ8p5ehYtycJFTZiKpKWP9pYueGvw+zm7xp9D
         AArQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMxUZRpcvkH3BWUfG5tyU31jRlHj+OYSKLEDVPOnWALcIUqB2pu+wtX4iwr1+ITpqp22urXTVT/jqFMg7FqPoXRU4bmfJiZ49yZgfGZ450i9M=
X-Gm-Message-State: AOJu0Yw633MRscK6+pc/YIHEiLx3/a8VPr4Hx2nGCSy3MEIQYCjXgbMR
	wWAeXal9KcThYeFK9Vrk6520yqt6BkyXtXUDwT9u97aFgYRxatiPwGVtT5w40BsEtrbYGoNCWcU
	GJVyhNmsebNL0u3WA34Y0MTQdNAK20zXig95tDw==
X-Google-Smtp-Source: AGHT+IHXkf3ljqAhrm9EuvRTPL71FiQZJIgLs0Bh9F/FREvRGl6HEr1C7BhvQe/yk1MwI0e0CuEwwH242Rm+FHCeyyY=
X-Received: by 2002:a05:6512:45c:b0:52c:8289:e890 with SMTP id
 2adb3069b0e04-52ca6e55c92mr8109856e87.4.1718709123676; Tue, 18 Jun 2024
 04:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com> <20240617-review-v3-33-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-33-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:11:52 +0200
Message-ID: <CACRpkdZjPrG4kUBxc+r7NzUt9UZSdiF7KWT6AWAd+vpuLSWk1w@mail.gmail.com>
Subject: Re: [PATCH v3 33/41] iio: magnetometer: ak8974: make use of regmap_set_bits()
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_041213_742242_48157A30 
X-CRM114-Status: UNSURE (   6.97  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMzo1MOKAr1BNIFRyZXZvciBHYW1ibGluIDx0Z2FtYmxp
bkBiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVf
Yml0cygpIGFuZCBwYXNzaW5nIHRoZSBtYXNrIHR3aWNlLCB1c2UKPiByZWdtYXBfc2V0X2JpdHMo
KS4KPgo+IFN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bi
YXlsaWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJh
eWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
