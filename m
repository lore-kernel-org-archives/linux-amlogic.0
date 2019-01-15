Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBE0C43612
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E184220657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DebVqO47";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hrruY9E8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E184220657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrvpjHCk0TshECa66jux6YjUR2viHPiCB7qWHBORd+8=; b=DebVqO47TuyJRO
	Qof1wLZfKQbOAA0KBsO/esSxjoHPNk7zFsD6dBZScf3vaLDyS3yTlgryAEfHz0bq4dPWAjEosfzfP
	DGBiIMq2mzeflur2mXZEdMegB758JnA5GPSt99Ldv1zFz0aBc7uWqlrHTYVXFY7efv6qQbkLPKF9w
	Wf3ZM5OPX51vd48mRH+6u/rvze2Nbrj0zLkmLor+MwH1MaLBXm6woli6bMy6RAVKZDgJcuMcvdfV+
	XgUhzKsdwyGdgguJsaFTLF9Ny94HUAv2Fo7IdeW3dQrz8wkKDULQFAoUwDHuGuU6a68yOYp3pkq8C
	38Pmvnu5gEetCotORIcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRPs-00079L-H8; Tue, 15 Jan 2019 16:18:16 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPn-000749-8O
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:13 +0000
Received: by mail-wr1-x442.google.com with SMTP id p4so3619219wrt.7
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIVvP63uifPNIU0hqhIbdHQEWcivaPiCZBtC+r2TVVs=;
 b=hrruY9E8aMwkGBS5E1FZ7MbeJUE9nEcDIg5TobdYtJ3hx+T5Dc+5zxvIOydZqkrVS3
 ppGM2LQmJ/rlm9hukAZsKgI11aVwqtkOVGQyQO3x/DbUK+WS0RocF+kPdvgz/oWlQQO/
 EvZkcS+m9p6CD27auivibwjhTMJIpBRpp8fgXi+K4v2845HCwOU/UYJ+lygKfIORSIhw
 CpAyBGAfatCDqoEv+vroiSK9XtqspCs7Q+MBjFTM3JwQqk+mo1EpDf2aTCCN4WgPlu39
 hxY01g97PXTsMaBOvRu2gGM9l1K0AfnOm2E/jb7zL7Z+UPjSdv1+t3M1Y29uIQqbbIBp
 hEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIVvP63uifPNIU0hqhIbdHQEWcivaPiCZBtC+r2TVVs=;
 b=St3z4eYgJQIB4RX+m9MCaa5RK/Krarq4UejR5USr+cJOg2uIG56Ux0Grk/HMgox5Ag
 1giUjVL8oXpheFzzrZ51ci8U0DCP6leF2FpkPz5RmtdV6cbFfJmSJTH8fAqOu/9xaipc
 c6Fl18aJe7K3dKwSc6wxzkOfOExi/Bwd7To5mcGFXafycqOoPKoKeoiK/RBE8BS++xY6
 QXxhaAPJCyT8CieNE054SXoL5Sv0cbG8CbLL03CluwyhE6v8+a+aUvsFH8h+bBFZ0N15
 uo0iDCHgonE6ookjA2K1iTT7ViwU3QEFTbUR+W9m2icfom0hjkw+GMDrBuWmNW8Mk70P
 D9Ig==
X-Gm-Message-State: AJcUukdbOGGgDIhdD5NbDd7jQvcmlOgLk8CqNTBpWgVfCa9bpyX/D3ga
 uCTZCOjqcNFkJIblyT52bsygAfnuGSco3w==
X-Google-Smtp-Source: ALg8bN6aVH3YzfUGp1acmmUfz1WJIORqTjdzaL3tMZB3P0OjOYVYJZisegqn+BzarHFeqhQ9qjrYsA==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr3731553wrm.143.1547569089363; 
 Tue, 15 Jan 2019 08:18:09 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:08 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 05/11] arm64: dts: meson-gx: vpu should be probed
 before relocation
