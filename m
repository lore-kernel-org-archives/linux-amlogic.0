Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572DAC433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 13:03:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E8E2074D
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 13:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GIFaelEZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XONJDaKt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E8E2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UEr3JDPsFD/hjNe1OcUOejQNx/nUGJ06AlFbbgt/bj8=; b=GIFaelEZQO+Cwt3Ia3iLfqFH2k
	BfOswwoluTFXJbP1n+dIiwzdThNyJ9h0dqMZdHBvRZarPThHy+TjR+iBX8L+xMSmbfEhPVbT7YVpZ
	NpWvoqeP/kkjVdPAh/CIAHpFZ0Gz0yzhrEs7a2l+zrNXaSHWLkfGc36nVn5BhNluLnvUv0NI64hbu
	HYxTI++6hMGcRqcaonC9BUTxvbedL5Z0UvXKzjnN3uPTFPbVHuBY3O6DqEqaAKcSuogf4mxyGmJup
	8FZN9pBVwmyIA0+JDjVGIJwCVj6GtdTNOBtRo8dbHH/YrL8VG2MqbGldI+egi1Q6Z4MSJIp7hVP76
	tfdFD7wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAC7r-0006fc-8d; Mon, 24 Aug 2020 13:03:03 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAC7m-0006eE-T7; Mon, 24 Aug 2020 13:02:59 +0000
Received: by mail-ed1-x543.google.com with SMTP id ba10so7953190edb.3;
 Mon, 24 Aug 2020 06:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=P1Zncp3mBPUwy/XcJd/Yz/e5wA8bamhjeRbMn86RZ00=;
 b=XONJDaKtbTenPVd8qxPHXGDxygjmiThWQu9BDEYWfQkNXTReQ/uDZ5EpmkZRn48ejm
 efOlakAgT3CzeiVj7Mb+Xe3MGYfSkK8ChioK5iaE0FrECZyu1NMbrsagF1MD4zeLbQBR
 YlcHE6GAiOf6uGdxmW7WV6BtF/nYzbopOxDsPzJW8y7ozmI8qbtwt/W/4c/3cQppu7NS
 uvR+ZYua5Efzwcpl/UYFTfrd/HHrj+o8hEJgQzJ/lWjW5Q/34xZ6iMphmfkOvs8Kryyf
 VaQ73biFs1164Ey+UwqI8Z3LwrPXz4xep8H74Fgq2ahk0F8imuGO7V4XUm/TyepKgz3W
 4d0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=P1Zncp3mBPUwy/XcJd/Yz/e5wA8bamhjeRbMn86RZ00=;
 b=NLMyFHccYXAHIcFqAD1S5XgHfsPJVJimImpgbzH22Dz6Q34zYMZ8snRsT32ffW3pkA
 UN0s9VM4wkKvXz+wySDNWD4+99Eqpvqi1DatLZQMva4r7haGmEvEDceC4H7Csvw2AOUo
 Dgkc1moAyrN1114V6TFp2qqfJ+/qNJhMBLgtartDg0lSva+28XCY2Up7lyg97N0O6Tb6
 alrDJ2D4LGKMF1sC789OmaSaUgwPxyXPN358ur5Jnx57FqHA71qU8j9Lk8B9wKyX0Vje
 InpKPn6demlHoJj7c2lJiMZMZ4GkHRFfSAqSaZt7ynur8PS3QMsUGp21PqDowZ72r7Ff
 wxIA==
X-Gm-Message-State: AOAM533mHJT9MiljefVdaFJ6qZoGLWOtXegXfhf6YFr61/dlow6UjJ9b
 VAQk3nnCyFfDocbvbbh9kjE=
X-Google-Smtp-Source: ABdhPJzyf2lmrCIi0SqicxviBRWrSr49744XFzc3aRPrmSNXEykr6WnIHEpJxxogoesnOqE2WhNmSQ==
X-Received: by 2002:a50:c3c4:: with SMTP id i4mr5236603edf.244.1598274175628; 
 Mon, 24 Aug 2020 06:02:55 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d4c:8a00:f0ec:b5d5:8c1c:a145])
 by smtp.gmail.com with ESMTPSA id g11sm9366898edt.88.2020.08.24.06.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 06:02:55 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH THIRD RESEND] MAINTAINERS: adjust entries to moving CEC
 platform drivers
Date: Mon, 24 Aug 2020 15:02:43 +0200
Message-Id: <20200824130243.27162-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_090259_003992_55B379E6 
X-CRM114-Status: GOOD (  13.74  )
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
Mauro, please pick this non-urgent minor clean-up patch.
  
applies cleanly on v5.9-rc2 and next-20200824

v1 send here:
https://lore.kernel.org/lkml/20200418093630.6149-1-lukas.bulwahn@gmail.com/
 
v1 first resend here:
https://lore.kernel.org/lkml/20200506050744.4779-1-lukas.bulwahn@gmail.com/

v2 second resend here:
https://lore.kernel.org/lkml/20200525142946.8268-1-lukas.bulwahn@gmail.com/

 MAINTAINERS | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f0068bceeb61..0cdb71b63f4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2446,7 +2446,7 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/s5p-cec.txt
-F:	drivers/media/platform/s5p-cec/
+F:	drivers/media/cec/platform/s5p/
 
 ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
 M:	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
@@ -2591,7 +2591,7 @@ L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/tegra-cec.txt
-F:	drivers/media/platform/tegra-cec/
+F:	drivers/media/cec/platform/tegra/
 
 ARM/TETON BGA MACHINE SUPPORT
 M:	"Mark F. Brown" <mark.brown314@gmail.com>
@@ -4014,7 +4014,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/cec-gpio.txt
-F:	drivers/media/platform/cec-gpio/
+F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
 M:	Arnd Bergmann <arnd@arndb.de>
@@ -11292,8 +11292,7 @@ S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
-F:	drivers/media/platform/meson/ao-cec-g12a.c
-F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/cec/platform/meson/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
@@ -15476,8 +15475,7 @@ F:	drivers/mmc/host/sdricoh_cs.c
 SECO BOARDS CEC DRIVER
 M:	Ettore Chimenti <ek5.chimenti@gmail.com>
 S:	Maintained
-F:	drivers/media/platform/seco-cec/seco-cec.c
-F:	drivers/media/platform/seco-cec/seco-cec.h
+F:	drivers/media/cec/platform/seco/
 
 SECURE COMPUTING
 M:	Kees Cook <keescook@chromium.org>
@@ -16511,7 +16509,7 @@ STI CEC DRIVER
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
