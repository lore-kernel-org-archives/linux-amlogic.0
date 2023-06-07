Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E862C7EE2F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYiLtQHBRE7qJyZ1AbyO8qziuQ4wD2HsR48ZCdPqAuk=; b=lk2cP2tR7utpvK
	M32zCQ199ggdhn2cKEjGeSIuujwqpMQGtJUvfNvbq039+Io4BgEnNw/AwbinCsIRv46qAVbPI75Q0
	tP4I3vU1Qb5Y1ju7gd0n+ULv4y1K75Mn/QpLOcGcrtrX+yEEoMUXR8oxTPrs6HZ7cAme+CC2nA+Yj
	e6XvgdF9273S6mtG1s69k9U6jBFdGMb5VDkluQPcCUzw2o2MG//ujzY5UhG6Kh4KQXbKavG/sg0uQ
	RlFVBpCucvpEhTI+Y3/9Ap6eNs12HUpXfLdRZJtykRmVZe0IHPYQHFk8pbCZwCc4NFudoqi9wKD/5
	ySziKWfKny1q5HqWgb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rqG-005jHy-0G;
	Wed, 07 Jun 2023 12:00:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qq6-005ZId-2V
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jun 2023 10:56:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so60387805e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 03:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135390; x=1688727390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyd9pt/YpzMBH88qjOs9+364TxIGbPNac8NRrW3GLXc=;
        b=v/X1m4SzefyOYsM7/gHRjW+n0qRdrj36fExZw2X3JPzPM5K859xx9jpvRatdLFDsAX
         cmoBExnCL9YzCvD0svrytnN6ysqIIpww1TVM/Qe32qyN2J5pnpOgOmAORIfK2C8vtUEk
         nqRs2+Z2BymouhTHWgCtgR6Q8AFZahnoqLE5Hc+3wQ4Q5VlZ9uRkXgO67vOuJxm1gmLa
         haOBV0IoWbujxQ6sr3Ngvt8wynie7BkNvvWp+chHa+Kiney5bSoJ4ck85f8xqYflGdvP
         2j72yNNRKbwcYV1ydDrYZL1/5UAngLwVn8kW52VucK0Y1kNYJxiZJXRrJmidJO7R5CM9
         FVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135390; x=1688727390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyd9pt/YpzMBH88qjOs9+364TxIGbPNac8NRrW3GLXc=;
        b=Qi0E4HfsGZTwuSKmyTkyKF3+xnz4imMKIysziN1KvKIx3a0YdAHNKMcfMuctN0UpTG
         Q89kKX+pFkkCqhEUqadQ667QvkLv3B2eyFuDlxBvSbBd/kwapi0dNSiFnIPIl2Vu1KwN
         bMgRVu+Xnbr6EihPPuC13KY+nT1sgUGCV9aYRJDgdw6kkNp94QUD8oj07Lb/MkShdqKb
         dxqaGNZNeDAvqRZMtWl+9GV1Qez24EExFfUJcfPImrwVUGfHZueJxRb2Xo2VnWRIQ81K
         LblzGpCPhP+QpVSJdPi/nrIdpDnB55l1mk0KMblTF2l7yN4LQrRc3dsmBr0ePiK0gZjG
         yvZA==
X-Gm-Message-State: AC+VfDx4hzHminFq54/y8lmRdooaHruLMovQWj0xL1hInaViWmqQZvp8
	aNkVp2dvAz59VRvXN16qB8qJpQ==
X-Google-Smtp-Source: ACHHUZ4GXlu6cnBvC2IgV+75v/ClB9iHfmUdGRkoOPm8iksSQOQo7VlUn8Ivee98twHjGUxH7tZv4g==
X-Received: by 2002:a05:600c:2158:b0:3f7:c596:31c2 with SMTP id v24-20020a05600c215800b003f7c59631c2mr4264535wml.16.1686135390298;
        Wed, 07 Jun 2023 03:56:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 07 Jun 2023 12:56:18 +0200
