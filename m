Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782D6C7EE25
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2Tce8T25IztpWQP6xGPUIhJYWv6RoRppXk8kJOm+Xo=; b=qmyWMQBpDHlhX/
	x8G3V7VzzoXGc/s9dJPJnoRmgWabPT/qmqLUKuPbVXcvLMG8VfDxdbG/N7yUYVHnIO4D4zjMJiuUV
	HyeYvbHiGUuWaSUHtLxXpTty4JvOy/Gab40FjOA0nglztuj/PcKtzBH1prPhsgQmtMLrCqQiV8zXP
	LrbYaI12WG/fFJsaguehQHDgSS3avU4gbQg0UPPlsCwe/uf3J+xYbOXu9/hNFgbxz/YvloCEUSL7G
	xBjJrlALOU5HXE5iEXT8jpWaG2Ve7L4ksS3sOJOBCeB1UkBPUNJBNqrZr0DGGrlhL3zOAkh4pIVHP
	+xa5LtSCm7slBU3hv1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8f8P-003dw8-2n;
	Mon, 12 Jun 2023 10:50:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8f8L-003duJ-3A
	for linux-amlogic@bombadil.infradead.org;
	Mon, 12 Jun 2023 10:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LWikiPW2cUcJbbQrNCBtpcns5WVgI8QQ3+VmuZnpaK4=; b=muahwSf48LdXSjAqgcr+Xc7hD1
	7TM5v5JcnhFNDZPGVlcdDnmYpUVAMfB314y9xLrojfZgzl4Q+qBIXv0eUQb3q5pJme3B3FAACtBbu
	7FPcWvtYHWV4SgFJYwPMdusi/eZz9axZghNvO87d9yBkW/imXWqgigfvEP9sNwuCqqzjEpfXtxFiZ
	fiIYr6z/w9cgwxjJ4w7q7JMOEm7AI2zslzVtHJvJ4PFD7LB07ehrFuYdVsFKfY+NGcYc+VGQ3m/bI
	nCQcrRHl5qfISQ71n7q+kaYrpPjPcnuWzBE5sWz2f81A3kPMITb2v1kTKWvh4XKdKyHTVXRjCTvBT
	Hgcia9HA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eJ6-008l8q-17
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 09:57:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so28173525e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jun 2023 02:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563870; x=1689155870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWikiPW2cUcJbbQrNCBtpcns5WVgI8QQ3+VmuZnpaK4=;
        b=NM7faz1hxOc7WjiYcIHgLpQO1U6RIdi0laPmcU8QfGHrHFG7s68kgD8Mtj7KCufI3P
         eUr7QHvusW0w1BXqkegAXFL4Dxvfzfd15Rmnsqt7ldXrPTYbBiRCS2PMzIVknqRZouTW
         FSfKv1PJ8IQWq40TEkveyWHybSe84yq3pyULp6u5G/ZAjjm8LOFuRqo37p1PJA8aEZIS
         etJDF4maNGuq8nnwI5Bp5wz3PNcHGKCMyf/AlaARjb9EJqhs10qsp2P0NHNaSa/c+FIE
         qZjwGIPbJFX3X0180Ul1RFnW1g7GNPwDSUx3iFnDLlFI4FPT4Wd2IyejRUw30lsJYhCN
         v3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563870; x=1689155870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWikiPW2cUcJbbQrNCBtpcns5WVgI8QQ3+VmuZnpaK4=;
        b=X2P6qWq7bg2qP5GvKd9mauKBvbgcw9MASBIvbLxYgjenZukEwWsoGMyIkANnmRxIHG
         +4MAZyyDMmbF4GBewXTS+WxDAJddrjloC0o5FB/yQpdGfpyCzIPw/b4xnTwIoyIybxsn
         PjR9f9T20XJM/Vzv74y6yqGQEaYEauTveJQNqGzAc0CxmcHGLyNWN4HYFdWy3eDJDU2v
         6uPvYVIn6VuqqvIrCAPx6Ey6aBBkjgv8BS4FFYipVFudViq6ucnDr5D3Y36UH+KDMxsU
         wTLe3vphI7io3xUJ/OmkwH5VTZ8JsEW4QXRp01sf3Om9CoxEyCBEuqRcjGd+OsH8UgtF
         KnkQ==
X-Gm-Message-State: AC+VfDx8VSIA0jmepoawj+Szgf8UMm00dpPo0j02qFcrst8/K5DlfHv2
	LGWKH16eXrTwXW8xVZDugarDJg==
X-Google-Smtp-Source: ACHHUZ7Ma7sCiGe8HySFslKdv1KtT+4tivJqG8hUQ1GAmKrlvPdIh5E9lsSHkY0m8a/68jOPtdU1Qg==
X-Received: by 2002:a7b:c846:0:b0:3f5:1241:6cfa with SMTP id c6-20020a7bc846000000b003f512416cfamr5607891wml.37.1686563870505;
        Mon, 12 Jun 2023 02:57:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Jun 2023 11:57:33 +0200
