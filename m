Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E428C3A5A7
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzIYQZpolCuIuJC/kPBlTVx27iF3N2jjN+rSh/hOflg=; b=kNdYPx4KpY9320
	wL1DYB8Vw4YAHNSLsrZ+Zx3r608FMBp7xq5JrpdHlj6eRxMwRclJbgfJCy+DOmpsY/+MtzIJLzFR4
	hNTyLx1UNnB5H2SJCNBAvRDGI4JPqWEc9NE+4V6w562/3ZrlqxcAfzQO4bpCZ4r6WqEEbu6e3YalJ
	LNojGYS+MKduF/qmXbsERkf1pKuMxDaMlSQxzcTuegcVsLqOqg5D7l1Vrs4QYShuQH4mJugneYjXG
	HhuoE69D5qS9iBbmyMLBCCtrI1+lF2NGYFCB897wIx7iiGT8z/pAcbFlztYlDmS6hZw/dTtv5Lsx1
	2QvrQMmaNrHvhWRaR7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ECv-00Ccyi-57; Thu, 08 Dec 2022 10:32:49 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EBm-00CbDY-4C
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 10:31:39 +0000
Received: by mail-lf1-x12f.google.com with SMTP id g7so1374489lfv.5
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Dec 2022 02:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxOwaXNbTiEohgYyBqos3ms0rULNHpJBLRwyMfOuuH0=;
        b=SNdyGSv85VbVAi3pneX2JkKUEzvN0PW4W9IL5g4DRhHvrBMOeni6Z+pOOEUpcInHC4
         8Oe7zRj7yqve48LHxc9nGSZ8mjyRRCvJpCF3Z+HStSkQrZAQaWw7GQJclRQO/E9VVVfd
         Buw7kNckTMw6llktH1TFtA8zYKuFyKlQfBHRHR2N0gMd5aCUYKIQZHVTqSpTEg/De5ZJ
         /7DYMHhSqyEC4K8AQQoiej8iBaSgPHsLttayPnDRwNPyQdAbC6HBdlCjQciE5QjQ2mgc
         Vx23NFx3NOCox+iJMxdZPi1LNdtRivWrNNhADRl2USslYsznJEGxEtTQac8m8oo5Up8r
         ayQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxOwaXNbTiEohgYyBqos3ms0rULNHpJBLRwyMfOuuH0=;
        b=1DfUO5uJuYuTA/00toz2l6wtarjgj2Vlbpa1ypuvvgmbDCRtEy55+FiSDUWjIaXC6B
         2y6qLFX/IAuMxVYhCkEEBz9/ue+x3kRCMiKVgqIpQmV7oZJWz4OiN2oshNrphvRtoJYk
         5sb0+R764rllKp/tH1IG8Eyun0XesulZF0XU6LAGO7DipYgtCmmfIGx9va3vzMXpPIux
         3LQSRnQgOgmkheqOOx6va/xiv/J9fr0IsMwTPeZudtgHqy/9KK4SdCaT4tv9CG8mVEbM
         IxO0fAvqhutJqBgcQyJMj+mWfXbVAPejayxm5jBO88xD5fPaSR+kOo9pMh9KPfyRGNo4
         JuPQ==
X-Gm-Message-State: ANoB5pmqh0b2/vNBZzzRm+zg2ZzkT2mFlj/mfw++k0qvjGRH1o8AF3z/
	F7q+nERwoKRycajhOOIWBVeBbA==
X-Google-Smtp-Source: AA0mqf4diiVxd7W4vZQ0KqLCAk/r4Pm72qA2Aa2aQQA5cwubEv5SXUy9nz5yQdu/ga1nWqYYYtXzrw==
X-Received: by 2002:a05:6512:3a96:b0:4b4:f5da:fb28 with SMTP id q22-20020a0565123a9600b004b4f5dafb28mr20618283lfu.169.1670495494230;
        Thu, 08 Dec 2022 02:31:34 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:31:33 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 4/9] media: dt-bindings: amlogic,meson-gx-ao-cec: reference common CEC properties
Date: Thu,  8 Dec 2022 11:31:10 +0100
Message-Id: <20221208103115.25512-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_023138_243475_075A8D68 
X-CRM114-Status: UNSURE (   9.22  )
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

Reference common HDMI CEC adapter properties to simplify the binding and
have only one place of definition for common properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index f65c9681a9f7..b1fab53418f9 100644
--- a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -33,11 +33,8 @@ properties:
   interrupts:
     maxItems: 1
 
-  hdmi-phandle:
-    description: phandle to the HDMI controller
-    $ref: /schemas/types.yaml#/definitions/phandle
-
 allOf:
+  - $ref: cec-common.yaml#
   - if:
       properties:
         compatible:
@@ -81,7 +78,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
