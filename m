Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD82C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=al9tCSNSxchS9l+obPsWIICqSulsPbfo4lcY1ryVMJo=; b=Xse0e+L7wwsTHw
	g1zLJyT7yKbyrPB9064RBSu8Yn+mXDp8QlH5TaCGtXe7YPsk25pg7twhItmN4RXOEOEUeUNZVvxjy
	YWn5jtP+B1mgt7c8D7iGkjJF71Jnw1Xalj+mrjngsmouulvgJar/8598/FX8hr24y9R04dbCQYODz
	X/IJF16tR2HejIWeiTU3Zxr4UXyCl1P2rn7//qb7XffALsLNFl6wiI+7H4SdeKgX1BiGTAoH2M7hS
	TjzG39BJpBrt8T6k6Od+BZUtG+BvoyNF06Xf1RZ13kTiEdA3TZeI4GeZp4xudYgM8altk+J5D9Ty+
	pA3R6fQJRQfhunletTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EKU-006TeH-Un; Mon, 05 Dec 2022 16:28:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EJp-006TFi-OH
	for linux-amlogic@bombadil.infradead.org; Mon, 05 Dec 2022 16:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tw1N36hf4S18yma0Kn3UCRfKqglTZ6hLE0qAVoDvnuw=; b=ZpXavypO7X4cNIfBlIt9vBFhf2
	P+qty9B/I55qcLfgs2qvIBiAHvjrpOZX8WZcWDdUoRW/dmgCh6/CCKYGMcpECg2IMDuhvoZGiavPp
	KoUwR/1INEjwX8UUMZh3u9OhGseGLDUGZpgsyRB4F1Az3NuAqALW39z3mok9cjbhBlZLXdZYcspEt
	AQVd5yzmcSRfLkXDBm0+ZRDSCiu4GCwIgl5R06PHmR+0DjGu+SHffXw2mjK5CPSpj2UYjEqHhhKV0
	MdrUHKXEv1P/tnGHbqnNo4sy29Ux5Sxno7KTRsuj1bhH/lSPSzRBOwokAt7ZxBXEnXnxlxHSbsedH
	/ftSenOw==;
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DFI-007eZm-Tf
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 15:19:07 +0000
Received: by mail-lj1-x233.google.com with SMTP id bn5so13914316ljb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 07:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw1N36hf4S18yma0Kn3UCRfKqglTZ6hLE0qAVoDvnuw=;
        b=solQ7lAy3lhvUXrIWcKhVEaQbsA5oV+r/OiP9U6OAxx6kULu+Bp+8RoBVzUc0OfQzG
         4T+1JOWKm+0Whmo4am/GRnHGsKTPyXjm4QV0atCZShzCAXhJ6GzU58z7qUf3lvWZImTa
         gFbYRmird/MeQCahfp8U/Nc1TPwqX5VjOSNPzO3661gr5FiUtdDEyQnPX3x0yAErCgu6
         /y+hkyyFpx5Ki730T9AYYKDd8rqtLf65jqzf+HUdqLDHw8R9gOE4KWHc/xCC9eI0MQ9Z
         zh+MuV4pShjkiHzzNmiGsWpRL1yfW+UGae30zDBCL3CY7wB7kAPc32SoZJ3CPZDwNn4k
         kaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw1N36hf4S18yma0Kn3UCRfKqglTZ6hLE0qAVoDvnuw=;
        b=sP1DrDSTt+V0FumojF0riBTjp1t0brcAeLr5naGvHQjbILOIVzB1asNZtCwyxNNkUx
         5hAmNPs17vyw+kaDtqFNGSUwTF1339fOlIzBUlpQBHV5OuqV9D4pZOOBxqzLB1wmkAFv
         7TlHZxgbJUaMHp5+ALOJ4RWOJJMkJM/c2de3rS51U8Z7/Cx9UMEfLdFggSMvlLPM234O
         cJ5o7I7ICiKfANzSPW7y3DSHbEmtUddY9nJ2x0D9oK7n9fx5XRf4P+wyiWDCECzDyj0s
         1SsTphYtar6rEaNc8xzfWWGLMRW0Ivce8oZPXJ/sDHdJSYF79ZXj8cYblJdqssKUpUcN
         mV9g==
X-Gm-Message-State: ANoB5pkiS+Zrdg4Dcy3hdk2yf1zJFyuR7gRE9CzK/PO5MObtb8OeTIuO
	Cfi3MyBw5RNXxzdkI52pzDBGuQ==
X-Google-Smtp-Source: AA0mqf5n7I3QT7lFRtdIRCvpgaFCa37U4K1ljngooWxay49uGqEYDkoh5mcR3TsHLb9OJcHSiojIlA==
X-Received: by 2002:a05:651c:2002:b0:27a:8ce:45be with SMTP id s2-20020a05651c200200b0027a08ce45bemr476662ljo.76.1670253535692;
        Mon, 05 Dec 2022 07:18:55 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:55 -0800 (PST)
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
Subject: [PATCH v2 5/9] media: dt-bindings: chrontel,ch7322: reference common CEC properties
Date: Mon,  5 Dec 2022 16:18:41 +0100
Message-Id: <20221205151845.21618-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_151905_165355_E09EAC32 
X-CRM114-Status: GOOD (  10.20  )
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
have only one place of definition for common properties.  The common CEC
binding expects also node name to be 'cec'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Fix node name to cec.
---
 .../bindings/media/i2c/chrontel,ch7322.yaml           | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
index 63e5b89d2e0b..af8ada55b3f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
@@ -13,6 +13,9 @@ description:
   The Chrontel CH7322 is a discrete HDMI-CEC controller. It is
   programmable through I2C and drives a single CEC line.
 
+allOf:
+  - $ref: /schemas/media/cec/cec-common.yaml#
+
 properties:
   compatible:
     const: chrontel,ch7322
@@ -40,16 +43,12 @@ properties:
       if in auto mode.
     maxItems: 1
 
-  # see ../cec.txt
-  hdmi-phandle:
-    description: phandle to the HDMI controller
-
 required:
   - compatible
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -58,7 +57,7 @@ examples:
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
-      ch7322@75 {
+      cec@75 {
         compatible = "chrontel,ch7322";
         reg = <0x75>;
         interrupts = <47 IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