Subject: [PATCH v2 16/19] clk: meson: eeclk: move bindings include to main
 driver
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-16-38172d17c27a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Wk7owxOdyJK0QkY8zyxIiRPr+2RNohL4MIdS38lxWuU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwLCmDkNgP+75AH+w2uzJ8MUa+VSnC3u09pDFh4
 LkrYsa+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsCwAKCRB33NvayMhJ0f9VD/
 41zr5oZSpYNIsDz4J2tF4zcenuEd2VZO5TngKZ1T0vgtfNZ9xs3fKw3aUnghqFAtOgWWucvf5E2hf0
 oz3uBGfuZDSYFuerVuEWXisBJjBezRTo4vEO2nc0vTntzxmYixG4/sB3Byd4sg6NvDhqhjcsi4W43a
 P/hKEulaTu9LaFVfgbIjPwuFmzMIzSDX9LTraEUEEwYAf2Y7RgyrPgk0L8s4YNokWYPj4MXhe19AWa
 2iGORoS7cA7+8fGqIEvXF3ebrPHHrf2IDFJf2JwuQBjs/5vD0+y88UpVfHDaRSFU1au/nLzcdiAimL
 kVqEJBpwFpbb47YQUKM+yLAMoXbgf+eZr3hkC91RYDUhb/gXZRe2SfpoKj7upsJjq+H7WanHriv5vm
 LQJZ1RfSCwMUY5sa2d9RDPmxVM3kQ7jdYejq8HwybB7IFD6VP7WEikhRibCOToPLkfbqKi+emMB7ye
 uzQ2pqTfVo8JV/TUenQ4A0iCO2L5f2+rAStVDSnsnK51gShnQWsMed+rGOTSmUsypKwWvDiAJFfSjX
 sa/dNFLD2+D+KBv8MjQ1WXrWap3AJJP35Ewe6MGmRvM5PfNR+NxW+hTpraSmTvKTVE3Apo+rWKZI/S
 JA788Oewcu64k5FQPByB4rU1yJc4XHyEaE0j17hBxgPqVy2es4QznoZHUFrQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_105752_676840_428C17B2 
X-CRM114-Status: GOOD (  11.96  )
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
 drivers/clk/meson/axg.c  | 2 ++
 drivers/clk/meson/axg.h  | 3 ---
 drivers/clk/meson/g12a.c | 2 ++
 drivers/clk/meson/g12a.h | 3 ---
 drivers/clk/meson/gxbb.c | 2 ++
 drivers/clk/meson/gxbb.h | 3 ---
 6 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 75f0912a9805..f132439a33a4 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -21,6 +21,8 @@
 #include "axg.h"
 #include "meson-eeclk.h"
 
+#include <dt-bindings/clock/axg-clkc.h>
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 static struct clk_regmap axg_fixed_pll_dco = {
diff --git a/drivers/clk/meson/axg.h b/drivers/clk/meson/axg.h
index ed157532b4d7..624d8d3ce7c4 100644
--- a/drivers/clk/meson/axg.h
+++ b/drivers/clk/meson/axg.h
@@ -102,7 +102,4 @@
 #define HHI_DPLL_TOP_I			0x318
 #define HHI_DPLL_TOP2_I			0x31C
 
-/* include the CLKIDs that have been made part of the DT binding */
-#include <dt-bindings/clock/axg-clkc.h>
-
 #endif /* __AXG_H */
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index e0e295645c9e..ceabd5f4b2ac 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -25,6 +25,8 @@
 #include "meson-eeclk.h"
 #include "g12a.h"
 
+#include <dt-bindings/clock/g12a-clkc.h>
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 static struct clk_regmap g12a_fixed_pll_dco = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 8e08af3c1476..f11ee3c59849 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -126,7 +126,4 @@
 #define HHI_SYS1_PLL_CNTL5		0x394
 #define HHI_SYS1_PLL_CNTL6		0x398
 
-/* include the CLKIDs that have been made part of the DT binding */
-#include <dt-bindings/clock/g12a-clkc.h>
-
 #endif /* __G12A_H */
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 116fcb6ba160..1ee0774a9827 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -17,6 +17,8 @@
 #include "meson-eeclk.h"
 #include "vid-pll-div.h"
 
+#include <dt-bindings/clock/gxbb-clkc.h>
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 798ffb911103..ba5f39a8d746 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -112,7 +112,4 @@
 #define HHI_BT656_CLK_CNTL		0x3D4 /* 0xf5 offset in data sheet */
 #define HHI_SAR_CLK_CNTL		0x3D8 /* 0xf6 offset in data sheet */
 
-/* include the CLKIDs that have been made part of the DT binding */
-#include <dt-bindings/clock/gxbb-clkc.h>
-
 #endif /* __GXBB_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
