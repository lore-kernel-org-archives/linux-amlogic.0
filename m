Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B079C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqsU89fDEpLLFzjyGMw1+D/sAKgFipIzHDUGn63pUwI=; b=4CN3dKY4usUjx2
	PQ5/yFCK9OvYx7Ccomh75E4Ysn/vJoZmLT0iA/h1V0fPQLQsexSxmFoklQY0x3vd7aJyHFlZur/tP
	wcVzMqgBTS3ZC5kD/l9YTZxvWOsT07jKy9HepOiujY/k3uP94fGT7L6LP+LCXV1nHoPYRvA81PDz7
	RHii3nohmjIwvdoyu53iJy5FEfLZnJ12oVZDFKctmm3ZuVjx0ge9KHOOYqc907rcqDO5pDUOkT4R2
	Zy7ybomDiqOgK4UtAZfPcULsYw7moQ0cwyKzm13sV40mNW/Jstf6cBmNaUWupuApV12i8IW0F2fyS
	CWeHTodnfWzlBOmxVA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fHg-003gVt-1o;
	Mon, 12 Jun 2023 11:00:28 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eJ1-003ObK-2F
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 09:57:53 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f654d713c0so4330285e87.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jun 2023 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563866; x=1689155866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6oOHskvZpHQoGsginTih6QBOSYmBkE5Mrhb11FWZf8=;
        b=T1rsFGL2tpY8sOqMVy7W3kwR0CkWoLM+VPfbvpSnWbad5idfsPhw71l6YyRSZa1OPB
         TrypESPNNtPWSP18q1W7xS83dsB17++59KalTZ+wznrhzgUutKcmMX3YA8xxGhrfEKbD
         5N+vftVaxO0od6oF6fd09b8x8Qoge4rQQ14HhH8BUN+VlPO919VS9T5IPMZPqm4uKTcM
         wI1ZgbnNZqwQ0qJOeKCOSFFDO3LA3VoL/pUp2NBglrFb8ScDyBcfd+JvdKxyA8UilKZo
         zAeXBpbr57jdHYsyvx3E5yLFFwuAVPTDv0h3uBH2/OMF8OTWTes5sPhVQ1LFTCGfVN/4
         3s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563866; x=1689155866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6oOHskvZpHQoGsginTih6QBOSYmBkE5Mrhb11FWZf8=;
        b=IQoZj0FPtoKrV9HP9jOJMleXjF+DXQ3wizUG1k5uhPS3MK0V6C5HzjBmymoOqZNqjN
         1STjVT1hop4UP4evmo5+qS54QcBbdbasvBDCGp4qTV1BjYj0uRQ8RLfJRxF/vrWy3dGW
         xLFf+8rqWKm/UdBPB3SfZam78WcfhI+GmEF06RefTYkB9mqU59gNB09H2w2ZPzeh9v5p
         i2EnQ1swYR+97qQl7hrhCTI1qh4gz1y/hR7ZbatapRPd7wrXAfLLCDFb/FsE6SQ7RwpS
         IxR13f3JHe/SvIPxztulpzEwlwLjVPvs+Bjh0/iMCHTRGA3AMzWpNwcbVxO6UWD53qTG
         fADg==
X-Gm-Message-State: AC+VfDx/sonDGrgvX+NQVTPt60V5EzjGFdfG4L+sTqeZr+Ti92i/7NFq
	PQaBzIApla62cHKkGV9BTyP42A==
X-Google-Smtp-Source: ACHHUZ6DoFnZRVYKtyUJsx2YEj+47TFTaJWK8Kc9s3CQEvGiarLxK1d8tDtuMUXOC9fGD2fIm7PBzw==
X-Received: by 2002:a05:6512:521:b0:4f4:d071:be48 with SMTP id o1-20020a056512052100b004f4d071be48mr4794380lfc.14.1686563866315;
        Mon, 12 Jun 2023 02:57:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Jun 2023 11:57:29 +0200
