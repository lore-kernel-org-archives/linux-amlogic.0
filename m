Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D351C04AAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:00:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5345A216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:00:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ta4eDA3o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="buEEeU0r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5345A216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1fMg0wAM5ZwEXfuC90b/WJtn7JG8iFkVICPyfC2Ezgk=; b=ta4eDA3oaCzyQY
	gHAPt7e7reW1svPssrPCCYWnT1eQTn5m3eZco6Q3TKOz+d9Nu86YNvdYa6svpYEFBjGKjG4qqHKHX
	F5FXzx0XPiyfjBTQVs7kzWUsetxcL7zHuUrLoMPtEgc7y21xCaPaUACMiZVo1skVroAzZlyjB1hLV
	jUrJMG6KS0RHcYWY/tInqmmRjqe6zYfev1W8BxWRevuHloGr6H3qB49iTyIZApfXkrkGy8Hf+NFFN
	KUflZVPpIF0raEEw4sdJ0NyYoKcTKW7BJ2Y/dubl0vK/C9c7Jqk93JfNqd0J8BagFVTNOzO/Pmdgq
	4ve/acfmiki02d0iu24A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSipw-0000wS-Pr; Mon, 20 May 2019 14:00:20 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSipp-0000or-12
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:00:14 +0000
Received: by mail-wm1-x342.google.com with SMTP id t5so11813928wmh.3
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bk5f0M6WXXbmXTgHtGqHLx2M1jGm6Hu++/ddevpUC3U=;
 b=buEEeU0rxW+e3VpPPy7csd4kPlVjuprnv5G+Zm6gKc+zaXk8TprUccdvM19Ccp4LXh
 EoR8MHoSYy73D0FMJXHN9UXVKLhiWJArCqWVFuKB0QtWmaEsDWRuRvpjbklW9/yzTiDK
 F1tAcywJotdwUGTOr5atQP0RjeO1WyFI0mwqr4M7Of9HhVKUKudFeuGMKjfsdXC2R7eB
 C4t2S/TzdMmRlAECyazDkOnLmHQzwzvS1BBVmm8rm2x93LXMIZZyUm/09M5VlhciSjMq
 1iT1sZQN/QXdKEXq+yZ0VZUHfIZvLof9jMsNr1FgmNIT96LWYQyIi51aTe35PwxOdKtT
 6RpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bk5f0M6WXXbmXTgHtGqHLx2M1jGm6Hu++/ddevpUC3U=;
 b=ssNgoJ8tNQke1oS+kfWQrx0yCj/MLOPsJAPDs2YOi9UzSpNWkMEUor2RJiLm0yS+os
 /17Rt8WEdDg2nz1kahXr10ySLXpu0NMvuYUOet2Zd+IBiDMS+QZpkKE+3JMKwdXKslD6
 CcaF43J/mZb3VkzyrTSjI9zUA2oFV4QJs7RWEvTrU5DhH1By/cfZYWXsWXei6oL5Oynb
 uFEKXKbTuX07aAu6ONu3Z9AgR4gypZIVwqsAHBgN8D6cOt9fyyjSBO/TBL1gUo5BU7pL
 SvOoo5a/jJT7DMjFhIdArThCHFY64j79Z1MM/hBj8Qsy35yuUnzSJcKKPPcpUuZeGFMY
 Tu8w==
X-Gm-Message-State: APjAAAUb+GkbhjYFHDcE71GpFHBt9ARkZiuTG2Hg+CFxLqhJUMx1gkGs
 j+jCdAIu69Moz7P7c8+hYRATJw==
X-Google-Smtp-Source: APXvYqweyz/vJLz3XSJrTqHAwkyOi496405Xmp7phDEGv3avQAvcYEUVMcBQhA7ylJbR35xK+RmgDw==
X-Received: by 2002:a1c:c8:: with SMTP id 191mr11326841wma.6.1558360810799;
 Mon, 20 May 2019 07:00:10 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l16sm28656473wrb.40.2019.05.20.07.00.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:00:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Subject: [PATCH] clocksource: timer-meson6: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:00:07 +0200
Message-Id: <20190520140007.29042-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_070013_065209_DD736772 
X-CRM114-Status: UNSURE (   9.59  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clocksource/timer-meson6.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-meson6.c b/drivers/clocksource/timer-meson6.c
index 84bd9479c3f8..9e8b467c71da 100644
--- a/drivers/clocksource/timer-meson6.c
+++ b/drivers/clocksource/timer-meson6.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Amlogic Meson6 SoCs timer handling.
  *
  * Copyright (C) 2014 Carlo Caione <carlo@caione.org>
  *
  * Based on code from Amlogic, Inc
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/bitfield.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
