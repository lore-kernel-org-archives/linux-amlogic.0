Return-Path: <SRS0=yw6d=O4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5A9C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Dec 2018 00:27:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4507C2184C
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Dec 2018 00:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VOjQdo8F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VcUl6ZcO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4507C2184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yv/OnZ7hlVe6qtIaPRV/bsdMR72SWtVTzs3aKmZPDFU=; b=VOjQdo8FnXgBGO
	BhriLY+tgxVRL0ahcRBiTGvN6q5YjKxFs8hKeXy8ENUBf/gw6ISK96wTVItJReI7cF+2wuowCc8o6
	xEAE4olq9CyQTVZq7+is96zilfIVoOhq05gLY+CApy7u/xUHrwel1DRmoFZsc1/AlBASuHHcoMdmG
	c40lniiybIIeRMCqNSgC1TNx7pMlaRwS0QP49a/txdrC1jbX6oZcB2QtvBQxO4UfPbOyuynhzU42E
	uejY25m7rTPf8bQDr0x4tKaTBneDhckpVm/WCqVQxgKxkKbiXo2JMxxOCNHaSUhSCHx+k/dB6eJaC
	JcWyLQ6Wv8W+gHBU5Vqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZPhX-0003kQ-Dh; Wed, 19 Dec 2018 00:27:03 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZPh4-0003Ix-LZ
 for linux-amlogic@lists.infradead.org; Wed, 19 Dec 2018 00:26:37 +0000
Received: by mail-pg1-x542.google.com with SMTP id w6so8586470pgl.6
 for <linux-amlogic@lists.infradead.org>; Tue, 18 Dec 2018 16:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hL3Ati85fy8xFPkWQkPeCaLxIhmY089PTpo//eHsIx8=;
 b=VcUl6ZcOmFKO1l5mSOnUQ4w3T8m0EkrQ+Cs76VpPqospZNTYpNroW6AFJzRAtliT74
 7aJmeqwGvzULNnumJ2qX61fsmVOTRNELlxlGd9toemARpH5dW07e/0k5pB2ZJ2ofP/pp
 YZOlYrQDeHif/GkIUn3ZUHaH5KRK6RNZce0k8VWZkD5sPlxHpbvNMx9Kd3nB1wWnF+1s
 LmSHH+/z//N7XynNUl4X12YzIyB89/srrijPbbAwbxMdB5bZy1TTIGlmHJ7oI1WATObA
 rZav8dAdDuxc6CyJnxZthk44IEcU9XyDAjMM40KhyOW8TUrgHYEeA31Aw5E+VlfsYqKL
 poCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hL3Ati85fy8xFPkWQkPeCaLxIhmY089PTpo//eHsIx8=;
 b=KWfinjfeBU1XtLTI7ssS3Fj6v8nGcvxFbLr1I2SOU+bBxfuCL0nC8fpLsLp6Wbr1Im
 Q9neZBybE3dejoPtowfV9HlCfUmqTtlNVLHzeyhKxGwkeWHMhnh12PNH6z+LwUDuK1Sa
 11v+lB0Gl5Tqrtf0TExdoDA2ARB7nNFZHwva0zA/M4eX927iZ0ZMiRp/k1/2di01C/mI
 r58VS1We95MkphqEme+40Z3GD/isiO4W73U7eUa87XK3DnV8n0EVdPScsDgUZkuryJn3
 brvI/9CkpBR4Bm3mzB/IkXITgsATvlqfMQyYqn/Zn0PZepatsOLu6q2AcxyMw3MRo3uj
 tZjw==
X-Gm-Message-State: AA+aEWa6MV8z8nrKKPUtqQjswLlE7UXhcPpFI8PD2ERux/Mhsd0fO3cn
 +eOhMQIbaBoInY7BTndpnq4UppDM2dQ=
X-Google-Smtp-Source: AFSGD/WLtHfBXONkh3HKQH8ghbzwWlejt8OaqHmf9eAhUkKNvnPb1MN9y0PGNOXwI2e5SogvuyrRVw==
X-Received: by 2002:a63:990a:: with SMTP id d10mr17722148pge.279.1545179183263; 
 Tue, 18 Dec 2018 16:26:23 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x12sm19743148pgr.55.2018.12.18.16.26.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Dec 2018 16:26:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: meson: add g12a x96 max board
Date: Tue, 18 Dec 2018 16:26:20 -0800
Message-Id: <20181219002620.12138-2-khilman@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181219002620.12138-1-khilman@baylibre.com>
References: <20181219002620.12138-1-khilman@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_162634_699920_7DCB5316 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the G12a (S905X2) based X96 Max board[1].

There is no branding for the manufacturer anywhere on the product, so it
took some digging to find the manufacturer.  But since there's nothing
about the maker on the product I've left it out of the DT name because
1) nobody will no that name and 2) keeps the DT filename shorter.

[1] https://www.cnx-software.com/2018/09/25/x96-max-amlogic-s905x2-tv-box/

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Special thanks to Martin Blumenstingl for extra digging for the manufacturer

 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
new file mode 100644
index 000000000000..fe94765b671e
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "meson-g12a.dtsi"
+
+/ {
+	compatible = "amediatech,x96-max", "amlogic,u200", "amlogic,g12a";
+	model = "Shenzhen Amediatech Technology Co., Ltd X96 Max";
+
+	aliases {
+		serial0 = &uart_AO;
+	};
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+};
+
+&uart_AO {
+	status = "okay";
+};
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
