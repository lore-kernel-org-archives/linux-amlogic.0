Return-Path: <SRS0=Bjr1=6C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5941AC2D0EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Apr 2020 09:37:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2628F2220A
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Apr 2020 09:37:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HrVSBIDB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tb+VfyjC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2628F2220A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=wA/yPX3hIy6AFZmf+AN7zZ8JQBRBPeO5+oJqgtsd48A=; b=HrV
	SBIDBwoJ+d3hXobisARLSM8VS+rd4yDEAzhte4go1ataURqgVXQuT2IyGe5H9y9IGgStdBegp4LyD
	1KrnSr7KIzFoyEIJ0RnMk3MBOxAGfdb+qCckN2Jgd1OaxFDVchtCYoh2/3wSuzIq83OrkH/50tx47
	YmFBkQtR5AkzgnJJ8GY+wEFWiUF3LmddPcqYnpWb8xZsk7cVHtmvvuV2ilORuSfl/EnIo49zIJvBH
	RSYMRooP5XrDrd85woeL/ctoTvA1ZR2aumyVtZkX/TgdybngUg1vJMG7vMa2yimh9xT8T9aRDB2+H
	mTO4a+oqAl1nBehUExCDq4GHC4N8otA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPju9-0002NZ-Tb; Sat, 18 Apr 2020 09:36:53 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPjty-0002Ew-0y; Sat, 18 Apr 2020 09:36:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id u13so5768438wrp.3;
 Sat, 18 Apr 2020 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wgfu39vG9R4ll9eCVwJav8n2HM7rx8PAeBSHmbcNkjA=;
 b=Tb+VfyjCYOWDy0PsTMFPIeg6WnHIszFF59D9PjMUUN0svKLTjpF3sZyl8H3Co1dk1l
 D1IMe2542AOhP/cWtXp06jpZhMqZJ2BJoQRz9spW1Xg1zAObvwCgMXOwepeCGJGWeNGW
 N0P4haKVg4K0BRpas6bIX1+Bnr4FVIv8OeoorUMBA4fRnsia+1lhZ7HudEYL56Mbcwhe
 5qNE1ifOcKOUjKeJZossp3FYEzCrN/tzL6xjWouAJFs7pg9xpGak6nN4yMiaZeQgKYXs
 XENhLmqeK43ZT7BrVNpnfFHYAB/vIKiHYiSVJzfWrnw+xAabKU8ccD3mra38zKJ4fY04
 kWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wgfu39vG9R4ll9eCVwJav8n2HM7rx8PAeBSHmbcNkjA=;
 b=dT0kU9os0VeTquRGKo/RJJvlYr1tn2nMX4LvjdRgEITeNalZRbwEkPv8icxCMtueII
 uZbDG8Y3wBmOf9S4b/y1is3KFg1LvaamqiCVkroFz1SCWuxx2cG/x6dDDFmEJCuq9rEn
 DqPdNQmCrk18IRecDjLwGsDWWZm0o37kbZ/grr9xfSxDNaufpM0QNSZR77NscpNav0nD
 ZKBz0B6O7PyrChBHYS8zXEzlU9clvcOlFmGLH82/sn9xs2sp2QIUfgE898YVXhT7a0s+
 L8LWGE1+4o3Ce4J0Stc0gk8zaLsaYNGseeCfWrLhulI2Fb+HMqc/RT1xGTqzi1IIby+Z
 QQLQ==
X-Gm-Message-State: AGi0PuaUBddbn3Sj8QQ0H4GftL/oAnpUheWOHobE5aj2oAYG1+sVXIZ7
 EnELlxEZe+xt1Za+zSEDmk4=
X-Google-Smtp-Source: APiQypIcLoxJQNQyMnGc2ZI2HXyHFpNGpG/umKJLNyhN05r5WvOL5tqpbb3JhDDJb77z7YfCVPUx1g==
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr3726868wrn.396.1587202600229; 
 Sat, 18 Apr 2020 02:36:40 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d7a:4700:391d:588b:ee8c:e294])
 by smtp.gmail.com with ESMTPSA id d133sm11782497wmc.27.2020.04.18.02.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 02:36:39 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] MAINTAINERS: adjust entries to moving CEC platform drivers
Date: Sat, 18 Apr 2020 11:36:30 +0200
Message-Id: <20200418093630.6149-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_023642_094547_8B09C882 
X-CRM114-Status: GOOD (  10.21  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joe Perches <joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Commit 4be5e8648b0c ("media: move CEC platform drivers to a separate
directory") moved various files into a new directory structure, but did
not adjust the entries in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: drivers/media/platform/s5p-cec/
  warning: no file matches F: drivers/media/platform/tegra-cec/
  warning: no file matches F: drivers/media/platform/cec-gpio/
  warning: no file matches F: drivers/media/platform/meson/ao-cec-g12a.c
  warning: no file matches F: drivers/media/platform/meson/ao-cec.c
  warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.c
  warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.h
  warning: no file matches F: drivers/media/platform/sti/cec/

Update the MAINTAINERS entries to the new file locations.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Mauro, please pick this non-urgent minor clean-up patch on top of the
CEC platform driver moves.

applies cleanly on next-20200417

 MAINTAINERS | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3083282134de..a708773e1af7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2373,7 +2373,7 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/s5p-cec.txt
-F:	drivers/media/platform/s5p-cec/
+F:	drivers/media/cec/platform/s5p/
 
 ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
 M:	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
@@ -2518,7 +2518,7 @@ L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/tegra-cec.txt
-F:	drivers/media/platform/tegra-cec/
+F:	drivers/media/cec/platform/tegra/
 
 ARM/TETON BGA MACHINE SUPPORT
 M:	"Mark F. Brown" <mark.brown314@gmail.com>
@@ -3932,7 +3932,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/cec-gpio.txt
-F:	drivers/media/platform/cec-gpio/
+F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
 M:	Arnd Bergmann <arnd@arndb.de>
@@ -11027,8 +11027,7 @@ S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
-F:	drivers/media/platform/meson/ao-cec-g12a.c
-F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/cec/platform/meson/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
@@ -15063,8 +15062,7 @@ F:	drivers/mmc/host/sdricoh_cs.c
 SECO BOARDS CEC DRIVER
 M:	Ettore Chimenti <ek5.chimenti@gmail.com>
 S:	Maintained
-F:	drivers/media/platform/seco-cec/seco-cec.c
-F:	drivers/media/platform/seco-cec/seco-cec.h
+F:	drivers/media/cec/platform/seco/
 
 SECURE COMPUTING
 M:	Kees Cook <keescook@chromium.org>
@@ -16089,7 +16087,7 @@ STI CEC DRIVER
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/stih-cec.txt
-F:	drivers/media/platform/sti/cec/
+F:	drivers/media/cec/platform/sti/
 
 STK1160 USB VIDEO CAPTURE DRIVER
 M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
