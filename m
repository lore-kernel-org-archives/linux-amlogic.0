Return-Path: <SRS0=3vaB=QP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51852C169C4
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 10:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 232A02085A
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 10:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G3DI0YDl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0hQRI5ml"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 232A02085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ey6gxdJCn96xCCVSPu6csgAn+LOq6b+i90u5BX/0XU=; b=G3DI0YDlMFXDU8
	Wu+0cXXFhlB/mo6Sct6rOAo+bUqvbax860FyHVCUEeSBZEYIOk1Z6Ja491fd/8M41raQO9PEqs0Tb
	QpC4OnAOfueLK32PNMmvqzucaWceHexqymtTF2fHRRhJohfA5hb0b1wibHu16K3Xtk9HL63NSM3rp
	yh2cYFn+Lgi2zmjXUnw+CVuL+hGirXBmd9kjfb0TBwbJBqJBwthF/jwZqjrpgIsGZgbUGvkJBnvRS
	wx1KOw/yarSaJ0pVq0PXXiUZWzjdyRUY9qUDaiX9lazYa5gp5t6TI7Yn0rX6zA3O8IbVng7gmGgJ8
	LHrn0igLwZrZi+Z8ezbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs3B2-0005xv-8Y; Fri, 08 Feb 2019 10:14:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs3An-0005jP-1o
 for linux-amlogic@lists.infradead.org; Fri, 08 Feb 2019 10:14:19 +0000
Received: by mail-wr1-x442.google.com with SMTP id x10so2913612wrs.8
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Feb 2019 02:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eO3Voe2p456qMJUTmSfjfToLuBGLaNZbZuGLhlQmyS4=;
 b=0hQRI5ml79BHdo7QVJjEatDn9SdBBjSKQ830hTYMW02cSPmFhpf/6HfDjs3UJR1efv
 /W7A9VjraD0t7gMbW4JHzWIU8h64LyJRPHtYqSNOjFLSl/OZiY6EGDfbnVJ+oNIzIjYB
 U5ECkC0mIK0/jzS7EjH4jn2Un9gs7m/HwJZW0AzfFlU9JfCbY7pn1J1uX6BdM3RwCMxa
 pX5p1Gz4pG1GX+kEfR951JqalAmMI/qE8njq/c7Zz2u982iKnELdvUd6sxaVkTI7bcX2
 XIYkNyPXVTRHbd0u8o4y3iV2/wCMHLtXKfVx4CVqtqmn55bNT9xVBnKSI874rI16kUzS
 H7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eO3Voe2p456qMJUTmSfjfToLuBGLaNZbZuGLhlQmyS4=;
 b=ARYwWmOCKO9ZO7gyIa91vezP8DscBgVxIEnrBJey4lHYPyVLKjyGLlSl1lNzL213I+
 1IzeCRx4I2FUfEQPz05r6I1EAkQ4HZoTZsU3XtQxVBifmw2RhBf5myvFEh8AsKf2jaX2
 imOtM3kQ2rssDFyz9muocAduZ5QQLuX35iARYMyEhgGynvMo9PpXn0XC1i3/yirRWlfC
 0hkDuST5V5n7SklzWO0Y+RW5yU2jDJIkMQuFgkWf9w1kNCQW7sDb1Cp+WCEt6C142BaR
 ao34HyMhkGJHfMCH4ta2pCZswfWTHOuXK1/giBGHtB2Yo1vvVdoIn/Xh/AYPaOPZKu76
 bnlg==
X-Gm-Message-State: AHQUAuYpoRmIcvrDMRsOtha9EX0Xturd0FSKRLPYCuKBraJwOj9On/Gm
 Pm2/kcpjOCaYHj1/9FswfdquWA==
X-Google-Smtp-Source: AHgI3IYIaI8KHjDTHR5aZF/KcgqtLXoJxT3GFY0QhRtgChxkud4EHMSRI6sHmIX8/tV5dU097KLqxQ==
X-Received: by 2002:adf:84e4:: with SMTP id 91mr15789126wrg.237.1549620855682; 
 Fri, 08 Feb 2019 02:14:15 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e35:2e9a:6060:2ed3:c463:803b:b085])
 by smtp.googlemail.com with ESMTPSA id
 a62sm1901634wmf.47.2019.02.08.02.14.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Feb 2019 02:14:15 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] arm64: meson: enable g12a clock controller
Date: Fri,  8 Feb 2019 11:14:04 +0100
Message-Id: <20190208101405.25699-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190208101405.25699-1-jbrunet@baylibre.com>
References: <20190208101405.25699-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_021417_087919_03DEBB86 
X-CRM114-Status: UNSURE (   9.50  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the g12a clock controller for ARCH_MESON

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 819e74ae9224..d0e0bd4af05d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -114,9 +114,11 @@ config ARCH_MESON
 	select PINCTRL_MESON
 	select COMMON_CLK_GXBB
 	select COMMON_CLK_AXG
+	select COMMON_CLK_G12A
 	select MESON_IRQ_GPIO
 	help
-	  This enables support for the Amlogic S905 SoCs.
+	  This enables support for the arm64 based Amlogic SoCs
+	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
 
 config ARCH_MVEBU
 	bool "Marvell EBU SoC Family"
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
