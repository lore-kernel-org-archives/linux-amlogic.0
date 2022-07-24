Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0E5C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDgU+UCCgAw8YLDUeOSezetJn0p5Mpk9s0SVPXy8Dz4=; b=gmeonM1pxCzvZU
	h2LTS2xB+hoHNTZ8V6VNvoUfpMbVy/LZtPKYKMLYbDy1z3sh5YU4Vx5/eh5zeVBAWck5txoTo1g0/
	RvEbkiG0Yctqfz05dphtIX/jIjzcYwwXlhYWyIyBh/6u7wIXTEgpraHWcgzm9M1DUl3BkRKD3pXHc
	yHgFkKdWZHDhZEtLuOd7ZIu86JixtVECPd9DR9P+PrKU58Jtu0/6N9H41srW+hWomSofHhTTugIHh
	nOfyRLNbKnIVkOLuNHfDtKL68NtqMcTWGDCMqiwB/zCY+C6EJJz6bhlzNDiK3sPwGQtCP5wm1CbqN
	H2cr+1FYCO1zv7KFjX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcQx-006WJM-Sn; Sun, 24 Jul 2022 14:18:15 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcQt-006WFW-W6
	for linux-amlogic@lists.infradead.org; Sun, 24 Jul 2022 14:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658672289; bh=DbWKrvR10r1zE4/Lc/OCMOhqelIuyqNB4MkXAJpJ3i0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fdGZqv0G12h9OADddYr6/hQDq8CpyT56VQ6SdY7JEPT+Q8fV/dGzlD8KsrRu0iAZm
	 rT5bRHTSb0KXNG8MCBERrwbZyjm/M/Uw5i8qTXJyW/t3mPOUpyeZXorxOiWOqAS9f3
	 oXo0Y1cHoQHyWItoDIypMSFX/TmJ9ZrcF5Xj+z+w=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrszc13.qq.com (NewEsmtp) with SMTP
	id 48289623; Sun, 24 Jul 2022 22:18:02 +0800
X-QQ-mid: xmsmtpt1658672287t2ej74n9e
Message-ID: <tencent_E6A4A40D269E1A840D602EBCC752DBEB6C09@qq.com>
X-QQ-XMAILINFO: MzYTHVlhOHw4ADZUBRIsvqjxotTTCL5nBEFw9NM9N7u+6L1XhJ1NkMndty8/DQ
	 9b358AqP2Me759huPa6CstyZr9lmQCMHBTFW8LwaL7y69azQhkY7Ow46GtT/B42+ktLWnySbomjG
	 8o/QVXE+aMMRwlVK9gZcwjEke8cps/lqHQA0GJDZ0n7J6zpTvra7iS1Swnemx45fNA6VUeD9mUaU
	 nnqYwxTN7hS0ZvHG9rdtG0W0GnjbKF/vSpGm5wMebnkB4KoLD3RPMQyGwgaZT9EMWiEbCSbWzeVk
	 p4FX7nkgnqmZ/EEIyirIAoOOsX2MQegqJSzDjBUOzyzXSxgQc81sm5WLo41Yogn15vsyGxWkqdbK
	 CtdCHQwdUARxX17YVZC4ddPXvrS64NAfVFGlXe3eM7XVsnyE+vw8TZn4DIqDgp+OCeQbORg641+L
	 nsZGOUHJxbpP/WooxKCfTzCIZV++rkLXDzbCx3X6TwFIbqXsUNj7MouxjwcwUy4i9OujDp2Z/3DR
	 A150n70Rz38Rz2IruIARXtAieE+kcSfgHKrCprzoaBqqmLPNZKXBh39GcGPXz4rcgVVIqC0h2vTH
	 J4UtNG02nNG+vRSoHqZgshCMJ+9lj7dcw0uKN0koA1VBzcDCzbZ7/2+80tTZnOwOLJ3Kcp9JFONg
	 uxJeGLq5x+1bd2O+gvrAEqjkIbzAYyxiYNUvfht2CamJNIm7/z7uCa5GIqPI7JTFJKGvXmQDv3ur
	 e0La7QWx/bpcz9+nOL2iIjsdtP7eJgtYqTJDXBfPHhO4fdoSmBG/QzauS2ObyG29+XW8lKNq3VOp
	 OoNqdg725GZ5CS2jtCJfhb2M9cfU/ga5Gb7enKkI+fneDq5n/zTmdtsWZRqu8MF6NCcDo2+GvfQt
	 HKQ5VD7+JdWyZqHDoln5Weyq5bOHxNPYq/YgrMHfbWDBMlMpYMffPjGW101J/TSxxpdWTbPr3g
From: Zhang Ning <zhangn1985@qq.com>
To: martin.blumenstingl@googlemail.com,
	narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	sean@mess.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v4 2/4] media: rc: add keymap for MagicBox M16S remote
Date: Sun, 24 Jul 2022 22:17:47 +0800
X-OQ-MSGID: <20220724141749.131724-3-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724141749.131724-1-zhangn1985@qq.com>
References: <20220724141749.131724-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_071812_359021_09CFCC86 
X-CRM114-Status: GOOD (  13.00  )
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
it has a key labeled "M", used as Magic key in vendor OS.
Ths has mapped to KEY_MUTE.

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 drivers/media/rc/keymaps/Makefile      |  1 +
 drivers/media/rc/keymaps/rc-magicbox.c | 55 ++++++++++++++++++++++++++
 include/media/rc-map.h                 |  1 +
 3 files changed, 57 insertions(+)
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
index 000000000000..8383fc7b10c3
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-magicbox.c
@@ -0,0 +1,55 @@
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
+
+static struct rc_map_table magicbox[] = {
+	{ 0x9f57, KEY_POWER },
+	{ 0x9f8a, KEY_MUTE }, // M
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
+	{ 0x9fff, KEY_VOLUMEDOWN },
+	{ 0x9f5d, KEY_VOLUMEUP },
+
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
