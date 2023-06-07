Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F54C7EE23
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+62ebMzHHdpA7RujIaB9xckS/1R0unudNGOpcH0Tpk=; b=hz4cAmbBXIYmLQ
	WLMwb1hPtM26FjDBTwQeSaLMl0paWiFyltGfQQkSXg4fy6muhIirKqoAm6uihx58p9LscmWq1SXbN
	YryGjqXwrCcVHNsuWRjpZVXBVIxgKaa1pY9STNlz/aRhHRNNlyH3xhZU9DwZKOSKcEeTkusCnV6Pc
	F8294VI8RyQ13xgl26nWz3oI+MHXL4zYrCUKPVPAKBEKLT4Vj6L+Swk2hHx7kVB4KWQyDOZQhFzHY
	aKbGKfJTiZCfm8EpzxAK+spdgLQXppyf9CtFtHaW1BKNbUWUc4ghp3v1yxyA0O2uZymtE0WDAbMsS
	RdlCyLz2w9s3oCZRXu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rfg-005go5-2P;
	Wed, 07 Jun 2023 11:49:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rff-005gnL-0T
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Jun 2023 11:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TTcB7fhvFZXuSVWwIsQAqPywer1oTBzWj1Dj0kwpdmg=; b=rBCU2UwHd5xKMySppr0jiGqz1N
	1Xgi23+25dgj+DobgIHZL4bl/fklD1fMaq2hbO1I8sKms5VIIHSqELEmXC8i1WQ5E/DjTvTLqCTwf
	ekECSsLX6epNHDBlLVpnyP/71SQHq6SVM62h+Wmr2QralCAfHUr1AY4aojhZnrBEkDwrieinesJF3
	zzLHUK4wYIFX3044Yk3G/X/p3Cf2ZjJmkgskoTHyOhneB248BlNzZSih4S0QVhNoiudRKN3oS3Kxu
	N1nAuPKG3l9D7KWjVDpUySX6E1jARcLH0yE56n/8ehPAO9VWWv8P9BaBvdfh0hZIJiY3e8Pdxxdkn
	g+ZhbHzA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qq9-0057xT-0w
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jun 2023 10:56:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3094910b150so7279477f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 03:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135389; x=1688727389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTcB7fhvFZXuSVWwIsQAqPywer1oTBzWj1Dj0kwpdmg=;
        b=AVxfAGTqsO3F9VB2LBNBJEbp/WcziRZhsovq5RbHqPyZ7E3qxrySl7P3MC792JXYOq
         gjkpwLBdjQFKX2Rq95cU3q+6EPL1dqqEmn7VlK2DW9clURYnZ/q35VrokfhSr2ILYAXm
         +Q0nxH9NfbK5o1ZAYL/jWbVTa+b/gBwDGBH3sq7vvDKidtXg38trxhAaGgzu7GZ6QVQn
         5fcQgbHMEv8bQCbiaM97uWAEiFwD2Qkwoy9hNb8a0GLmidgoL6EPW9jZ6A77a3afpWkX
         o8Y3vYeqCTcifkPlE/S3NM/YBzpczOXjeo2xC26JcUFZtU09ub0ioSnUYrQE1BEle77t
         /trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135389; x=1688727389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTcB7fhvFZXuSVWwIsQAqPywer1oTBzWj1Dj0kwpdmg=;
        b=U7LHL+Erq9lJhMPwhijMPnK1qt7qz+z7XXLZyVS3TPy9mlplpfalp2trWLe3fzKBF1
         1V38cIfiSMF7gMm8aXZ9GdHquLVvArwqXWF3ZiDM/AnqtcVfpyAWmOTdydE9v5av9gre
         eltWi319Kz+dQEVPvnYZ03+bu6ooSC51qCDJn0JHShAD1UEo3wfVPgK9/OhfuSKbOWz3
         4tAUgH6GtylpgxRWCwbs/V+pmSOiGx+F2FxfIEeP7BJcQIkjhtmCtCT4YwfZ7HHmTww3
         VO/GGr5NSsUgwD6F7ex0WCdCHLmtsrWRy9QbWcobbfc9RD6yVBBM2pplh+lL4Ipc2dYc
         xCtg==
X-Gm-Message-State: AC+VfDwGTqhiGr4pZsps1QDIyq3xCBmBDGqlM1eAd4kB0dva9eaBjLOP
	WnCL9NYsxK8+9DFWrzowS1E+mg==
