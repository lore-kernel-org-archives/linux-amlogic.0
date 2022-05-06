Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F4BC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 May 2022 23:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wVUM17HAHoOv+rfAW+jKJbHCfVfk1AX1huyAaZ1n/Zc=; b=2mZLBQ7xVTLrPT
	+16M+Mh9UB8cOceSS1MHBtpdF3ZepU561nL2mq7jQlqUbyKvp4tx2rq9E9GNmjPTeRuLpETlOsmha
	JI1sqr7hQeuauN6d86DdOeXLeTKiuiaj1r9iwAbCnzYTVt7lGNB1OVXVJKcWD9sVj4f7zmpClguYd
	BUEEBk6G4fQZvZsQCxl0mhj+DiZNWyU19InHmexg8a0MWf6UEVrTqTWU5RQJeYwinp84dmjpXlRsh
	ephKx91+IOXh9dBYLVH/JvTS16YiH1klDYFKQQBjivvR21qKn698dZFOTrJYMuBsy9mfJwHzJX73e
	KwbOLP/vHDZSDadnYf7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn7O5-005Q5L-3D; Fri, 06 May 2022 23:29:29 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn7Nu-005Pxs-5d
 for linux-amlogic@lists.infradead.org; Fri, 06 May 2022 23:29:19 +0000
Received: by mail-pf1-x42a.google.com with SMTP id i24so7442793pfa.7
 for <linux-amlogic@lists.infradead.org>; Fri, 06 May 2022 16:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nigauri-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZryJIATSG1rhke0rJfXTfUFsBQ86+ZTOTmR7kVabtXI=;
 b=N8dL8GLe87MYs6OgH7bRT1eZgTqQyzOBKIjqgJ//OQYPu/gPDbsr6lhxB4RSRjjuOE
 sneUljFGtZHU1OSXJF80lMprGDCqMmp1suZ1v6xEU3ry/RbWrxDeBZCI/D64v7Yjn94M
 y7mVGqwunG/Czz+9/0m0HElq5op5dJpzi3ShdWh55jfqHkqbtXtX8EsPxP6YtkS2kYg6
 8LZXeT0ihJ7ekaUgOyFExvPQ7ZcbbysyDw9EtMMfcxYdOI5f2W2mFEO9AJ3MNgGZvCSm
 ZEBHydh1grVmTOmU5ZCClEbpsVFRTrS3KqWloySM09EWCZkcK2VSHfb4pY/33QylqviM
 pABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZryJIATSG1rhke0rJfXTfUFsBQ86+ZTOTmR7kVabtXI=;
 b=f2WblPVTcKVkdIDSGjHvR5GLO9sP/D/MwwwE03TqPndeIRBnc5QlIM5lu1qiSycWUS
 oDaMDKbLn26qkylmFGlBXls8QG2YL/N3tiXU4N7hwbo8sD7ZQbOs6sbtr8s6LuaaPVKK
 fHb8Usv0e2XKbga2qSYpRRRB7uSDCOiwq23KLbURD4/n1EnFsvMH66DD6lXLz8FhPZ2w
 lEpzBiE0Q3RportK16GLHJv4o1nr7H57TpduWNTi2uzeQP0idVJ00NvwpgWxgT4FveJt
 edkvf1jh+xyU/grs7d6EIgTiJMtnwO5BQo3ym8qbf0smsZWFVna2CIN0QHIMwwI4CLqD
 H8/g==
X-Gm-Message-State: AOAM530Ce3cC9qfNQkAZzhiDictd6r1mcmGHHm7MzpdGrXO3ugw/fAPW
 cTjjvvaCPSLd9cQwA3MDLUAc
X-Google-Smtp-Source: ABdhPJwDqQtSYBlWcHAu64fZxver1LDggAI7mPO/6wt4Kp2hobdi2w57JzQzPqGrjGjah4egCMW73w==
X-Received: by 2002:a63:1d26:0:b0:3c1:eb3f:9daf with SMTP id
 d38-20020a631d26000000b003c1eb3f9dafmr4590923pgd.284.1651879756163; 
 Fri, 06 May 2022 16:29:16 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:7285:c2ff:fec2:8f97])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a170902a5c900b0015e8d4eb1e3sm2333441plq.45.2022.05.06.16.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 16:29:15 -0700 (PDT)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
X-Google-Original-From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: rtc-meson: Fix email address in MODULE_AUTHOR
Date: Sat,  7 May 2022 08:28:50 +0900
Message-Id: <20220506232850.220582-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_162918_444617_00AC08F5 
X-CRM114-Status: GOOD (  11.27  )
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

From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Ben Dooks's email address is <ben.dooks@codethink.co.uk>.
Fix Ben Dooks's email address in MODULE_AUTHOR.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index 44bdc8b4a90d6..db1d626edca5f 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -399,7 +399,7 @@ static struct platform_driver meson_rtc_driver = {
 module_platform_driver(meson_rtc_driver);
 
 MODULE_DESCRIPTION("Amlogic Meson RTC Driver");
-MODULE_AUTHOR("Ben Dooks <ben.doosk@codethink.co.uk>");
+MODULE_AUTHOR("Ben Dooks <ben.dooks@codethink.co.uk>");
 MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:meson-rtc");
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
