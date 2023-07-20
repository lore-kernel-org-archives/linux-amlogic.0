Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EB9EB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jul 2023 19:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZu5STz1dYf5UhzopKzhh/1qmmSysmOy/X2LwOHUgK8=; b=PBWH7kYz2LNAl0
	XeQQsQtIUwBbofHca3N2mYuPuNMGRHR+E0EABoWcwV+7wRzpzTaD6yhgKIEL3pByHew52HkJ9MNrF
	D9v8bV91BrE+C41zEFB3qMyR+l1edgny3nctgjENmZvC7h0NTkFZUvVCAuF+2IWe3ybPtjnimkICe
	corU9272E2+dlCdLC14lW/729z4+J1BvHH7RdrfQ3n/3N2l5So7OT8x+EY+lgRl7wNuHPqgi9yO5t
	SdO/LzA3Ntl6J2J3eGWFN8KcYkoi/BwQpNaxhLWT4tTCYHAay3MBMx/uJ6LiSdpNwR38rA5APm6EU
	JJjsktPuwLrvdQgUUqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZXm-00C5Eq-2U;
	Thu, 20 Jul 2023 19:42:34 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZXi-00C5By-0e
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Jul 2023 19:42:32 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-cc7863e7b82so1066762276.0
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Jul 2023 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689882143; x=1690486943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uboV9zE5viSPMUN9jRcO0cjpaJKLGwKotI/bN04OyY=;
        b=Is+h2NeaSzJfFfsZ98ro8BWc2npdTi8/mAPrWVvtpsxb716Whq2DsR1nkUJ5zX14Xz
         79qaflwC3BG2VYXCeK0ijBZtmZDQ1AwFmwaxjZDd/vn/AKdit/VHpHHNt7ZvyrLIlMK1
         rAvvaKIi1pdCGIE6T6PamxnnJ1xdepfGuegPYvjWZ/2v5uqSbyOmvOqKrH1HZMZxxQ9u
         TipBUYHRAcaq7G2V/lDcSoviQy3dB4LjRa8c+TMTdx5eHkXHMxyv/6aRPA0MgnDthZDb
         /qNXdFoMB9q33L3QYVfMXu7JSq0qiwBR5arRe8VeAjZhX1/RRVS46BZipMLM8QxKUS/8
         /7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689882143; x=1690486943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uboV9zE5viSPMUN9jRcO0cjpaJKLGwKotI/bN04OyY=;
        b=H0pWFywmS0ghFt3fCJHId0vtYNPmAzYhNKdjobGY8v3Om6f0wz+pWdM7Mi8aXgwmPS
         u1NsN51/Btxx/KRVosOWSJ1Ek3F0a8EzeHQVEGH6ZWkzkjVuarX8vHqiVRwUStGqGby7
         4ysBM+GWZ1VePY2MyHRqTV0k5Oil4VtoUI/x+nisuvLgan50cmWIEUZjrCtz64t7HgEK
         lSh/7p3pQ4S5cstC1sa5D1CVu5KiK3rAG3oGMCV1B4SvXDcGoHiRdLvVXFLaStCzPTG9
         uEt3rXPkoSyFU0Zj7coeAnNocaQH0tWmUkuxl8Cku0uxwXGbq6yXkpCuJp6aQ9CkJX14
         mHYA==
X-Gm-Message-State: ABy/qLbTcZOyIXPbQj7HIh7zRkonKucWHtOdAjCRKU4nyxRPyzJe9+9X
	bv/fC1ul4Ru77f26v5JwToRymWFLZA8wdstWLKouhA==
X-Google-Smtp-Source: APBJJlE7cBabIqsDgOVse9OOZ6aTjmPoq/DJCfwfg6nCOEVEXRqRJUSYnSIJLuoYJ0UvKAptp1crbwCoFVPdkqeY7hY=
X-Received: by 2002:a25:c50b:0:b0:cdd:6635:a1f8 with SMTP id
 v11-20020a25c50b000000b00cdd6635a1f8mr5819173ybe.15.1689882143201; Thu, 20
 Jul 2023 12:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Jul 2023 21:42:12 +0200
Message-ID: <CACRpkdYe9b4ZpvYZqkcMq0Jjni_VD_75Zt5oKv4+v9f3pmJbVA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Chester Lin <clin@suse.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chen-Yu Tsai <wens@csie.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-oxnas@groups.io, 
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_124230_274711_5B9ED575 
X-CRM114-Status: GOOD (  12.05  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzo0OeKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgoKPiBUaGUgRFQgb2ZfZGV2aWNlLmggYW5kIG9mX3BsYXRmb3JtLmggZGF0
ZSBiYWNrIHRvIHRoZSBzZXBhcmF0ZQo+IG9mX3BsYXRmb3JtX2J1c190eXBlIGJlZm9yZSBpdCBh
cyBtZXJnZWQgaW50byB0aGUgcmVndWxhciBwbGF0Zm9ybSBidXMuCj4gQXMgcGFydCBvZiB0aGF0
IG1lcmdlIHByZXBwaW5nIEFybSBEVCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ICJ0ZW1w
b3JhcmlseSIgaW5jbHVkZSBlYWNoIG90aGVyLiBUaGV5IGFsc28gaW5jbHVkZSBwbGF0Zm9ybV9k
ZXZpY2UuaAo+IGFuZCBvZi5oLiBBcyBhIHJlc3VsdCwgdGhlcmUncyBhIHByZXR0eSBtdWNoIHJh
bmRvbSBtaXggb2YgdGhvc2UgaW5jbHVkZQo+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJl
ZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiByZXBsYWNlIHRoZSBp
bXBsaWNpdCBpbmNsdWRlcyB3aXRoIHN0cnVjdCBkZWNsYXJhdGlvbnMsIHVzZXJzIG5lZWQgdG8K
PiBleHBsaWNpdGx5IGluY2x1ZGUgdGhlIGNvcnJlY3QgaW5jbHVkZXMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKSXQgc3RpbGwgYXBwbGllZCBjbGVh
bmx5IHNvIEkganVzdCBhcHBsaWVkIGl0LgoKVGhhbmtzIGZvciBhdHRlbnRpb24gdG8gZGV0YWls
LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