Date: Tue, 15 Jan 2019 17:17:53 +0100
Message-Id: <20190115161759.1657-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081811_296557_8EA4C604 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Flag the appropriate nodes with u-boot,dm-pre-reloc

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/dts/meson-gx-u-boot.dtsi                 | 15 +++++++++++++++
 arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi     |  7 +++++++
 arch/arm/dts/meson-gxbb-odroidc2-u-boot.dtsi      |  7 +++++++
 .../dts/meson-gxl-s905x-khadas-vim-u-boot.dtsi    |  7 +++++++
 .../dts/meson-gxl-s905x-libretech-cc-u-boot.dtsi  |  7 +++++++
 arch/arm/dts/meson-gxl-s905x-p212-u-boot.dtsi     |  7 +++++++
 arch/arm/dts/meson-gxm-khadas-vim2-u-boot.dtsi    |  7 +++++++
 7 files changed, 57 insertions(+)
 create mode 100644 arch/arm/dts/meson-gx-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxbb-odroidc2-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxl-s905x-khadas-vim-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxl-s905x-libretech-cc-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxl-s905x-p212-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxm-khadas-vim2-u-boot.dtsi

diff --git a/arch/arm/dts/meson-gx-u-boot.dtsi b/arch/arm/dts/meson-gx-u-boot.dtsi
new file mode 100644
index 0000000000..868a573e2a
--- /dev/null
+++ b/arch/arm/dts/meson-gx-u-boot.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Maxime Jourdan <mjourdan@baylibre.com>
+ */
+
+/ {
+	soc {
+		u-boot,dm-pre-reloc;
+	};
+};
+
+&vpu {
+	u-boot,dm-pre-reloc;
+};
diff --git a/arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi b/arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi
new file mode 100644
index 0000000000..c35158d7e9
--- /dev/null
+++ b/arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-gx-u-boot.dtsi"
diff --git a/arch/arm/dts/meson-gxbb-odroidc2-u-boot.dtsi b/arch/arm/dts/meson-gxbb-odroidc2-u-boot.dtsi
new file mode 100644
index 0000000000..c35158d7e9
--- /dev/null
+++ b/arch/arm/dts/meson-gxbb-odroidc2-u-boot.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-gx-u-boot.dtsi"
diff --git a/arch/arm/dts/meson-gxl-s905x-khadas-vim-u-boot.dtsi b/arch/arm/dts/meson-gxl-s905x-khadas-vim-u-boot.dtsi
new file mode 100644
index 0000000000..c35158d7e9
--- /dev/null
+++ b/arch/arm/dts/meson-gxl-s905x-khadas-vim-u-boot.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-gx-u-boot.dtsi"
diff --git a/arch/arm/dts/meson-gxl-s905x-libretech-cc-u-boot.dtsi b/arch/arm/dts/meson-gxl-s905x-libretech-cc-u-boot.dtsi
new file mode 100644
index 0000000000..c35158d7e9
--- /dev/null
+++ b/arch/arm/dts/meson-gxl-s905x-libretech-cc-u-boot.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-gx-u-boot.dtsi"
diff --git a/arch/arm/dts/meson-gxl-s905x-p212-u-boot.dtsi b/arch/arm/dts/meson-gxl-s905x-p212-u-boot.dtsi
new file mode 100644
index 0000000000..c35158d7e9
--- /dev/null
+++ b/arch/arm/dts/meson-gxl-s905x-p212-u-boot.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-gx-u-boot.dtsi"
diff --git a/arch/arm/dts/meson-gxm-khadas-vim2-u-boot.dtsi b/arch/arm/dts/meson-gxm-khadas-vim2-u-boot.dtsi
new file mode 100644
index 0000000000..c35158d7e9
--- /dev/null
+++ b/arch/arm/dts/meson-gxm-khadas-vim2-u-boot.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-gx-u-boot.dtsi"
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