Subject: [PATCH 07/18] dt-bindings: clk: axg-clkc: expose all clock ids
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-7-9676afa6b22c@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6307;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=i559U+duYxVWd6eTXv6zQ3nbveD84Ze4RuRj7ve9Lag=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJQg6OR7X4SkAl4D5b/HlCZPSlrXXDG4ksEvn/w
 uqeeiMyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiUAAKCRB33NvayMhJ0VOxD/
 9zwRsJrzD6SjolCp+RH+Z8Rf9e0SxeJBS5bP+JH11+AJ87nF+ZUzhF/e2aInq8kC/EjCC2iPmgTKfa
 GD2LYZw/6fDKYy1/KaIji70pSkk5bvzJSiRt02CHKXZql3BSJckTlopB6Eir8VRwIHHygDUrU+WydS
 doENJ6/Y5sQ6g8aSRg6ZHoNBKIFf6e1HP2OKjPBoT5G6gtooTr9JpraCbwv+nog6g0BgURqRv4H88k
 hwWDjLtd8Oso5h2i8znSCGSsOkk8ZZ7ZXE3faQH7Yge2ynqyl9TLxr1hZMnjelSeEh1QjRapsojh9F
 T45BrLoIBPVda/I46VC5wjnHSpw+H2fHjv2AE7hMtixmvGPT/j2juXMpTBzBOHIc/ZbB7BOLYpwzgk
 cPihShZ6t7f8YQ3GdnIhbefkkWdTT1SjSmBIqj5IGneDdMEqE7DZ+P3aWXK8Fks7ec/Z09dhZ+bUZT
 5fJEoC2S1Bq4gVvsrOabRg7VmH7MdKTuYQ5XF/bO7NS6UQcxve8NPwvq2HRK8QcOc2I9XCRneuR5Zq
 31epITdNgZehiXYJnInBcYMy1cV8AtRSlJ0mqyIhMLGkEHcjJuSNVzBYAmw7reeLL2L9Y4RSHAExYx
 bicWwQBbIz0rIi0QE1ntGoCZ/rD/lMhi7W3BGbMxRafJLqC59J7j2m2Xt+Ig==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_035630_842460_55277721 
X-CRM114-Status: GOOD (  12.98  )
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

Due to a policy change in clock ID bindings handling, expose
all the "private" clock IDs to the public clock dt-bindings
to move out of the previous maintenance scheme.

This refers to a discussion at [1] & [2] with Krzysztof about
the issue with the current maintenance.

It was decided to move every axg-clkc ID to the public clock
dt-bindings headers to be merged in a single tree so we
can safely add new clocks without having merge issues.

