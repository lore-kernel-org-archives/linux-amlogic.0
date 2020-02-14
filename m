Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED18C2BA83
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 08:58:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1484E20873
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 08:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q7GP+kEL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuJK5ZmI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1484E20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cu/b7Gz2bPkZcli05Ecg1kziJ2ZzlVxWS2cqAuOMNM=; b=q7GP+kELbP4YlA
	px/Sj9HyQ8wJ4lpm6E2BlV7/0wVqDBD1prJRUOKJ87q3HS6A0lucEQjCRs0AH7C1I8pCTzhsJSb5S
	rd2dtjWbJX1SwtjLr/jKgEFPQHDA4ET5Z6pdfYrdhE5Vu60w7/0Xw6+2ixHD2J2TNav1Qr9ncHSnt
	2xRxgZBZ6UR7kiBuB+sEbvRG9U6S6ktlLureg2jgO1pZWvGha/HCYgQw1QFcDQGHztCxjlTFbQX9T
	JH9s/HWWkvIaqmrXPfVbgcKn6no+9glDxjs6VNp56NlSEaS+X9z3OnMbQzTSOLgaKliylTXhxsktD
	dnVAhKrjCxe37McD1MmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Wne-0004Iv-4K; Fri, 14 Feb 2020 08:58:14 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Wnb-0004GY-81
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 08:58:12 +0000
Received: by mail-wm1-x341.google.com with SMTP id m10so1557769wmc.0
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2020 00:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNHMsrFpW6UxmjPYn9L8QH02HyfSoGO3j/SqFO5X3Sg=;
 b=HuJK5ZmIt1gRK1Xh9dxdU0IkgGYYPnl6lf6LKs+/jKZE7iEOXRHH13u6ksUmfpduet
 7OnmusNgdjYuirXERXkdabhTwWzLanp6Af5vSr+5ebIu3FucjNa9KbpXZRtmQ9/hT9de
 8JzuZZ6s7IyFxL0RZm69jsoU99t5UDRon9cTcMLCgTwwP2mPrYHCPDV2Fcj3Yi+2jSTX
 Ua2qpkOlGR7FvMYS1bYb89L4HrDmPU8HxPeIbfVXuo524EK72TxEF8yCG2HTKEF94Wc/
 b0jnH6T1yfYKxMfymnVqwiSd5k/Ddl2nw6Jin5X/AsB7WUSWbmBhfQKr8zLRq1QjakVd
 bnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNHMsrFpW6UxmjPYn9L8QH02HyfSoGO3j/SqFO5X3Sg=;
 b=tawzCDUtnCl+TQxxBGL3H5nJ/iCrQjV36jfjzTqsxqs89/xv9xympyvh31PNrePUL8
 WfsvtnM3YYLTA5a7uAAtZsg0S4L3Wdq8NpH8uieA7CDnkHSThk4XrffNg4kXriLjrl2p
 Xxdwn1qWUQHpMWFmssDR4rjOkMx9/HSqNNELPiF4aB0csuSKX42qUnxR/VV4rrx68ISL
 gE1MJDd2OMNuONaU+STeW1KWVfK7lOrctRioM45z1Vz4oWDCn3flBj2YrRUUkij93Jlk
 p95LwYbQoC2i5b9QkKHNIhlqvqHa7lSeuoHWApFq/Dddb2ZGgrkwzCf0rlJrS3Z7u0s9
 OyKw==
X-Gm-Message-State: APjAAAUMBqWpUWEFm8vqnxCzFO3G+mgipfjgt3IsKMc2bZE6wUmVxVMw
 losYTs9pEPznXhm+ofM0nxw=
X-Google-Smtp-Source: APXvYqwH46ZVwvqUpazhBp15QCAhXvH0sIB103vvSXT8bKEQ66FJzKLQeWXPMiqcSOaKoZWNAmmLOA==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr3384909wmj.43.1581670689597; 
 Fri, 14 Feb 2020 00:58:09 -0800 (PST)
Received: from localhost ([37.237.208.38])
 by smtp.gmail.com with ESMTPSA id z19sm6206418wmi.43.2020.02.14.00.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 00:58:08 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: [PATCH v5 1/3] media: rc: add keymap for Videostrong KII Pro
