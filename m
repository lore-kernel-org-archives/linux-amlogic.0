Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA00C27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DOvXDc9XfZccqy7U7eGpGZV7Spx6eg5hC0z3y9N2Ko=; b=qVzV87j0SFXXbJ
	QqYnjAhvOsO5IF7jv65gDKQ+z6T9duhiJvrIcXEf1viJaf1OJ6rVe3Ybn0ene+t+T/zsTKgFWKjaX
	Aut6T8jm4H6FHNGCj096W85OV45BGM7dVA50Zka3pA2t2MIbMG3IVJAMKDitc9nFpCSUQeWnHOOQh
	UQypauBfzJj/W85TRIzZeONT+9qbaMuYZih4GS05qp6b0HlnFLGdVICj+2F7hd7bT0Yxq/TSrDvJf
	o9R67AAENUFRiPc7oye/Gz9TpgPTtPN9TN4ZeO8raJenTAj2fJCMEOh3nrM64b/+azNp8V1VsPUSM
	gC+Qr4qivUKC+y/3z8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3X9-00000002G26-347M;
	Fri, 14 Jun 2024 09:47:47 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3WF-00000002FFQ-2oE5
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 09:46:54 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a6e43dad8ecso360889966b.1
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358410; x=1718963210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3IU7+TXLvfDkHuXEh0I9tjkuQWX38Z7PszEGMh/894=;
        b=gVwujhCm2wTK8ONHQAFiqgv4+pyd5q2Y8jP8sF4zLoO+nwgBH6HBmM35TtAXxxtg1Y
         DOoUCWx4qRo0fKOXSpjyTdVlCy1SxEx6MZ0czpEz3hrm4ARaoi/f9vCgXCdHodVexP4F
         miZX3k2z9DvePhxE9PJuQxPdLo6VZMa6oxsA0NfSnlTa43imIvae9vGRdZZ6ylEjFNqY
         +qPsrHD3EbZ0rkUKiw0nHR/C1UaXaKTjIAgZgsRmd1lKr3W5rbEDL+tmhvI3eZ3hzQic
         fKm993wKGKCUMPzKt76SMI/yZ+mrRdY8JXWzlzLte2KD7iSUOndNqep5yqzgh6MASRt6
         lydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358410; x=1718963210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3IU7+TXLvfDkHuXEh0I9tjkuQWX38Z7PszEGMh/894=;
        b=tu4j9ZHu9+F+H4BGdqFkIMK8TangY06MwY2U6/ApWxMidAmWJ9+qYnUbQN6dmrE6/J
         AJ7A6rdY9s6yJ1S2fJB95t3BNbKD/eu9DLZIvcwUP/ZCBod4QaHak9NbM3it5u6dywwA
         kNLofgyT6gSV6nqn5Ylo8U0cURL09xVaAxcxfDwBnEdbOm8usHWdnY0agvk/ZWuImlku
         uFIEJhmBX7VHlM+x96dJ/ToWPNZNJ99m6DBVSK7ojQH6qRXaX9uHWKA8Oj+8wv/Z5NVq
         Ao9wwfdpuOLp4CvHJOTcgtXcHvHw4gIuxjgAV5wBAFDdNPCe+RxRtX1nZoXrX9uFbh1d
         n6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUd2pjl+1uxewbSXkB9UQdDcfkHhrhK4qqhJ7/bMOY3NiXMq4rypMeZ7R7BihKX89+Q8b8aNZS4pXBaSCsCfWUiucCXJrMOP8vAgcsrw14+iJk=
X-Gm-Message-State: AOJu0YwA2tfGMAYLFPr6OA/5utI4RQZn6AtAeD8IlFYx6ZY6pyiYjmWw
	MxaX0HTLh+ouAnW2C7zfN/Xnd0qg/XwEAd2XpSdXCv2cxt066uqC9/WcLXgA/n4=
X-Google-Smtp-Source: AGHT+IHzJUpHJvBzO1v5iLmWnz8CRAittbY6yI3kGFRmVAHwcqWiqXe7ztIdEf/PB4A+9kWWiM2SYA==
X-Received: by 2002:a17:907:c302:b0:a6f:6337:1ad5 with SMTP id a640c23a62f3a-a6f63371be1mr141309566b.27.1718358410044;
        Fri, 14 Jun 2024 02:46:50 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:07 +0200
Subject: [PATCH 08/22] dt-bindings: thermal: nvidia,tegra30-tsensor:
 reference thermal-sensor schema
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-8-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VJPDXpI9a+tnKsAKTdkikW8im2YdBEsD1YQ0PHQTdfk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFm5f4tbEdT6Hj9kos4aHIzliPjW/NKGFDxx
 Ipnt4UnJqyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZgAKCRDBN2bmhouD
 108SD/9u2rmhmgwy0Iz1Y2lIEPUPCrVcvZT6yoWrfj0wgLw7Qozmtm5AmkEjCDpLjfJ0jn0Pqu3
 KmauRx7VbqoERst4rURkBcYMHLAC0w3Zu9vxRa1RTy5YiVouiBUrD5PCMYATOck/MYTTtkVOfW4
 OJ7LkFnf/Y+0CtVMtdYcN1F4/vdu9NG2saYtCHkAlaKJbb9WM5cdo/4HjDrgQXMAxGlSi23rsPs
 RBU858AEvvdeIaDL/d/1h+dtmXG8FqdhOrknzLOj0AABWGmpZCrrVHw4XWVGlhcNHHRiZZy0GPR
 YRWKGN3ptlFG2yMoUpM0bfupahX60O8m3ivmBzvk6QGKdF88dXCDP1YmPqyWRJQv1szVYj3d/WK
 9O6yKUknXbaNp/s0LvfthEag74z249rHMFB/5AdMPnlB1hKRY2PFRcOYBuL38lL7AfRgPesk5v2
 m0doaOAEtBfIalCR5zavBZndHesTpQcRLybosB3oV0eEEp8d5H1+M8UImCyUIisdmO//fCQsnTK
 gFveqBq94NauRZXVPD7mvqyNpoysTViIAQKDTKiw80/qqy6Wo8eHEd5VCfYXOEPNBjCDZY0PdhY
 vFo+tFSggr4iLZ2hdbNMoK3U3rYVOTmozWqyyamilhIEZSgZ5tHcGmTmEEY8Xk/rEZefiRxoNIw
 6rrAEJr+a9MpxJA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_024651_892650_BCF97563 
X-CRM114-Status: GOOD (  10.40  )
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

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
index a35da257b070..972d608ddf95 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -27,6 +27,8 @@ description: |
 
   TSENSOR has two channels which monitor two different spots of the SoC.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra30-tsensor
@@ -56,9 +58,8 @@ required:
   - clocks
   - resets
   - interrupts
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
