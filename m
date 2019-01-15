Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC59BC43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78A0A20657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oz7l0KFN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nk5Lc/vH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A0A20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3xxMgcoAPAq4kM/xfMwSX/PWgKJpkVNpbnRh9IVfRw=; b=Oz7l0KFNB/2P+C
	uZ8/AZDY8JrGV3ihoFHtLlj4stjGZKgWzWVJScR1Qmx5xPfBQmreG3NWnabMFPjkgH8SDhVRCoQxJ
	kTAEzraAHWyWyL9AC9EhnJSPl9vlIWuafyMaI5WUIB2XwCZfBzCVlcpjz3V2GH4nC4BQ/saOQU7PE
	PfX+hyaoAGiZgrayQmsRSrdTOZGa5Ss4u41zXckyEmZYicW77bYKxg3Q1OIgYCJ0RQDPBLF2AUBvW
	ZUIf0RA2zTZnrAbE2MT9VTNVzVKvGR54Et6lYotLJ09uyl6KuffnhHAUiEYiZ1n58zF2OO7bsJtE9
	2xbE/nt2H5mfsrtF18pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRQA-0007VB-6D; Tue, 15 Jan 2019 16:18:34 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPt-000799-12
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id p6so3816110wmc.1
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XdFlpcWqNimRDBSAVnxb0JtFkPf65JOSTI6WG2yqYtI=;
 b=nk5Lc/vHj8uzX15nWooOhc+3b1iICA7Che2zE4Zg8f/hUrnf/zs9LbZoaUKEttNJi1
 GJHkW66zmaIcHCy4eijEb6X/akVU9hnLxgrRnPbXSg6BAPD6pO4TVLhF/H9aqqAg/Zrl
 HQyLrTjOuC9g8tAIRyv/4X3pYugoOKEnyIkfExQhguP1JsE2PS4n0bToHg4vQu7HWoDg
 UgX/lRPgooW1RoksBQLJO4mG7UHJM2i0nXqg/03iDvhr6U7sexhAhzCatHlc/hpvvn+5
 KVvq8AgRYpNYq1avGBM8NXC3IgQ6VliyAVJ5pP4BO9AyScCXdynKSmylH/RdVzNajgrR
 RzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XdFlpcWqNimRDBSAVnxb0JtFkPf65JOSTI6WG2yqYtI=;
 b=nNXmZJGdZCFlhY871SENltMENUHYfgZiyhIdb1UeYjKkvJJcvSv7AcWBkzWfnwMuOE
 X4dUx/p60OBv41gJptHkpVy8E4XUt596G0IzkeJlbN0yWB7JU4PiHzEHLWvzlR+ksKId
 14GJUdV256nEAfuXh6VQujy/LqgjBjemKhY01GJWsYOPGTNpjkW2E/wUM98CQvHEQYf0
 vc2xVYud6RnebaxaN0xZFaF36CiZRwcHrj5P/sz9MgPWb7gG+BI0QJDqO51QEFwjEUL9
 Q7+k7Mr9IWqwgDUO2yrysu6aSjJWTmlEYne2t6e5BSVAbkZyPpPvVX7w/1rgJkxQFqlm
 4gFQ==
X-Gm-Message-State: AJcUukdzkKECsJ6KSVwy0xo6Nhkq6YRfEF6b76kQ0ONpqPGVjQlUGqly
 ACtXEIqQux80l4eo9d+2bW7D5g==
X-Google-Smtp-Source: ALg8bN7XLJTKSIVn+I3z9J/SWi+eRt0rJ4cPemGR6WmYTXqjsuF1ZZ8RkZQpA7LheniIS3dMf0hDVA==
X-Received: by 2002:a1c:ae88:: with SMTP id x130mr3761123wme.91.1547569095506; 
 Tue, 15 Jan 2019 08:18:15 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:14 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 10/11] arm: meson64: enable console mux and console env
 by default
Date: Tue, 15 Jan 2019 17:17:58 +0100
Message-Id: <20190115161759.1657-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081817_562002_CC88C6E8 
X-CRM114-Status: UNSURE (   9.14  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

With the recent addition of the meson VPU driver, enable the following
config entries by default for meson-64 targets: CONFIG_CONSOLE_MUX,
CONFIG_SYS_CONSOLE_IS_IN_ENV.

This allows outputting the console via video if CONFIG_VIDEO_MESON is
selected.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 configs/khadas-vim2_defconfig  | 2 ++
 configs/khadas-vim_defconfig   | 2 ++
 configs/libretech-cc_defconfig | 2 ++
 configs/odroid-c2_defconfig    | 2 ++
 configs/p212_defconfig         | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/configs/khadas-vim2_defconfig b/configs/khadas-vim2_defconfig
index 75514d2ca5..ed8e32776c 100644
--- a/configs/khadas-vim2_defconfig
+++ b/configs/khadas-vim2_defconfig
@@ -44,3 +44,5 @@ CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
 CONFIG_USB_DWC3=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_CONSOLE_MUX=y
+CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
index cf87802653..add8e0973a 100644
--- a/configs/khadas-vim_defconfig
+++ b/configs/khadas-vim_defconfig
@@ -49,3 +49,5 @@ CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
 CONFIG_USB_DWC3=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_CONSOLE_MUX=y
+CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index c21b9ad9ca..c3fdca5e67 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -49,3 +49,5 @@ CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
 CONFIG_USB_DWC3=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_CONSOLE_MUX=y
+CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 33e6e74fa2..60cf97b3b6 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -38,3 +38,5 @@ CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_CONSOLE_MUX=y
+CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/p212_defconfig b/configs/p212_defconfig
index 2ab47e616f..d2c2da10f4 100644
--- a/configs/p212_defconfig
+++ b/configs/p212_defconfig
@@ -48,3 +48,5 @@ CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
 CONFIG_USB_DWC3=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_CONSOLE_MUX=y
+CONFIG_SYS_CONSOLE_IS_IN_ENV=y
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
