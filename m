Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE516C43334
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 23:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYUVfo/5btXXdjbtV77J9Zbn+jKB8hUBxq3B/z5lFWQ=; b=V8xeJlRG1NkxZC
	rxGsZdQ5xFo0J17cS7GdpTKDpagkEP3B59+j5/fP1FlVHcSL76y8U7oNqVymg4lSBPwnJNhsUaBDK
	JLrKo5H62f2fmnTf/i+M8ihktNFj/GSVyZUgyUZNLB2bwRmUIl6zynmr+92S14vJ4tRRnRrJ4HKmq
	h/VBMVkhx2a1pgo5Hv/z0O/69FWP8MEaMVY1JHLnLL7bMtx2BrQpAIwCdqNQlAJGppSkIVJnOsaIb
	60EgKNkKZJqNiyWUB0RxoZ3qcaVUFsPEIXMciVXlBmSXe2xdaGwgv+KR29MzYI+Z5U0NGOKf/WKrd
	uU/544np+rPzXhLbhQyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFkqo-00G7A8-11; Sun, 24 Jul 2022 23:17:30 +0000
Received: from out203-205-251-73.mail.qq.com ([203.205.251.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFkql-00G74Q-Ke
	for linux-amlogic@lists.infradead.org; Sun, 24 Jul 2022 23:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658704637; bh=int5LufGeXMqPTw/9z6fnqzHjTwREl6lTVHUKxYTTPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VVm4tEqpCqHQFvsvSbaQXjvLQFig6OdsWw9gByEl6HcViJXORdi1KttSxFWmVh2rg
	 7L/Ju2GQ8qu+ri5J2TnTLWCjnzMy1UxL71SKxfX4rK/BZUrUrbRCVpIpxrqyJi6oHW
	 Z/caEhvgJR7ZIpWyCnhLF4tPuJmyrgDiXfiAQL2A=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
	id 44B2EEC3; Mon, 25 Jul 2022 07:17:11 +0800
X-QQ-mid: xmsmtpt1658704635tszjjy3wr
Message-ID: <tencent_5AC39B81CB85E258763BA8CD8774E9045806@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjD8jntV4C0BxKXORVqVJFyVA5JNVVSZJY8HZc2hg2REfL/ZzBxJ
	 W1zcqwOkzEOULVOvZ6bt0Z9E0HfUXcM6W4xpycNSTQPWLyKeBlkII1Yc+xFk9eiou5U2CG9R6VR7
	 9HFZugqwz/RE5rEMFkypoStxn3LZHHHkp7r136pMLarmHIKEq2zrC8YWqaNzYhLcVXu1dnGVxyqw
	 hmoAMXYUYLH85AgdbhPWO64/Zq7y3SA5+HDKG2cl/vh0J+entGEQJ/r/3YgUshrKt1soSx+/acIa
	 S3B5ntvlxM7veK1SPFJ0wxynC+D98tQKbjUFH5PQa5rhRZMAMnRB88Y9/bNgqs7wGaqg8UPQ/eQ1
	 /adl6VqLFJiJXAAHSCjS9Ssk2WY/gM9zC4+evVKWyLi1c1XwNtAkCc/ybeNaJ3IGZ43GwTaHI9XU
	 n2L+SwUiAOFroSgG4SPto+cZ0JtT0CSvIPnKA304pKyxu4Znr5Ci58h75C9l7ufCG2EvCxyZZX5R
	 3fA4Pxv0wcqqCHStlGYBzCwwih3o3M+gyxJFkKm0bmv/k6mI7wI9WaDL7160UK+OfcctPFPJWGI3
	 iW08Zh5NqoetV8BB0/hhGJQ7YmNJEuSgo2vHeWkmWfrKSoYQnrfH0SCHnWaaPtyiZLTZ+QtQzB0v
	 QZwL8ya7x4QuePxok0EdjRwfrsL/1Ui9K/9VSCNzHUN+AHl4XFm8sV5Xb7sfZ8LEIVd6nomD+I5r
	 5hWeMZiWhvn+EZKUr1xtongUU+57L1KlHO4VSD2IM1lX/feg5HsuK8noJ65HODch8TOLtqJxGzaL
	 uf7r2H+L9f+uiN1IGEld863MQW+LN43Zf2SxIz5FshvRva/VIUXoUMIONjnnGrOrED7Oog37s17h
	 dD5B5SujCnQZLjZmBQXWPxecfAOA8W4R4a1Xebk7Mic1Yu8afY8l/+DilSdGZHXw==
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
Subject: [v5 2/4] media: rc: add keymap for MagicBox M16S remote
Date: Mon, 25 Jul 2022 07:17:02 +0800
X-OQ-MSGID: <20220724231704.132472-3-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724231704.132472-1-zhangn1985@qq.com>
References: <20220724231704.132472-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_161728_017951_EA635802 
X-CRM114-Status: GOOD (  13.44  )
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
This has mapped to KEY_MUTE.

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 drivers/media/rc/keymaps/Makefile      |  1 +
 drivers/media/rc/keymaps/rc-magicbox.c | 53 ++++++++++++++++++++++++++
 include/media/rc-map.h                 |  1 +
 3 files changed, 55 insertions(+)
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
index 000000000000..b4fc1856a9e7
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-magicbox.c
@@ -0,0 +1,53 @@
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
