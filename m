Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7CCC30658
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2024 21:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vr0IVIIElxOZlLQRj8LMuPqvYe//zai0j5h3G0Nbbb8=; b=ebWc9aCJteba8r
	aq9zIp9yl9DLDDNXk/lm15Z29TUHJax7MG8XCGYRmYZ4pZ8YjX2db4N2sOqxwcQ7nLl2pOJEP2Eiy
	GYedSBv/J6q9G6RRouyaSNT3cvj3QxDRXWmdagknJKuvgtRKekZTtbICGx/WLMrruR+m9CJpuobgO
	e/blunMBOO3SbUMv8kHAhOxzTZvg/Sllcc9i5+kH98mUW0qXC7yxkTJHiKwEkRvEaYKm4WRrep1Rf
	PzIbljNcw2FFJwHcgZXZ6n5ElAorJEo67GMk+r6AO5bner/DniGR3wmtpxNUX+p10/nfGsno3pH8c
	xqubHVKBojPGFPybr3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOkhk-00000007yRv-3tmk;
	Tue, 02 Jul 2024 21:06:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOkhg-00000007yPj-48US
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jul 2024 21:06:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A92161E1F
	for <linux-amlogic@lists.infradead.org>; Tue,  2 Jul 2024 21:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D757C4AF07
	for <linux-amlogic@lists.infradead.org>; Tue,  2 Jul 2024 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719954379;
	bh=NyzwM0fsXKf4dXOAJKkuMhvtpscp3UAXzQ88ePFkdHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T0jF5n0XmYOBWCFsIhEiFwCW709AF2iNAJBXPHQDhZ3ouUIflhHJtwIPSeAQkemwl
	 uvh5nDRj8MsScENuyxikrGs7trBmvGpceQ90A9jThyM6OwHTK1hSB47GteIED0mkfp
	 yIXfQgx1XVTTfS14P6B441+5oNJT53fpMKqRINxMzkGSKAywbiMtggfLmF/5MhXRyE
	 MR2OEIi2KWdc0w+AofhLDxqqtYNvgWMUcCMzmTV90XllmcI+M2rs3uGRjmGpiIo+bY
	 S7E4wTeW1JLVmvZdlftDTuGLXlMEsznlapdBUQq2P/lZic0fAeIbHo/yvEPyuqkLW8
	 0fIXzDl9OJV+g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cd8897c73so5387316e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Jul 2024 14:06:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsUUPiTjwCeGp86ngWAsbdlSgL3gcBYFbgwSBI8bZyxpR/ztgOYZp5N4ieTrCWEHs3nJBpfVjsHi+xzeTcDS4ezXsWGRp3CIz4aj0wWPcW6TI=
X-Gm-Message-State: AOJu0YzT+nvZi76kPjmyV2XrAiJXpmK5dbjwnREvTxK0N1OjmNwN/wui
	bqJeipuqc+Y7cK1yb82v2Q/NH44MpqmbMOvSCTbhKgF4WsROBGO03/upfHWiS0rU23aAN+LpweA
	RQEOl5bguTAWTlzSiXzYofOxd9Yv+ralyrUby7Q==
X-Google-Smtp-Source: AGHT+IGUxDpnfmOI+j4i7sET5B6iGTwPCxoZxCFPXJYFFkWMGwCKQTKuc3id2P0lUND+5DiDyxhNNJ4MNomLGxiA7Lo=
X-Received: by 2002:a17:906:f185:b0:a72:b1b1:eb3a with SMTP id
 a640c23a62f3a-a751447b093mr634755766b.19.1719954357446; Tue, 02 Jul 2024
 14:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org> <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
From: Amit Kucheria <amitk@kernel.org>
Date: Wed, 3 Jul 2024 02:35:45 +0530
X-Gmail-Original-Message-ID: <CAHLCerMuG92Sf8+BdqPLqh+x3YxBjD6YdYF2k+AxQcwCqerxzw@mail.gmail.com>
Message-ID: <CAHLCerMuG92Sf8+BdqPLqh+x3YxBjD6YdYF2k+AxQcwCqerxzw@mail.gmail.com>
Subject: Re: [PATCH 11/22] dt-bindings: thermal: qcom-tsens: reference
 thermal-sensor schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	zhanghongchen <zhanghongchen@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_140621_133175_C7EC23AF 
X-CRM114-Status: GOOD (  17.29  )
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

T24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgMzoxN+KAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBEZXZpY2UgaXMgYSB0aGVy
bWFsIHNlbnNvciBhbmQgaXQgcmVxdWlyZXMgJyN0aGVybWFsLXNlbnNvci1jZWxscycsIHNvCj4g
cmVmZXJlbmNlIHRoZSB0aGVybWFsLXNlbnNvci55YW1sIHRvIHNpbXBsaWZ5IGl0IGFuZCBicmlu
ZyB0aGUKPiBjb21tb24gZGVmaW5pdGlvbiBvZiAnI3RoZXJtYWwtc2Vuc29yLWNlbGxzJyBwcm9w
ZXJ0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBBbWl0IEt1Y2hlcmlhIDxhbWl0a0Br
ZXJuZWwub3JnPgoKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Ro
ZXJtYWwvcWNvbS10c2Vucy55YW1sIHwgOCArKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3Fjb20tdHNlbnMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3Fjb20tdHNlbnMueWFtbAo+IGluZGV4
IDk5ZDljNTI2YzBiNi4uY2NlNjYyNDIyOGM3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3Fjb20tdHNlbnMueWFtbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3Fjb20tdHNlbnMueWFtbAo+IEBA
IC0yMTcsMTggKzIxNywxNiBAQCBwcm9wZXJ0aWVzOgo+Cj4gICAgIiN0aGVybWFsLXNlbnNvci1j
ZWxscyI6Cj4gICAgICBjb25zdDogMQo+IC0gICAgZGVzY3JpcHRpb246Cj4gLSAgICAgIE51bWJl
ciBvZiBjZWxscyByZXF1aXJlZCB0byB1bmlxdWVseSBpZGVudGlmeSB0aGUgdGhlcm1hbCBzZW5z
b3JzLiBTaW5jZQo+IC0gICAgICB3ZSBoYXZlIG11bHRpcGxlIHNlbnNvcnMgdGhpcyBpcyBzZXQg
dG8gMQo+Cj4gIHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gaW50ZXJydXB0cwo+
ICAgIC0gaW50ZXJydXB0LW5hbWVzCj4gLSAgLSAiI3RoZXJtYWwtc2Vuc29yLWNlbGxzIgo+ICAg
IC0gIiNxY29tLHNlbnNvcnMiCj4KPiAgYWxsT2Y6Cj4gKyAgLSAkcmVmOiB0aGVybWFsLXNlbnNv
ci55YW1sIwo+ICsKPiAgICAtIGlmOgo+ICAgICAgICBwcm9wZXJ0aWVzOgo+ICAgICAgICAgIGNv
bXBhdGlibGU6Cj4gQEAgLTI5Miw3ICsyOTAsNyBAQCBhbGxPZjoKPiAgICAgICAgcmVxdWlyZWQ6
Cj4gICAgICAgICAgLSByZWcKPgo+IC1hZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiArdW5l
dmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+Cj4gIGV4YW1wbGVzOgo+ICAgIC0gfAo+Cj4gLS0K
PiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
