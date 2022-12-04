Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1569C4321E
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Dec 2022 18:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/LiJ0hYJawg8SVc+Q01tETujdbmAfQ53bP/+z51oVI=; b=nt4AiE2EXtEaOe
	LLy8pe/vdnfkbV+E6e6euANvu9+QMghrULiS2jUzmKS1eQJkxtlv9cQdN0LGfINNa59Yl/KHol/78
	zUUYm1Va6R4QZ1d5OP8d1EwEZ622B5DG0PwyqT3f2oSryEPlDjxup2+m9kA+ooEOUi7+QW9wXRPec
	qDDFb4WYsIyu3GGqn+zrGjiVhJXyk3r06UvBZtfCAAlb4uIWGBwLACMyTDu4ktiLjlQB//VUVCZuk
	n0zWUel+puQXcWTT787cviqjx1eqOP8qo1BwaCGFtrCajbqRhWMiESyJ+rDcQbfV7GmvuvlIjQp0D
	v0RXYJLepdea07JzR+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tno-00AMoZ-Ci; Sun, 04 Dec 2022 18:33:24 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tju-00AMFI-3T
	for linux-amlogic@lists.infradead.org; Sun, 04 Dec 2022 18:29:33 +0000
Received: by mail-lj1-x235.google.com with SMTP id b9so11184750ljr.5
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Dec 2022 10:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+PteMG/Ads8tC893Hy13VLmIBDMK2suUNCe/1HZdDs=;
        b=zP5nnhCXiClJ1DgCHNM3yk7JNqSv02YTEZax4FH6Y0gPcr14cFqylT8Hbkz3SNtRTn
         MkkF0S/zRYGUQLLy4DbRInPHw2yzVtW7QyTVzI4pU4RpNqkljZEkCcCg/LtaUqR2smha
         hbhh0k+4K7ONv9Dwd34Xy49ceZftpvWYk8vLjLe/4r/8nB6LiBKf0wYrWO4+eP0fH/jD
         3L9eUcSGuHBbDzFwLP8nW/QAjNXtSdRxAemSmyqfsEcvdW5FPFWbBwVX038t0+yVF/nA
         QpcSWxI0MFIR6ADPslPbPPo2k43pYt8w9InuRouSkiNz/hL1UPAbLyX8H8DHD/vrcD1A
         Zhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+PteMG/Ads8tC893Hy13VLmIBDMK2suUNCe/1HZdDs=;
        b=z3xRmeFN1/FqFoq1aa6P6S9yQwAlBo/yPRxCvbp+y8zxFGBbEtsAFzdQQuYmzqdRpd
         QRUheXZTSdtbAAN3nM0ExVB2n8eEP1QMLAQ688aEmJrjxpkicWdoJwUEvFevvzv1Di06
         Zd4/2KPGdgv3KuGQFVMJPYWtStSNJ2aqD5NudYLYCr83lvHT8GO06uCQbdiGt9kN838i
         nlbv3YGlX45iGuE8jwg/reDjTTAIa1rhvqkd/Chyl9cJUujrdpFbzrmqvz7jlnsKksru
         jEplpQ61mj7h2ldgxotP24fAyK+X/d0DkPLFoPkpm2+GJawyA/xvdGU5t6Wvrxos7BU3
         +JmQ==
X-Gm-Message-State: ANoB5plP7md+MeVBCWBH5d2ysGxRT6cqYRnsCGPfio+V+CcrsC65dtzw
	Btq8AsSXjvpXE15aB/A464T3Og==
X-Google-Smtp-Source: AA0mqf7cT4VZxE40h1S5qRGuAOZwWxzBWZBIYv7ax4dztOW39Zzssoufn9ODgvCoaB+u5NHzZC0IXw==
X-Received: by 2002:a05:651c:1145:b0:277:8759:bf65 with SMTP id h5-20020a05651c114500b002778759bf65mr23608947ljo.108.1670178559826;
        Sun, 04 Dec 2022 10:29:19 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:29:19 -0800 (PST)
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
Subject: [PATCH 2/9] media: dt-bindings: st,stm32-cec: move to cec subfolder
Date: Sun,  4 Dec 2022 19:29:01 +0100
Message-Id: <20221204182908.138910-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_102930_103945_D6AD4BEF 
X-CRM114-Status: UNSURE (   8.87  )
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
