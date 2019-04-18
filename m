Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56BEC282DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761862083D
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3cIJyN6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lsSTVAhb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 761862083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ns3Lr+tvv4Bo8E4JJ7MmqLZ0rttqeQnJbPvFf+qLcSc=; b=L3cIJyN6y0R7Tn
	VrV6ULEM7vvM/SjxgN0TZNduwhwJIvUj90hqGSW5Y+LnZ0BDqy1kEZCv8/WWJfbCIcapr3GAsJxJi
	rcOeLDgpNnFtzIyXhpuQqSk0wsfrpxKDm7BvLyOTxVyOyFtFuaorfVX3UjfsWYkKNJwTAVVjdHMJ4
	6ZcvMNmu/MwGyzs956nhp7VEcrCnUkdTxThJYzQOnAVXqHLA/WS3jotLTYBcpOudnIxtdllMRk7T4
	28Nt+JHeWjxl0ZAhRClJD7I3V/YSee48wdCFJbxBDofaS0gSoq6M0y+9PZnLBpOwXA1Tb2TNH0L5m
	p8OyNFjak0FXtnZDQa7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH68h-0000cB-3s; Thu, 18 Apr 2019 12:27:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH68V-0000Og-4x
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:27:30 +0000
Received: by mail-wr1-x443.google.com with SMTP id s15so2714698wra.12
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GXR/XbcC+MuPwrv6yn5gN1sB6ocW5hyXF8NUjGi26E=;
 b=lsSTVAhb+qlYZx6/VJZVKeluppYr+EBnKnGJ3q+BLnQRCCtudLXHVoKFhBfbV4ya+M
 JcZNjtXkyeA5QgzkwlBoBr6NXwqnHIu2BFFvoA0mQfJv1y/9asKzk4bZXUizQJcB5xTb
 0l6rDJpgrrGbzTge5SddZq+W0/7hstXWk9qVGWK87oa0Bf0YqkVJF2DUArmGLRM7kWty
 G/yg8Tu9gVGhXRrFHEo8+g5HAW/ruFyn99oC4D0QCS2I952CREt9ZeyI26GuGs63yPpG
 XyCeTTApAcxGJpkiXOuWOPijDlZo18ZrqL5fIkZ7O7cdPkxZQxWoiSbIPm03apaXDLe7
 BYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GXR/XbcC+MuPwrv6yn5gN1sB6ocW5hyXF8NUjGi26E=;
 b=dcg/xe6Tm/ldMFd6ttHU/41P5/KTxWTZW/IimJbkYlGb2fyQ8rK10L6WKbCyrTm6Ye
 yaOILGKC1kBubV0t3Q9X9hZcTevGqLN40tJ5Q8Y9jEd+GPgymBG5b8rsa3sSEywjP9dJ
 B277Fz82WKZvTPPDd/HcNXekeusf4Fz/2fJc+BFNK6tMvYrHDpD7h9XPinApCr0xxKnt
 sApSfZot4kZH57Y1/9l5ys+rJcf1q9D3lyYI+56vz92Do8eWWn7xSYZfqzjVD9H/ztnG
 46tCetDSuRvii2WF0vp07QwOCq5aontXzeB1Wee2VOcU20EEKdwEjEs2D4JhFB+Uzose
 PHlw==
X-Gm-Message-State: APjAAAVssuLfSepBIpwXZuH3fUrqjYKybcULiW0gpUNSkupGTY7HFq4q
 qJ42aSTAZiB9rTZ792G/mfnECQ==
X-Google-Smtp-Source: APXvYqw3FHqzmykIz55fADriP7f/Vj9TMin3ermX/n1eHPrq40L7JksYv3X7ZwQu+Szw3rc2cNlXJg==
X-Received: by 2002:a5d:6687:: with SMTP id l7mr484340wru.307.1555590445504;
 Thu, 18 Apr 2019 05:27:25 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z14sm1510110wro.81.2019.04.18.05.27.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 05:27:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/6] arm64: dts: meson: libretech-cc: set eMMC as removable
Date: Thu, 18 Apr 2019 14:27:09 +0200
Message-Id: <20190418122714.30805-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_052727_188657_8C585432 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The eMMC on this board is add-on module which is not mandatory. Removing
'non-removable' property should prevent some errors when booting a board
w/o an eMMC module present.

Fixes: 72fb2c852188 ("ARM64: dts: meson-gxl-s905x-libretech-cc: fixup board definition")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 255cede7b447..d4d5e3e5439d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -255,7 +255,6 @@
 	cap-mmc-highspeed;
 	mmc-ddr-3_3v;
 	max-frequency = <50000000>;
-	non-removable;
 	disable-wp;
 
 	mmc-pwrseq = <&emmc_pwrseq>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
