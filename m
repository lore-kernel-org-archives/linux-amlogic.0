Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC5EC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 10:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lvrh2hmMTR1vyW2i3mfbWvbJen1uOdQ3cimhrOAY0oU=; b=vUEyyVzo7b5tto
	reo/1ZHMb1rxG1UClsH7dswm1wfbQrUH2CsaQAQpA66sWU8MUEY2UN6BtqJE67bOC5y4+VdgXBdlQ
	W5820lRyhs541ObN6YoyoJhxl4ihUi6oOlOtnu26rUgx6LCmtVw0cLjCELzC11BRyxLUyzRcxCnV6
	fdG62FjGQiba+8f0ftOnQx2RiQBj/qq3Cpqu+z48Yt5qOBQ3GnznkKd7kJjRMRRe5ckBny35oebUB
	OOZMSsRlN9YZIRonn9abebNPM41lRHhcSyHpB+r/FtjKksnP8LBgRx5u+q657kg2M2kNBGTFsKTd3
	mFlA/31oYEMNKfIx1L4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EDw-00CeEg-HH; Thu, 08 Dec 2022 10:33:52 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EBm-00CbEv-T8
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 10:31:47 +0000
Received: by mail-lf1-x131.google.com with SMTP id bp15so1336021lfb.13
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Dec 2022 02:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5ptnyM8tU9KK9vuHrqJhLp9kBHzmtP8NOjNL98W6O0=;
        b=Zqdk9FLKb1U+056szYPwGwZZOCtduYqr9pYvnZ70agJ8neRKwJbE/0KXoVf9PGud/3
         WUUDU/fEZhoXXFg7hf9+IhzSsBiP64yONaa7u5T8aNsgIJdYGPQuba+HXXhMaeC6D5H1
         Rzilnv2cjG1wKqajm+kC9DBF9p2SAL4WDD6JNKqCfElln9GeZVsjaVwzyTVyYJgeipEM
         Csnc1Cy9CHiwtzHyu5sOypvruVbwF4Dckt6L8lOKrui5Ts4xiBE0rlgNDnP/yJ71x/Ep
         QUzxoCtns51f5ylw3SjAEvbdbMCGK16oDkOSKEiYp88amzXcDBhw+o3cDnWsXTLx/n5r
         A1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5ptnyM8tU9KK9vuHrqJhLp9kBHzmtP8NOjNL98W6O0=;
        b=QD15s1h0KOy/UkTp/li5LyUbWI+Lq6F1eTubSKQG9WPKxAZ/Ze5FGDFR+Gx8V10qMU
         Yy05pVdrL3MOPrgXMa1wGxQHQUdCNkPj2yyJwzZRnePl37ov5dW22+zNRtzipVjMOKEM
         2/38gDegRK6zTT6KP1cXQJCHGmHqlrCSAMqvKj378Ccwc7VVs0Wbn99SJsXJI8XvOTZh
         S0MBfahGKaE1Oj0JZUhBq16F8DF2HMXunEuWLgkmD6vKo5HBhjY9XtbzSoW1UAmA7QIf
         LjZDecdq66amUHaQ/kCtYY1fGfOnKaGObrXGfCHv1fxpUAYU/abOquQmY7pCH83634fJ
         kdug==
X-Gm-Message-State: ANoB5pnFdbogGRJfAo/T2yY17yevBoJ7uXtCWJDeRhte+twPBz8TVF6G
	qEyyE/zJFqrqkB18whjnkarIsQ==
X-Google-Smtp-Source: AA0mqf5tpHiPpZHCEhpkHs1cV3jMDIzMzb1k+nZXnOkFjY2FhmuCd2fWYcDhxvNhmKNesC4O0TZ6CA==
X-Received: by 2002:ac2:4acc:0:b0:4b4:10ca:5240 with SMTP id m12-20020ac24acc000000b004b410ca5240mr34308930lfp.482.1670495495875;
        Thu, 08 Dec 2022 02:31:35 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:31:35 -0800 (PST)
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
Subject: [PATCH v4 5/9] media: dt-bindings: chrontel,ch7322: reference common CEC properties
Date: Thu,  8 Dec 2022 11:31:11 +0100
Message-Id: <20221208103115.25512-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_023142_849192_19654EAE 
X-CRM114-Status: GOOD (  10.08  )
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
Reviewed-by: Rob Herring <robh@kernel.org>

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