[1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
[2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/axg.h              | 58 ------------------------------------
 include/dt-bindings/clock/axg-clkc.h | 48 +++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 58 deletions(-)

diff --git a/drivers/clk/meson/axg.h b/drivers/clk/meson/axg.h
index 39f9e2db82bd..ed157532b4d7 100644
--- a/drivers/clk/meson/axg.h
+++ b/drivers/clk/meson/axg.h
@@ -102,64 +102,6 @@
 #define HHI_DPLL_TOP_I			0x318
 #define HHI_DPLL_TOP2_I			0x31C
 
-/*
- * CLKID index values
- *
- * These indices are entirely contrived and do not map onto the hardware.
- * It has now been decided to expose everything by default in the DT header:
- * include/dt-bindings/clock/axg-clkc.h. Only the clocks ids we don't want
- * to expose, such as the internal muxes and dividers of composite clocks,
- * will remain defined here.
- */
-#define CLKID_MPEG_SEL				8
-#define CLKID_MPEG_DIV				9
-#define CLKID_SD_EMMC_B_CLK0_SEL		61
-#define CLKID_SD_EMMC_B_CLK0_DIV		62
-#define CLKID_SD_EMMC_C_CLK0_SEL		63
-#define CLKID_SD_EMMC_C_CLK0_DIV		64
-#define CLKID_MPLL0_DIV				65
-#define CLKID_MPLL1_DIV				66
-#define CLKID_MPLL2_DIV				67
-#define CLKID_MPLL3_DIV				68
-#define CLKID_MPLL_PREDIV			70
-#define CLKID_FCLK_DIV2_DIV			71
-#define CLKID_FCLK_DIV3_DIV			72
-#define CLKID_FCLK_DIV4_DIV			73
-#define CLKID_FCLK_DIV5_DIV			74
-#define CLKID_FCLK_DIV7_DIV			75
-#define CLKID_PCIE_PLL				76
-#define CLKID_PCIE_MUX				77
-#define CLKID_PCIE_REF				78
-#define CLKID_GEN_CLK_SEL			82
-#define CLKID_GEN_CLK_DIV			83
-#define CLKID_SYS_PLL_DCO			85
-#define CLKID_FIXED_PLL_DCO			86
-#define CLKID_GP0_PLL_DCO			87
-#define CLKID_HIFI_PLL_DCO			88
-#define CLKID_PCIE_PLL_DCO			89
-#define CLKID_PCIE_PLL_OD			90
-#define CLKID_VPU_0_DIV				91
-#define CLKID_VPU_1_DIV				94
-#define CLKID_VAPB_0_DIV			98
-#define CLKID_VAPB_1_DIV			101
-#define CLKID_VCLK_SEL				108
-#define CLKID_VCLK2_SEL				109
-#define CLKID_VCLK_INPUT			110
-#define CLKID_VCLK2_INPUT			111
-#define CLKID_VCLK_DIV				112
-#define CLKID_VCLK2_DIV				113
-#define CLKID_VCLK_DIV2_EN			114
-#define CLKID_VCLK_DIV4_EN			115
-#define CLKID_VCLK_DIV6_EN			116
-#define CLKID_VCLK_DIV12_EN			117
-#define CLKID_VCLK2_DIV2_EN			118
-#define CLKID_VCLK2_DIV4_EN			119
-#define CLKID_VCLK2_DIV6_EN			120
-#define CLKID_VCLK2_DIV12_EN			121
-#define CLKID_CTS_ENCL_SEL			132
-#define CLKID_VDIN_MEAS_SEL			134
-#define CLKID_VDIN_MEAS_DIV			135
-
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/axg-clkc.h>
 
diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index 93752ea107e3..442162822b88 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -16,6 +16,8 @@
 #define CLKID_FCLK_DIV5				5
 #define CLKID_FCLK_DIV7				6
 #define CLKID_GP0_PLL				7
+#define CLKID_MPEG_SEL				8
+#define CLKID_MPEG_DIV				9
 #define CLKID_CLK81				10
 #define CLKID_MPLL0				11
 #define CLKID_MPLL1				12
@@ -67,23 +69,66 @@
 #define CLKID_AO_I2C				58
 #define CLKID_SD_EMMC_B_CLK0			59
 #define CLKID_SD_EMMC_C_CLK0			60
+#define CLKID_SD_EMMC_B_CLK0_SEL		61
+#define CLKID_SD_EMMC_B_CLK0_DIV		62
+#define CLKID_SD_EMMC_C_CLK0_SEL		63
+#define CLKID_SD_EMMC_C_CLK0_DIV		64
+#define CLKID_MPLL0_DIV				65
+#define CLKID_MPLL1_DIV				66
+#define CLKID_MPLL2_DIV				67
+#define CLKID_MPLL3_DIV				68
 #define CLKID_HIFI_PLL				69
+#define CLKID_MPLL_PREDIV			70
+#define CLKID_FCLK_DIV2_DIV			71
+#define CLKID_FCLK_DIV3_DIV			72
+#define CLKID_FCLK_DIV4_DIV			73
+#define CLKID_FCLK_DIV5_DIV			74
+#define CLKID_FCLK_DIV7_DIV			75
+#define CLKID_PCIE_PLL				76
+#define CLKID_PCIE_MUX				77
+#define CLKID_PCIE_REF				78
 #define CLKID_PCIE_CML_EN0			79
 #define CLKID_PCIE_CML_EN1			80
+#define CLKID_GEN_CLK_SEL			82
+#define CLKID_GEN_CLK_DIV			83
 #define CLKID_GEN_CLK				84
+#define CLKID_SYS_PLL_DCO			85
+#define CLKID_FIXED_PLL_DCO			86
+#define CLKID_GP0_PLL_DCO			87
+#define CLKID_HIFI_PLL_DCO			88
+#define CLKID_PCIE_PLL_DCO			89
+#define CLKID_PCIE_PLL_OD			90
+#define CLKID_VPU_0_DIV				91
 #define CLKID_VPU_0_SEL				92
 #define CLKID_VPU_0				93
+#define CLKID_VPU_1_DIV				94
 #define CLKID_VPU_1_SEL				95
 #define CLKID_VPU_1				96
 #define CLKID_VPU				97
+#define CLKID_VAPB_0_DIV			98
 #define CLKID_VAPB_0_SEL			99
 #define CLKID_VAPB_0				100
+#define CLKID_VAPB_1_DIV			101
 #define CLKID_VAPB_1_SEL			102
 #define CLKID_VAPB_1				103
 #define CLKID_VAPB_SEL				104
 #define CLKID_VAPB				105
 #define CLKID_VCLK				106
 #define CLKID_VCLK2				107
+#define CLKID_VCLK_SEL				108
+#define CLKID_VCLK2_SEL				109
+#define CLKID_VCLK_INPUT			110
+#define CLKID_VCLK2_INPUT			111
+#define CLKID_VCLK_DIV				112
+#define CLKID_VCLK2_DIV				113
+#define CLKID_VCLK_DIV2_EN			114
+#define CLKID_VCLK_DIV4_EN			115
+#define CLKID_VCLK_DIV6_EN			116
+#define CLKID_VCLK_DIV12_EN			117
+#define CLKID_VCLK2_DIV2_EN			118
+#define CLKID_VCLK2_DIV4_EN			119
+#define CLKID_VCLK2_DIV6_EN			120
+#define CLKID_VCLK2_DIV12_EN			121
 #define CLKID_VCLK_DIV1				122
 #define CLKID_VCLK_DIV2				123
 #define CLKID_VCLK_DIV4				124
@@ -94,7 +139,10 @@
 #define CLKID_VCLK2_DIV4			129
 #define CLKID_VCLK2_DIV6			130
 #define CLKID_VCLK2_DIV12			131
+#define CLKID_CTS_ENCL_SEL			132
 #define CLKID_CTS_ENCL				133
+#define CLKID_VDIN_MEAS_SEL			134
+#define CLKID_VDIN_MEAS_DIV			135
 #define CLKID_VDIN_MEAS				136
 
 #endif /* __AXG_CLKC_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
