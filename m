Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79312C7EE25
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mL4YSS7M7QKxAvdm7zM6Vg+P7nuLi0hSMr9V2lJeTDQ=; b=fr4XuNnAs0fPSI
	a+iZ2qkV/XrVp09NEE57jipsLicUXaIBSOKq+1vF79L6qu5SLAEcSCofoxVuMEKBDY83tlL5+N/0Q
	o4wixZiKSLqUaVLHTBDvmzjlAMnEB74SCQ4uVJ3Y0yYi3/+hWL8Xcw8i3fcEWgH+STKLVAzSZ8DZm
	48rB2A1GPUlefFNT1Ag7qplnqJ2PHceW/CiOoEmDL0cI6LQ9bBKuWiEb8PeHYPEkKFTOaOq0+vZjV
	RL1FIFD/YgxetsD1n3e0L5trI1t5/FsT9yv1592igXaTHfc/w3s4XSKASRuteGOHTwnMtpD1u9Ryq
	MZhV55p3PGx6D0rqc1cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8f6p-003dGY-0s;
	Mon, 12 Jun 2023 10:49:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8f6j-003dDw-2m
	for linux-amlogic@bombadil.infradead.org;
	Mon, 12 Jun 2023 10:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iGABTIXJEtrcII94q40tWwhEkxspimjWoq0DU0S3sQs=; b=HlygIUpGG+U3aLnpxGlM23F2aG
	9wCJ+wPf9FYawHD97mJNxWA0W4D+siKoWAfrw44FpjarcitZ2aQOrk7STkn/p/GPRvx4PoVZ+vjrk
	TZ/bQyfLWgumNAoJncyX9Tj4xkvWZPCTyjJG6OO34t6pc2OwuZXWPeyQqVvP81RGrpQ6uqgxf1LpW
	nlo+7G1mHnewAKEjPKySW1nfQF8egtvSnUB3m91acvl8N/qo6cbNFj4GeCYOQuP/s0pxt55BrVW4X
	IfUkzSe8362aZyeqpJByNeCLHG56q1sEsTeh7oySo//e1WWKioLdwFrMEgpuu65JYvXKeZVyCeE3b
	NMv2Zqtg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eJ4-008l7t-1I
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 09:57:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f6d7abe9a4so29606815e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jun 2023 02:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563869; x=1689155869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGABTIXJEtrcII94q40tWwhEkxspimjWoq0DU0S3sQs=;
        b=XOODmW8kd46QALhCoYdKYz0ZKb7h3AW4QLpNC4PvWgdPexSuKGLgDMfq6Uf0DuqcB6
         XlhqBXdMxtmM8lkda8/RpXydmtwagf1e3bqIwxuH8it8Q7pTPbf8p8KkP889fFFlhyy9
         V/IvwrNYPyKmQizdw3wvQnbGoTjaKwOCxnVczbDSbsnmAmIgPe0Wq24EHS6+wEbkFKa5
         Rvzlgq/y+95wkWqDQqkh2r4Ppp2tWF7/kTy4hYETkYsUTxfOXT7vyUtU3JY6/NKdCnxn
         InA61VnTUYBVSpkptW642pAXhprzAG8YzIZxynEqCngjP/SP+wc2uihoN5EsfhY0uJcR
         dXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563869; x=1689155869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGABTIXJEtrcII94q40tWwhEkxspimjWoq0DU0S3sQs=;
        b=iVt4QxBpH909id+Y7LTmdTcokGvt7qBy5ltF3S2rcntU+zuTddPV/bBxNP14v0ukjA
         2Sj7lo8lyyCndLDvsR+QITQ8BmwKO7gJIEnW12hnydutb75qdgnG6g/zoynaz7K633z4
         DiU1dHB6E+q+fGK/kNkaqZq6fA37zRn3t/4dlulX3B9kxpnjtRdspJLf/WD7r7bGpJR+
         Vt9bTMpTUzcAO5WK5wJjlq5PbyTkIEFO8Pa34L/6z/aDDQMxCnf/rPN0vT5WYGG8CvZo
         pn72Ln+tVp+gc5P+syMMZNGEK6ikWSimch3JNE8HfDyPujTrVuYNf+zfT/QhS3OOKQPn
         de4w==
X-Gm-Message-State: AC+VfDw712Y4f+RGOZlPDHfnlIWih1aAv3Mgsy0UhvQyrn4pDtt3u6id
	UJqY3GZ/eUb/I2Z8ZRtCpRMe0g==
X-Google-Smtp-Source: ACHHUZ4pZ0mAWfvZT49ejf6jbqhwr+jGyAu7ETXbQsaAdq/C6mOxVunIkRCgPgo8t2VOaLdrt7GYTw==
X-Received: by 2002:a05:600c:ad7:b0:3f7:e6d8:457b with SMTP id c23-20020a05600c0ad700b003f7e6d8457bmr5751929wmr.19.1686563869321;
        Mon, 12 Jun 2023 02:57:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Jun 2023 11:57:32 +0200
