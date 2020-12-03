Return-Path: <SRS0=ZFy2=FH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D75CC63777
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:16:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FE420705
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3FE420705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8l0/sMcZwtIVjZbKIqUPAPJRWiviUiJYtjJiJkgp4Qs=; b=fk85ryl8iS7FsxW/0Q8j2dXFmt
	+zsaIPOs7CF5O9wXQ1gQ8UGsMx/Gds2ZpeAeQesv3/CcSpjw886hhLBhId5Ja1eCm0SjOw0JB5pyk
	DUfFZWJO1X5Mfq4MPMLd0usuJ/CS2/Qw2FKiaM7KbfoiHZZI0cpMv2vap2+C7zd5BDtFAJEeLBIZj
	bSamg/S4RUc+WFHORos7X6lK4XoQuvEarpS/qby5QQGJJpXsslArxpwQsz6WgKUqXmddqkKam5K7A
	UfHhFs8peYvyzUJGEJE6eqoW2HlklUO30XbUc0yLOrSxeWPCPwviZXRpLFwxMNMiGGqIQLl+Jaajb
	NvUUFyUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkhuY-0002VP-G2; Thu, 03 Dec 2020 06:16:14 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkhuU-0002Ud-Dq; Thu, 03 Dec 2020 06:16:11 +0000
Received: by mail-wr1-x441.google.com with SMTP id k14so660960wrn.1;
 Wed, 02 Dec 2020 22:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gJfgbMx5UCVGZoNqzKdjkvqOZ2ILsN+qlvohK/C4/eg=;
 b=tjINT1s6ViX3a5aTZOZFp2S9ZYVBKaOeEVq24XEoMGu0j9P1Ng1fVtwceZOUouewzd
 O8ySkp7JpSMpOS2Tql/L4VwPc07fk9kZixP5l56AEVuZwNmX0UV1FI96CM3wldQDEzqJ
 U0mEGkSWBoQ3dPEGtrMBv7LV2qnSjitWjQuNXj9m0w5h878jaIHq7aGZHf1gy8DraC+l
 KIY4Rd+cynUAoN/q3PvzzK2DJMIVqEYdtiX6dtaEPwHGuLvq/diuVktZfXTf0nNmNRUP
 2Gs6madbXIcIh6OFC9z6pqqxRUys1dVb+N5EdsU1AvpeR/s/vVbFIHvPslPlqq5nmCHu
 wjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gJfgbMx5UCVGZoNqzKdjkvqOZ2ILsN+qlvohK/C4/eg=;
 b=PwapIqEdJB/P6x+x9GMQIXIGwWdhj+lcU6wB8YkEMNbyf4lYU702rQSVV085fQbgdC
 UKtFwkQilO1ABHoI3nZQBjSVfs3VAX6TH+lGPEr4z9nENpb2BS8QyV4IvFULKyfNEdLT
 ha3ymkOLOsOI7GkGvcbWy12/OrSVm0U9L2Mi3M4LNyLnJgO6T01aYMXGdPf+4Z5zMBmS
 K4FFgNUav06NI8H5qObDa2/DtcHEbGEExr6wOxC14MQOm+9L97yPxFi+YNXIYG5ZI3SG
 pCPJf/BS45kdFcop6bee3w29D//vaI+XBxxvUcdWUMUaaYY1/t1FiSmZ0iR/vddldatG
 SvlQ==
X-Gm-Message-State: AOAM530sr0UTGkNiyncFxi80HExKY+1N4WIFBrG8mikMHxsXlT/a5VhA
 73X2g7xdhU5R1sgbLy8VS6A=
X-Google-Smtp-Source: ABdhPJzI7F2jC8UlYveoOW71/rRyzpdMhwuemS5A5oZfn8s3w2a02yBYz+Bgz8Nchl4yBdBV1Ue+mg==
X-Received: by 2002:adf:f94b:: with SMTP id q11mr1767372wrr.351.1606976169182; 
 Wed, 02 Dec 2020 22:16:09 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c187sm48081wmd.23.2020.12.02.22.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 22:16:08 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: minor fixups for Khadas VIM/VIM2 dts
Date: Thu,  3 Dec 2020 06:16:05 +0000
Message-Id: <20201203061605.9603-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_011610_510544_A7E70442 
X-CRM114-Status: GOOD (  14.36  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Reorder the VIM/VIM2 includes/bindings to follow the format of other dts
in the Amlogic tree and remove a stray empty line in the VIM2 dts.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
This patch depends on the v4 "arm64: dts: meson: add more GX soundcards" series [0]
being merged first.

[0] http://lists.infradead.org/pipermail/linux-amlogic/2020-December/009236.html

 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 7aa08f74c49b..6fe589cd2ba2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -5,9 +5,8 @@
 
 /dts-v1/;
 
-#include <dt-bindings/input/input.h>
-
 #include "meson-gxl-s905x-p212.dtsi"
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/sound/meson-aiu.h>
 
 / {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 0250c98dbe9e..955a63aaa5ed 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -7,9 +7,8 @@
 
 /dts-v1/;
 
-#include <dt-bindings/input/input.h>
-
 #include "meson-gxm.dtsi"
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/sound/meson-aiu.h>
 
 / {
@@ -194,7 +193,6 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
-
 &cpu_cooling_maps {
 	map0 {
 		cooling-device = <&gpio_fan THERMAL_NO_LIMIT 1>;
-- 
2.17.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
