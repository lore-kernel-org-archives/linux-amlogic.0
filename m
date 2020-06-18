Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA14EC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 13:28:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC78F2082F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 13:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o37VNuwR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eHOmkiRH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC78F2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gTqxZvUjM4bGKNjYZUqju/FUxSKuhJbjJBDtGo8ES8A=; b=o37VNuwRbwzpKt
	LmjVfNd+MB+ANVRrBNn8DAir8IoECnLC+BpBfD3AI3rIoq3KX8ltC8JywSimlEbOupCo6hTI7UgDW
	FUA6Wl9CdPgBQrnypBUf4t48SAWYCfjUdQHVNnISiHk7h7j1gGyiRcwUXXkvQNuMBe5eOAMf+ZzAp
	IYQ/ZFP+0CwkvAERbvodPFZ6uKEPvLiueq+4Acq0gcXt37hZBctV8Ri39l5f5cg/Wdhxh1AsXgn4g
	12XD6geIAjtXmx6vCJQHU6hJPHh15uDnF9oVsXlyXLJX68nnCV+uB/3Iw/WrMYXS5l54MElQ+Jzso
	Hso9XcIhs20j1vRxH6Fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlua6-0000es-MO; Thu, 18 Jun 2020 13:27:50 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlua2-0000e6-Rj
 for linux-amlogic@lists.infradead.org; Thu, 18 Jun 2020 13:27:48 +0000
Received: by mail-wr1-x444.google.com with SMTP id q2so3624953wrv.8
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Jun 2020 06:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xGuWagvHkR5CzPo1CRVJNp1xS36Ei3NsxHAn9Qc6w5w=;
 b=eHOmkiRHxbMLhRbAL0KHWuGUzadE+ZgogzWzMmhkx3LAIVM+AXis6XYnZre3Uf+LcZ
 QcWObIqEjvqx+6h83uCPq0nc79JdbpZgk0BHcDcpG+E3iKwwlH1lKCkh4AVAq5OX7ZJM
 8iD+ylvAc9hq2oAEXs/7ReqValj4Eln1UiErT4wuC0bHEWGlRs04Ikl13lbvbresYEts
 sKL+f4yHgN9AxRNv3fvPk1mnR5fNh9J20SxzOEXZSIZibA+ZNLSAponUFnymjtFdhwNb
 E6YZYUXWbu/YthMC0laqhe7S9VHJ8wZjpyfd6SICISVTMTvJ8F1lk5BP8uDbeR9peZQ9
 CFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xGuWagvHkR5CzPo1CRVJNp1xS36Ei3NsxHAn9Qc6w5w=;
 b=gF5/s6sUMhocH4HtkvCohnqtHppLctAMciC899m/APKvKuKFanQdmY5Fr28/OO6mNi
 LdaVqXovQb3yzQbaNOZip9Wc842VPOpDOfrTa3uPlMRynJyhi90mQCEJN3E9LQyBvDBn
 znik2AVviLarTga3hcejlQ3HCp8B3nFyV7Q64Sav69wrxaHcMRf+13FOf8uJdGjmPLIA
 C54M3anHdoDv7Acokr2COAj/plLFY/UnLyNP/N0Q3NQsQvq8nUBPjxOlkIvu5+9aqANp
 MsrsEqJUmbIWK0KSwYthcNN+T09wLawfo3dLkemn9/g/t3qgAXdqYiukFA7zai4DcQvW
 wSPA==
X-Gm-Message-State: AOAM532IsLhH3Ug4n3Wr9pfxmvzon1anrQHIqtwb6Vic7TKh2GKaofA/
 g3UHHRe/kjyzLfh8fUI/TNpg2A==
X-Google-Smtp-Source: ABdhPJwppCorQbCpUQGKifbVA2gARZbO1wdWdyRTreqjCiFRT7SQ5iqEUtlUzbrx4RUAnkHkA5UfPA==
X-Received: by 2002:a5d:61c6:: with SMTP id q6mr4518545wrv.282.1592486864043; 
 Thu, 18 Jun 2020 06:27:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9902:c1f0:76c7:9dbc])
 by smtp.gmail.com with ESMTPSA id a16sm3562843wrx.8.2020.06.18.06.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 06:27:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] arm64: dts: meson-gxl-s805x: reduce initial Mali450 core
 frequency
Date: Thu, 18 Jun 2020 15:27:37 +0200
Message-Id: <20200618132737.14243-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_062746_950554_6AD313F8 
X-CRM114-Status: GOOD (  14.85  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When starting at 744MHz, the Mali 450 core crashes on S805X based boards:
 lima d00c0000.gpu: IRQ ppmmu3 not found
 lima d00c0000.gpu: IRQ ppmmu4 not found
 lima d00c0000.gpu: IRQ ppmmu5 not found
 lima d00c0000.gpu: IRQ ppmmu6 not found
 lima d00c0000.gpu: IRQ ppmmu7 not found
 Internal error: synchronous external abort: 96000210 [#1] PREEMPT SMP
 Modules linked in:
 CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.2+ #492
 Hardware name: Libre Computer AML-S805X-AC (DT)
 pstate: 40000005 (nZcv daif -PAN -UAO)
 pc : lima_gp_init+0x28/0x188
 ...
 Call trace:
  lima_gp_init+0x28/0x188
  lima_device_init+0x334/0x534
  lima_pdev_probe+0xa4/0xe4
 ...
 Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

Reverting to a safer 666Mhz frequency on the S805X that doesn't use the
GP0 PLL makes it more stable.

Fixes: fd47716479f5 ("ARM64: dts: add S805X based P241 board")
Fixes: 0449b8e371ac ("arm64: dts: meson: add libretech aml-s805x-ac board")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  |  2 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |  2 +-
 .../boot/dts/amlogic/meson-gxl-s805x.dtsi     | 24 +++++++++++++++++++
 3 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index 6a226faab183..9e43f4dca90d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/sound/meson-aiu.h>
 
-#include "meson-gxl-s905x.dtsi"
+#include "meson-gxl-s805x.dtsi"
 
 / {
 	compatible = "libretech,aml-s805x-ac", "amlogic,s805x",
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index 867e30f1d62b..eb7f5a3fefd4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -9,7 +9,7 @@
 
 #include <dt-bindings/input/input.h>
 
-#include "meson-gxl-s905x.dtsi"
+#include "meson-gxl-s805x.dtsi"
 
 / {
 	compatible = "amlogic,p241", "amlogic,s805x", "amlogic,meson-gxl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi
new file mode 100644
index 000000000000..f9d705648426
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 BayLibre SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-gxl-s905x.dtsi"
+
+/ {
+	compatible = "amlogic,s805x", "amlogic,meson-gxl";
+};
+
+/* The S805X Package doesn't seem to handle the 744MHz OPP correctly */
+&mali {
+	assigned-clocks = <&clkc CLKID_MALI_0_SEL>,
+			  <&clkc CLKID_MALI_0>,
+			  <&clkc CLKID_MALI>; /* Glitch free mux */
+	assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
+				 <0>, /* Do Nothing */
+				 <&clkc CLKID_MALI_0>;
+	assigned-clock-rates = <0>, /* Do Nothing */
+			       <666666666>,
+			       <0>; /* Do Nothing */
+};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
