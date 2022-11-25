Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A5CC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 14:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tCz+OBI5EUsPTepZPK2qx3lSmq3xUycYzuXzy1QeUrw=; b=SD21cI2ZJ9ROBz
	55E5KPmrmZWKAM5viawiBbCXlgdBMf39tDsLRIb70oQg/BR+D82ehKiCi1TXec2kRbSPKa/YbiAVt
	Xp+FzPDph9wXCHII+bh4NIvRb63Jd7PjNWrpkYTI14XRA+U7fKxGnbmkQ8Hca7zg5m62UEJMCjDRE
	oy+NvRfiJMSkvryBNcrWcYatftC66l7LDifsGLyZC/twaF6NL1SAsd1JCeYTH5VBLvi11xuV6CL3S
	P6ZyByE9m3mZz4Epwyg5MOF1t/n3sx8vcdetdWX26qCfclf/7LgkDCCeYJrluP9WZV7x0nN1XH1Wh
	j8SfT+MkzAtdk5HabDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaB3-00HHCh-53; Fri, 25 Nov 2022 14:59:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oya1q-00HCSl-Ik
	for linux-amlogic@bombadil.infradead.org; Fri, 25 Nov 2022 14:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Z/5v6IfA/ubg2nJLOKQQG234MZiHjjc5dgAnhVX0L/s=; b=kxK7iq2slaWVnuKu1rcWgAXBjV
	bunl0JfPLdLLhAkbolMq9FDL1oKb7UXE/5RS5qft0okESnIqdnn5x8xk9klHZ/yduxx3GtpBE6shh
	I794n77/V4GV0+9kLJ14ViHUOlbItwVl5vN0HWNxqhLCzOnYFdpsRxbjFmuA9pHY00LwpOHflj5kU
	QSiCZo0d12zQcuTi6rXALHGunP7z36XycqQhhYi60hhRagA0b8jAYDnhCYxQMDMiw+7drPz7Ex3Te
	9qCy9m05Hzw/c0aUsp6cerrmZj9wJYGdAELz5eE0cAZ0x1ffpgGML92CyY7Id4tDkmtzz8S2FG3II
	Vdf76SXQ==;
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZti-004YDs-M1
	for linux-amlogic@lists.infradead.org; Fri, 25 Nov 2022 14:41:48 +0000
Received: by mail-lf1-x130.google.com with SMTP id p8so7185022lfu.11
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Nov 2022 06:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/5v6IfA/ubg2nJLOKQQG234MZiHjjc5dgAnhVX0L/s=;
        b=v73NYCBjG/HomZkRNgmtOXhKv9cDQF46tMMBfqYc9ma2DNFgUChhr1kRR4/N5cNR78
         lv/CTaeOxTdpJopTBlfwwU1FQKFo5Dr+k6DSfMB/vP0q2JVfU327ncYXBGyzuSSe0ioA
         xCh3szZ4Ju2wPRvEw3heXC2hkaEwhkGjfPWhcDiOYN+WyM44YzdVli4uW9OJnUdJYbE1
         J1e0fqamTsPgRgUXqeg++Q/NAx8x4+nipbaopQXn5McLgoDkJk5udBz0lfVzDay7z4dp
         LZsfO7Gu4co2UDIyarq+s8o1/UEBYd0iOXpx5vUvDEp7IF7Z3mScOD40ZFG66FGU2Xtr
         PJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/5v6IfA/ubg2nJLOKQQG234MZiHjjc5dgAnhVX0L/s=;
        b=mjVHqDPnvmyE4QHSHAuKzKr1mCLIFmpLYvupnpcQ8Dd6Xe1Mbr5FodsZlgTjtSC05O
         9Z2w2z1nSvPlb8Acl1J0L3bTlJCjF+Z2DZyNYKaplCtqq69Ilf0ZGhqeHJswEUa6Q5mh
         EqOwHaF4R5WKUuIGWa0aDnHTRJqSjHoj1CbmG04t6EMnOFkqN0Yj/7cf3UspxLIdaYrj
         x0GcEcZ8vn9Sm/U+n6D05rKpEuOYg7/fO9gizffq1DftvxPjMpxSgSFpmdavZYivEHLZ
         E2UblHUDz87gD3xu7Ggemtl6UwdkeHTDr1nV9PVMwCa0qj2zZGRwN+3kucZl5S2woNa8
         kZ2w==
X-Gm-Message-State: ANoB5plenDXGGeajBZmbI7J0hOYKjHqnxnREiwGCsCalUTKkQqjxxmYD
	4TzUFbWsURYbb/0nEjZEKwTI9g==
X-Google-Smtp-Source: AA0mqf7XBjlNHsnGinQ/ZJ5ekm8hErX7jb3UzC0AoUVOflTI2G0Ga0tLnzkPrVnr4q3TRO4R7Dlq4A==
X-Received: by 2002:a19:791c:0:b0:4b4:dd9:1880 with SMTP id u28-20020a19791c000000b004b40dd91880mr7436620lfc.289.1669387303294;
        Fri, 25 Nov 2022 06:41:43 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i20-20020a2ea234000000b0027738fd1eb6sm384995ljm.110.2022.11.25.06.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 06:41:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
Date: Fri, 25 Nov 2022 15:41:41 +0100
Message-Id: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_144146_876080_02311557 
X-CRM114-Status: UNSURE (   9.54  )
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

The node names should be generic and DT schema expects certain pattern:

  amlogic/meson-sm1-bananapi-m5.dtb: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index cadba194b149..028220ed45ad 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -81,13 +81,13 @@ hdmi_connector_in: endpoint {
 	leds {
 		compatible = "gpio-leds";
 
-		green {
+		led-green {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
 		};
 
-		blue {
+		led-blue {
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
