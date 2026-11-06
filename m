Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46641606D824
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0t/oKppN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b9PsTNz7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tIWM67uvHG9WOMzEZG8+5fruL1F5rGyVk/8L0ghVcco=; b=0t/oKppN9JrL4tWWg5zQRWO8k4
	FDiKSN5jiu5xRNZ5HutyNxc+9bxmmBmKavOBllzKqGBvt4bFRFz7yKsCnfBl+0oy8TABRziGBWgda
	f2wp+gBKQ1KOklLxGs5ft/EavywZnx9yZkfMUVX1si9mtr1gmi643JrHZKP3HSKDfwLf0fYpXSZKS
	moK7EEmASArYe/JOQA7EYwdvN3I0sbqSueXkveN7F4PzwreAFaxXLb/LflnRlYd9i8uv1up7VPY3P
	lGlTRFu8uYg09EPHlrfF0cIkr5lCPf+7LhBwckzDSe38f6CVdlb68M3w2U6//v4CuvVq8ZjIcOId2
	5z9tFPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLR-0000000BZqk-1ajm;
	Fri, 06 Nov 2026 08:30:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLK-0000000BZfo-2QvM
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso904502f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 00:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953837; x=1794558637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b25tkkPNAeRRnpE+CMTponpLZXifzTvvMAoqNcMPDG8=;
        b=b9PsTNz7w9zvD8j7m4caYFKGA5Qm4IyYu0qhTz0ySlMWOYBH67NkYjxFmcucYjxq2a
         E5dhwjBHRFpqkR37Cbe1K/r/uv23ehwKP4bH4e7QtXZNgf5OAOR+EAz3zTi7CqOtDcAC
         SZiM4kYc1MNqiAy/AWzZUmNrbLjbpLHL4HtVRFW60pA+zKEjMYDXyRhApufs0triRZd2
         2tGelmHkUYGd1VSoveE9MzHOvaE4ijnZAa+WzIRM5OxUckUo7Uw4Pvl+PAFqhkmUWiEc
         sn7M99335G+4KAz4TG4TpzcMPtV+YBzea1VPUpF18SrS5ld8EHN75G3pVaiFKsc8fwN1
         0XWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953837; x=1794558637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b25tkkPNAeRRnpE+CMTponpLZXifzTvvMAoqNcMPDG8=;
        b=hskvJdrU8caROJl3G89QUNOWNpugroIo8pF0RWydXcxAPWDPvUBMAzKBepMvCRdcr/
         T2Pv7QNYWA0vW0FcCTrlasSFcLo1Xnv3BSWFw/u8pGRGD/WYVSrquX5mqTW+Gqi3k+6J
         /iaoi/CSd9R4uOa9Uc2JJVftri3UHdLN5MsW3+vSIQNYfQYBS4cL49Q4j8NJ9q7la5jB
         Dnp/7nLlWstx0X4hJJOzUV8UTdYBDQUPt6iz9pi+7Dt+Oh/yVlqvp2VrYbFFgl5JAPzt
         5Z8Kvd+G8jTs4KgZWbbtMhn4FoXWDMCRFoMr84At2SEoGiRK5dmqzJ/SPMPeC2XeWs7y
         28zg==
X-Forwarded-Encrypted: i=1; AL+hErH7abXbW7D/23812Rp7rZyQglt39cP40hzL243Li87sIu5dvf8U83xaIh6uKOTaLNHXJPXov/devT+5+8Os@lists.infradead.org
X-Gm-Message-State: APuU4Z9cNT2XUBVlX9FosSTexldV2wQ5oFwnzkoiDxstwEHULtD6BSuG
	KwQ/2nNWyS/UoB4mT5/ivoCqTXcWdyyhcxM5bPM6WT5mwo/t5Wmxax+gf0DNBxw9cd0=
