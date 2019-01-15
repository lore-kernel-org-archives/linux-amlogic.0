Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA064C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A916A20657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t92O6n0m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="c2Fc9Pwb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A916A20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTabXKEGLSMXQW1HNBLxRqnECdx4rWDemsrhS6PwrKU=; b=t92O6n0moPTtvO
	O36Z01kCAmIH28ltyEbTGfVBOfJQmwAykZS9H3OQP7hjMTeZpslDT41m0OV09SsF4lKR9kCYeYdVp
	QSdyf5+OGNRt6Whx44DB+SjKXfcn/3Kge+rDrg8FNrVyVlgQ2HUaAHzWj5xFDhbGSb3r2D+vyfYC7
	72lUXnn0dRtJmj35vnL6s2WnVquh8gN5ZK7oFVDWNIr9r8i6MPm1XPUcqSRnTLN040YOF+bVOgkp6
	9sNkkcvsbbUc+nJcsl0Tr9aehGW+PDbtAJKasJLBq3YHgY3C15xwOM9t4sP+EAUvj5BAPfEia8tv3
	9e7vlsvJkuis6C7GnqZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRQ8-0007Su-2k; Tue, 15 Jan 2019 16:18:32 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPs-00077r-81
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id q18so3605552wrx.9
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xcouZkYyUK4i5KIwHCX1Wsiuiy/JNInEfwKg2Y2UMDs=;
 b=c2Fc9PwbxuRE898GEzCBrWXxjlOk55bbQ51aNvpROJqjg6IjYm/Q7fBR+c7Rs5QaIK
 0yFukoqWy+vQtT/O8gs4SgMvdH3Q03qqi/6GQVAaK6g3WwREpWbWKrX5xHXqBUPaTuHH
 fGoFlwQep45g+/zd7EgC0yANwoYJiPN2opXo+lOcjYmx342qeMV0DMAUy84D4LC3JvoY
 5WwpjCSY4IXQhOpV3WtkKLolGNCr0uHpeUX50F+DAdwa1RNPHaiS7T4YJe+QBUSIsi9A
 LqQjh/Itz0bI3DJUPdODQYxehKv8IfmJYjrB0PWT4YLo1NXmUAJ15kFxqtxrhEiNqcq+
 NhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcouZkYyUK4i5KIwHCX1Wsiuiy/JNInEfwKg2Y2UMDs=;
 b=R2paxMG2kNe84VcyySbD/EblhWtORxAJx6WkhiHLkNYufAV6Y1kDxhqeXQbcnb9D9u
 NV3FAr9ycG/n26EBxyafH8o5QzOSaC9ELPMihI0BkInlymN6OOJH4G1OB1UXLBWSwFHk
 4yTitj1ugs2SPo/7iuo0axnrspD9447jui2Z27PF1OrVlwyeBgy67JhWxupao2PYlGet
 etRq6utU+3JpGUCZcMf75k0iJQBvsHL5e8qstIWpxMiJQcXJN5Pd8Ixw35/+yQackENH
 M58HdevkUPQfeza117rvnVxJlpWckYGGRsfbRWxrr4L53jOMWY2/u8pQ+LxvgBjDhj+X
 Q14g==
X-Gm-Message-State: AJcUukfTXaYCS5B8aHcvsuX7Kv1Iwj5GQg8YA6/6ZbQUshqis4v9kE77
 UMjC2iFkRklLazcpIxHSl2CXJQ==
X-Google-Smtp-Source: ALg8bN4/TjnSLm3uCzxULKzByXQvo6ALE4AE149C6kauQwrEflykTgrKh575cM649n3lwA6vUzTJyg==
X-Received: by 2002:adf:ecc8:: with SMTP id s8mr3727821wro.208.1547569094243; 
 Tue, 15 Jan 2019 08:18:14 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:13 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 09/11] configs: meson64: use vidconsole and usbkbd if
 enabled
Date: Tue, 15 Jan 2019 17:17:57 +0100
Message-Id: <20190115161759.1657-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081816_596322_619F8C5D 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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
Cc: mjourdan@baylibre.com, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Allows displaying the console via video and using a USB keyboard.

Also enables CONFIG_SPLASH_SCREEN if using video.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 include/configs/meson64.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/configs/meson64.h b/include/configs/meson64.h
index 40ac079dfc..d82a674270 100644
--- a/include/configs/meson64.h
+++ b/include/configs/meson64.h
@@ -16,6 +16,26 @@
 #define GICC_BASE			0xc4302000
 #endif
 
+/* For splashscreen */
+#ifdef CONFIG_DM_VIDEO
+#define CONFIG_VIDEO_BMP_RLE8
+#define CONFIG_BMP_16BPP
+#define CONFIG_BMP_24BPP
+#define CONFIG_BMP_32BPP
+#define CONFIG_SPLASH_SCREEN
+#define CONFIG_SPLASH_SCREEN_ALIGN
+#define STDOUT_CFG "vidconsole,serial"
+#else
+#define STDOUT_CFG "serial"
+#endif
+
+#ifdef CONFIG_USB_KEYBOARD
+#define STDIN_CFG "usbkbd,serial"
+#define CONFIG_PREBOOT "usb start"
+#else
+#define STDIN_CFG "serial"
+#endif
+
 #define CONFIG_CPU_ARMV8
 #define CONFIG_REMAKE_ELF
 #define CONFIG_ENV_SIZE			0x2000
@@ -59,6 +79,9 @@
 
 #ifndef CONFIG_EXTRA_ENV_SETTINGS
 #define CONFIG_EXTRA_ENV_SETTINGS \
+	"stdin=" STDIN_CFG "\0" \
+	"stdout=" STDOUT_CFG "\0" \
+	"stderr=" STDOUT_CFG "\0" \
 	"fdt_addr_r=0x08008000\0" \
 	"scriptaddr=0x08000000\0" \
 	"kernel_addr_r=0x08080000\0" \
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