Subject: [PATCH v2 12/19] dt-bindings: clk: amlogic,a1-peripherals-clkc:
 expose all clock ids
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-12-38172d17c27a@linaro.org>
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
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6566;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UztVWvUWFGUUksXEP2qHwozkrUK7gyzliS7OjlRDluo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwJXLqocVsZvSKTPXPMSuZmTKpKBo1rlqKh1MDK
 rWKDZROJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsCQAKCRB33NvayMhJ0StwD/
 4uJMXKbFQd58Mhu4CRgLitg2yuQEWGsiuV77G+NjiKLzf9iomailZDjh7C2Iyk2gA2tz0pUebZ6Y4L
 7m2wFj2BgNVIMpDQQeZmnyzEdOtne/t0wmudikE6+FqTOw+/oCuIggWia4kkyu2+iv72G1dWQf3e1j
 wRP9LtzkSo8CimoVSxyZICxhmXwSAut47o/OoPXVCUrgl/hzQy5Qng7RVqdJg3UqaXU6e6xqZZKHz5
 iujz6VLMpCFwfEdo4FFmJLqyLtl4DzBxjWTyOdeqt6+GUmJ+hrIYcgBbb8KVJkivv60oY0EvEQsTa6
 1lMKFAkfN/4uQGSfV0xMxU1Bda4IvudP9cXzc+VCHqYvf4fsdxgHGMyEQIY9LpzlNzjuZBdUENtGO1
 SUJOHyCbpT+85zCeyZ4M+8Xhm/82QC/bqeWR7Qwy1cQEoD396qvsjd5YzfpHsjQr1C4ozY9SVtJU9j
 IGvcSQxzYa1DeDtab8JLxcClZIVNouEoMdDKjTuokYWugzZguNSmvClNmNijTnxekdW35oPDSCgVYg
 N3MkMhbhpaFawhms6MV/bo0AX9NVP2hqxR7F3XXVt+9rXccqg/TPFXZTKzSG2kPpm6K8NHZAjDFeis
 l2UwRDoHAVes2dERFLh2A1VlRVXMrXE1xSZN6nQ9Ekn8cIxCOIMC6qygUvIw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_025747_779085_6F8AD756 
X-CRM114-Status: GOOD (  13.45  )
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

It was decided to move every A1 peripherals ID to the public clock
dt-bindings headers to be merged in a single tree so we
can safely add new clocks without having merge issues.

