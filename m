Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49BC606A327
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YTLs7N9N;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=is5rjkXy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Cn3nRkJyss5GjH1frdyWLt+OQmUuLebnCF/yx9sh5jc=; b=YTLs7N9Na3rNYxz0TCHULrZWuA
	kYu+ToZOFALm2LXuGLzeXQdPBlkUvD5JTGkUl0Jon7PCzp74ku491LlO4VWFDsdHfVV5LxCTwCGVu
	4FDN1K2XQR76qBAFE2rQjRFEp38I/gmh9zAi1YT478XshSzlPpDZ4caRfv3KA8IszJbJ47hqBZx+h
	CB/XkL2W3JyODmKKSLT6EwT02ixSxJyxlwHUzZhsJhawlIEJY/A7eJASxLc0TbgZIQ+VT4eCcfJE9
	QTGDiIZQwCocWb3karlyzFTXbE9/lwDMZ5f3KcLsgcbRjj+UJJZgVJWmP1v3/s4QaaQJRqY2nJdpr
	qSTW5ejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQG2-00000002hMb-150X;
	Mon, 23 Nov 2026 09:22:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQER-00000002gmo-2oRe
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Nov 2026 09:21:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so37163535e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2026 01:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425651; x=1796030451; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=;
        b=is5rjkXyAZk/gdPB4hCA9eLzdRJeF4dJxOacloxN7WTUGbkWivoKAbXdJrbzhmU47h
         aZ8IMWwtT5RTbZXiLEGckwB4r6jSUA9/TQMnI6e/2tcr4U5L2YeIrZHCAE7AJ8jUK+kL
         rmkwWQMbgl2/eq0H54pgtakYM3IjSGdk/QfNFY199Ej3ds0aaYhfY/WWYW/7of9dnkvC
         w4JHrrB/Gz3MhSdnJR9pNcgNP0EpFLceYBKkr9ZG4+xlUFn28yq7FX5CYxLWV1GUgd0l
         zf8QCoUpqHZX56sWPCS6SGc5pHR1z6zA5OXCRZLTDS7EETxz6tdXeBXNoEYHupRjiesz
         SKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425651; x=1796030451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=;
        b=ENyXq7p2ZQlFmIQV9y5ZfsZ1Kd7DFmPZTCv2MiT1cb/rM4meoWhnflucW8LbS/UMHe
         5l/XYAaZS5KggwXZjHJ8NVDnA1EX61yElwMp8NbNeRgnlkQH4Mt+E9ato6PCr8IBIAf+
         iUBc0OBwuVOwle1tR0UfjuBxfFmi1Vqmy5hgUsicgJju2V+qqlLlr2dE0qyzW2sHlcmi
         lm5bluOmvFWkQHAmBGOgf/RB1PcMISJT5QeK+6OnFm7X2cVOXIQchATq9TJ4BV1acvPS
         Uungt+cbdeK2oCBG0OzO5mCavCvCaFT7xhRhDutbCi1nqaDfRJFcJigleg6ww4Kw3WEu
         C8cw==
X-Forwarded-Encrypted: i=1; AL+hErHlGEgfgN7UPQ5QlKYX99GeZZjSQqY7Z/MTkU4jYQlFlvAAeSyTTiq/JcM5gIDDXG8+/8EgZWGNx6aXDzGc@lists.infradead.org
X-Gm-Message-State: APuU4Z8TB6EF29Y+NhcyNSD2trhQ+FpHoBgdeIMAOkLD9n2Aa7Oz3dn+
	JTehgIYm8lHLGYwu3cl7Dvy25FzXIoiOo75HGuP+Tus5E51gZxtLveF6c0zQlQVVPGY=
X-Gm-Gg: AZFdTZc1iX0mq/pOhLLeUA7oVYfyp8dTwZbN80e43gL0y2mT/gh3SgeB+54lkccrAVW
	PEAeX33GKfppI0vl/Qbiw+OoYAn2c1ADjY9Oxuk2AGVXu1qWgpNk+7zpycEVr3EtzVUIFOqIOon
	UKu+MAS5pdDnkOMQw234y8HbKpJX3AvhTPsKYOo3wN3Ij2Tl/5vGMqY6k6ERhjLICisQfKODo2J
	XB0+gNgWfMtiRDVxBW1m21zvHVgYp5sdfewUjZuD0aH618whD+3t/ltihO0qebOWvSfhtvzBcd9
	26fWwKu9pona6oWiarZLYSuBI7C93qx7byNoYF6ZA5MDIsRqjckP9KR2GP4QlzfLaOmwimkuArD
	6QfzF3+WfslLfgY2xsMKEi0tCacW4OoAKW1V+KqsVSQE8awN6iZnMsd6wNhKTi6DifY/S+DLhX+
	pRwTvp9A7e3hPCBZx3uIKpsJDMmIalesbgW+vhKyQidOwRHLsHZwg4bmijV5012Q7pQOXgzt0fW
	m5dEL3VVLlqM5fWqDsyUPxdSXWfzINw1/sZeIFXRe8LLFJnYUcEIJGV1Dx6Y5QZo2PrIEnWiCon
	6qpkA52TcMSYTiJ47n8xLXfqFeIVkFjDziY+z3JwmjVSuxIRwC4nFqD+JmRG/td78K3FMUyFiq/
	2H2hSg+vzRmFDg0EjUb3G3NCytPLlQIOwhoFgeJz9T+KHjg==
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr245433325e9.7.1795425651076;
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:50 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:45 +0100
Subject: [PATCH 1/3] arm64: dts: amlogic: s7: add the SCMI firmware node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-upstream-s7-clk-dt-v1-1-95f46d67d8b4@baylibre.com>
References: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
In-Reply-To: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_012106_619393_E6E96AAC 
X-CRM114-Status: GOOD (  11.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The firmware of the Amlogic S7 SoC family exposes the clocks it owns
over SCMI. Add the SCMI node, its shared memory and a header with the
SCMI clock IDs.

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h | 27 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi       | 29 +++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h b/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h
new file mode 100644
index 000000000000..71630bc94531
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef __DTS_AMLOGIC_S7_SCMI_CLK_H
+#define __DTS_AMLOGIC_S7_SCMI_CLK_H
+
+#define CLKID_DDR_PHY_OSC			0
+#define CLKID_USB1_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_HDMI_PLL_OSC			3
+#define CLKID_USB0_PHY_PLL_OSC			4
+#define CLKID_USB1_PHY_PLL_OSC			5
+#define CLKID_USB0_PLL_OSC			6
+#define CLKID_ETH_PLL_OSC			7
+#define CLKID_ADC_PLL_OSC			8
+#define CLKID_CPU_CLK				9
+#define CLKID_DSU_CLK				10
+#define CLKID_GP1_PLL				11
+#define CLKID_ACLKM				12
+#define CLKID_PWM_G				13
+#define CLKID_PWM_H				14
+#define CLKID_PWM_I				15
+#define CLKID_PWM_J				16
+
+#endif /* __DTS_AMLOGIC_S7_SCMI_CLK_H */
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 64440df4f542..69dec312e7d6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>
+#include "amlogic-s7-scmi-clk.h"
 
 / {
 	cpus {
@@ -109,6 +110,34 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	sram@50f6000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x050f6000 0x0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0x050f6000 0x100>;
+
+		scmi_shmem: sram@0 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x100>;
+		};
+	};
+
+	firmware {
+		scmi: scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x820000c1>;
+			shmem = <&scmi_shmem>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
