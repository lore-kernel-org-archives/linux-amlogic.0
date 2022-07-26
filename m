Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AD8C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 13:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5Au4C9I1jvImrdPLCsBl+bw/dyuutuo/Z82BoZu3VQ=; b=kB6Fb/UEAwn6gG
	ARbJ5L9FKsWG4WGdCsfP2czobd7s5k4APeZkHvBP95ZL3L+aQl2ChktbIbxVSDA0WgC9AUmM20OEn
	NkVanTJ3mNqR7zy9c1m2lkpcyWPKA7f4W1DF3B43e+Mu2z07z6rykLWCSOIuYj2AOLD+Di/2lm4y/
	Oe+QYfdgXmtwjtLUZqIlBmyvi0nRxlh852A+pekIoi/8gzeBYl1LfWZo3BSQ6OaW2conpvWIXpMQ9
	WanPPXkVHpd6byEWJ4GNrLsFdxqOOHSiGohW9oPpIF87nWf2KRRlNcyPXyq7GSRyVTFUfdzWOX+gK
	KuwaZBUUm45TvOSfwXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKPk-00HJ0P-13; Tue, 26 Jul 2022 13:15:56 +0000
Received: from out203-205-251-72.mail.qq.com ([203.205.251.72])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKPg-00HIy5-PT
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 13:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658841348; bh=5geWFKNR9AJ6x3qx++pzhLuWNpfTgGlIuLAIHsGBbVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zyUx1sm8vTak3BLEf+KTl3D90EKkmrh6gXQR5pKKES4McNYdPYY9dKIuqAAqVuDv/
	 xB3XSQDJB1k+/xQ56z0NfSzd0srTZOrwxx/WpGABNYWPRVYwgdu7pxUiyOUQ1RVO9a
	 c5VwESYVLTd8wOcrpa1DlsVvi+AX6UXTz5U0/CMM=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 3EA1E4DA; Tue, 26 Jul 2022 21:15:42 +0800
X-QQ-mid: xmsmtpt1658841346t3xi8az24
Message-ID: <tencent_7941C3ADC1F805DF58467BADCD88F4C0C406@qq.com>
X-QQ-XMAILINFO: MyHh0PQai9FpTpG3FI1lKjNYjEOZwJnjpla9XEmvmmU1mw/EIHI9NmT6pVmmXR
	 cNrFeVeZAb36XNhH5kNFRAaRxrQRqDTNJ6uyYDDJ7UNuTRK5zpwOR+LINFF8mC5B+JOypDosrQSa
	 JlQZNBW+Ao/kxc4mCIayflaJrPB5QRBaQvvvH0HSXbpxSEUerLubJFNQH8qJnviWRB+XNMkLDV79
	 5nIgDghgBxY+9kYlACpr0H+J49HE6Mo5c0lM71MDW5Wuq8TwZMpswu82FpOQt5QjWcssqpNsVGmd
	 wuxzboQZcuy25Ustc6hhXtE4jae9nWX03s02StSiK1ahD9vCjJCBsYs0GJOtdl//GfrdYR3jrWW+
	 v0HN0xiEePOLPVO/BIS14OLoD9ruh5+YFh7Mn+ZRj7O82BTdiRTgTPV7UIy8z6nAQ+h8G/JxsepU
	 juJ3c9WjsCw3iCBi+D4d7UQ2swQXZEialJ2RM287WCxuNylQFJvOfp7mtHAg2gskv1PW+MAZU0Nf
	 p5HjWcJvgQ65ImfA83roQhoPdh4x1mU/GT+EaNAFxmnJXCgjfnwf1Q8C8XcKATfVx3Zk/8OTzRvc
	 U2iNOcrJf7Eu0qJJYYvgBmSMTNxPy/65vpGS9iRmONOJ1E8RAnFNvGm888+sJrieRdiUKoEI6KOb
	 clxU8W/OpYzdvfsdAUdTYPbfyqMDXuOzEX/vUmqKVIBNRVdEQ0sDTXEhoHta37XvBuGwQhbcO1nb
	 ZrE1ZNrz4H7aIk9mYvG3h6mecpqsiI5mo3glVLKHs9vCnkdPSSoKAxznk92TcDIEYvqhHMaPs/pb
	 ISsnLXNTs3bHaMxZhsS6XWxhh6tKqKeobYEQpWpDxQx7qUS+WN5rtykSmZhvFEc0ojs3ag/C0+XQ
	 Xss/DLg2K3j1USNxat4o24hOZJc/Q4E/G6n4rCNvJ7MrsUl0PEfNHOGLLmKVfchg==
