Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3829C27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyEu6ZF7NMVx6GoJvotBmRSTJPlhEvxj1nanUjLT9tI=; b=YDxrdhOJ4KrZMq
	2ONl6znpYMkD5kssNsCo8E7/bNVXSRhx4jI8CSpffKrSKs86drvYScq1SKlc7T9mfsjmbfA1uhFrC
	R1HCFoUXl3dweXJ5Hna1uaFYhsB2Yae1AcU3DbhXkZdgPZ+iSLBTQFNrroCp5qbDExSXil+IEq22W
	22UxSJjAkx2xP7RdgYnnJHY4nl0d3iw8rBGr4rqOSZV3UJlf+PSpmaRMxZTIXczvFZR/f3n1mluii
	fYWgA1MOn+0HUjNErTl8PhTqrJQEcDxs5mi+bGUX0jnot+enKQYxAS4vkoKLB4xiUQeoWIe0a3knA
	HOmEmz26WkNfGU2dgmmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Xl-00000002GVT-3nqm;
	Fri, 14 Jun 2024 09:48:25 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3WR-00000002FPW-27FO
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 09:47:09 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a6f3efa1cc7so522584566b.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358422; x=1718963222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xst6Q4HKXSHpj0dsrGI7SNIM5Xkm2Oh1h9QPylE4GLY=;
        b=IE0fk/Rscr/ztf+qah4EYIf4OwmX4BBljh41gNbC3y5o/9AIe3XN4xrtaFE7VI7uEC
         JdMyB8WfKkbklf4OmC2RbYOaUmNteYWnGxdzTLfHXxbI1Stro0HUz+Ee7lk9PSFMzT9i
         FaW75Cke9xsBJAsl2yebVrpITHVHzLTjRBGa2gG+dFKJeZb1dWgCgJY2hDGtzQ/OEBsG
         2abeYGIRSazHSqf7+7B+/8A+bn0OeQTfP4kRKfGhDd7Goe8VNWY+T5GcLztIQFWN26GA
         85chhEDRyIp3GIeD/1YJq9nQLXOrykUAQ3Bt7fRMoVhWuxI69lXBN3qcbLWyWJUY5RtA
         MM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358422; x=1718963222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xst6Q4HKXSHpj0dsrGI7SNIM5Xkm2Oh1h9QPylE4GLY=;
        b=sFgUpNtK43nJiAiqLY0Gor8VpnksAJsV39dWogbN7Q4Yi/jiyYP9+7vHt22w+UCaRy
         vvgCsBYaJRkcfvk2KagJKSfM+4A1ZIPH28vwPJy9mJie3CCIwSDLJHrprRxkS6ztOwrn
         OvjohZ8kMMFNrBL0ZzvE68E4WwrjSBCB363IY4v1cVLR2HwjPo1nfUayo3FJvUPlfoW9
         U6SMkK1TVKVCi0IcsMrVT3axJfXeyEr94J98WPM1RTR/uaNxi7yh/aV9a6MQWHgfs8mH
         G8D8P1JXbF8621K+9VYXWujSRE3QKJoYJBaHc3+CO0ublVhVTitzNWqKyMOyKjkgF1R5
         wakQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgZF7OimeAW5INurwu9uXjI/Xmxjv8Oc8WsyjULLWwTIPKCtsoKs9ViD4xCTXV5xSveVoe5iPMF8X9pVIzRPCXWwCG5WFWW3h8HO38Ow0yMdk=
X-Gm-Message-State: AOJu0Yzq7s5PZIYTHAGXnAcY1lGZPMbQa67oQjasGk7qJOdYxhJuQh/u
	nQFmwRF71poYoVrMB3FazV/vPpueXmtY1UATaia4up8H+ASDJS7Uipmoap8rwyI=
X-Google-Smtp-Source: AGHT+IGAEOJ8/Eq/DXhbXLqPscGRVDNmR6uXpGnxSfm7LmH1ErumRz9nwzEhow0zGr3WMGsUdb3qBQ==
X-Received: by 2002:a17:906:9c8d:b0:a6f:6b3b:d034 with SMTP id a640c23a62f3a-a6f6b3bd16emr35934466b.2.1718358421943;
        Fri, 14 Jun 2024 02:47:01 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:12 +0200
