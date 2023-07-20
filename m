Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A0AEB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jul 2023 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLrArpDNfBDTWa+wOKDSDlNMnnMyHhvnlhzEVw05jP4=; b=HJEJ1O6F5xV3HB
	VNyv9GPvf1viboaZ3a31GVLXi7z31DB/UVJjHV/e3S3O6FJz7aIn2OigloIIBwc33Jv4Zpdn124LQ
	9f27hNL26LgZY/rXTR+K/5w6dq1rLZhXztcf1/ISXfMsk2QzTRojDAQWIAomKQhxAjIdw8kWcwvoS
	YO5GFsMRtBFo/5RONLQiEoeOIC60FsuiOmdFZbZDYr2SE6LM19f9vw74jUm3UW0AwzARhG1uBaBcq
	Wd4o7qoIny31oa78VecMvnmcwh9h1SzdM2+baNkYaIXdP4ReBC6ifRe/CCKPGWkhqaSDLIsFEkXcq
	PgY1/DQMKSCsWzdvDDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYjT-00BwVx-0Z;
	Thu, 20 Jul 2023 18:50:35 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYjQ-00BwU3-2o;
	Thu, 20 Jul 2023 18:50:34 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-94ea38c90ccso34166166b.1;
        Thu, 20 Jul 2023 11:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689879029; x=1690483829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ri7fimkcHumz6u7/WZYeGYX85HXnNnQ+B/CYo4XrX0=;
        b=BuHxm6Tf0fTwMGnX4aV1eLKpeDBOXtQDZQHBBmuIydyJB2jD0TRAJqpXGVl6pQ0KcJ
         kmwpzIoWwDst1AN2kFV1VI/Rb3p8I2YkQ2UlgJch3rRnf2j37I3hnA9z+Ks0NTkt1ery
         0cmkra6EiFujQgOSwBI+H1euh0SOC+DyiMUByfO/SybJlsaQf6HMF/nPRyZSmfxeUfsV
         +BbCm4iRjGXx9BYQx6jq6+FgblL/Yxrs+HHngxQOvp5Q6+ZMGZMCMdt+7sijZ92NPJv8
         mp9gx+Nc53A7tJgzKMmkmsYSaGy+zm1/F8RketKEBe804GlPm6LaNWeXXI3A6UYckmRG
         PQ9w==
X-Gm-Message-State: ABy/qLaTA7kZQrmdlfYoFF8H4TK6WDlPgmlg7aW6mngidjo5L2KAANF1
	To+Qd93Ih6TqNRilbRppocft7Txb2C3pKJT9buQ=
X-Google-Smtp-Source: APBJJlHi91lqNeNV5b3NsqRozieOcqVx3nEK9H5IGaNOQgSl+w6cuVzQPslNMDSGV1xCPVo92lepZZT6y5Duc+GvbWI=
X-Received: by 2002:a17:906:7a11:b0:993:d90e:3101 with SMTP id
 d17-20020a1709067a1100b00993d90e3101mr2893837ejo.1.1689879029584; Thu, 20 Jul
 2023 11:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org> <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
 <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 20 Jul 2023 20:50:18 +0200
Message-ID: <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
Subject: Re: [PATCH] thermal: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Guillaume La Roque <glaroque@baylibre.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
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
X-CRM114-CacheID: sfid-20230720_115032_911957_57E75F94 
X-CRM114-Status: GOOD (  14.16  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgOTo1M+KAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTI6NTTigK9QTSBSYWZh
ZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwg
SnVsIDE0LCAyMDIzIGF0IDc6NTHigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4KPiA+ID4gVGhlIERUIG9mX2RldmljZS5oIGFuZCBvZl9wbGF0Zm9ybS5oIGRh
dGUgYmFjayB0byB0aGUgc2VwYXJhdGUKPiA+ID4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3Jl
IGl0IGFzIG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KPiA+ID4gQXMgcGFy
dCBvZiB0aGF0IG1lcmdlIHByZXBwaW5nIEFybSBEVCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhl
eQo+ID4gPiAidGVtcG9yYXJpbHkiIGluY2x1ZGUgZWFjaCBvdGhlci4gVGhleSBhbHNvIGluY2x1
ZGUgcGxhdGZvcm1fZGV2aWNlLmgKPiA+ID4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVyZSdz
IGEgcHJldHR5IG11Y2ggcmFuZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gPiA+IGZpbGVzIHVz
ZWQgdGhyb3VnaG91dCB0aGUgdHJlZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVy
cyBhbmQKPiA+ID4gcmVwbGFjZSB0aGUgaW1wbGljaXQgaW5jbHVkZXMgd2l0aCBzdHJ1Y3QgZGVj
bGFyYXRpb25zLCB1c2VycyBuZWVkIHRvCj4gPiA+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29y
cmVjdCBpbmNsdWRlcy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KPiA+Cj4gPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPgo+ID4KPiA+IG9yIHBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ugd2FudCBt
ZSB0byBwaWNrIHRoaXMgdXAuCj4KPiBTaW5nbGUgcGF0Y2ggaW4geW91ciBzdWJzeXN0ZW0gd2l0
aCBubyBkZXBlbmRlbmNpZXMuIFBsZWFzZSBwaWNrIGl0IHVwLgoKRG9uZSwgdGhhbmtzIQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
