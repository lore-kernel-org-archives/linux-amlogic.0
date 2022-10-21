Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F07C43217
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKGYBpLsGNEgIGA6FTqwQyIe2jtf4awcTF4qzHLNerI=; b=B/bneamygCIWyU
	8A9P91Cq+wCkiWgpW4qi1frhu5iuiu4IvCkzH2pfH4l2E79Ox94+jHqscIWJy1XsOw50RVAmfQSJW
	B6O+SDdYtvcJiHAxisTUrnbOyPr3Z0fLfECyJlEl5a7EpCSW+6nloCTjsR5puLqdyPffHt7r6nGf5
	2loqhMzLgKklbH0TcrtiR49ruyFdfeQVLPdRrp4YYZH1VrwVKXl1NRINB4w1BJuKjYGsmujUxNHR7
	OqMgN1zgCZZfIJlnke0jv/a8Xtovsll1jBIpuKQveTFHeTrSuyY3lyEy4Df3AwqYL/zIcUa0FsyCM
	eoXD+fwIEmYwQPRc9mKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols8T-007zu0-Q3; Fri, 21 Oct 2022 13:32:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols7h-007zBI-S9
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 13:31:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id l14-20020a05600c1d0e00b003c6ecc94285so3939558wms.1
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7Qoz9jeBcfdzL9iyekJH2YPQjo48jyM8jlQ41M6YtQ=;
        b=J8v+969UzU9Y9w/SR7VUhM/aEcbhclODwWuAxD/2d3jJUKqh+EMU5hI0TGmOVQxIQA
         lYzdLAgH9Epw38urAuGMdecmgz8rRRgI6eqr3YA804isCcnKNSaTQsqntIVuaXkAZFVk
         4fYlMQORa8yVEOeIfgVLEewvRKR9p4kf26uJN+hCvkmpgzxgkIHv1KQW3g60H5Vy9VAF
         nlgq+EpW9yRisAMhpzDniP0fSWgLqcl1k0K+J1OEHFXH01QrM9J64woxI00TTdZsX87P
         m7LfLYndbJiQSP0I4a+6goeJN9afeibn43oy8f45JbpTmNh7ezVzjjuoYzSLuG4cDrT+
         PqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7Qoz9jeBcfdzL9iyekJH2YPQjo48jyM8jlQ41M6YtQ=;
        b=ehP61K+e+p1/4hN129JOAVdmu+jiD+bxqFjSFFWxFWx7/S/J71r3FLpieh06WN322s
         X9QwIIkZ6c8vn4q7he8W4OKucnRFfjX62hY7GZ1jaqj9zvX1Vjf072SiD+Qgp/3Y/JZB
         pp7BW2a3gZBqdQkvbHquWIqdViD21u+GHwOTFGiiySU0IS2qjdyjQfP7AoHSufcLrU4+
         3ZEqiKwASm3ws/b8xl9PQxvp6so5izqpigkcXBzhE3hEYktktZMgpKKegZTuB7LJvbMd
         IAwArinraA+eX7aiV/AXjKvjjSQO736xS4hKhJwuqroabKvfK5tTEKBo2l7X+7TXZudh
         QGtA==
X-Gm-Message-State: ACrzQf3Shs6DlXsP5ySCvD7rdF+4YU62oYtILoD+JDJDAbajqEZzuc91
	dbblW9lPvC+1XzAwNi9oFjG3uQ==
X-Google-Smtp-Source: AMsMyM7vhBSUx8oFPqKPxgekjBSxnpKkMenQ/luY5NA8wvs3PPhn5weMl3uUeZtAfwwfplq+OXGouQ==
X-Received: by 2002:a05:600c:5119:b0:3c6:cae1:1512 with SMTP id o25-20020a05600c511900b003c6cae11512mr34727154wms.80.1666359100026;
        Fri, 21 Oct 2022 06:31:40 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id j8-20020a05600c1c0800b003c6b7f5567csm10325280wms.0.2022.10.21.06.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:31:39 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 21 Oct 2022 15:31:28 +0200
Subject: [PATCH v4 4/4] arm64: dts: meson-gxbb: add SPI pinctrl nodes for CLK
MIME-Version: 1.0
Message-Id: <20221004-up-aml-fix-spi-v4-4-0342d8e10c49@baylibre.com>
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, Da Xue <da@libre.computer>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666359095; l=868;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=ak0c2C3voqy+PYUNmJZvTOe1B4YCFcIjwb3vM78gKV4=;
 b=U08rR1DqiuMN+ZjEAxpTF5BvPqmpkiWEm+VeI5J7vmNpVuKEJ4/g+EhvlrAaKQ90o0QaPnwGQnN5
 bJ4hBA7zAGFQklbeHPuuVocBB1bNTOcICPKDHttTwFahly1iqCha
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_063141_944037_0CD754DB 
X-CRM114-Status: UNSURE (   8.07  )
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

Add SPICC Controller pin nodes for CLK line when idle for Amlogic GXBB
SoCs.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 7c029f552a23..923d2d8bbb9c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -427,6 +427,20 @@ mux {
 			};
 		};
 
+		spi_idle_high_pins: spi-idle-high-pins {
+			mux {
+				groups = "spi_sclk";
+				bias-pull-up;
+			};
+		};
+
+		spi_idle_low_pins: spi-idle-low-pins {
+			mux {
+				groups = "spi_sclk";
+				bias-pull-down;
+			};
+		};
+
 		spi_ss0_pins: spi-ss0 {
 			mux {
 				groups = "spi_ss0";

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
