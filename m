Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715DFC27C75
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iX+uwtYBI1tQ4sBd4AhHZWzTPEp3EWpmxF94rmHFvi4=; b=C+VgDGL08/Qw89
	VYBotgjk+pCNm44lnUoPHvRkwjFGOVmg8/fo/anZ4SSYns0T9/9HuC0GX6GztbqSBbmsFQCJqBJCy
	PjpX6AF1xSe5/jRUosLEgZv2VTLODTOY2A4CdMz2xLhsjhwKo/UScMUKnedxOHUVFaaAd13HI/XIf
	STmcOwAr3PfGcCVrlrJ+ffFE9/W2maN4vWC7bsXxYq8WT+SdUXERN9mcxzKpueMWug+E2P69eOXWQ
	oUS7CvDpaouGoQoZMNglxCbQ1w363D0I3ThEB2YWDeTdHVGAdEk3OLAdseXke4ibzyiHKObnBKA9f
	W1EKpJX+9a4fQsgym00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Wr-00000002FpG-2Z0u;
	Fri, 14 Jun 2024 09:47:29 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3W6-00000002F5r-0Uc2
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 09:46:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-57a1fe6392eso2604088a12.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358400; x=1718963200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6wsm8Xx/pf44IU0fA2MjvK7doD5kwmYUud3XBVXDbs=;
        b=VHohFwpNh587gRHkIUpK5thvKOjdS5CE2Psim1Ip58xRvrVvQ+/IekTuLWP0rhcbya
         V52ddunoyWbvGsXmbVGgDh2dHPC6hG75kFZ+VLpRUSzXoY0rpauZtn5lsbMbbkIj6tnT
         36MBw08SpVdwN4Ui6qCqzdkV1LuhMry6W0hgeWGZv9AgpmhgcYKpbIwwR/o9IAhuz285
         EvPLJbdv5qN04bOifeZYZsFj9O7Q1OdsloLqSNkdhOTz/zy0UFEbu9pdo8pHTkEHufFh
         mFKLe31gBLteDLF6ydjaS/+cdkEnTOTHbY4I4kJWqa7cQQHLUu5xLOZ1tNdYhTGA2G4g
         6onA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358400; x=1718963200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6wsm8Xx/pf44IU0fA2MjvK7doD5kwmYUud3XBVXDbs=;
        b=r6aPgdEZptJMP6jKvV61r+xy11KJzdCsBASkV+LNnuXxUNRQyu6EYsZbNc+qNHWo2H
         /wjTMHYZ4FmeJHgfL7ykDGckf/qSkGdDhHvSInhvWkPwJ89TE0ZT8Ag8OqZ2b3BLk9O3
         zWJ1PTsc+zO8wadCYbP6xFeIeZfYqgafpbYZnEOrz108J6N8oHralYnGJ5egKjkxGdLD
         yiZqbsmFobcUj+z7E37HcEJG18KDjJ0RDglfeGs898M+iX8OZLYmlkaPS5hU48y9WlS4
         bAuc8islrnWn/1alX9q53cKqUq1s7wEBLaDI4m7vf6+g000PT4zgg+1N+n0c4OKclVj3
         dUQA==
X-Forwarded-Encrypted: i=1; AJvYcCUNYXr0koC0hxmBkM6SRAi4xXoct+C9jAeMhgOdGwaJQRAR/9WTwWoi9jQNobQmloBbI7E5u+WSuyX1sKbXofxv6LKfELJli1/xMi86smBCEWM=
X-Gm-Message-State: AOJu0YyQJnjy6WZWsqOmz1zQk/mFsLYB98P7jRJYEOhzSBII03xFsSmb
	kUjk9Kg21hjWTfMqVXWlhpnlP8hV/DWuN72PcyvxcJJHI9GwEtUSxo9lv+d5HyA=
X-Google-Smtp-Source: AGHT+IEiXb3yGV64TEB9dXMpsLr2AVSRMLYNMjccShQyJiKLUI2XAj/tHwYBQihryGriZP6pQI+tWw==
X-Received: by 2002:a17:906:1754:b0:a6f:593f:d336 with SMTP id a640c23a62f3a-a6f60ced441mr137234066b.11.1718358400263;
        Fri, 14 Jun 2024 02:46:40 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:03 +0200
Subject: [PATCH 04/22] dt-bindings: thermal: brcm,avs-ro: reference
 thermal-sensor schema
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-4-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4nD7nbG+x/aHIG3b41jcsj1A8FaFZMdyxJIm6u3+UCQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFjXVOnPfxENiYSEd3PegskhPdMdIBD/C50x
 gmcTpA2YC2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRYwAKCRDBN2bmhouD
 17PBD/9uYmV8ARyZjA4ebD50QHOJeOLukSI+7nYfdM7JguKmOozwbkqqMEEm4Y0hsTy4FKxfSQ6
 aX9Jlt2b4Eu8v6bt2h7qgbs5dwjMto/c9km1pndTva/76T6LheOsVIys7rKqu9I4WFycJAl9Z+R
 ITA4nfhIqHKcc5lMGo63EYIymwpGpRg0xPfhHMeBacHmuEO8+Ga19DYhegyzfmz/1IIfsMeIQyN
 /e/qMoh23oP0pX6rx1s4A5g2LrZXct4S3ThE3MAiFEwmLU8v517DS818NXn3ZkoiMZqddZUUuMQ
 73N7kWxS4DRg4tjiS2ySxTm+NrIh/EJs+xfeY3vfqprS8+JiDw2bstTnfTgpqtcK25xrKOAUKkA
 VQI2F4dPkZJGMgWSHgmrytDYs2AnwgO8IErRXB2cxcOMgSLA7ec8ERAg81qOC+YZk1BLqLkAoJC
 ie05pevMxHxxEnGk0eYwn42+Z4l3C4AjWGeU8AvPb7SVd91uFpLoxVbKLQ+pmo8WomhTlt6FQAS
 kzZl4sy/enWnW7jJcfB0L3NzCT4cpsXK1eWhHWk9wZ4SkbLTkCVjw9p+YF1GH+F1961ziJwtkXV
 XZXgbQItXtV6BKXx5DSa3sfi+vpztQdEOHa9eDA7BtuT4Z+8K7liyhWcIiwnW8+j/OQ21Q9tMWX
 LO1gAouP7lLNF1g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_024642_444684_9EAF9C08 
X-CRM114-Status: GOOD (  10.29  )
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
 Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
index 89a2c32c0ab2..0271a0bc1843 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
@@ -19,19 +19,19 @@ description: |+
   Refer to the bindings described in
   Documentation/devicetree/bindings/mfd/syscon.yaml
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: brcm,bcm2711-thermal
 
-  # See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for details
   "#thermal-sensor-cells":
     const: 0
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
 
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