Subject: [PATCH v2 15/19] clk: meson: aoclk: move bindings include to main
 driver
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-15-38172d17c27a@linaro.org>
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
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4058;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bOuyCBL0/AIXLX6hiE6zgLeDwAQJVgePg34gNgzB9JA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwLupPz9Q3hz6kaxIoBFQCEnvf4lduKXuGyeD33
 3BA5LuaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsCwAKCRB33NvayMhJ0SjXD/
 9kmLr4iXPfj7lRWIz4mwsE+ANIVosQTKAhRXXbYmgrJ+BRF1RgJPe3oj1hnO1pa38i9wRUKDrhCfyq
 sWdgdtn6O5PaXx9OiW0b+8tBzaJ5U8VS62/1A9UEP7cvorPIa/pzokswHLZjoHMzxKgFc9/gdZ3Dgj
 oLCysB01wxopAK5ohMRqOfW1QUP50PsgMWSrsawcUZpnWqHmcyQC8yUAR12/6U5xkL5AQS/KH1RAJR
 ZPOB9/Lo+memVg7zp5QdzmV1HDLp5Lnp9k/UQOT3MUlI1YmIoUPcilWJeO4/ye9c6JPzzVxRLedxyt
 p7LjzyHrwsxIbAi6fG0RZLj6TN0FA/9DNcBuMgccJwIwJrgtJTfkAzuR5CYP9QRebSiFmrwwn1rj8b
 cAoMXJ9TYTTe6ApvLHqHvgvdBYdVOwRpwxgY3YD13ZtIIekJ562OreduBX3JzJ0AJTWMHI/Sss5k5d
 0EQl1tBnkXmE5PfahVIsDXJBUoibWqdv1HafMUHJvf8tEE50OgyXX/n8LipSDEh4vR1CuEqEnO4IEY
 Z7ArwZN95IBdUz4L/XiHfoU2TcWh/+CSW3t6UPRaZ5BbJ8Hb2IzhBzW7Nk4eaBMBQaz/MRepm/ePC0
 lYaUGxbSGFzpPtVwx7eKvcLnbt/cJNq9xdNDuMRGzkWXy/XDoy2aNUEy3Q5Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_105750_583696_D379CAB3 
X-CRM114-Status: GOOD (  12.71  )
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

Now the clock ids are no more defined in private headers,
cleanup and include the dt-bindings headers from the main
driver file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/axg-aoclk.c  |  4 +++-
 drivers/clk/meson/axg-aoclk.h  | 16 ----------------
 drivers/clk/meson/g12a-aoclk.c |  4 +++-
 drivers/clk/meson/g12a-aoclk.h | 13 -------------
 drivers/clk/meson/gxbb-aoclk.c |  4 +++-
 drivers/clk/meson/gxbb-aoclk.h | 13 -------------
 6 files changed, 9 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index 2d1dad8657e0..8f42ae899175 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -14,11 +14,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include "meson-aoclk.h"
-#include "axg-aoclk.h"
 
 #include "clk-regmap.h"
 #include "clk-dualdiv.h"
 
+#include <dt-bindings/clock/axg-aoclkc.h>
+#include <dt-bindings/reset/axg-aoclkc.h>
+
 /*
  * AO Configuration Clock registers offsets
  * Register offsets from the data sheet must be multiplied by 4.
diff --git a/drivers/clk/meson/axg-aoclk.h b/drivers/clk/meson/axg-aoclk.h
deleted file mode 100644
index fe23dc53aa73..000000000000
--- a/drivers/clk/meson/axg-aoclk.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (c) 2017 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * Copyright (c) 2018 Amlogic, inc.
- * Author: Qiufang Dai <qiufang.dai@amlogic.com>
- */
-
-#ifndef __AXG_AOCLKC_H
-#define __AXG_AOCLKC_H
-
-#include <dt-bindings/clock/axg-aoclkc.h>
-#include <dt-bindings/reset/axg-aoclkc.h>
-
-#endif /* __AXG_AOCLKC_H */
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 9b258c1bc2d1..6213b3e26318 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -14,11 +14,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include "meson-aoclk.h"
-#include "g12a-aoclk.h"
 
 #include "clk-regmap.h"
 #include "clk-dualdiv.h"
 
+#include <dt-bindings/clock/g12a-aoclkc.h>
+#include <dt-bindings/reset/g12a-aoclkc.h>
+
 /*
  * AO Configuration Clock registers offsets
  * Register offsets from the data sheet must be multiplied by 4.
diff --git a/drivers/clk/meson/g12a-aoclk.h b/drivers/clk/meson/g12a-aoclk.h
deleted file mode 100644
index 9d6eeb24ae0c..000000000000
--- a/drivers/clk/meson/g12a-aoclk.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (c) 2019 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef __G12A_AOCLKC_H
-#define __G12A_AOCLKC_H
-
-#include <dt-bindings/clock/g12a-aoclkc.h>
-#include <dt-bindings/reset/g12a-aoclkc.h>
-
-#endif /* __G12A_AOCLKC_H */
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 736c35d126f5..d7f7dc81fa6d 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -7,11 +7,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include "meson-aoclk.h"
-#include "gxbb-aoclk.h"
 
 #include "clk-regmap.h"
 #include "clk-dualdiv.h"
 
+#include <dt-bindings/clock/gxbb-aoclkc.h>
+#include <dt-bindings/reset/gxbb-aoclkc.h>
+
 /* AO Configuration Clock registers offsets */
 #define AO_RTI_PWR_CNTL_REG1	0x0c
 #define AO_RTI_PWR_CNTL_REG0	0x10
diff --git a/drivers/clk/meson/gxbb-aoclk.h b/drivers/clk/meson/gxbb-aoclk.h
deleted file mode 100644
index 94197b957512..000000000000
--- a/drivers/clk/meson/gxbb-aoclk.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Copyright (c) 2017 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef __GXBB_AOCLKC_H
-#define __GXBB_AOCLKC_H
-
-#include <dt-bindings/clock/gxbb-aoclkc.h>
-#include <dt-bindings/reset/gxbb-aoclkc.h>
-
-#endif /* __GXBB_AOCLKC_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
