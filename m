Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B27BC43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B1AF20657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdPbWnSQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="N4W9jvwt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B1AF20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8h0s4CSdQe0TVzTgz5MMiEUyCf8zqkTKspDujHI7Y8=; b=pdPbWnSQOgP0zY
	HB2rymrOojpTLAm67xgmtGXz66ZVJBauPn7INvMhrF47I0HE3ZNWD150WbKjVYqYEr9mp1VUan7QQ
	W/tf5FWaZXOsUTcVBOZvMJZ0ZLhxNSSkVaeIwPB/3l8L/g4lFTwtKkz3LOVJax7VAZAYL70BOKpG1
	csiPKKzvLSoFNeB1O04J0QKnuXQG6p5zJITy9sxeQ2FhkHAbda6T4tr1Tu/xGlMncb42xVXcVOlm6
	62/W2SX/8c/3XCbjy+rS44tGRc1j7wDQ1r0XXZtOVmkVJnsyZtHhBdNlpgWykPoFOAbe/kL92jyOb
	hVhBu+lNJAWTiYrhlJlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRQ5-0007Pp-8L; Tue, 15 Jan 2019 16:18:29 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPu-0007AU-5V
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:22 +0000
Received: by mail-wm1-x342.google.com with SMTP id t200so3856594wmt.0
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/9sBNZRhmtQWr6ynKocORfHb/2/e5UwiNQ/S8z3vVxk=;
 b=N4W9jvwtq12a4MDs+H0c6ZtEgj1zPWzWMjkDTXUxlsbc5IUw5eHgsQWr9IcS5S8oqc
 au1zTFs+zjOhUUr4j+b7ohdmNeqekF3CW0/oa0LfkqJs1q29L6K8O3Xj3W+lG6Jr7umS
 yCV3plQCzpDdq2F1UBbvnljkIz9lHuJVa4VybWJYdSfqnVkmwBZi2vP7d4ttuGxNFl8j
 kR4LqYXq2nB5eHsjno70yFXIhZYI79prFTWnwcNvMvtP6AsyIogkfTD0vEQn1vnW/oag
 my9hhXrDQDcCMDeBf6ZYkDsaO2fJPNc6kKb2tc2uVIMYFu4PnrsMcZS9E5G74GePPDgL
 8eYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/9sBNZRhmtQWr6ynKocORfHb/2/e5UwiNQ/S8z3vVxk=;
 b=OYqUvlWJ/BCx/YBm9IO+mbpwh5HM/+rZ1ehgbsIBzyJtAogZrUMHwICNVIU3ejhWpV
 NyGSAY0NCuSNsPamtk3dJQifIGQR7cWyRqbxM+jvoSME9pf7+Yvol3mpXGoYbiYv83X+
 E9iVdloGw/FAROhAxZSSZHXBxJbznaYkEY8j0OtVE74ak8lmMLAkhoNyfIE0/OQaTYcg
 9UL3/BUAVaMlAMYLfxR8E9ToNnducCNW/eADz42LG8R672AcpAgqMCZE3J1/mIWrSELx
 arxY9TT1eS00qPTmrTOFwqDxosuumNTDP9/ABxWaJupibBqyLUL+KG/ekMIktgicC7RT
 uqNQ==
X-Gm-Message-State: AJcUukcq7xL2s1Z4sAE7zCxBWp104hgpn1RAdLA9RG54RMEDlP+5TeVn
 58n/dy7mV6X5PxehtkAbLtKOCA==
X-Google-Smtp-Source: ALg8bN5yhsPFMZ40la96szzREQ2sUUjctghRyOVTvA+j5uoQp1ILMAvrZWSX9z/GGESEnYoX7xylmg==
X-Received: by 2002:a1c:b687:: with SMTP id g129mr3927311wmf.59.1547569096552; 
 Tue, 15 Jan 2019 08:18:16 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:15 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 11/11] arm: libretech-cc: enable video by default
Date: Tue, 15 Jan 2019 17:17:59 +0100
Message-Id: <20190115161759.1657-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081818_703037_2A882DD3 
X-CRM114-Status: UNSURE (   8.85  )
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

libretech-cc being the main device tested with CONFIG_VIDEO_MESON, let's
enable it by default.

Also enable:
 - CONFIG_SYS_WHITE_ON_BLACK for prettiness
 - CONFIG_VIDEO_DT_SIMPLEFB for framebuffer sharing with kernel

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 configs/libretech-cc_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index c3fdca5e67..fa01b15a0b 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -51,3 +51,9 @@ CONFIG_USB_DWC3=y
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_CONSOLE_MUX=y
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_MESON_GX_VPU_POWER_DOMAIN=y
+CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_MESON=y
+CONFIG_SYS_WHITE_ON_BLACK=y
+CONFIG_VIDEO_DT_SIMPLEFB=y
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