X-Google-Smtp-Source: ACHHUZ4fumcrKb8pooiAOdPPz0B8CCI+n6EuNqbae5B4JgTIBFlK+dELGeYqUfhpIfRCX9dJdTEANQ==
X-Received: by 2002:a5d:464c:0:b0:30d:779a:111d with SMTP id j12-20020a5d464c000000b0030d779a111dmr4284506wrs.17.1686135389303;
        Wed, 07 Jun 2023 03:56:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 07 Jun 2023 12:56:17 +0200
Subject: [PATCH 06/18] dt-bindings: clk: gxbb-clkc: expose all clock ids
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-6-9676afa6b22c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8016;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KiKGGALlXn5bKD15xyCXq+2b6M4JCPjE8pgNXBuK/xo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJQnOEa43QHK7iLufgTFPbo9+zefPo3FS6933Jm
 YhRfR9OJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiUAAKCRB33NvayMhJ0V+mEA
 DLptDPB1zQk77Q7NvjeIu/6JAlaXYpRMCUKJtt/DC52QuI2C78LuipBWsT6dlV5w1xxjkOBPkc8D67
 jy2OYlh9iCPP4ttqQ+p9gXv6DSfdK5e9kBe4b7nuVwxr+sOyNobWb/2dQPQez0y4yVIAjPzL9NTJWW
 YZNLEJOLcXbn/vcR3669VBkkgOK0q4vOtmvKD5wiiJ3Grl4DU7SOm2Y+OJY0BvSPh/+VxORrrdMFpP
 5MHqDoahaBlhInA/MMszjrIfdWdimNJvJEOCF6Yv+Hr3+kfAtBSdQI33ZtiCEOveqJ6HZrXs10NQTl
 3hZq1XCFS0LdpPJYU2MkR2+e5ekjeELPFTXi+5Tu4NVtCp47oHZrzVMNldtvHUuBb5lInIhhn18YDy
 VE/rs7inxAcp7IYoMjKlY9EVrtr1uRXCNhJZ7eIOYVkfkmai66zwWrLZ4R9YKYbuuZWvJZ+akbqaW4
 ZDXujm4IoPJqm3a8gj/SvDCaGruVlpOnngHgi0vqIyYLRaAglL0frIercFL/GZepkOAY3W32oxzN0X
 q/XQmfwrZ0s51jyM+MmVq6KHazDlakyMENSQRN5FyIcYbWSI9HVSDP0AxRLhM50LvGW5LU8PMkxP79
 txfqPU25SgJr3JpXW4nZDhJEKkqsSFxxTwiDgGKB/U6gV1hw4t2CZdUKXlog==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_115633_749498_1B926ADD 
X-CRM114-Status: GOOD (  13.11  )
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

It was decided to move every gxbb-clkc ID to the public clock
dt-bindings headers to be merged in a single tree so we
can safely add new clocks without having merge issues.

