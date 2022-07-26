Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359E0C19F28
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q18+cfuf3dZFw7heC0sEyfet93Z8Nf/peui9xr8rvmk=; b=KaNuq0Dnh7AFrj
	8MR+IV2nLTAj9cW5Wm8gEv6CS1NH8hooqxnKXAzh90zU5VMmVUGg7XfcWTQiksbVBBkyjTLwgFGMd
	D/8r2PdPTS7g0Gt3h4qPXo7ekL18/eM0lJHyzXENtuAOwPGiOpF8L3A0B6jWK8LWn0v5j9wEHv6Ri
	MbiXJ+/QUam1A+//FT1WG9uGlLLK5oqhUj/uhJ14YLrUQqESiTrzCjE4hLFrYSPOQlq8L6EYaH+v8
	vQb1J3ZIIrt2qFc7+DGZQRhvHz+oemmi+uFKq5K5x+GN/a5DHD36IqiT6kR48hv31YCASCHp2Sdyk
	u1gj/89HadvoDksxFx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLgP-000Gxy-Nf; Tue, 26 Jul 2022 14:37:13 +0000
Received: from out203-205-251-66.mail.qq.com ([203.205.251.66])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLgL-000GuK-Fu
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 14:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658846226; bh=n+2zwg2mfAc6w5NGzL5Tt7QCkWYembSPh6trcGb1UsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=y8qnz8P2sRQK2nKWwbFA0s0y50ZYmH+eLx7gob2qVonfBR6ZvCv6isJgLcxNopyQW
	 RQFeqNbTtnDx+geiPp+tFzNHfSNDdYaayxQdnffPYXwMNzjgYhUn1ww7iva1Iw7DYD
	 QQFHfzzI1bFnc1aT5AkiQ8I2mZ2gf+J13l2kz+do=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza35.qq.com (NewEsmtp) with SMTP
	id 940102AA; Tue, 26 Jul 2022 22:37:00 +0800
X-QQ-mid: xmsmtpt1658846224t7e82lufb
Message-ID: <tencent_C8CE09C0860E03CE0BB931D876251B746907@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j80DVVCKg9tfd8cDK2rVIzJozayXGfT7vLIJfl1PppYtKQKMYbWb
	 2Nk44TnbbVsU0OVZ6d5Rjvsv6taBna42mEomTO7Bu77vV36sGw+NE3HaV4uBksIPsmElBvx2ss2R
	 iOlwaX6Tat82RX4F94ZymYuV6FHS1lzYWOxQXqZXCoaeVd0X+N52Cbycr+e4rLWSx7tAII1lyH9n
	 IgYYeKBVaOk/6UAxWkJa9UG8R3o2KDlWmrwdtZsRhv1w+Tm1igfa4T2358TMRA4m2/eVY45SoBB2
	 1E19g3A4X/l6mAdmN6icQg8jYbGLO4YdmZ0ZusMfL8op/iO5hZBzYnxO+dpJcMUKzdf9/Fw0kg+3
	 s41c9wGROQlnzoxqrHXFgwH1vDBJAjEzMxodDeuysno3+3kQhjOTRNWkdohcnqQ0sgpqRv0UlQdq
	 Xjq8JgG5l/Qhi+vxdRHiL3Iubs49atzNeoBNHLbiCE/g8o9BRpL0MEjhmcLN6FtnPeynLsDIFCKi
	 mg5gWmOmSmgJaD5xpC2J936Y8Odu6dgdjFsGgeTtOFSGqsjw+Y5m5fH0XnWecovOiExz+dvGO+9f
	 aPksPqlXcjtVW9VnUDNIBgs1plttSgLSZq551cPCdznlOt07ikNH6u2tOakV1/KK0hDGKtuju+O4
	 4wDqpoiDo73jcMCjnO+oKBuwoZETrOdV1t5WtkxuPm1f6QYFfOLx+BQEqdMk3rqf+VOsDNBktNd2
	 98c6aO8bBQ12mj4dFiLBBBYyFo0ISGutwIU47+aopH5/Ictxb2xKdwO5D5u1OdMUXRQFDysi7tMf
	 3+dx0oKkQMtje6M8nHEGX2xwPsS8vT+eTvh7iALfPRfLt710rNAvkX5PIFi6bRNAhApB5Eya8UMT
	 Ot9Whh+MQTie9MA+ynNDOdRUmT4CMl/hR6pa4WBvr45bRs+sJTGNR83WJ0YrMcWH1RfDTzu8c8yF
	 hu4dZRcwGgPP57EiwSrokwzN23ls+ebTve9QqqBRY=
From: Zhang Ning <zhangn1985@qq.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com,
	martin.blumenstingl@googlemail.com,
	sean@mess.org,
	christianshewitt@gmail.com,
	linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v7 2/4] media: rc: add keymap for MagicBox M16S remote
Date: Tue, 26 Jul 2022 22:36:47 +0800
X-OQ-MSGID: <20220726143649.142574-3-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726143649.142574-1-zhangn1985@qq.com>
References: <20220726143649.142574-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_073709_857981_BD95E515 
X-CRM114-Status: GOOD (  13.75  )
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
Signed-off-by: Sean Young <sean@mess.org>
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
index 000000000000..a1d9ff30d051
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
+	 * and mapped to KEY_MUTE.
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
