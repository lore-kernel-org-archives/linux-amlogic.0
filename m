Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727D5C83005
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNJuQR2IjkRvvo4XgW1hFtjdTNcSKjyVRc984CFV1jc=; b=mj7/V9EEcczJGh
	fpH549FroPT2UgysDDPuWS96kwqNGWAVCLH7Yw5pkQmv4J+SCmpyiqdTUV3HKk+SrOFfGxodkfgoy
	cQC8U/R5xiQ0p8xc03sq31O2VUjpDTo2F/yt9OqsejaRYMK8j1FSBx9jyTYVukYE5Y7L3GRNME4Zn
	hOqnSmoM41Sw0K5HB+YwpnmvF3r6VnQfOV7n/hB3J8NZX62E57I4HC39WtEXr52VkCftG0yh4SUNv
	ICs0DUkYzWh9v7n59nj5G1ttqESzebAifBHIoaxTJyalf0iRmwTyVy0uMxMzWntfWtd6WND0o4/Di
	jiTXQ5ZGyR7JldI4BFRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fHc-003gRB-0y;
	Mon, 12 Jun 2023 11:00:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eIw-003OTS-2i
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 09:57:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f732d37d7cso41647285e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jun 2023 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563862; x=1689155862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbHf+IL1LUbmb6bIQ1QnD8svIjDZEIHNq/iB5p8Ynhk=;
        b=CTb+JbZSehkVE0HBmMD8nFBIOP5MxvjlUhcFAkVaBX+ZyK4Nx6msQR4mKNX4SrUeiA
         B5JRS2kiSjv+ZAFh7USkX5+NXK+f/Y3hvnP6Rku9rHZXBFs792r3gIwGjugly9UCBMpb
         YHGX+VNEtCsEulkGcIOPXWTlIGpPchE4YWEAo1ry9NEbBrdD/Y0nUGMRU+EfIYtDAnWG
         Mycn6Ji9zO4VfyyOw4mSfXSRiM4cXhzMRZym0a/CBTcsqQSHuV1oQjVdX28eoj9jVkjG
         08WlKUFr4RBQh2B27+ysZC2Ps3mtcGXChHbggXr+D+SIbA7eSPSGl1fk8JKhxDESkQlB
         dZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563862; x=1689155862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbHf+IL1LUbmb6bIQ1QnD8svIjDZEIHNq/iB5p8Ynhk=;
        b=NDCCqS2GRMob6E2np93uqsCiVeU7j0HMyW00EU9CsGvPInGIotI7/oH22hUNiFlrGt
         kWlxF8hOl8FhgkvTI70KRUyEIBqz8D6DdTusiyNRZE8nKPsZQ4Kq84bVOOJZVML0301I
         qWehgkAxhJrSDYRvtPCo4t0KNj1yKPdJDXgkcgyFywFhH4OIZ4KY4OePMhrcls2Z13mq
         mnzrK6Wsp/rXjPXAt51RKEzMXdr5dZZJ+dwKLdyKh8rv2lOjcB7PuEyBYNF/RJYCw89O
         qNr++vbLhwJiX7W6V+4gAjY+2HtTgsuSqNioFTKqR+Ee0GFPvrTEMOZUYj5XaoArhmwg
         p/gQ==
X-Gm-Message-State: AC+VfDzO5gekDIuzC501IMh+tkiiRSBrTHBai9P4nWicE+fQsOUb8FPW
	9lr8NbMUTr8G388CWzp0ZKhIjw==
X-Google-Smtp-Source: ACHHUZ6rMKubV+Yhbfrj2CxwMvftqavvFeWQK2uCaIcsrBnmv7wMoQMJKcLAmbLz7GX/9MSakxfHsA==
X-Received: by 2002:a1c:7708:0:b0:3f8:1729:f879 with SMTP id t8-20020a1c7708000000b003f81729f879mr2690033wmi.16.1686563862384;
        Mon, 12 Jun 2023 02:57:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Jun 2023 11:57:25 +0200
Subject: [PATCH v2 08/19] dt-bindings: clk: axg-clkc: expose all clock ids
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-8-38172d17c27a@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6371;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zwAa2o57kccACRvdkvpBerSAII7cBtUnqpo6Vgi95qo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwIaAgDVc9AP5bZbhCnhZ83xloAs4gINtMKEiET
 wrT0kTOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsCAAKCRB33NvayMhJ0efvD/
 4x2N7+qvpkjBXMRMypdMS6fITuLX8rgeLZQYNmSK3EpXIswM0PMuafIXkr9huLD7OwJjiIO4k8s2ZE
 m5qtgQ+H+WvUzOYVtPpr0xqVrTvaRFjyuRF54MgcWzxappPAU6inch6t9BYSinZzPqOVgzXBn+EVLJ
 7ndzrvQk9Lh6NUmjZfJcJNY0MtmqQ1DNFoTjK6BySjFSzmRJkFmc/7iZ21F4MI+JhmXe0bvNFAYur7
 NuI/PpPSMen9bxPuKyRLEnLjSghHOblNaGeEpUaSWY7InEGyR2sUV0YWA8uqtqqOPOGeBY06Qhf7hl
 2e1Vkvk5rnR1aHNE46a1Ldp4P4YCt7kKhSba0gsfRt0g1jV7+a9GZWn+iPK2swUQoCrDBIEx7FbH6Q
 6WWj9mzww9+f84JFtQZxV2yPCuNw9mpJjeypFxgNByKpo6BcsG53Hz3JMAU8OPkHBvrJe6m+IP8ZPB
 MsR6hWLL27DcA06wQ8NUg5QXxZ4oHeRdxyN7T6OKOwlv9VtEhnQpBcnBYJkKD0Z6wtU7ZvCrN1Ynuo
 wf3BE27wE82c1SqJ/MWntfAOwWMTa2IeyvNe2JxBKstsIbDrkAMvGOiV7XrL8aqPpYJyb1B+lyODsG
 IpDzxZJByEdf+6ZJ5v/F9YiOXUda6l+hZTez1nnqvrUzBmJTrU2IfKjJokkw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_025742_943044_C6979241 
X-CRM114-Status: GOOD (  12.64  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