Date: Fri, 14 Feb 2020 11:58:00 +0300
Message-Id: <20200214085802.28742-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_005811_284256_2FAEE867 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is an NEC remote control device shipped with the Videostrong KII Pro tv box.

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 drivers/media/rc/keymaps/Makefile             |  1 +
 .../media/rc/keymaps/rc-videostrong-kii-pro.c | 83 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 63261ef6380a..aaa1bf81d00d 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -119,6 +119,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-videomate-m1f.o \
 			rc-videomate-s350.o \
 			rc-videomate-tv-pvr.o \
+			rc-videostrong-kii-pro.o \
 			rc-wetek-hub.o \
 			rc-wetek-play2.o \
 			rc-winfast.o \
diff --git a/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
new file mode 100644
index 000000000000..74a278ffa3f1
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+//
+// Keytable for the Videostrong KII Pro STB remote control
+//
+
+static struct rc_map_table kii_pro[] = {
+	{ 0x59, KEY_POWER },
+	{ 0x19, KEY_MUTE },
+	{ 0x42, KEY_RED },
+	{ 0x40, KEY_GREEN },
+	{ 0x00, KEY_YELLOW },
+	{ 0x03, KEY_BLUE },
+	{ 0x4a, KEY_BACK },
+	{ 0x48, KEY_FORWARD },
+	{ 0x08, KEY_PREVIOUSSONG},
+	{ 0x0b, KEY_NEXTSONG},
+	{ 0x46, KEY_PLAYPAUSE },
+	{ 0x44, KEY_STOP },
+	{ 0x1f, KEY_FAVORITES},	//KEY_F5?
+	{ 0x04, KEY_PVR},
+	{ 0x4d, KEY_EPG},
+	{ 0x02, KEY_INFO},
+	{ 0x09, KEY_SUBTITLE},
+	{ 0x01, KEY_AUDIO},
+	{ 0x0d, KEY_HOMEPAGE},
+	{ 0x11, KEY_TV},		// DTV ?
+	{ 0x06, KEY_UP},
+	{ 0x5a, KEY_LEFT},
+	{ 0x1a, KEY_ENTER},	// KEY_OK ?
+	{ 0x1b, KEY_RIGHT},
+	{ 0x16, KEY_DOWN},
+	{ 0x45, KEY_MENU},
+	{ 0x05, KEY_ESC},
+	{ 0x13, KEY_VOLUMEUP },
+	{ 0x17, KEY_VOLUMEDOWN },
+	{ 0x58, KEY_APPSELECT},
+	{ 0x12, KEY_VENDOR},	// mouse
+	{ 0x55, KEY_PAGEUP},	// KEY_CHANNELUP ?
+	{ 0x15, KEY_PAGEDOWN},	//KEY_CHANNELDOWN ?
+	{ 0x52, KEY_1},
+	{ 0x50, KEY_2},
+	{ 0x10, KEY_3},
+	{ 0x56, KEY_4},
+	{ 0x54, KEY_5},
+	{ 0x14, KEY_6},
+	{ 0x4e, KEY_7},
+	{ 0x4c, KEY_8},
+	{ 0x0c, KEY_9},
+	{ 0x18, KEY_F7},
+	{ 0x0f, KEY_0},
+	{ 0x51, KEY_BACKSPACE},
+};
+
+static struct rc_map_list kii_pro_map = {
+	.map = {
+		.scan     = kii_pro,
+		.size     = ARRAY_SIZE(kii_pro),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_KII_PRO,
+	}
+};
+
+static int __init init_rc_map_kii_pro(void)
+{
+	return rc_map_register(&kii_pro_map);
+}
+
+static void __exit exit_rc_map_kii_pro(void)
+{
+	rc_map_unregister(&kii_pro_map);
+}
+
+module_init(init_rc_map_kii_pro)
+module_exit(exit_rc_map_kii_pro)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mohammad Rasim <mohammad.rasim96@gmail.com>");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index f99575a0d29c..d22810dcd85c 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -274,6 +274,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_VIDEOMATE_K100            "rc-videomate-k100"
 #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
 #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
+#define RC_MAP_KII_PRO                   "rc-videostrong-kii-pro"
 #define RC_MAP_WETEK_HUB                 "rc-wetek-hub"
 #define RC_MAP_WETEK_PLAY2               "rc-wetek-play2"
 #define RC_MAP_WINFAST                   "rc-winfast"
--
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
