Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3B7EE49AB
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Aug 2023 22:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9q6IoIj4vLqLe5pf19dGjSPiOudzeEOeuoAsRoShzQ=; b=MY26elJnJMxHqi
	J73WmVXj8uKvlnd5eVZJ2fg7FASndSBZ5KZVLC+fv6ri39kzjzla1qZ9O1zSb9lbII9FxlDe56zvY
	BYOQ3zDV/s9W0elkx3XSGkMb9eKJXpPz/mGxQ9Iuxw2A9HHbUEGtezp+krlX+WahW2ivG9xHptM1b
	3AyW5X9rCy8N/E7ETIHkN69lnU9gYciOAtBHCpek3AbRjPPKbdbKkb0ob+cm8qt6dQdOyLwYRarxW
	McsBAqQIfiLA2/rZLg67pOIwgDPkNQJn/xQJPSAAiqso+Y9aFnTc0JiP8YK25cMTHbyX1vVke1ZE2
	AEwqy7AZGkgZBeAlIlZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYa1V-00Gspa-1Z;
	Tue, 22 Aug 2023 22:38:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYa1T-00Gsp0-1V;
	Tue, 22 Aug 2023 22:38:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB030642C9;
	Tue, 22 Aug 2023 22:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C27C433AD;
	Tue, 22 Aug 2023 22:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692743929;
	bh=U15eYY76gsnD/RHRrRp2WW4I4OCWvlLasJey1YPS3bA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jn4NXR0lfbWYS5Bph9NDsU+CUS6oKPixIBuJYm6y13c3Oey4zsZFxl5LEbilQxJik
	 FeYi4hk81hW93Pito7BlDOIWLAaYnB0RhnPhbkxJtYjIwxdi5/i0pNyJyNN/nCccuI
	 fmY+ssuFxpfa7I30gkLK8YDwU53i5SgxztwwtwOd89uEzAB/wmwwNcI4B7etE38nUX
	 1KT94QzqmI87253Kc52MD6Y8fou1jBGiX1pJkpWJMnTdedMpWf+KZdUDC39Y5QFc9X
	 pamJJqabcmOvoF7HZyud2tyJQOPli0tj7WP4SaXb0FkLx82tm9eotCxnMBwonE7SUu
	 gzqa24AIGrPmA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2bcb89b4767so43873001fa.3;
        Tue, 22 Aug 2023 15:38:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YxdKahgtp8t5Ng4AbjJvSH2sjgplqjR0LOIiXoohvKweTPZCt+F
	n5ppaoW4HGz5UZeSeLa8/wbvfLzE9FmoJtcUIw==
X-Google-Smtp-Source: AGHT+IF0JLsyZnXZQBcgCFuF2kEmLMhxys3SoS78ueuZDPswTtorzz1H8NCRQqi/aO+jact/25/WQ07MKCBccdqUsKI=
X-Received: by 2002:a2e:9919:0:b0:2bb:8d96:6041 with SMTP id
 v25-20020a2e9919000000b002bb8d966041mr7975933lji.45.1692743927592; Tue, 22
 Aug 2023 15:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org> <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
 <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com> <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Aug 2023 17:38:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
Message-ID: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230822_153851_586979_6203C708 
X-CRM114-Status: GOOD (  17.32  )
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMTo1MOKAr1BNIFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZh
ZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAxNCwgMjAyMyBhdCA5OjUz4oCv
UE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBK
dWwgMTQsIDIwMjMgYXQgMTI6NTTigK9QTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIEp1bCAxNCwgMjAyMyBhdCA3OjUx4oCv
UE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBU
aGUgRFQgb2ZfZGV2aWNlLmggYW5kIG9mX3BsYXRmb3JtLmggZGF0ZSBiYWNrIHRvIHRoZSBzZXBh
cmF0ZQo+ID4gPiA+IG9mX3BsYXRmb3JtX2J1c190eXBlIGJlZm9yZSBpdCBhcyBtZXJnZWQgaW50
byB0aGUgcmVndWxhciBwbGF0Zm9ybSBidXMuCj4gPiA+ID4gQXMgcGFydCBvZiB0aGF0IG1lcmdl
IHByZXBwaW5nIEFybSBEVCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ID4gPiA+ICJ0ZW1w
b3JhcmlseSIgaW5jbHVkZSBlYWNoIG90aGVyLiBUaGV5IGFsc28gaW5jbHVkZSBwbGF0Zm9ybV9k
ZXZpY2UuaAo+ID4gPiA+IGFuZCBvZi5oLiBBcyBhIHJlc3VsdCwgdGhlcmUncyBhIHByZXR0eSBt
dWNoIHJhbmRvbSBtaXggb2YgdGhvc2UgaW5jbHVkZQo+ID4gPiA+IGZpbGVzIHVzZWQgdGhyb3Vn
aG91dCB0aGUgdHJlZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiA+
ID4gPiByZXBsYWNlIHRoZSBpbXBsaWNpdCBpbmNsdWRlcyB3aXRoIHN0cnVjdCBkZWNsYXJhdGlv
bnMsIHVzZXJzIG5lZWQgdG8KPiA+ID4gPiBleHBsaWNpdGx5IGluY2x1ZGUgdGhlIGNvcnJlY3Qg
aW5jbHVkZXMuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgo+ID4gPgo+ID4gPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJh
ZmFlbEBrZXJuZWwub3JnPgo+ID4gPgo+ID4gPiBvciBwbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91
IHdhbnQgbWUgdG8gcGljayB0aGlzIHVwLgo+ID4KPiA+IFNpbmdsZSBwYXRjaCBpbiB5b3VyIHN1
YnN5c3RlbSB3aXRoIG5vIGRlcGVuZGVuY2llcy4gUGxlYXNlIHBpY2sgaXQgdXAuCj4KPiBEb25l
LCB0aGFua3MhCgpJJ20gbm90IHNlZWluZyB0aGlzIGluIGxpbnV4LW5leHQuCgpSb2IKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
