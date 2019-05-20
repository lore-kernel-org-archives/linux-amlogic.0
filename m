Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BF8C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:42:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03DAE216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:42:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQgkPYJz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WCbRRamr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03DAE216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buLfAK4RnpUgbmuWi87sIK1PJ8L1yjUDlWDyfR2EE/s=; b=bQgkPYJzh+uT/H
	JiwCALv7adWPZS8HtqUeNUOWfRq1bqnsPXOtkVxLHDkW0Nt/k2oizxG00y5HS5oFIJIvBkd3ByISY
	a8+42VZQ9MBsDAvwk/sv3Kc+M8K905oI/QviPUsEsRwKEJF7d6MPZmtOtLbHGms2odBOUAblgyckn
	ElS5vTcZNS3PI3EqRvsKy2SKU5VT8nktbef8wHMrESHvTKjVVuqSvGaslrqVdGsrP+tTFPucUEe1d
	DtSoh7f7U6Nh8WCX8GjpWyhRbzQNE4lbbbh0A4YtuxfphnUy/8q2ZkXCHRGj9xTM3GWzp2piM2o5a
	ioFZEq+Gx5fY6Z8fzDgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjUE-0003Vd-3C; Mon, 20 May 2019 14:41:58 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjTe-0002o8-N6
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:41:28 +0000
Received: by mail-wr1-x442.google.com with SMTP id w13so4162747wru.11
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuVh9TVsMqZSn9qS73DaH0TkGBsg1S2LZDD25U2BAlk=;
 b=WCbRRamr4ZuC30uvTI0zqjb40m9TBkUAGNetbDmjURtBHYQm7JZtDqmVMxLVisKum/
 moGYyeiHx3jCWiteFsGfm4mPMmCsxdH78GkvOfkaU5lonf//0m0Bl3uCi2q5WF6yv8ho
 Ah6+4VpJzq9M7+ls7RGtlxvPhRVjGc2QOvfTzoXReszIvluY+i4h49bcycRWP4gsZoZb
 wKHZrHV4MOUIDPsmO6HdT5tYMaWH8hXFwlpxzLYroMXXh2fREFmFkobxSB5owMkU5/x2
 E/IR4jNBR7MI4HTWFR9yUr62+KxcB/c5atuMEKHB0mDNkYsgsXY2QFe441f48s7bBOBn
 JpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuVh9TVsMqZSn9qS73DaH0TkGBsg1S2LZDD25U2BAlk=;
 b=OzgCp86l3F76/styO5mQ5kh926zqD1FsPmnXTlS8FWnYZw0KocyL7xM8o5FOEDxplz
 kd7qL6ZHsXTwKlaBpnQJJyZyTOXEHVf+SyJRbu3Lx93uPGXpORqWneiSdBAD8Ibyte1g
 aZ8nMFG1Xuto+Zz/EoHNFgjsDbPDmePSTfL/VZHDQvk9wWgVx8KnSkVXeP0vdsRZcdO9
 jM8uolc3VS83Lz3o5OQavG7CJwGhnxxXwMo8yP5Xy9yB7KqecQEVlS4oC5BpswK6qImu
 51FrTzK7LIR2dtzUEh5QhKiqc6aGIBOxnEY8zn2USSB03Va54J8ydmAJaQ6PoO7U2B3P
 Aggw==
X-Gm-Message-State: APjAAAXjoExjUx+7bA+Uo5zCyrkv4xl2N/wwS2qx8I31mYnWdO+4Ejn0
 CTSFQ3aK0wJdp6NsTP23YwV4WQ==
X-Google-Smtp-Source: APXvYqwLWGWrmt9aWGH3uyiRHLGzj2Yw71bsYLdFfvi+AaABiH/XMU4nW2WLFlYBNK/Qtb3WCPayTQ==
X-Received: by 2002:adf:e40c:: with SMTP id g12mr29036029wrm.98.1558363281095; 
 Mon, 20 May 2019 07:41:21 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w3sm6743679wrv.25.2019.05.20.07.41.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:41:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linus.walleij@linaro.org
Subject: [PATCH 1/5] pinctrl: meson: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:41:04 +0200
Message-Id: <20190520144108.3787-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520144108.3787-1-narmstrong@baylibre.com>
References: <20190520144108.3787-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_074122_986391_16E75AAB 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: linux-gpio@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson.c      | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson.h      | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.h | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8.c     | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8b.c    | 8 +-------
 8 files changed, 8 insertions(+), 56 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 4edeb4cae72a..83c0b1753e70 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson GXBB.
  *
  * Copyright (C) 2016 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson-gxbb-gpio.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 0c0a5018102b..813f2bdd90a5 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson GXL.
  *
  * Copyright (C) 2016 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson-gxl-gpio.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 96a4a72708e4..54fe8f0e4e6d 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 5eaab925f427..29ca94926af0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -1,14 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Pin controller and GPIO driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <linux/gpio/driver.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
index b93b058c8a07..3810b066df16 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * First generation of pinmux driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
  * Copyright (C) 2017 Jerome Brunet  <jbrunet@baylibre.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 /* For this first generation of pinctrl driver every pinmux group can be
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.h b/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
index 47293c28f913..47c0c28bb8fe 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * First generation of pinmux driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
  * Copyright (C) 2017 Jerome Brunet  <jbrunet@baylibre.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 struct meson8_pmx_data {
diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 785e29e74a56..2070e3c61a34 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson8 and Meson8m2.
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson8-gpio.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 7f76000cc12e..8d2d430ea02d 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Pin controller and GPIO driver for Amlogic Meson8b.
  *
  * Copyright (C) 2015 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <dt-bindings/gpio/meson8b-gpio.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