Subject: [PATCH 13/22] dt-bindings: thermal: rcar-gen3: reference
 thermal-sensor schema
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-13-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rpuNS2iyU2OY1Fsid3Kqc5QDO3n5JBWLxF/W1R0sPwI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFrkuJnoT5D7TUdkG7FcAVQbX/5GndtGQlj5
 3lpE+6QYFOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRawAKCRDBN2bmhouD
 1wzaD/0Tab4yh0LCsewgEaD/ET5KJN+2kKHthAr0z6S2A5kFlUNqTxe/e3Uj3hNmO5eXvlrViui
 2Y33IWyT190pg/BJizhRchR4cjGkup51OgbLSjJsTpTO+NVC67xRxXuZvm8KHPIqk1d5AUnuorz
 QQ0E8O9UI9GpZ1WtXnrKVhLIGnwrCTPiyVXaKZMmTGW2TPFNtV6AUHJ62pISBPvJu23hhlgWtK/
 brvgzh2e5JMfwDvzg3u9O6SkCqZL7h8VXiRA/ooujXQSJztMxQT6BChRZUvlxwoQzz6VG1kwMeA
 ooj7ACmcdZUwXi3Npgv1akW45aLKyDmC2D5n5+FpK8hi9CJBi1MZTIPXVlx0sYRD21Q7imj5uWM
 wK4okjnLJTCj98w5UUxpfNA8fqeVtag4Ybsu9ia5cTqR1RnyvfdPy5IThulporCW9NI5x5pTmOq
 4I+4ovx5uBLQL1VlN/1q8EP33MfumMbiiD6mL/YUoYOP81xTmhd24ZbHIgN4qzMdKDEKnaM0AhL
 9/B0GekVy0UOV84c5RE2n7KhDCexOSXM4ehaOgKYGcDeQfE9DEJc9PjsIvo91q5PfU3MRzsq6eH
 BekBHTSU0IWtc66yGmQuQ9VSYgTr/NrkM0gfmAoDoECvtGGhESPKKe5TDQlhGjaOfh03wP3IpPV
 V43AIzP/kZdGwxg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_024703_843926_FC07819F 
X-CRM114-Status: UNSURE (   9.93  )
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

RGV2aWNlIGlzIGEgdGhlcm1hbCBzZW5zb3IgYW5kIGl0IHJlcXVpcmVzICcjdGhlcm1hbC1zZW5z
b3ItY2VsbHMnLCBzbwpyZWZlcmVuY2UgdGhlIHRoZXJtYWwtc2Vuc29yLnlhbWwgdG8gc2ltcGxp
ZnkgaXQgYW5kIGJyaW5nIHRoZQpjb21tb24gZGVmaW5pdGlvbiBvZiAnI3RoZXJtYWwtc2Vuc29y
LWNlbGxzJyBwcm9wZXJ0eS4KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdGhlcm1hbC9yY2FyLWdlbjMtdGhlcm1hbC55YW1sIHwgNSArKystLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9yY2FyLWdlbjMtdGhl
cm1hbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvcmNh
ci1nZW4zLXRoZXJtYWwueWFtbAppbmRleCA2YTgxY2I2ZTExYmMuLmQ5MmU4ODJjOWU4ZCAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvcmNhci1n
ZW4zLXRoZXJtYWwueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dGhlcm1hbC9yY2FyLWdlbjMtdGhlcm1hbC55YW1sCkBAIC0xNSw2ICsxNSw4IEBAIGRlc2NyaXB0
aW9uOgogbWFpbnRhaW5lcnM6CiAgIC0gTmlrbGFzIFPDtmRlcmx1bmQgPG5pa2xhcy5zb2Rlcmx1
bmRAcmFnbmF0ZWNoLnNlPgogCiskcmVmOiB0aGVybWFsLXNlbnNvci55YW1sIworCiBwcm9wZXJ0
aWVzOgogICBjb21wYXRpYmxlOgogICAgIGVudW06CkBAIC01Nyw3ICs1OSw2IEBAIHJlcXVpcmVk
OgogICAtIGNsb2NrcwogICAtIHBvd2VyLWRvbWFpbnMKICAgLSByZXNldHMKLSAgLSAiI3RoZXJt
YWwtc2Vuc29yLWNlbGxzIgogCiBpZjoKICAgcHJvcGVydGllczoKQEAgLTk2LDcgKzk3LDcgQEAg
ZWxzZToKICAgICByZXF1aXJlZDoKICAgICAgIC0gaW50ZXJydXB0cwogCi1hZGRpdGlvbmFsUHJv
cGVydGllczogZmFsc2UKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKIAogZXhhbXBsZXM6
CiAgIC0gfAoKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
