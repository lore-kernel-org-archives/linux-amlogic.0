Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDF0C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/LiJ0hYJawg8SVc+Q01tETujdbmAfQ53bP/+z51oVI=; b=K5KQEIY+hMtkWp
	LpRb1GdUexjSmwzRkM7wRheOPuUbv3Yozb4thYEcWVLjfSvv33/87G7Lp9tKCuDHuEfVK2USvw6ks
	SZIswgJ1HfFJEcAt0q10PUCW33c4yEpnTu09vdkUfv7QWEX8kjwIvpLRREFG9f22z1yZ+YjnblB6K
	Wkwa0fWggyYzr0AjeQs06D4f+DW6X0qaF9POIFdqvRhQ92ozBDrnWxhvV3oR8ZDK6leOdQM1pOaCV
	F/O6nyJueOnbgXnI6BqMQrFEOxg72u5S5SX0hy5lopKwLKa+wFHNT4LdAJe3efME95PlIoN3T6Zxi
	m9+xrC7iQrJ9B2nfgoBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EMG-006UQQ-OV; Mon, 05 Dec 2022 16:30:20 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DF7-004fnE-9h
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 15:18:56 +0000
Received: by mail-lf1-x131.google.com with SMTP id s8so19086332lfc.8
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 07:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+PteMG/Ads8tC893Hy13VLmIBDMK2suUNCe/1HZdDs=;
        b=TyQKk5Jb/oTm+Kxu2GX9IYiCfH6m5H2YSYAaAsoQ4Xqhn0YSesbd+oJMZwhLzFIhsT
         uwPxEQiUzlRp2ZKGDHIMUWEM9hqwXUfS7wDSGb40/dB3jgxmd+WCeSGBZpWRAhpQblxZ
         woNdwJs7zRHNHg88D85YeUu8115asVSudFEajY5oe5yU6SNTBFmS1ZUh9YvzGT+PB0fF
         JFoGP/gUE8u5ZeUctNk1FTBoQkLcxpuv5B6UdCR4RAiZUa+O+EltMAzNWjagUULlVcwg
         R18gDUIVgp9X8sU3JDEez55GjaLFGz6gKm8Q/KiDjfumjmwKDzYRb2bAzyeG3MITLtCd
         34Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+PteMG/Ads8tC893Hy13VLmIBDMK2suUNCe/1HZdDs=;
        b=CoCFzuv15ppsHrJvO45hgH40natVSDYp9oCwb9rmWevz3l+XNkWlBuvcTXQDMGhyIA
         wDpxfiSdfGLe9J1Q+Ci+shx8cOb/JVBZoL6b2I9BwOLBknV8oOYCyGObl2apVMvt6DVX
         PKppRuWRfKylo6RF91Tt9yM+Uug8ciW7AExNZHNbrkooFZTIINKMAoEIVuJ/KJ08obmY
         vLjhbNTKGQG5+ChqSJtWbyPM/ZGopurvnerG0jta/W5akWQslbVL6eHc9eN608K1gGG+
         eBoKQPmFeD+CNtHl9gDFf8LRDWFoVM97eQxovFBRD1m/nVJjgkwq2lM6s+Q+iba50Qbj
         kYug==
X-Gm-Message-State: ANoB5pmjLF6aPiZ5hPPWfo8TeU7IeCIH8dVLip9QDRfgbEeipjdpOrQa
	rm3OeU3glT0UsjFK2B0okdSzfg==
X-Google-Smtp-Source: AA0mqf78FJH5p0ax6RFYVZeoFxmMuA7VAWipG1lyz5YZW0n7TWCLHLZ7zCLyYkWtLb4MXZoQZsJMGg==
X-Received: by 2002:a19:654c:0:b0:4ab:e1c9:f9b1 with SMTP id c12-20020a19654c000000b004abe1c9f9b1mr22905192lfj.378.1670253531188;
        Mon, 05 Dec 2022 07:18:51 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:50 -0800 (PST)
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
Subject: [PATCH v2 2/9] media: dt-bindings: st,stm32-cec: move to cec subfolder
Date: Mon,  5 Dec 2022 16:18:38 +0100
Message-Id: <20221205151845.21618-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_071853_442320_D2EBB64F 
X-CRM114-Status: UNSURE (   9.18  )
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

Move st,stm32-cec.yaml bindings to cec subfolder and drop unneeded
"bindings" in the title.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml (89%)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
similarity index 89%
rename from Documentation/devicetree/bindings/media/st,stm32-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
index 77144cc6f7db..2314a9a14650 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
+$id: http://devicetree.org/schemas/media/cec/st,stm32-cec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: STMicroelectronics STM32 CEC bindings
+title: STMicroelectronics STM32 CEC
 
 maintainers:
   - Yannick Fertre <yannick.fertre@foss.st.com>
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