X-Gm-Gg: AYBFou1PYRlgT5Kn6vEJQFpKcGX3Dy/29EGySQxj6d55p2g5cWjDOHLsIDQZ6z96hjS
	aMCiokOPWTm77wnTJr0DHUvhZXN/gxxLIIlK+eWz97x/YG1HPa2ehc7LN221U3P0FNKN+mQ+CV8
	wwbcHU6tKHGmOJOYliSPZde+jmSvEtMhe1UqNa/1y8h3qSrrJprejXlCd6jr1seYp1sRyR4F+MS
	1a7WOuXVkXYs0hwkTa0Lkijkzx3PbJ7C18tZQFLUkGhKbj3ti7YAukcboVLDkF1Ue2hvTG1bvpU
	0dinId4y9M1oQ4VW0RTv5miNP0CY0L2/tVHZxSIuDtGcLZxTss9VWoEVngZxA0kasqHrpiUEGOd
	mwfDmJ3DScGTC6+9PSVYjQGekMH/amBev0EdK1QBZm0wQLmauN5M9TB/jv00jAYsSUqXRDjfmdF
	Tygt1w5d7QZ/pD9+qVyL7eNzGTqx+fKUzD3vciqYwrfKe82k9mF4yoy6EUmYljAe+4fGgmkYEjp
	BQC5svosMpEdrg1hrYwH4lQyrkb+e3ack82zPr3OlawQqkKY5MaLbb3gvQob14tHCFuGuq+WDbv
	JyNptUXSui2xYABYZYOcJEJKQ0NSmMSTiTu+DBtYe7QUsTml0sQwfPpvJFrMhtr3oGc9/KI1/a/
	UkEjdtXjpMtwsghVQg1De5Otm0qb16NxFCoyZYnzb0+4glA==
X-Received: by 2002:a05:6000:469b:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-4911ab4c665mr5700123f8f.29.1793953836751;
        Fri, 06 Nov 2026 00:30:36 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:36 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:27 +0100
Subject: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003038_641538_5A7C8547 
X-CRM114-Status: GOOD (  10.91  )
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

The S7 PLL controller supplies clock sources for the peripheral clock
tree and receives its reference clocks through firmware-controlled
oscillator gates.

Add the binding and clock identifiers needed to describe this
controller and its connections.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        | 73 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    | 42 +++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
new file mode 100644
index 000000000000..e2b5ba5524a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 BayLibre, SAS.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s7-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S7 Series PLL Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Carlo Caione <ccaione@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,s7-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: input fixed pll
+      - description: input gp0 pll
+      - description: input hifi pll
+      - description: input hifi1 pll
+      - description: input hdmi pll
+
+  clock-names:
+    items:
+      - const: fix
+      - const: gp0
+      - const: hifi
+      - const: hifi1
+      - const: hdmi
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@8000 {
+            compatible = "amlogic,s7-pll-clkc";
+            reg = <0x0 0x8000 0x0 0x1e8>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_HDMI_PLL_OSC>;
+            clock-names = "fix",
+                          "gp0",
+                          "hifi",
+                          "hifi1",
+                          "hdmi";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,s7-pll-clkc.h b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
new file mode 100644
index 000000000000..4014314a3eb0
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL_VCO			0
+#define CLKID_FIXED_PLL				1
+#define CLKID_FCLK_DIV2_DIV			2
+#define CLKID_FCLK_DIV2				3
+#define CLKID_FCLK_DIV3_DIV			4
+#define CLKID_FCLK_DIV3				5
+#define CLKID_FCLK_DIV4_DIV			6
+#define CLKID_FCLK_DIV4				7
+#define CLKID_FCLK_DIV5_DIV			8
+#define CLKID_FCLK_DIV5				9
+#define CLKID_FCLK_DIV7_DIV			10
+#define CLKID_FCLK_DIV7				11
+#define CLKID_FCLK_DIV2P5_DIV			12
+#define CLKID_FCLK_DIV2P5			13
+#define CLKID_GP0_PLL_DIV0P5			14
+#define CLKID_GP0_PLL_VCO			15
+#define CLKID_GP0_PLL				16
+#define CLKID_HIFI_PLL_DIV0P5			17
+#define CLKID_HIFI_PLL_VCO			18
+#define CLKID_HIFI_PLL				19
+#define CLKID_HIFI1_PLL_DIV0P5			20
+#define CLKID_HIFI1_PLL_VCO			21
+#define CLKID_HIFI1_PLL				22
+#define CLKID_HDMI_PLL_DIV0P5			23
+#define CLKID_HDMI_PLL_VCO			24
+#define CLKID_HDMI_PLL_OD0			25
+#define CLKID_HDMI_PLL_OD1			26
+#define CLKID_HDMI_PLL				27
+#define CLKID_HDMI_PLL_PIX_DIV5			28
+#define CLKID_HDMI_PLL_PIX_DIV6P25		29
+#define CLKID_HDMI_PLL_PIX_DIV7P5		30
+#define CLKID_HDMI_PLL_PIX			31
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H */

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