[1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
[2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/gxbb.h              | 76 -----------------------------------
 include/dt-bindings/clock/gxbb-clkc.h | 65 ++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 76 deletions(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 6751cda25986..798ffb911103 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -112,82 +112,6 @@
 #define HHI_BT656_CLK_CNTL		0x3D4 /* 0xf5 offset in data sheet */
 #define HHI_SAR_CLK_CNTL		0x3D8 /* 0xf6 offset in data sheet */
 
-/*
- * CLKID index values
- *
- * These indices are entirely contrived and do not map onto the hardware.
- * It has now been decided to expose everything by default in the DT header:
- * include/dt-bindings/clock/gxbb-clkc.h. Only the clocks ids we don't want
- * to expose, such as the internal muxes and dividers of composite clocks,
- * will remain defined here.
- */
-/* ID 1 is unused (it was used by the non-existing CLKID_CPUCLK before) */
-#define CLKID_MPEG_SEL		  10
-#define CLKID_MPEG_DIV		  11
-#define CLKID_SAR_ADC_DIV	  99
-#define CLKID_MALI_0_DIV	  101
-#define CLKID_MALI_1_DIV	  104
-#define CLKID_CTS_AMCLK_SEL	  108
-#define CLKID_CTS_AMCLK_DIV	  109
-#define CLKID_CTS_MCLK_I958_SEL	  111
-#define CLKID_CTS_MCLK_I958_DIV	  112
-#define CLKID_32K_CLK_SEL	  115
-#define CLKID_32K_CLK_DIV	  116
-#define CLKID_SD_EMMC_A_CLK0_SEL  117
-#define CLKID_SD_EMMC_A_CLK0_DIV  118
-#define CLKID_SD_EMMC_B_CLK0_SEL  120
-#define CLKID_SD_EMMC_B_CLK0_DIV  121
-#define CLKID_SD_EMMC_C_CLK0_SEL  123
-#define CLKID_SD_EMMC_C_CLK0_DIV  124
-#define CLKID_VPU_0_DIV		  127
-#define CLKID_VPU_1_DIV		  130
-#define CLKID_VAPB_0_DIV	  134
-#define CLKID_VAPB_1_DIV	  137
-#define CLKID_HDMI_PLL_PRE_MULT	  141
-#define CLKID_MPLL0_DIV		  142
-#define CLKID_MPLL1_DIV		  143
-#define CLKID_MPLL2_DIV		  144
-#define CLKID_MPLL_PREDIV	  145
-#define CLKID_FCLK_DIV2_DIV	  146
-#define CLKID_FCLK_DIV3_DIV	  147
-#define CLKID_FCLK_DIV4_DIV	  148
-#define CLKID_FCLK_DIV5_DIV	  149
-#define CLKID_FCLK_DIV7_DIV	  150
-#define CLKID_VDEC_1_SEL	  151
-#define CLKID_VDEC_1_DIV	  152
-#define CLKID_VDEC_HEVC_SEL	  154
-#define CLKID_VDEC_HEVC_DIV	  155
-#define CLKID_GEN_CLK_SEL	  157
-#define CLKID_GEN_CLK_DIV	  158
-#define CLKID_FIXED_PLL_DCO	  160
-#define CLKID_HDMI_PLL_DCO	  161
-#define CLKID_HDMI_PLL_OD	  162
-#define CLKID_HDMI_PLL_OD2	  163
-#define CLKID_SYS_PLL_DCO	  164
-#define CLKID_GP0_PLL_DCO	  165
-#define CLKID_VID_PLL_SEL	  167
-#define CLKID_VID_PLL_DIV	  168
-#define CLKID_VCLK_SEL		  169
-#define CLKID_VCLK2_SEL		  170
-#define CLKID_VCLK_INPUT	  171
-#define CLKID_VCLK2_INPUT	  172
-#define CLKID_VCLK_DIV		  173
-#define CLKID_VCLK2_DIV		  174
-#define CLKID_VCLK_DIV2_EN	  177
-#define CLKID_VCLK_DIV4_EN	  178
-#define CLKID_VCLK_DIV6_EN	  179
-#define CLKID_VCLK_DIV12_EN	  180
-#define CLKID_VCLK2_DIV2_EN	  181
-#define CLKID_VCLK2_DIV4_EN	  182
-#define CLKID_VCLK2_DIV6_EN	  183
-#define CLKID_VCLK2_DIV12_EN	  184
-#define CLKID_CTS_ENCI_SEL	  195
-#define CLKID_CTS_ENCP_SEL	  196
-#define CLKID_CTS_VDAC_SEL	  197
-#define CLKID_HDMI_TX_SEL	  198
-#define CLKID_HDMI_SEL		  203
-#define CLKID_HDMI_DIV		  204
-
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/gxbb-clkc.h>
 
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index 4073eb7a9da1..c0ce5e9c4151 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -15,6 +15,8 @@
 #define CLKID_FCLK_DIV5		7
 #define CLKID_FCLK_DIV7		8
 #define CLKID_GP0_PLL		9
+#define CLKID_MPEG_SEL		10
+#define CLKID_MPEG_DIV		11
 #define CLKID_CLK81		12
 #define CLKID_MPLL0		13
 #define CLKID_MPLL1		14
@@ -102,35 +104,92 @@
 #define CLKID_SD_EMMC_C		96
 #define CLKID_SAR_ADC_CLK	97
 #define CLKID_SAR_ADC_SEL	98
+#define CLKID_SAR_ADC_DIV	99
 #define CLKID_MALI_0_SEL	100
+#define CLKID_MALI_0_DIV	101
 #define CLKID_MALI_0		102
 #define CLKID_MALI_1_SEL	103
+#define CLKID_MALI_1_DIV	104
 #define CLKID_MALI_1		105
 #define CLKID_MALI		106
 #define CLKID_CTS_AMCLK		107
+#define CLKID_CTS_AMCLK_SEL	108
+#define CLKID_CTS_AMCLK_DIV	109
 #define CLKID_CTS_MCLK_I958	110
+#define CLKID_CTS_MCLK_I958_SEL	111
+#define CLKID_CTS_MCLK_I958_DIV 112
 #define CLKID_CTS_I958		113
 #define CLKID_32K_CLK		114
+#define CLKID_32K_CLK_SEL	115
+#define CLKID_32K_CLK_DIV	116
+#define CLKID_SD_EMMC_A_CLK0_SEL 117
+#define CLKID_SD_EMMC_A_CLK0_DIV 118
 #define CLKID_SD_EMMC_A_CLK0	119
+#define CLKID_SD_EMMC_B_CLK0_SEL 120
+#define CLKID_SD_EMMC_B_CLK0_DIV 121
 #define CLKID_SD_EMMC_B_CLK0	122
+#define CLKID_SD_EMMC_C_CLK0_SEL 123
+#define CLKID_SD_EMMC_C_CLK0_DIV 124
 #define CLKID_SD_EMMC_C_CLK0	125
 #define CLKID_VPU_0_SEL		126
+#define CLKID_VPU_0_DIV		127
 #define CLKID_VPU_0		128
 #define CLKID_VPU_1_SEL		129
+#define CLKID_VPU_1_DIV		130
 #define CLKID_VPU_1		131
 #define CLKID_VPU		132
 #define CLKID_VAPB_0_SEL	133
+#define CLKID_VAPB_0_DIV	134
 #define CLKID_VAPB_0		135
 #define CLKID_VAPB_1_SEL	136
+#define CLKID_VAPB_1_DIV	137
 #define CLKID_VAPB_1		138
 #define CLKID_VAPB_SEL		139
 #define CLKID_VAPB		140
+#define CLKID_HDMI_PLL_PRE_MULT	141
+#define CLKID_MPLL0_DIV		142
+#define CLKID_MPLL1_DIV		143
+#define CLKID_MPLL2_DIV		144
+#define CLKID_MPLL_PREDIV	145
+#define CLKID_FCLK_DIV2_DIV	146
+#define CLKID_FCLK_DIV3_DIV	147
+#define CLKID_FCLK_DIV4_DIV	148
+#define CLKID_FCLK_DIV5_DIV	149
+#define CLKID_FCLK_DIV7_DIV	150
+#define CLKID_VDEC_1_SEL	151
+#define CLKID_VDEC_1_DIV	152
 #define CLKID_VDEC_1		153
+#define CLKID_VDEC_HEVC_SEL	154
+#define CLKID_VDEC_HEVC_DIV	155
 #define CLKID_VDEC_HEVC		156
+#define CLKID_GEN_CLK_SEL	157
+#define CLKID_GEN_CLK_DIV	158
 #define CLKID_GEN_CLK		159
+#define CLKID_FIXED_PLL_DCO	160
+#define CLKID_HDMI_PLL_DCO	161
+#define CLKID_HDMI_PLL_OD	162
+#define CLKID_HDMI_PLL_OD2	163
+#define CLKID_SYS_PLL_DCO	164
+#define CLKID_GP0_PLL_DCO	165
 #define CLKID_VID_PLL		166
+#define CLKID_VID_PLL_SEL	167
+#define CLKID_VID_PLL_DIV	168
+#define CLKID_VCLK_SEL		169
+#define CLKID_VCLK2_SEL		170
+#define CLKID_VCLK_INPUT	171
+#define CLKID_VCLK2_INPUT	172
+#define CLKID_VCLK_DIV		173
+#define CLKID_VCLK2_DIV		174
 #define CLKID_VCLK		175
 #define CLKID_VCLK2		176
+#define CLKID_VCLK_DIV2_EN	177
+#define CLKID_VCLK_DIV4_EN	178
+#define CLKID_VCLK_DIV6_EN	179
+#define CLKID_VCLK_DIV12_EN	180
+#define CLKID_VCLK2_DIV2_EN	181
+#define CLKID_VCLK2_DIV4_EN	182
+#define CLKID_VCLK2_DIV6_EN	183
+#define CLKID_VCLK2_DIV12_EN	184
 #define CLKID_VCLK_DIV1		185
 #define CLKID_VCLK_DIV2		186
 #define CLKID_VCLK_DIV4		187
@@ -141,10 +200,16 @@
 #define CLKID_VCLK2_DIV4	192
 #define CLKID_VCLK2_DIV6	193
 #define CLKID_VCLK2_DIV12	194
+#define CLKID_CTS_ENCI_SEL	195
+#define CLKID_CTS_ENCP_SEL	196
+#define CLKID_CTS_VDAC_SEL	197
+#define CLKID_HDMI_TX_SEL	198
 #define CLKID_CTS_ENCI		199
 #define CLKID_CTS_ENCP		200
 #define CLKID_CTS_VDAC		201
 #define CLKID_HDMI_TX		202
+#define CLKID_HDMI_SEL		203
+#define CLKID_HDMI_DIV		204
 #define CLKID_HDMI		205
 #define CLKID_ACODEC		206
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
