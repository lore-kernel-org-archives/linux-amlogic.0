Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C59C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Jul 2022 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfjM4pE2FoYB/b3Ql9EHHGOVygtBQTYg5h/SwYAeack=; b=amSBlB8TEefU0m
	LA3pau5jDQ15/G5elR4TG5/ykXRLEoDfGn2jTKFnZaK4oRvvcDLK96MBNPdpW6KZkEkolmanIYjS7
	Nmuqs9a/3gFchrao3aLuwGAu3Pzi5TX5fkxM0lTtWDE0ULfI1wwkq3N2dyVuFBuiveyjoS6eLvDq2
	ERvWJOqYLwv/1I/eiUQ6S5lv751mrn8otooMDXCUsLQaxdqhEh6zXIGFOe+jch08VcdpA8npikQDv
	gpE2y1cXSbL5ZX+v+5rRKrt+d6K43iX/Ve1FFFrAwTqoROMm5rGkJ8obperpGG3mS+yG0OxA6xVOr
	P6zNm6JslQxoLpieQuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFHTe-005F0b-SY; Sat, 23 Jul 2022 15:55:38 +0000
Received: from out203-205-221-235.mail.qq.com ([203.205.221.235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFHTa-005EsJ-MD; Sat, 23 Jul 2022 15:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658591728; bh=cLBMwJhbfVDDVfG5dMtvVF9DYptadW+JXeDQ3gCBx3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KpoheWLdq7wQS96m61A1cENpnaroEGOwmdOP5pshZva3Jk4w/PWhQcNUvXSMF2leR
	 RxsHv37LktUGdgZLVcxnqE7ztokVF7CuizG0xESUBuOzVNJZH2+wljNWnHlmumiUXT
	 qwwOthJJHinEBqxiGLvG9a7cFEceQAZAKBivBwzk=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrszc13.qq.com (NewEsmtp) with SMTP
	id DD800C3C; Sat, 23 Jul 2022 23:55:24 +0800
X-QQ-mid: xmsmtpt1658591727t4oj6vm09
Message-ID: <tencent_ED01C585DBD86EFB91CD8074FB0460C3BA06@qq.com>
X-QQ-XMAILINFO: OUUXHEo9i1ukWrYLUOhMGPy7IYEYzVlfJE7vxSfAdsofTb8HubjoZDOD9Zsp1o
	 HEjOU72hF4CqAkP0vBV1kDRk7DPyg3N2ufQnz2TFSITwNYXXDdmy8SNAX99aRYZFTZJAA0jCZXLY
	 yKt7PRMc4i3/e+1ouTIM2IwpxomHDKOt8Yaz1xTNPMZwEeNWRTJUlr2F02RrPJ427dmUHhGE1Uz/
	 5iI5apA8CgDV7eWh67J2xuRory+ZT9t/gP64Q2QgQKHaEgMsOqco+P0OKuBr7xPKi0myXMQjUHjx
	 szx1z8fL4z12DZnPQHSJtqLWn1npGT4aRraPfv8Q5oYfIO2dnyuRTqfvjSEc7Ua2q5acmZwvEmAz
	 FxNTQjHsajb5QX3eCMv8cWbwNvt+35ZBW6Dvgz3hwqCii01IOWSfIvza1DUunM4A4Ro3LDSyuOdp
	 QJ5HNHSR7iVjJ4sYc2myYC5nYvUWRRha3t/SDGx5iadZs2Fpe/LehtaDERNH69se2CAgx63Wo5R/
	 0U3EPsWTwA4dliqCbwgp4+AnIO2tnUB6Yg4lpqPOTqFRWtGZGh110Gbxrl51qVA/iMVQiURYH9To
	 OmDQrvU/xplZbc4TAOznG54jSATAOpyybXK2EFlsq2ltiqwI3Tk7funLWDfzMc+lztRBctbeIpeM
	 34dy5OvitOp5KitC8ugD/xSnj8hZQX+xrPgFEpymilfGg9NZphzE7qlm7m6oE7YK/zt//mw7nMLX
	 KZRr7U7/v9bCjb5XQUNsg2KYckss2FxJ6bUlQpr8J0Sr3BGvN3Wf909L3zB0LpYzGqvxg3MHYV+u
	 +vkknrt6px9hvVCGDl7TTQVFPzGwDHQ5X7oYxFCSD/4xoUWWXuFIp1j5gVJvooL02bOHD6vacQjw
	 CJvRmBh0HxUaj2B/gEKQirltcCRSk7VlAay7nUDQOyWD9nLOpYVvJyUO+vH6p9J1vmGIkB/gtT
From: Zhang Ning <zhangn1985@qq.com>
To: narmstrong@baylibre.com,
	sean@mess.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [PATCH 2/2] rc/keymap: add keymap for MagicBox M16S
Date: Sat, 23 Jul 2022 23:55:02 +0800
X-OQ-MSGID: <20220723155502.127404-3-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220723155502.127404-1-zhangn1985@qq.com>
References: <20220723155502.127404-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_085535_248368_05EFE7E0 
X-CRM114-Status: GOOD (  13.58  )
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

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 .../dts/amlogic/meson-gxm-magicbox-m16s.dts   |  4 ++
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-magicbox.c        | 55 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 4 files changed, 61 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
index 464de73d2f0f..69e72687ac9c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
@@ -34,3 +34,7 @@ &ethmac {
 &sdio_pwrseq {
 	reset-gpios = <&gpio GPIODV_2 GPIO_ACTIVE_LOW>;
 };
+
+&ir {
+        linux,rc-map-name = "rc-magicbox";
+};
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
index 000000000000..7dd3afd8a42c
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
+	{ 40791, KEY_POWER },
+	{ 40842, KEY_MUTE }, // M
+
+	{ 40771, KEY_UP },
+	{ 40714, KEY_DOWN },
+	{ 40710, KEY_LEFT },
+	{ 40718, KEY_RIGHT },
+	{ 40706, KEY_OK },
+
+	{ 40775, KEY_HOME },
+	{ 40783, KEY_BACK },
+	{ 40726, KEY_MENU },
+
+	{ 40959, KEY_VOLUMEDOWN },
+	{ 40797, KEY_VOLUMEUP },
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
