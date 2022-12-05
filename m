Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085B6C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFI02GppZRuVA45zgEt2J5/RWGokbih6QeeMJ7EgSO0=; b=Ko08ISu72AvcMU
	Ghy7K7zgInJgokJNDI5eERQZ9VjApdiz8B4OVnke8VbvHAKiLvwxZUdQBRHDgyfwBYYn7opbUpCig
	7UuxU7R1ltngKw6bG0tx4j6l8idMDJlMse1iJk0GlnWHvStvy1zcyzp4jx601KlPc4zzqcBxhuWgN
	iACoh2mGtndabRIyOCDyHl2uCo2o15yRV/V8bVHwx60sXF066BuLRXwur5lTt6+gnHvxNka6jHWl/
	vwyAEStn+7XcSiGMTwnPrpvDotrmfM6y795zX370tE3E2SvmY7nQgIc+Ygm8hRkm8ajEoyfK53e/i
	o4QymOWUYp1MWqIwE5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EMR-006UWQ-V9; Mon, 05 Dec 2022 16:30:31 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DF7-004fmz-Ez
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 15:18:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id p36so14726456lfa.12
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 07:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMM2e9aAz3ScK1WCwVxOEAtkh7hD8Yf9LFwwk/nFS4Q=;
        b=XXvn8qAq8Z9ZjUknoYhyHU4GY12GZE2RsUUv7JBfngn7zSavhb1dt3AAQzPE2bHk9i
         lt2zMOESrs1C1XU9rfTK/T8ErK1W8dKv0V9Ke0uiICfH75C59lIguDlcJVgysdUBSaWS
         2QKgs6JhfzTFPAR6h6wXe4j6Lvve3IrBPS7Ni4Il56qblyoSvv1T9QtDZQQGG/l9Id9H
         OLT10cXgoPSrsQISgc8S/ZvSms9ffVKnQc2jI7oIrQIHrsHx8BPoTErd9ZozuFEpZ2nU
         kSySjyJji1I9/26O54zxl8ON8/38sDEOUwM5YCoPuehgS5IXr/KpEUhPtL0pniC0UivV
         wImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMM2e9aAz3ScK1WCwVxOEAtkh7hD8Yf9LFwwk/nFS4Q=;
        b=LR4i7MsYVPH8UWgBVbkPuA2/LfQDWyzcDqhiX2EMTuIUsvG8XOXNZJFSyuM7zikl/X
         dpBakWYf42lI4izCpt4ZgLjxuP4CxhtfmIdIgwEO4EKRCo+D73O77k3mfwBxAxY/UsbM
         wAlXL2qysRBaqfwhRwNWGPxM+DLFuRzd4jjOYBhyDLd448wHO/hLxxKedkCkim+ZI0dY
         uDqwxr3RzVtsUAiGDYQgostkNaDxNnQd0AxDoow9AaS3JADNNserQjK4B/J63fks/sbH
         EfoWnJv2YliQBlsME1UcRv3IzrV5OJMBgeArJqKrCSf9Ceypno2dYzJvMJUJPDvDITCO
         EkcQ==
X-Gm-Message-State: ANoB5pmMZAqWEpdcK+gkgLoeN9oVg4c1Ea/zYBUJY/RlESjAT9ygE9LH
	IiXIYd1nJjIxIU/sAkHUN3pglQ==
X-Google-Smtp-Source: AA0mqf6+PyA5wIRMbY5xrOCf3yc5l33tR90s95AXvlxQBcLjopdbD0CRdckVx/Eh2NMejeIoM2cdqQ==
X-Received: by 2002:a05:6512:324d:b0:4a2:4d28:73b9 with SMTP id c13-20020a056512324d00b004a24d2873b9mr29734643lfr.690.1670253529775;
        Mon, 05 Dec 2022 07:18:49 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
Date: Mon,  5 Dec 2022 16:18:37 +0100
Message-Id: <20221205151845.21618-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_071853_544737_D5776B5D 
X-CRM114-Status: UNSURE (   9.92  )
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

Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
unneeded quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
 MAINTAINERS                                                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index 8d844f4312d1..f65c9681a9f7 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/media/amlogic,meson-gx-ao-cec.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/media/cec/amlogic,meson-gx-ao-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson AO-CEC Controller
 
diff --git a/MAINTAINERS b/MAINTAINERS
index e3f3c3e53f77..07cb85cac4c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13553,7 +13553,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+F:	Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
 F:	drivers/media/cec/platform/meson/ao-cec.c
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
