Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5141C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Dec 2021 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvk4AIdsQtSePHTYrXvqdnSf8QbyM8JVLRy6uOuPYUk=; b=VUpIiudjOWmmUz
	qeuDALvmmqU+dp1ecWGAhpuwDUGmSAtichGgdlkHuxtjVbsHps/BkOK1+z33fqp0zCEVndpNcn2um
	INlzwsLTOkXE4c92zVXAiKRIDdQfHRDnL93lcAthY6CRhGM8GDn///30+UccKcsEuz47iDui1PNST
	BB2n+9205FZ9Zz/eieZlYkbB3Uw6B1qzLy4tCO1DvDVM+nfiNrb6Fy1M8279rxrU+MWv/tF8e3Swz
	mReRfDt3Wax7ri+SiBqudTCaYpsxO7dEBBs9fcqUjXRYJFw5StFUjjuBZKOGzr06Pumfs+AsuT64p
	uyF7eqa1PAzJ7Jh6G/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxn5U-004TW8-R6; Thu, 16 Dec 2021 09:30:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmxs-004PrR-Uf
 for linux-amlogic@lists.infradead.org; Thu, 16 Dec 2021 09:22:19 +0000
Received: by mail-wr1-x42e.google.com with SMTP id i22so13156665wrb.13
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Dec 2021 01:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=IBIcLZSOy80V1yBzhtcSFcqDD4kkSdfp+gTS9zZBVCk=;
 b=XPwMjjS896rF3wTPgiL4/7AJY56mYN+5vaZ7vvkRsi2Dz9xjnSF+kNAjfDHlE7mEqm
 nICcYZUXRCzHjg3Ahnfu7YadMbpn5UKx87+NRxJCUPOMCudu9t4jlvALU2yP8+kvMNDC
 6aBRg8UkobFS6YwtcnwZItuubVAlYOlLIH4AbYOtQ1fR5PCTzYfMSmRHPw4qkF4cwnCH
 IJZXrBcCXmVwAmNQZlza5H8bm14GZJBK4Q9PyjHo4FiBYTebUPGjY2/3TvVegtgzEO3V
 DY8MLaUdZNqKaP++ZeyWNBG7Gg9ip1GfqMlscvGxWJq33oli0ljkfY+DDuGxaZCNQSHZ
 60qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=IBIcLZSOy80V1yBzhtcSFcqDD4kkSdfp+gTS9zZBVCk=;
 b=trOCuAcuLN13X3JZ1miqXKfXDSfN1CwwFuvwp2fN/h60SPo2OwC+Mhbi+tAgEUEDlI
 lJJyn7ng32dlbAkyTYr9w2VYKHLEjeezaTxapayddheAeM/ezrzHKJ/EDoAznYCjuIpd
 p6c4hCfD1PyRO6SyJ/AbMaaSq5gxF2JJc7ZCjmlFR8RhfOdiR2mMZJz0mYDqgrgFXdKL
 bqY0oJnQ/W0hgZNKKfMaIb+yvrfosn4C29cnZmS8+He47GhOAq/1GhIBRZPCXHrcBdqR
 CmFPbshFjLv8+9QBaKFrdFGdQh4+3EuVqwReY76l0mJTVAjbcnkMvrTMSk24KqNyx4O+
 11bA==
X-Gm-Message-State: AOAM5334fxYCrg1QUEvjuCAAhNYGavsCINTxh7R1B4w+bWotK0HzvfPh
 fSH42SLPhBLq3lEP5V2KchuCNg==
X-Google-Smtp-Source: ABdhPJxSnTquNq6JwmPv+bXWcRlBCk+Bimb5jSizbS7N5/Rsoe683qozx8WpAu0ZU+/nhDp/7JIxlA==
X-Received: by 2002:a05:6000:118a:: with SMTP id
 g10mr7702290wrx.533.1639646534830; 
 Thu, 16 Dec 2021 01:22:14 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c11sm738335wmq.48.2021.12.16.01.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 01:22:14 -0800 (PST)
References: <20211214022100.14841-1-qianggui.song@amlogic.com>
 <20211214022100.14841-4-qianggui.song@amlogic.com>
 <1j35mv31c1.fsf@starbuckisacylon.baylibre.com>
 <0a3efa6f-f048-ee04-a2d6-30f337f3d484@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: "qianggui.song" <Qianggui.Song@amlogic.com>, Linus Walleij
 <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
Date: Thu, 16 Dec 2021 10:20:54 +0100
In-reply-to: <0a3efa6f-f048-ee04-a2d6-30f337f3d484@amlogic.com>
Message-ID: <1jczlwaoqj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_012217_084539_28548311 
X-CRM114-Status: GOOD (  11.71  )
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


On Thu 16 Dec 2021 at 14:07, qianggui.song <Qianggui.Song@amlogic.com> wrote:

>>> +static const unsigned int clk12_24_pins[]		= { GPIOD_10 };
>>> +static const unsigned int pwm_g_hiz_pins[]		= { GPIOD_11 };
>>> +
>> [...]
>> 
>>> +
>>> +static const char * const tdm_groups[] = {
>>> +	"tdm_d2_c", "tdm_d3_c", "tdm_fs1_c", "tdm_d4_c", "tdm_d5_c",
>>> +	"tdm_fs1_d", "tdm_d4_d", "tdm_d3_d", "tdm_d2_d", "tdm_sclk1_d",
>>> +	"tdm_sclk1_h", "tdm_fs1_h", "tdm_d2_h", "tdm_d3_h", "tdm_d4_h",
>>> +	"tdm_d1", "tdm_d0", "tdm_fs0", "tdm_sclk0", "tdm_fs2", "tdm_sclk2",
>>> +	"tdm_d4_z", "tdm_d5_z", "tdm_d6", "tdm_d7"
>>> +};
>> On previous chip, there were pin assigned to tdm A, B or C.
>> On this generation, it seems you have added a second level on pinmuxing
>> to re-route the audio pins to different controllers
>> In such case, I don't think they belong in the same group.
>> Depending on settins, D2 and D3 could be unrelated
>> I think each audio pin should have its own group (one group for D3, one
>> D4, etc ...)
>> 
> According to our audio colleague, on this chip, tdm A/B/C can choose which
> pins are routed to their controllers freely by writing special registers,
> say, tdm_d2_c can be assigned to any of tdm a, b and c by demand, so no
> need to specify a/b/c words any more.

That's basically my comment above. Comment still stands
Each D and FS pin could be related to different interface and should be
in different groups


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
