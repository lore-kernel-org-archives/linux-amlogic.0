Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EF4C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Mar 2023 06:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4VqDJtyAwBsIFlMmr7y7ep3XOqmAXJzq03rb5/n0f/Y=; b=rP/2K7l6YTk4he
	QqT6g6jQHqSgtNW9QOVBeLfABjz2MD83Q0XNUaC00dY9dBP9P+E2gYh4QwlIUskjdybK2vEPbnE35
	7GzEZ6aAkgZVfoxxqXzHtwxpSgiYtysw8S44Qnfpsf3oOeg6HH9G5Ni/cvGfAmgUD3j3YnalECIiU
	Y5mcZilHIrDcvYWaAS9OJZNJlJq89A8ksQSH2bvndhxYzJPLTWipniJNEMIN1DKmFTgNqfaf9SVWw
	mxSzB1bj4UAbXVi+MLC5ldOQk3z0ay1TWDO4BV+09mE0d+YO6pN+Bmtq5Da5tef53CtR0JXb/X6DH
	qYCJQI97nvq2xKkefwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgJWW-00841d-1L;
	Sun, 26 Mar 2023 06:06:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgJWT-008417-1U
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Mar 2023 06:06:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id p34so3264443wms.3
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Mar 2023 23:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679810789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cueX1tlDyZQ065KUwhnXoi1nTSev/k3RQzOBMsNBLiU=;
        b=p31anWWkKI0R5+RJJrSLUoTqdWe5dYLsXbXGLzMlYKNGVHaRTUSjqUkHhiRfT4O6FM
         eFZ2CEr4QBHOL3KKMeX/H0oPyP0PCeiXhRpPXiLE8I/FYi7idxPBrgDgBuvM5FjJEIaK
         uFN17sOfTHzuqeL5Hu+87yjsIfh/nsduN9WrSm9fm7CzI13triR47KkvBZrVD79kE/mK
         x/meNPYBt6wTlJXYNUHAnuBXCtAfvBaat0Qc4NNpigF4sM9RM/ZGpK0xm6cxKxlJRS1t
         JgpEMROoxXBHNWzHrVeHbnaqhUBd49FIjmDhYatmmY2y3QRhSwr3+Ek/JIIOQCu3hWF9
         0W1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679810789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cueX1tlDyZQ065KUwhnXoi1nTSev/k3RQzOBMsNBLiU=;
        b=Donr9NSmumUlhIhS5TK2a3IMPq8jU6B5+9uFErLdCGFgcqtVI48X7TatDvxT1QCogz
         Cb+MgqOoko7RKxVPYf1BCPS8RjmAnsGP6VRmpbhTOj8QpwwpvEz3ezBmJHaQCMcLCymu
         x/gRpAjtkiZsZd24K0SRGGc8uoMqJ7dWNH51YCpSPNG5ePCfHV6WVwbR3M8ypwQ3dBq3
         vPscuRL/1kWeD71p2Ka0SOzQ1Ya2ZKtqRdTwvPCF1JBUt1K+GztxRGdi/YWje/U3ae/Q
         ofyXOibL2WtN1UGmhexlQY3wgjN0QyE3EYkCffVONIc0Pmqza882dmQA9PNU7ZVegOQM
         Achw==
X-Gm-Message-State: AO0yUKWL9TnP4Lb8P+ZEIklHaLjhZI6g5yrTy+F9C46jSX/Xav5m9UUO
	BogMmyaLLgD+A9FVpa7ZQZ0=
X-Google-Smtp-Source: AK7set8zqQGUmJKcwvyqMRRVBqxHDCeTzQ2qTMB6Hqee4BtW2t7ftihtEip8leZnxnVOWW7i3O71HA==
X-Received: by 2002:a7b:ca4a:0:b0:3ed:d64f:ec30 with SMTP id m10-20020a7bca4a000000b003edd64fec30mr6221686wml.33.1679810788555;
        Sat, 25 Mar 2023 23:06:28 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id o39-20020a05600c512700b003edddae1068sm4771001wms.9.2023.03.25.23.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 23:06:28 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] boards: amlogic: switch LibreTech-CC v2 and WeTek Core2 to EE powerdomain
Date: Sun, 26 Mar 2023 06:06:25 +0000
Message-Id: <20230326060625.2734090-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_230633_538960_317227E6 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

The LibreTech-CC (LePotato) v2 and WeTek Core2 boards are still using
the older GX VPU powerdomain driver. Update their configs to use the
newer EE driver like other Amlogic boards [0].

[0] https://lore.kernel.org/all/20201106101901.2472557-5-narmstrong@baylibre.com/T/#u

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 configs/libretech-cc_v2_defconfig | 2 +-
 configs/wetek-core2_defconfig     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/libretech-cc_v2_defconfig b/configs/libretech-cc_v2_defconfig
index 30b1651554..ea71f055d9 100644
--- a/configs/libretech-cc_v2_defconfig
+++ b/configs/libretech-cc_v2_defconfig
@@ -51,7 +51,7 @@ CONFIG_MESON_GXL_USB_PHY=y
 CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_GXL=y
 CONFIG_POWER_DOMAIN=y
-CONFIG_MESON_GX_VPU_POWER_DOMAIN=y
+CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/wetek-core2_defconfig b/configs/wetek-core2_defconfig
index f5149fc002..07d2587f77 100644
--- a/configs/wetek-core2_defconfig
+++ b/configs/wetek-core2_defconfig
@@ -44,7 +44,7 @@ CONFIG_MESON_GXL_USB_PHY=y
 CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_GXL=y
 CONFIG_POWER_DOMAIN=y
-CONFIG_MESON_GX_VPU_POWER_DOMAIN=y
+CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
