Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CB6C3B18F
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 22:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB0A22086A
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 22:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MjX4yWRH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1UTBh4c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB0A22086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cu/b7Gz2bPkZcli05Ecg1kziJ2ZzlVxWS2cqAuOMNM=; b=MjX4yWRHfxd26O
	2xnoME2GQl5i9I74AYi4USP68v12i4kgbT41jAKSgC1v5mMzrXJYDFOz0rd7+rrHYyBpiOLp+O0FO
	zydSTIKjbJivIY2skFDzIveMOXw3wAvW4EE3bmNHboMTdet8SpVAqLBhJUVFjEAJGkQbrSQQS7Unh
	3di65WU4AXgKpyGmq1u0zH80JWBsGxGHyPDPiSDrT7xF/3mFz2RNtTL1Lubq8XNRQr8mq2e32bjS/
	rvNFfLhgeh/+CDoXDzt79HtPKPt3PP/AJ/efvAvTld3ekwg71t6BkRnJgt40YHQWaGcL2rh5246PO
	vEWCjy9jR1cjUgreEAgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Mlf-0006AP-QE; Thu, 13 Feb 2020 22:15:31 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Mld-00065F-9c
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 22:15:30 +0000
Received: by mail-wr1-x443.google.com with SMTP id w15so8652407wru.4
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2020 14:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNHMsrFpW6UxmjPYn9L8QH02HyfSoGO3j/SqFO5X3Sg=;
 b=Y1UTBh4cKwum14du9DtpH1dK+W6N6rldqWcRqa17b0kpzJoc2WVIRpIfRYyhyzhOjZ
 P1QsLuv3hYxhDLRmvoIwEpsDSSD5Jh9kHG0Oqe8IZkqyZcnZFf56sicYV1GfMlpRDn3F
 MKRxNo/g4XwlClQaCA6pbJ9xsy+4pfha+fFOndMzocTcZyAMPyYzDLfTODhiM7Y93xak
 j6pE63Lxepv2O5wPwsjt12llh2U77iZL3cBheO+c6PQB3UUdo/08QoSbz5TAc+Nq0MFu
 iZKWue5dz+zPPsLyMTpRR54a3R0hRxncdB85j6SMnvdABZQnEaTTvzuiuqhZSGtTw+r9
 42rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNHMsrFpW6UxmjPYn9L8QH02HyfSoGO3j/SqFO5X3Sg=;
 b=j1nLqwY3vo0rzlaBBb0kUg9cibmRkW3FFvVYtLVLjInR4ZyxvJIT1/H3jYsN5Bg85V
 xbhE/5d9sIFZjmCmGR4ULChrRavmlZCyuPaVltiKxyw+zv7k7+A3S1papj7IO6NsjoiI
 SdFZ485xpmGcQ5xvhFEXCAxUDNOoh9+1D1cMIAMtjioTSmNwXR7ymJOkascSIEdJhbmI
 3vLNJ2puti0sOPHyvbwBYKFLTel/4L5uBaLnq8tHiZjox3Apcw7Sf+90Hp5z/AV2JdBH
 sUC8aH/kZPNDdRHo3MoKMeYIi/aDKwYhzNwgj/fOROAarjssrfLrwHZZCS7EBXaYdY87
 SEUA==
X-Gm-Message-State: APjAAAUqqcNXJfaZP8tHNwnhlPgMJ3mttKDVCXzrs7VR3/iUODyty5Gt
 5Bu0suitnio3UBqaGCB0EWk=
X-Google-Smtp-Source: APXvYqy8qjWmrikXRItnTX9olAYWWfbD3wCZJD6stOK/ag37WlKsTH/8vNUP5vmDzeJ9k+oHaEE38g==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr25130175wrv.302.1581632127506; 
 Thu, 13 Feb 2020 14:15:27 -0800 (PST)
Received: from localhost ([37.237.208.38])
 by smtp.gmail.com with ESMTPSA id d204sm4657711wmd.30.2020.02.13.14.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 14:15:27 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: [PATCH v4 1/2] media: rc: add keymap for Videostrong KII Pro
Date: Fri, 14 Feb 2020 01:15:12 +0300
Message-Id: <20200213221513.28540-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213221513.28540-1-mohammad.rasim96@gmail.com>
References: <20200213221513.28540-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_141529_333070_A41AEAEC 
X-CRM114-Status: GOOD (  11.95  )
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
