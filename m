Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64404E77199
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2025 20:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sST8vgjJ41fdHH5P3o626cLSW0YRa6uzp/0vQtZxKxc=; b=kQm65HI+EnYDL9
	maji+++OTWVLlTb38inf5CxYEIlqJ23i+s2iyd+TBH1RKzAn8NDf2/z140JmN86k2YmI7rUoEmq9o
	hVC1Gm9E8wGi3x+MkDcoQsQ0x2XIuGyUbMlB4BnKZ8gTKfy6AKikl0IM+LR9degBtoFK0nGvCS+xi
	cgFl3Z3M3MtBHoqRqSS1FZKVhmmrg7SHsEEIRF825PP96nC/dra7cUZ8pDeSWf6Kf1Ao0Q+bxIHQS
	dp4Lgdbm/YfFNg3mhogth3lDkLiD+jz8ASXL5TH9impqDaXEg1Sk8PZVPV7dY4sxkq2jfQELLq+a2
	WEdB2dSXyZHxtBJ1Ycug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVykO-0000000DBY3-12je;
	Thu, 09 Jan 2025 20:03:16 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVykL-0000000DBWS-0QXh;
	Thu, 09 Jan 2025 20:03:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81E65FF802;
	Thu,  9 Jan 2025 20:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736452988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ufquL8MTaCaDartUz08Jv9Co5w4deNYxwsOj/E8fcww=;
	b=aqnMgi8dmXNmdqbb82gZLgfSEWXhFqHsrY4xDCQkXxC1eVbQ/WCgrOzndGV9myrqe/hElG
	jef5H3/ls9gbinUu25fBKeiz2GZiCFulJ+4WhYBhfC45VCcq4EfPtR0KIHfjbcek+Q1VfV
	9wBuydXTJ3vjy+3TBFcHwgj4253G33JMK1TEdzYz0Ww2Ja4TgQmwoyNJWYJWfnKuos+WPd
	cU46FTlgkwEX3NlsLIdW4FYBG1lIgDNygresvTuecEYNDGFWiC7SET7ShqD2glnBctwGq+
	pVYOLHmLiyMp2+38SZucpgCpNOe0nHGnaKhJZh2gFh8WYrNUDI6LJ28dYOimqg==
Date: Thu, 9 Jan 2025 21:03:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vincent Shih <vincent.sunplus@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] rtc: use boolean values with device_init_wakeup()
Message-ID: <173644377117.1019413.12980385173648327961.b4-ty@bootlin.com>
References: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_120313_294918_E2E83611 
X-CRM114-Status: UNSURE (   8.97  )
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

On Tue, 17 Dec 2024 08:13:26 +0100, Wolfram Sang wrote:
> device_init_wakeup() second argument is a bool type. Use proper boolean
> values when calling it to match the type and to produce unambiguous code
> which is easier to understand.
> 
> 

Applied, thanks!

[1/1] rtc: use boolean values with device_init_wakeup()
      https://git.kernel.org/abelloni/c/8c28c4993f11

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