[1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
[2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/a1-peripherals.h                 | 63 ----------------------
 .../clock/amlogic,a1-peripherals-clkc.h            | 53 ++++++++++++++++++
 2 files changed, 53 insertions(+), 63 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.h b/drivers/clk/meson/a1-peripherals.h
index 4d60456a95a9..842b52634ed0 100644
--- a/drivers/clk/meson/a1-peripherals.h
+++ b/drivers/clk/meson/a1-peripherals.h
@@ -46,67 +46,4 @@
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
 
-/*
- * CLKID index values for internal clocks
- *
- * These indices are entirely contrived and do not map onto the hardware.
- * It has now been decided to expose everything by default in the DT header:
- * include/dt-bindings/clock/a1-peripherals-clkc.h.
- * Only the clocks ids we don't want to expose, such as the internal muxes and
- * dividers of composite clocks, will remain defined here.
- */
-#define CLKID_XTAL_IN		0
-#define CLKID_DSPA_SEL		61
-#define CLKID_DSPB_SEL		62
-#define CLKID_SARADC_SEL	74
-#define CLKID_SYS_A_SEL		89
-#define CLKID_SYS_A_DIV		90
-#define CLKID_SYS_A		91
-#define CLKID_SYS_B_SEL		92
-#define CLKID_SYS_B_DIV		93
-#define CLKID_SYS_B		94
-#define CLKID_DSPA_A_DIV	96
-#define CLKID_DSPA_A		97
-#define CLKID_DSPA_B_DIV	99
-#define CLKID_DSPA_B		100
-#define CLKID_DSPB_A_DIV	102
-#define CLKID_DSPB_A		103
-#define CLKID_DSPB_B_DIV	105
-#define CLKID_DSPB_B		106
-#define CLKID_RTC_32K_IN	107
-#define CLKID_RTC_32K_DIV	108
-#define CLKID_RTC_32K_XTAL	109
-#define CLKID_RTC_32K_SEL	110
-#define CLKID_CECB_32K_IN	111
-#define CLKID_CECB_32K_DIV	112
-#define CLKID_CECA_32K_IN	115
-#define CLKID_CECA_32K_DIV	116
-#define CLKID_DIV2_PRE		119
-#define CLKID_24M_DIV2		120
-#define CLKID_GEN_DIV		122
-#define CLKID_SARADC_DIV	123
-#define CLKID_PWM_A_DIV		125
-#define CLKID_PWM_B_DIV		127
-#define CLKID_PWM_C_DIV		129
-#define CLKID_PWM_D_DIV		131
-#define CLKID_PWM_E_DIV		133
-#define CLKID_PWM_F_DIV		135
-#define CLKID_SPICC_SEL		136
-#define CLKID_SPICC_DIV		137
-#define CLKID_SPICC_SEL2	138
-#define CLKID_TS_DIV		139
-#define CLKID_SPIFC_SEL		140
-#define CLKID_SPIFC_DIV		141
-#define CLKID_SPIFC_SEL2	142
-#define CLKID_USB_BUS_SEL	143
-#define CLKID_USB_BUS_DIV	144
-#define CLKID_SD_EMMC_SEL	145
-#define CLKID_SD_EMMC_DIV	146
-#define CLKID_PSRAM_SEL		148
-#define CLKID_PSRAM_DIV		149
-#define CLKID_PSRAM_SEL2	150
-#define CLKID_DMC_SEL		151
-#define CLKID_DMC_DIV		152
-#define CLKID_DMC_SEL2		153
-
 #endif /* __A1_PERIPHERALS_H */
diff --git a/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h
index ff2730f398a6..06f198ee7623 100644
--- a/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h
+++ b/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h
@@ -10,6 +10,7 @@
 #ifndef __A1_PERIPHERALS_CLKC_H
 #define __A1_PERIPHERALS_CLKC_H
 
+#define CLKID_XTAL_IN		0
 #define CLKID_FIXPLL_IN		1
 #define CLKID_USB_PHY_IN	2
 #define CLKID_USB_CTRL_IN	3
@@ -70,6 +71,8 @@
 #define CLKID_CPU_CTRL		58
 #define CLKID_ROM		59
 #define CLKID_PROC_I2C		60
+#define CLKID_DSPA_SEL		61
+#define CLKID_DSPB_SEL		62
 #define CLKID_DSPA_EN		63
 #define CLKID_DSPA_EN_NIC	64
 #define CLKID_DSPB_EN		65
@@ -81,6 +84,7 @@
 #define CLKID_12M		71
 #define CLKID_FCLK_DIV2_DIVN	72
 #define CLKID_GEN		73
+#define CLKID_SARADC_SEL	74
 #define CLKID_SARADC		75
 #define CLKID_PWM_A		76
 #define CLKID_PWM_B		77
@@ -95,21 +99,70 @@
 #define CLKID_SD_EMMC		86
 #define CLKID_PSRAM		87
 #define CLKID_DMC		88
+#define CLKID_SYS_A_SEL		89
+#define CLKID_SYS_A_DIV		90
+#define CLKID_SYS_A		91
+#define CLKID_SYS_B_SEL		92
+#define CLKID_SYS_B_DIV		93
+#define CLKID_SYS_B		94
 #define CLKID_DSPA_A_SEL	95
+#define CLKID_DSPA_A_DIV	96
+#define CLKID_DSPA_A		97
 #define CLKID_DSPA_B_SEL	98
+#define CLKID_DSPA_B_DIV	99
+#define CLKID_DSPA_B		100
 #define CLKID_DSPB_A_SEL	101
+#define CLKID_DSPB_A_DIV	102
+#define CLKID_DSPB_A		103
 #define CLKID_DSPB_B_SEL	104
+#define CLKID_DSPB_B_DIV	105
+#define CLKID_DSPB_B		106
+#define CLKID_RTC_32K_IN	107
+#define CLKID_RTC_32K_DIV	108
+#define CLKID_RTC_32K_XTAL	109
+#define CLKID_RTC_32K_SEL	110
+#define CLKID_CECB_32K_IN	111
+#define CLKID_CECB_32K_DIV	112
 #define CLKID_CECB_32K_SEL_PRE	113
 #define CLKID_CECB_32K_SEL	114
+#define CLKID_CECA_32K_IN	115
+#define CLKID_CECA_32K_DIV	116
 #define CLKID_CECA_32K_SEL_PRE	117
 #define CLKID_CECA_32K_SEL	118
+#define CLKID_DIV2_PRE		119
+#define CLKID_24M_DIV2		120
 #define CLKID_GEN_SEL		121
+#define CLKID_GEN_DIV		122
+#define CLKID_SARADC_DIV	123
 #define CLKID_PWM_A_SEL		124
+#define CLKID_PWM_A_DIV		125
 #define CLKID_PWM_B_SEL		126
+#define CLKID_PWM_B_DIV		127
 #define CLKID_PWM_C_SEL		128
+#define CLKID_PWM_C_DIV		129
 #define CLKID_PWM_D_SEL		130
+#define CLKID_PWM_D_DIV		131
 #define CLKID_PWM_E_SEL		132
+#define CLKID_PWM_E_DIV		133
 #define CLKID_PWM_F_SEL		134
+#define CLKID_PWM_F_DIV		135
+#define CLKID_SPICC_SEL		136
+#define CLKID_SPICC_DIV		137
+#define CLKID_SPICC_SEL2	138
+#define CLKID_TS_DIV		139
+#define CLKID_SPIFC_SEL		140
+#define CLKID_SPIFC_DIV		141
+#define CLKID_SPIFC_SEL2	142
+#define CLKID_USB_BUS_SEL	143
+#define CLKID_USB_BUS_DIV	144
+#define CLKID_SD_EMMC_SEL	145
+#define CLKID_SD_EMMC_DIV	146
 #define CLKID_SD_EMMC_SEL2	147
+#define CLKID_PSRAM_SEL		148
+#define CLKID_PSRAM_DIV		149
+#define CLKID_PSRAM_SEL2	150
+#define CLKID_DMC_SEL		151
+#define CLKID_DMC_DIV		152
+#define CLKID_DMC_SEL2		153
 
 #endif /* __A1_PERIPHERALS_CLKC_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