From: Zhang Ning <zhangn1985@qq.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com,
	martin.blumenstingl@googlemail.com,
	sean@mess.org,
	linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v6 2/4] media: rc: add keymap for MagicBox M16S remote
Date: Tue, 26 Jul 2022 21:15:21 +0800
X-OQ-MSGID: <20220726131523.140581-3-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726131523.140581-1-zhangn1985@qq.com>
References: <20220726131523.140581-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_061553_171490_8C56FCDF 
X-CRM114-Status: GOOD (  13.65  )
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

MagicBox M16S Tv box shipped with a simple NEC remote.

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 drivers/media/rc/keymaps/Makefile      |  1 +
 drivers/media/rc/keymaps/rc-magicbox.c | 58 ++++++++++++++++++++++++++
 include/media/rc-map.h                 |  1 +
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index f513ff5caf4e..02c1c2150f03 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_RC_MAP) += \
 			rc-kworld-plus-tv-analog.o \
 			rc-leadtek-y04g0051.o \
 			rc-lme2510.o \
+			rc-magicbox.o \
 			rc-manli.o \
 			rc-mecool-kiii-pro.o \
 			rc-mecool-kii-pro.o \
diff --git a/drivers/media/rc/keymaps/rc-magicbox.c b/drivers/media/rc/keymaps/rc-magicbox.c
new file mode 100644
index 000000000000..015767429028
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-magicbox.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2022 Zhang Ning <zhangn1985@qq.com>
+
+/*
+ * Keytable for the MagicBox M16S remote control
+ */
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+static struct rc_map_table magicbox[] = {
+	{ 0x9f57, KEY_POWER },
+
+	/*
+	 * This key labeled "M" is used as magic key in vendor OS,
+         * and mapped to KEY_MUTE.
+	 */
+	{ 0x9f8a, KEY_MUTE },
+
+	{ 0x9f43, KEY_UP },
+	{ 0x9f0a, KEY_DOWN },
+	{ 0x9f06, KEY_LEFT },
+	{ 0x9f0e, KEY_RIGHT },
+	{ 0x9f02, KEY_OK },
+
+	{ 0x9f47, KEY_HOME },
+	{ 0x9f4f, KEY_BACK },
+	{ 0x9f16, KEY_MENU },
+
+	{ 0x9fff, KEY_VOLUMEUP },
+	{ 0x9f5d, KEY_VOLUMEDOWN },
+};
+
+static struct rc_map_list magicbox_map = {
+	.map = {
+		.scan     = magicbox,
+		.size     = ARRAY_SIZE(magicbox),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_MAGICBOX,
+	}
+};
+
+static int __init init_rc_map_magicbox(void)
+{
+	return rc_map_register(&magicbox_map);
+}
+
+static void __exit exit_rc_map_magicbox(void)
+{
+	rc_map_unregister(&magicbox_map);
+}
+
+module_init(init_rc_map_magicbox)
+module_exit(exit_rc_map_magicbox)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Zhang Ning <zhangn1985@qq.com>");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 793b54342dff..656217b8e91b 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -277,6 +277,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_KWORLD_PLUS_TV_ANALOG     "rc-kworld-plus-tv-analog"
 #define RC_MAP_LEADTEK_Y04G0051          "rc-leadtek-y04g0051"
 #define RC_MAP_LME2510                   "rc-lme2510"
+#define RC_MAP_MAGICBOX                  "rc-magicbox"
 #define RC_MAP_MANLI                     "rc-manli"
 #define RC_MAP_MECOOL_KII_PRO            "rc-mecool-kii-pro"
 #define RC_MAP_MECOOL_KIII_PRO           "rc-mecool-kiii-pro"
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
