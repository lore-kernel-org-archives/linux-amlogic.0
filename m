Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15262EE49A0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuywEkXLYbyWh8VJ50PGBBzJYizEohFD+ti8jRD8ncM=; b=zoiFeuhBQSm5Fk
	R6sxhy35l28oO8nV4VBNmv3q9qkyL2xLCPVewm6ctE5ktOsOkLHRlcPk9mtTbTgbwnA7912+mE0EH
	u5Qqhb1MEms1jawstzGvezpUtw6f5CGyhLrut3C2ZONgLvwP8MMtXztFyBPIpyJ3J32sM7Tg0ZKP3
	ttO9hN2vRrBD7oaVtpJy9YgOh9Yi2wnl4DE5o0q0JUHFfMLe2F8FH8MFEFAKNwiN8RyTVzG8Ke5vP
	q+moj5a3yrmq96jYTSyKkdojsdTsieA05fsqV7/vNsPfVBjPZsvbpgye46FBXnAiqHazbHjR9mT+U
	ciSVagQm4P+HykQSf3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYn1n-000YA9-2P;
	Wed, 23 Aug 2023 12:32:03 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYn1k-000Y9W-06;
	Wed, 23 Aug 2023 12:32:01 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-56cae50792fso556704eaf.1;
        Wed, 23 Aug 2023 05:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692793917; x=1693398717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ApOaAU2C11Pn2qOxjg2kIqTJJ7VnWEqUmde/1TenZQ=;
        b=DiFohPbHRTClbJOG+ncFJH5plPzI5WGHSQ1voxBKCxpH7AxSu7oBdWkvsdn1/aOZxe
         kqWjyYnYa+o9+Jrvvk6agEpIRUI26XG2mlYw9DOHEQtVWdxh1l7Md15Y4jSnnaB7b2s9
         QboiFqN1rMQ7f3bb9YQagisMg9egWf7gM4ZKXJxfb0oxmtVIKhU1ZdLlrdkl/4RksU7J
         6kzMqy4xMaBPRLd6aUEAKVUFw6PBj+DE5HaUKX/PoP+iqE1pBOp7RVY21TV9dD3Q9alC
         0JuE2TGkopk4xnxgLxd/S580JJm4JLSnBBQpjvFiMFBuhWaxrQxDf70diP2LL5MRkiFa
         L0Vg==
X-Gm-Message-State: AOJu0YyFQ3nbWbQCZcWAy6gIXyP2rWEZ9kXFmLGngqeS2R3JtGIpjXbM
	KHpLOmJoR3Xu3HOkxLhIs1t1zjtD5Lxw4hUT2Ak=
X-Google-Smtp-Source: AGHT+IHhMwKmKIBwwvi/YmGkSAgu5efCUMytt4QejM22SViosU4j5VAi4fORzp0+24y420UMM8bLIkI7yh9A1hX+wbo=
X-Received: by 2002:a4a:e741:0:b0:56e:94ed:c098 with SMTP id
 n1-20020a4ae741000000b0056e94edc098mr12003584oov.0.1692793917062; Wed, 23 Aug
 2023 05:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org> <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
 <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
 <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com> <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
In-Reply-To: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 23 Aug 2023 14:31:44 +0200
Message-ID: <CAJZ5v0j2psZUYF1gYTK3G=+MdrLOg1QhOxENhSvWbvGcjzLizg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230823_053200_066640_F5F6BE0C 
X-CRM114-Status: GOOD (  17.83  )
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

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgMTI6MzjigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDIwLCAyMDIzIGF0IDE6NTDigK9QTSBSYWZh
ZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwg
SnVsIDE0LCAyMDIzIGF0IDk6NTPigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTI6NTTigK9QTSBSYWZh
ZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4g
T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzo1MeKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBEVCBvZl9kZXZpY2UuaCBhbmQg
b2ZfcGxhdGZvcm0uaCBkYXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4gPiA+ID4gPiBvZl9wbGF0
Zm9ybV9idXNfdHlwZSBiZWZvcmUgaXQgYXMgbWVyZ2VkIGludG8gdGhlIHJlZ3VsYXIgcGxhdGZv
cm0gYnVzLgo+ID4gPiA+ID4gQXMgcGFydCBvZiB0aGF0IG1lcmdlIHByZXBwaW5nIEFybSBEVCBz
dXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ID4gPiA+ID4gInRlbXBvcmFyaWx5IiBpbmNsdWRl
IGVhY2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2RldmljZS5oCj4gPiA+ID4g
PiBhbmQgb2YuaC4gQXMgYSByZXN1bHQsIHRoZXJlJ3MgYSBwcmV0dHkgbXVjaCByYW5kb20gbWl4
IG9mIHRob3NlIGluY2x1ZGUKPiA+ID4gPiA+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJl
ZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiA+ID4gPiA+IHJlcGxh
Y2UgdGhlIGltcGxpY2l0IGluY2x1ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMg
bmVlZCB0bwo+ID4gPiA+ID4gZXhwbGljaXRseSBpbmNsdWRlIHRoZSBjb3JyZWN0IGluY2x1ZGVz
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Cj4gPiA+ID4KPiA+ID4gPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJh
ZmFlbEBrZXJuZWwub3JnPgo+ID4gPiA+Cj4gPiA+ID4gb3IgcGxlYXNlIGxldCBtZSBrbm93IGlm
IHlvdSB3YW50IG1lIHRvIHBpY2sgdGhpcyB1cC4KPiA+ID4KPiA+ID4gU2luZ2xlIHBhdGNoIGlu
IHlvdXIgc3Vic3lzdGVtIHdpdGggbm8gZGVwZW5kZW5jaWVzLiBQbGVhc2UgcGljayBpdCB1cC4K
PiA+Cj4gPiBEb25lLCB0aGFua3MhCj4KPiBJJ20gbm90IHNlZWluZyB0aGlzIGluIGxpbnV4LW5l
eHQuCgpmNmE3NTZlOGZiMTIgdGhlcm1hbDogRXhwbGljaXRseSBpbmNsdWRlIGNvcnJlY3QgRFQg
aW5jbHVkZXMKCkl0J3MgdGhlcmUgaW4gbXkgbGludXgtbmV4dCBicmFuY2ggKGFuZCBpbiBteSB0
aGVybWFsIGJyYW5jaCkgYW5kIGl0CnNob3VsZCBiZSB0aGVyZSBpbiBsaW51eC1uZXh0IHRvby4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
