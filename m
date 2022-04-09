Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424E7C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Apr 2022 06:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CQUfu7bmzbzS3fXiDKlvKbYMx0aEfEegY3P2NPvkWYo=; b=bGEki2R2VUuWua
	y/RLkEJ76dkVR+Ec+iv3Wu3+vMh9DaaDmvr1Czl4EmgTU2jnWmKIrQ9RoJu94jDpWjoK7eo93Lqk0
	odT1fULP71jCfFyTvMjkqE/p2cTkeaMPwlxPi9tevLrbe/MDjjxKmQ0S0sOz/X7uwxiOZdPzz/UyB
	2P7HqRew78bcUXoYJ2bul1SkQ/YIJ3VwMA1+SGL4Iv/vqaaX22Ls9PlpDnEcOOjcRe6KU3XeRu73q
	KaOieYW/Xd8nUC31eE/2Qq6ArJWM2BEEJqzJp8Dlh53qVkRrUW8T33f+3rLVppmL8MMkMIAa7AvbM
	bIIisTHc5qgWp8GujQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd4of-002Sxz-1M; Sat, 09 Apr 2022 06:43:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd4oK-002SwD-BC; Sat, 09 Apr 2022 06:43:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id r7so6843657wmq.2;
 Fri, 08 Apr 2022 23:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Hew5fcLWaJy7bwAuvYjA3lNei48lfLSyllJNDnqQkVc=;
 b=jILQ4LHxO5+CInWgmA9XopC7fi7sLeqXXx9pBVE3OL7uY/CCkh9vQt8hlKNx8vQQv6
 lCLmAnhndgoqf1I+4UIz9HdwcUb8XBn8cGk0o58ymElyZOOt+rqSa5ZJo5ze9rkezna0
 oxsSslQgdJGQv/f3Q41ckLEsfGQeoZ4MvdjDcFOBfA1DHSpsR6gm+N02GSgGY7tIs9Lw
 KwZTlemStbsCE7Rf9k23+HFArdXbk867jm3jn0D5OHMX7LrPEE7eQXcEVxGoE6eTLZmU
 qyB1RPeLQgzslAiW9Guq3hP8d4Gsg8b7s52l+/1pS23Q4hd6M15L6u4QX9aRtfEy+ezN
 x5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Hew5fcLWaJy7bwAuvYjA3lNei48lfLSyllJNDnqQkVc=;
 b=O+Zyf+HLHBzeRXa4vqTbzMG8YyFisnAcGIQhpp/Rc+KnIwMM+7LONKj3eb8rHI4lb5
 qIOg2uzymzUzmdkceTL1eYQ8bEiiPZm6q+j9H9o0SaQ+3wA+J/4WTia1oTWYeSX0Mr91
 H6OdMgI+h7dCKYi/p3uJTy2x6LdSJEd9j/JeCBO8iLrVN3Iep4RFPUXe8pCEouGUXmtu
 wdNfsDt1jnVKh1gQRQ8l+pflF3wza7GlzeO26PppgZXWKQMyapPbK0xFu/9cwvX1wN3y
 uaQfCTeLRHQrlljCypRLprWBh4TugySIals0fkHEiYymxNeRmUmgP/XD5eOTy5ChEVQI
 tyTg==
X-Gm-Message-State: AOAM531TAIPMaODCVfARsaXwrx7mE6Ma26GoejOfaP0lcgYBix8bSEVZ
 iv4BYuSZEnDc/01PiUyl4nRkhJhnnlTXz+Et
X-Google-Smtp-Source: ABdhPJxdQ1FvRmMXuNN14cFg6MkFQt5NUoRYqlA8V6b4WyYE1xKS45Ugoygq92XUmHHpnELWWhi/eA==
X-Received: by 2002:a7b:c188:0:b0:38e:74f1:7cbf with SMTP id
 y8-20020a7bc188000000b0038e74f17cbfmr19905948wmi.104.1649486581395; 
 Fri, 08 Apr 2022 23:43:01 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d5987000000b00207891050d4sm5375643wri.46.2022.04.08.23.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 23:43:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] arm64: dts: meson: alpa sort the board Makefile
Date: Sat,  9 Apr 2022 06:42:57 +0000
Message-Id: <20220409064257.24453-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_234304_425934_5DB0C0E5 
X-CRM114-Status: UNSURE (   8.31  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Let's alpha-sort the board Makefile to keep things organised.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile | 38 ++++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 0eec18678311..8773211df50e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -1,17 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-radxa-zero.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
@@ -19,29 +20,29 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-p200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-p201.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-meta.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-telos.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-hub.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-play2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-libretech-ac.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-hwacom-amazetv.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-khadas-vim.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-mecool-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-sml5442tw.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-vero4k-plus.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-jethome-jethub-j80.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-jethome-jethub-j80.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-hwacom-amazetv.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-khadas-vim.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
@@ -52,15 +53,14 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m5.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-h96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
