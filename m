Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97F2EB64DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RvUNow7s/HEiUsQY6HcsbzBICVULwxcPi4l3+hTYHA=; b=fl4Is0/VMOdZJ8
	0mGP84Vu1zZpWFFS5wFTWm7p4wwRwFUeRB+w441hyvdNJktI6+YVGKOK5a+q8L2bSuXTVEh8nqTUT
	o2cTNyLfE+8kWUdC8dD1gno/6upF/1h448l/egONTg+LQsVbwG338dBLYJ1jJHGGiuHhf3QiblfiD
	EMfSVYq9b2Nopz+kDeiGmUzPyVN/mp6IqfFVGEQt7gpV8iLWzZESd1BUFNXOwBWDu31qD2ccHQVrB
	ZbBN5ofIPEOxpIP3c9fQ3oHWvcgXuhgGZWVgXkVMCLyKS3JvUde6JLTM+KhG6YN8LLEsIxU2BaZcn
	Y/wNGfFjbJxGPHAhL7gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOqp-0078pO-2b;
	Fri, 14 Jul 2023 19:53:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOqn-0078om-1X;
	Fri, 14 Jul 2023 19:53:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBD8B61DE2;
	Fri, 14 Jul 2023 19:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BB2C433CA;
	Fri, 14 Jul 2023 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689364391;
	bh=DnEjVGiuXfP3swFolvK4a+TN59hjw2gEVcLZQUXBvDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mn87tiPgZ6ilmAUhV977eN8ghu423vnPb3bEQXiueuJFlG6WzckKVMBYgx1XXxNaX
	 uZLBgaozxXIxTjMwwZNV48AJ6IMuBYZoVyzOzjRfheSwy+adVIZ73Ma7GMH/LYoiS8
	 hcOEgR57LDhoIb4QTvPCf/wCVxc3h7Kvt4VD/k4D0c/wK97+sjzu6mr25aZQsYNWl3
	 098AiK51OpiCy2cNMNRiacvZN6BEPN3mg7PfGgRH9OxiHBDW8JTYfTM1FqidsDFTCm
	 d1GulW7sULPhNG45eCQXrmcwpCNJF/mD+Y+rb0JwswPdlZCblEQ5fjs6Gv1LtynJYb
	 iJzdclHBcYkvA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b701dee4bfso36715231fa.0;
        Fri, 14 Jul 2023 12:53:11 -0700 (PDT)
X-Gm-Message-State: ABy/qLZDZTT+g+8XEohGTQ+aARfHqqvwjXkl6pxXAYRhm3PFpL2DlHwg
	k75DLAGNaMwmiIoIBuD0Edd1NE0KwHSjkwpUIA==
X-Google-Smtp-Source: APBJJlFIVq6SSfDGp/7zlzMmel1HUM1zDWT3EoUpkE1rCFI61SUoU0+rrNxJc3PIb6p4Jh4x1E4RyP9tWO4eKUbbP0E=
X-Received: by 2002:a2e:9a8a:0:b0:2b4:765b:f6ee with SMTP id
 p10-20020a2e9a8a000000b002b4765bf6eemr4915096lji.41.1689364389871; Fri, 14
 Jul 2023 12:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org> <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
In-Reply-To: <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Jul 2023 13:52:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
Message-ID: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
Subject: Re: [PATCH] thermal: Explicitly include correct DT includes
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_125313_603796_64E57531 
X-CRM114-Status: GOOD (  13.75  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTI6NTTigK9QTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFm
YWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzo1MeKA
r1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSBEVCBv
Zl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBkYXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4g
PiBvZl9wbGF0Zm9ybV9idXNfdHlwZSBiZWZvcmUgaXQgYXMgbWVyZ2VkIGludG8gdGhlIHJlZ3Vs
YXIgcGxhdGZvcm0gYnVzLgo+ID4gQXMgcGFydCBvZiB0aGF0IG1lcmdlIHByZXBwaW5nIEFybSBE
VCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ID4gInRlbXBvcmFyaWx5IiBpbmNsdWRlIGVh
Y2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2RldmljZS5oCj4gPiBhbmQgb2Yu
aC4gQXMgYSByZXN1bHQsIHRoZXJlJ3MgYSBwcmV0dHkgbXVjaCByYW5kb20gbWl4IG9mIHRob3Nl
IGluY2x1ZGUKPiA+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJlZS4gSW4gb3JkZXIgdG8g
ZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiA+IHJlcGxhY2UgdGhlIGltcGxpY2l0IGluY2x1
ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0bwo+ID4gZXhwbGljaXRs
eSBpbmNsdWRlIHRoZSBjb3JyZWN0IGluY2x1ZGVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4KPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29j
a2kgPHJhZmFlbEBrZXJuZWwub3JnPgo+Cj4gb3IgcGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSB3
YW50IG1lIHRvIHBpY2sgdGhpcyB1cC4KClNpbmdsZSBwYXRjaCBpbiB5b3VyIHN1YnN5c3RlbSB3
aXRoIG5vIGRlcGVuZGVuY2llcy4gUGxlYXNlIHBpY2sgaXQgdXAuCgpSb2IKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
