Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2283C352A1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lvrh2hmMTR1vyW2i3mfbWvbJen1uOdQ3cimhrOAY0oU=; b=0wnDEO8ET1Ixpt
	xd467r+JdASl8dFyHzMMz1DW8QQ/DVzwL3l/01S0T7jV1dBxRniiV9vaaKTHHdPHeKgpY7XKgem6J
	5Aw8hcabYGQOmWiwXH8T1rsHxd7uncbQ1tSjinYSBwYVe90GvdstCfktF8ZroA06nYj7OrDznYuXF
	I0Q82RExoV5rRekghNhFcQamp7w2/AzWo0irrqn18JBtOObGX1SZyTcog3RxqO1Ul7Tn6Y7+iMLjJ
	5tF+04C6ttIX4znd0fGKF7A0SXw9mIvzWpSkTWRO9mutXIqA+kDkStgkhKckq2cACuOsmVPtNIi4B
	ow/UUPmFa7dDpsTFALsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rcb-00HD8e-5t; Wed, 07 Dec 2022 10:25:49 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rZz-00HAfL-IR
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 10:23:18 +0000
Received: by mail-lf1-x12d.google.com with SMTP id b3so27950912lfv.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Dec 2022 02:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5ptnyM8tU9KK9vuHrqJhLp9kBHzmtP8NOjNL98W6O0=;
        b=kwnECpHYYs2dljETpxBP82ebzWcB8+wP08KcpTW0mTbgigX6RffI70K/KhpLO/YDC2
         6DwfcxArNz6QB+WP8rHiDiRyFxCJlWR4KIL0b5P82ylwXg++5M3rZhjXdHiiXenylfhh
         WHGDlw16wENi7DG/Sin7l0bUZZT73PHBprW595DmdPO4nQRLmk9Hzom9bLKpofnmbhu1
         7eeohVs98jGdxiVle7XGMFdI+y4jxV+npBwZjmRSfJFJNx67uycw7h98J5ThbGjBDaJg
         KFTspp95uosj6pXTZxb2sC4/FEUjUWOCO/8FUs5ZSXmYLlNvJY4ndBIiWMWqIYdxGArH
         cL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5ptnyM8tU9KK9vuHrqJhLp9kBHzmtP8NOjNL98W6O0=;
        b=PEjL9AniVc5oQqtn1H0MwL0iOFSUJ63miuupAYrz2UXS9lGEnZWq/HM4bI+IeF+MJN
         l+L77qhlALUpfDlXNppdogVdeEDP0qQShizEj+xS5KLbN+D6NiWMNh6Y/M1/B5l/9vDr
         YGQn6Lyv61GIC7rnuAz+pGHBsmrIClaj+yejvwtQKC2JQiB49hvwXWEjJSweyy8ViUPD
         LecQZ1XPyK2rFcz148Cq8CoXA9OTzJ4kHvY1VA1U85f1W689NRI3KboAHuDatjESkSR9
         gLPzXLuTZowGjWVgawtbU9O1odgXqsw0DhNCzlBrTrrum7Wzac+YArLbgd4xKJaKuOFo
         7ejw==
X-Gm-Message-State: ANoB5pm5YXFJCbIrTteD5Jgsf3392Fr5wH/FszIHjJUQdVMXy9GuTm+s
	mJn1ULN5haS7s3Wge+JlaNGWvQ==
X-Google-Smtp-Source: AA0mqf4r7f2xeXn7yaYoPkPuO7SMWpWfTPrwG1RH+SDYe9rX4EhYS8TzE8+PgGnMNg3pkiB3apXW2A==
X-Received: by 2002:ac2:5e8e:0:b0:4b5:9370:d084 with SMTP id b14-20020ac25e8e000000b004b59370d084mr573180lfq.527.1670408584717;
        Wed, 07 Dec 2022 02:23:04 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:23:04 -0800 (PST)
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
Subject: [PATCH v3 5/9] media: dt-bindings: chrontel,ch7322: reference common CEC properties
Date: Wed,  7 Dec 2022 11:22:49 +0100
Message-Id: <20221207102253.26663-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_022307_657193_BB0574BF 
X-CRM114-Status: GOOD (  10.51  )
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
