Return-Path: <SRS0=aiPH=O2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7700C43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Dec 2018 09:26:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71762084D
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Dec 2018 09:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9hbk71s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ub+j+9xT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A71762084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5lSmHDno3MEgvKO+x+Cw0tbz4N6VWmRI8CWd509BbQ0=; b=Y9hbk71so5/orH
	qpE8qEWB3w4Qx70sXJmfgIbI/uptlVA1SPA6wUqGhSoRdQ8twgPhOBYJ5Lw9fZ6S9qplvHyiWSWlA
	QqL6NgAkMYYUbRdJp1F7FRo52ebC9y2XTvb72UaU/WiekVvAzhgWsY667awax1Hg4550QVStWPo2S
	hf5mm9r1tKbdjUSLpaqoqW+J+rKNAzQCr/UoYCS1MQqK0Pi3f2jZUoymxOMCwtxmmepNaSKcWDMMf
	cKo3dcfiWD3qMAp8vUkFyg7qAxmFGfJl1Gf085BQ+LCfBu2CIC4LYwkvrJYlhJn0+6B3CDB4TJSTH
	P2ltnuoFR4/AUvy1FrOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYpAk-0006se-Ob; Mon, 17 Dec 2018 09:26:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYpAV-0006Sk-Nw
 for linux-amlogic@lists.infradead.org; Mon, 17 Dec 2018 09:26:34 +0000
Received: by mail-wm1-x342.google.com with SMTP id m22so11836230wml.3
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Dec 2018 01:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tS4yGA7iWWOyi+GCL63KyLHcBBsgEBAcy+ulLv+j2yU=;
 b=ub+j+9xTNocUdqOWcWTUlEnPh+A8jIUR/QZzueA4WpCdtTc5qXYxzwYKkNFwKYdWRR
 Ji6p6MbA3D3/t8Pxi3dmd6DihwQXvdrbXxov3GswluJMRIuT8lUiscQNd9ImgqE/RfsE
 x8MtExwzkZmZrXVJN+k9hodVXNCl2wsuTqjgO0BSTL/xjajaj3XgZWVosDx5FQK9MVJf
 mMM1L7PtNysiuMg10KCAMoXan6w7T6cOuXHJZNuaQhFPv6/mcJbVgVB0k1xWMKhdrwTV
 P+MXDbobEwtT8WjYIwizGjxj/OxTPhC6fik0anq/p14lMZoB7wjLhprj4KBvlcVe3Sfh
 b4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tS4yGA7iWWOyi+GCL63KyLHcBBsgEBAcy+ulLv+j2yU=;
 b=IeLr60OT4wwlQujc98PTF/p1/gzfXx060awVi5cOWizmocTT5BOaQx4sEvKyBEPGEY
 lxkWr7qi+l6DYqHSTZ9BOaNjsidY0PY5G03kVAUeZAqQo8H41SJo0mfiESFxLHzu8KQc
 wyBnvDv/BwFN9JIIdT4ECvioxlzJ3Mj3d4OAZ2GSphzRp8e8EeArDxI5NnqgTmMuWBOI
 xN3hhrp6iLLxHDBKAHv0pSbhqCQeHW8T5AJAJyT9qnE1ayXZ6CkQphRwubaFDMZu/F/c
 0FVD02uCJ1tQwcMlmbp2lAEetgyLJ6KmSEZUYPogOuLOxh+GZ1H710X003UFbPi6k2/u
 qETg==
X-Gm-Message-State: AA+aEWaYjgFGzT5S6N94WzaI+IGHhiqDx1trUj0ggiL/wTEb6NIRnH7h
 OfnBMzr6u8c6j2pESHBL2YW13w==
X-Google-Smtp-Source: AFSGD/VTnk5x5nYQi4FIZhtxnyyVzFt4/z+L7OtqErbgZirLOkb+klaisO1aQD8lnzZ8QnX68CBUvg==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr11184157wmg.51.1545038779009; 
 Mon, 17 Dec 2018 01:26:19 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f130sm10884496wme.41.2018.12.17.01.26.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Dec 2018 01:26:18 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: u-boot@lists.denx.de,
	trini@konsulko.com
Subject: [PATCH u-boot] arm: dts: s400: Fix status for eMMC and SDIO ports
Date: Mon, 17 Dec 2018 10:26:16 +0100
Message-Id: <20181217092616.31001-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_012632_026666_1CABE55B 
X-CRM114-Status: GOOD (  10.66  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Under U-boot, the WiFi SDIO Module should be disabled and the
eMMC modules should be enabled, so this patch adds an s400-u-boot.dtsi
include file specific for U-Boot that will be included by the build system.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/dts/meson-axg-s400-u-boot.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 arch/arm/dts/meson-axg-s400-u-boot.dtsi

diff --git a/arch/arm/dts/meson-axg-s400-u-boot.dtsi b/arch/arm/dts/meson-axg-s400-u-boot.dtsi
new file mode 100644
index 0000000000..c46eb3f38d
--- /dev/null
+++ b/arch/arm/dts/meson-axg-s400-u-boot.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
+ */
+
+/* wifi module */
+&sd_emmc_b {
+	status = "disabled";
+};
+
+/* emmc storage */
+&sd_emmc_c {
+	status = "okay";
+};
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
