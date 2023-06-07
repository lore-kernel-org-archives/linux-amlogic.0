Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02464C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJZWeZUlAnWpawz+z6epdml5fXkPTbs80Dg2YzAv9KU=; b=sVrpfsIev3dRtS
	oVBEG8091ZWikA/GYdr5a+TU1pm1TEXGqiVBzu5P9qPk/3i97z7GyATirI8gwdCN89aif6hzXC3dW
	am7e0MMQtNs+CdyaNV7eNku7C67HialCDyNpBx+OJDXBfuTin7uuSN1HKOo1GnpjLtGBs3lW4XMol
	j93YKCfqW4KEzaN4kXURbo06k/Qfafge1ksiwypw6tA0FK7LVtJviZTCAdDAKMeKms7QJ1OmqiSpS
	Gs000/WTizjOFSd2n/sS5FbXU5wpX7Dr144UphSiVaHXUATz0lk5zh/AGV/SMm0lAysIOhD2+YNnt
	uiD5Qf1OOv7idEWJxJsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rgW-005gzj-2s;
	Wed, 07 Jun 2023 11:50:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rgU-005gyC-2t
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Jun 2023 11:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xnMTB1gQyvEeZp7nZTAM6BVyhIRBWpY4lFqsFPGfZMM=; b=PWL29gVGaKfkU9P3YccDaQcAgh
	CDZw4PP+BLSw9oeVUZ9ByXHoHwCnQtn6JRBdvnNS0JAddZpmLkuGJR+Ww5sCVGVm+rKcCKKWQ5aRo
	Ou3dsfeTjzm5YiTDdMKKebzAIMMXl8IyhW1+ILCQ5PQi8YjPLnhXePwe8q1IY0QfUG6ZAJP6YZdfm
	R3msi8uM/ttZLOtqb4CYeDC0Lelp/w/X/mYiGd6woqJZ3xfIEfBqSFHrfAwffjpY9lPYKoI81uhoX
	n5M+c59mOFJoSHp5svNDD3Z+I1KybWo+vjbxRfQVvCCw0FXZjakXAeb9JmHsygafnt3xePKfghOFp
	LUc67wmg==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qqF-0057yr-0n
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jun 2023 10:56:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f732d37d7cso43846675e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 03:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135396; x=1688727396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnMTB1gQyvEeZp7nZTAM6BVyhIRBWpY4lFqsFPGfZMM=;
        b=yGS9r2A1xgdQzVP4dihVaE8lusnrMU9qumXIEZ+USwaQXiI/Y3/pw0wHKjtSKuOh/p
         IIzwkTH1fhQ1R9gSAEl6xGUAAETAsr5aPVlflmcVeulAuNvYhDsZF940O/kmwThj9kTI
         auSVKiOjFTuBT2g8zix67oQik+EJV+Rvmb3ACEeL/c5Xssa+5JQBIPfp7mHqrcedF3k/
         CPbqF23LwDtOl8062CZsrn/0TTimpMTUNFJKn+TAeLum/Z5eBWfhBiKu95/F4UWOap5J
         /WritJ9fe1hUrNATwQayvnFrsVxIOT/zhwiNzPspvk+Ujie26qhlnEySwHu9DdEDRcXx
         Ehvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135396; x=1688727396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnMTB1gQyvEeZp7nZTAM6BVyhIRBWpY4lFqsFPGfZMM=;
        b=PH0PHafIS67jads1ATgPF+PNowsTwf4V8nLaI/gAr/Zo9/n6QpmUNLZxIFQIEs/5V4
         /G17n3pdZ70is+dWOUGC6NMb+4D57zt4NdtV/ASZqXfCLmmkgIEMNEgeqFw1GtaK1bQG
         D8A0rDChJYAAyllNxz2GiDcTqzgQVmUVzJWA7KPZTgcGfIwFE18BRTMmT+H7a2LM43sZ
         5UpW4CFPn12bbQHnjCusA5dfsbSTw/iSo8cPx5RhxMo3T4xcXa8om/pkTs2NKKl+0lHH
         gzfrxp6ggXw6i6JvN7zMhCpCEQpfFjc3p53SeayGh3lmldIrbfni3DUWJqVxzJ4b/Biz
         5zog==
X-Gm-Message-State: AC+VfDybXldXDEEGjrFogevYd5WSnhGFDxoW7dHx+GMMZSNH2LMZqG4f
	cu0fBSx957PK+CFeV7ndO5Qs8g==
X-Google-Smtp-Source: ACHHUZ58EvoPYuC5nZs66WOAPONtdHAb797/8fHYHvmBuwVELAHZs9tvGj3wF0mebUj5GAurl5ARmg==
X-Received: by 2002:a1c:7215:0:b0:3f7:dfdf:36ce with SMTP id n21-20020a1c7215000000b003f7dfdf36cemr6877223wmc.9.1686135396566;
        Wed, 07 Jun 2023 03:56:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 07 Jun 2023 12:56:25 +0200
Subject: [PATCH 14/18] clk: meson: aoclk: move bindings include to main
 driver
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-14-9676afa6b22c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4058;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FAGqTS28vY4TA8ryV7GfqsaTq2wyyajQNS171oDhvXo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJT+mKi8cd1UlKPoKTBHBSQhYVzjPlpEaF7dsBc
 atUX7ZmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiUwAKCRB33NvayMhJ0S+YEA
 Ck1hq8jC1gcmtNViGR6dPVN0ot4jPzoiBmbWPOkJgGCzgXNbmuAhra566hDE+YEFexOU60REdOTyI1
 UkP/WerO+WdJTCK47r/kS7iouqLxYltUmujw5wlSNwuRgjG6NGC3fcS0MUjbfsONZhFexZjr1NM+uS
 H1+lVf+91M4wWUl8enMgPxsYEqqS7Hq3Al6/ALJUkjVN/Y4oaSH+vHZ55h46b+7jJZvNUTBUmclED9
 Tq3oJ6BY+uVCNDeCkdBR5dVZZwgIes2Acm2MUHpHUmrHsR4mhkm4EYef0PTYMqljjn8QevUw0cn87V
 DySnXu20dOFsiUqhfwXJnNPKuW7dnNOWTpi7NOnFVoUt5094la/m4ihv9zJZ/LW7pD06n1bJDZvHmA
 Rgy5xSbute20oPer2lBsx1R4j519ZmZ4uhHB9jgJAvcI9jF8u/eXkFdIFp0vhgALBSbp64j8jfDu8H
 29g5a387liydAp1qmmM2gmn+Hl1M5dFP2Yw9eciMqbatZVw5tlzVnIFUznW4KT+19Y7TUGa0J+v054
 jJsmav68gNlK1kelh8j2wYozuW15TiNJh5BO8jI1GWQqgajCAYX60uUDX+Z4g5u3GVLiSCYlsDTgii
 ew7XaAlaSEVEeHSZCTxxeNn7YsIThHmjYu16If/Hco2qzh6vpv31TYzFCtIw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_115641_212418_AC2965E5 
X-CRM114-Status: GOOD (  12.27  )
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
index db5b53146bcc..fb470459aaf8 100644
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
index 52501ec709f7..392e1805f1c8 100644
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
index b08f60f5a73d..f3723c0d6a01 100644
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
