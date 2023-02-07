Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2D6C64EC6
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCeMtLr3P57RB4bGU2b8FYae3vC+Wukxh2yv+mdnXM8=; b=ubzMx59jT9jpvw
	yv0vqmFitt/yVLGX0Z+CcSOHi8/IEgerMPEOaT+OnVf0B4Hbj8yyl7D+spD6aHQLjwvX6/ubKgcvc
	8pO/NiDK35O2/SGQi9+VWDnQTX2Yo857TVlAENVDJ6RzPvCbEJ6+H6lSOHYU/evBMLtygNOVVXcE6
	3eTu/Hyb+h1LaqyPIcDdXIReTIE7Dj3ZCc+1FnJhKgSE2Xlg9yQm8ZkhjL2s3o8Y1R7zhF/85Lxi9
	8iXzJqj46NXh8p3SczimrmujxbXhPGL3x/cbPCXwjtGtN62F7/hPhKROnNZ/EAsg5O5YjOnbq4UfP
	G5XWBh9R7kCW4atifrAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPbe-00CdgY-Lr; Tue, 07 Feb 2023 15:10:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPa2-00Ccgj-T4
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:08:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so13414591wma.1
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 07:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QanlvCxRAxNh0Aitpwd4RYe4ua1rl5xSvSA8lFNTtWw=;
        b=y7FNB7/R4II5pcYBayBqRSarruWI7pyoaSbUCapJ0nML1/iHBjcspYzalKk9cJL9Wd
         DiZTazGtlrHrztWq8Aq2gwt7M+41PlZxd8WtoU3y8NqdVmS9OgXAv4l392WnHWrn1DnM
         cpPGV+yNfMMbK2sK66RZD2UJPQ/JL2TM9ZaCBALGO0SfWFp2oF9HcyQuMXM4rVASPSQs
         XmMJavgYceC4sPoF2KXgttz6Av6SQquuDWMIuXtRJhWKuR93Dbl4uRUokad63L/WeucA
         SniS0P/bGI45FAmvsRkIzRIHjqdhNz0Ngnb0G+lIeRQ1vE1xoPh+csPvat6P7LHjx7OY
         3azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QanlvCxRAxNh0Aitpwd4RYe4ua1rl5xSvSA8lFNTtWw=;
        b=tDR3VQV/zbyTsKwoRpa5ESyOTkwmxQKKR1pir6xvAYxvTBV0D/T2y0uMdm5/kmqQJC
         1nINLQfMqUYxLtbzYn+MyyC9l98kcVjax+TS+vscAVdmc2zMkQ2GsN8IkVYr8hbvY5R0
         03b/GZOr5X5TdTfpxIvBtPAZZZ/9hGcHKEKxcNg/2eXBBj8yQC9KRGTtR76aWeE+oXEj
         K9bLVatBlKO1n9lrq/5OzhSV2G40HSf+5g+xUbuqwbgz02GE+HAxVSgkKr+ECnCZIYvn
         HeEwG1AOX30pi6BVn6BxzR6iHXoPtEDin65epw2DEUQHTTNZx3HKVASN64mvAfQTPeDb
         n8Ig==
X-Gm-Message-State: AO0yUKUJgI6YkM2I5RiDrFB5OcF4CrrTGEsbl1ajn8OqZy6C/p4NwN2N
	Be8whvezdt0AqlxioVKbVqUdVw==
X-Google-Smtp-Source: AK7set/ApDuZBr+dcZIgvzCXDf8imlD5bcnHGLhZATLXygZx8ZLHKqYTjIk5AUcpqAVmKSdW74QrDA==
X-Received: by 2002:a05:600c:16c4:b0:3da:270b:ba6b with SMTP id l4-20020a05600c16c400b003da270bba6bmr3446241wmn.41.1675782500704;
        Tue, 07 Feb 2023 07:08:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm22092173wms.28.2023.02.07.07.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:08:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 07 Feb 2023 16:07:59 +0100
Subject: [PATCH 6/8] arm64: dts: amlogic: meson-s4: fix apb4 bus node name
MIME-Version: 1.0
Message-Id: <20230207-b4-amlogic-bindings-fixups-v2-v1-6-93b7e50286e7@linaro.org>
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, Yuntian Zhang <yt@radxa.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_070823_027777_E1C35887 
X-CRM114-Status: UNSURE (   9.91  )
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

Fixes the following bindings check error:
apb4@fe000000: $nodename:0: 'apb4@fe000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index ad50cba42d19..f24460186d3d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -85,7 +85,7 @@ gic: interrupt-controller@fff01000 {
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
-		apb4: apb4@fe000000 {
+		apb4: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
 			#address-cells = <2>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
