Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF1FC5DF87
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 07:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GBu0J8ELKCfPZkzS9m+XwEGxrILLRPses7HWjVxmgHg=; b=QMitfts6VsvFWj
	F2nhTALE4mNxNCk0aqF6TOJmZdgjtX3MwVVmck77Bd+tKJFS0eL5toVT08qINI6gOEhUoI8HotIuf
	/B09RoeHvO1K7PgNnTzCmVMB4IwqAM4XMQKo7mjHEZ/lLjyEj5r2o9S4IT4LWiwnTaIMpgJ1hzIz+
	jHU5xvpCzKQmFLipK1/mv1C0t/T8yTVOwC7VdOJRNFMl2gyXelNN+cfyqFQTtuDVy1NssfKxXAFlz
	7AFgGBMhXhhv5gzSAaDS4Gx5fWtu13DBhS4NTiVHmVcOR2xB2mXFOpNaxw/33HMtUXKqS6OTATZhy
	H4LrbLDbBKIoPuwBGMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJTh-0000000Cg8t-03Fh;
	Fri, 21 Aug 2026 07:15:49 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJTe-0000000Cg7c-2xJU
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 07:15:48 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e08baf860so655431a91.2
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787296546; x=1787901346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Y/Hk1ij4iIeeDeCgZ2taRMrjGJza1klMebG4Wvu7x0=;
        b=cm8vpJFo9QS0LYHZ2sXo8zlAXekpwAYsP8XvLOFU0ctGsL04w5bCMk+SrFgs8LpkJG
         0D7P+PdST6Yp5ehbsSkEa0IuWE2BlUdUPaHv+sZlJuPmIWtId5hZmywcrXDZjcfqzCWO
         WRqtB9qFLaqYeFaF7+4BBOc1weEj4A+c8z9vShozY5aS5iU/FvKJBMeYCZ4+kjfx0WH7
         J92FQUzFML23rBmdXcxAjFiZaB+d1Ovjz8DYrsXmElcfs3NuOk1nkmsRG0GpqyJiMKJZ
         WQ7KvDBDWz8XFZFZWrJ3VbfqfLaLkXRjVjr1AO9Ih5dp4ukqpldRfWvxtsUlRonBMYQb
         4Wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296546; x=1787901346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Y/Hk1ij4iIeeDeCgZ2taRMrjGJza1klMebG4Wvu7x0=;
        b=BqFDjvExTLsQG5Ug24mjGsjBwwudG2D9/OLAPNRGFJ88QDZjlhDwJu3oHcYYi4p1yY
         jsqVXQN1mN+zcrWa/39zHufpOruajVjn/q+9XmibzSMO08FBDC63jQrMuP7tHzOEcRUj
         JyxLjtpMi2z3NS0WIPfm4EdkGNb/r1H5CXVss/eioJ1jj875SnxwAjsN5AdmeCq4uB1p
         L5QLRb1PYyynLN2eNwyirGlhwBAw+/DKBBlv3B2k4+FmvyP0YGZe2a2J5yOQtBs6KGOV
         LU9ZrKSZj+t1vBylF7okWh+1R74UePshxvqoYEj3jICsBet3NvJ6ELGQlifIRvZMfUg+
         LcVA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0VEWGD7yFQb390BUsVUOIzuvJe8gQk/Ca6psixtVFU33aovkrMUIMHYPBdn48mceQsUk2886V8ZVKv99T@lists.infradead.org
X-Gm-Message-State: AFuF++mFxI8GzDAPRyRkHPAxf2Ngxcl4fW0KFKG4baQN0X3viKmjoO7l
	yQIImi+pBU1Q6M6vc+XH6lTLMYC/uOVdB5zuw/taN0zSQxGvlaVbDew=
X-Gm-Gg: AR+sD13u+Xvy3GXOcufoU9nIK2WUA6n/9sHy8dxNQ6RmkZ4td3ALHLVZaKOY3Fkemi+
	n0UKzYo5OZE8m4RVxNpW6ZG6cO4iJk6jbgWyVdG2wgf2XezFCxn90cPsdK/hNTB+lW6Rq2qqIMa
	B4Dfju+yAiPxrpdwcQGkm0q2KhcwIz69hHeGWm7o5NUko61aPxn8qfL9f3uJMI+1XB7xXdtepMT
	53GvDh8r7471k+X4OAUsnQDEaBKAymrWeNs75UwpLe+rxvWCoLe8YryrnVnoxknWh/LiZB+NNp/
	bmk4ToNmvSOQzdhMfyWDTgupEq9deTobFAUALvP2sJmtf59CjX+SdggqOOMFkmXp/C4Y4VslvPM
	jFZqkjYpL6fguAUO2OtZkPJMNmOH71yRqXuYzpXvG+ncAKbsoqloUx9cCtXiKlfUTmx9htQqfv/
	Fv0am9U8b+ljgoyjbhWoFHbFNAXqrcdswizE+zKKnaZMJcQE/0TW13F/Pi9eERjTJAZ6DlXwKlW
	Jm46LMWbxTJwQ==
X-Received: by 2002:a17:90a:da87:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-395c3731c29mr8394315a91.12.1787296545832;
        Fri, 21 Aug 2026 00:15:45 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm1951676a91.15.2026.08.21.00.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:15:45 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] media: rc: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 14:15:33 +0700
Message-ID: <20260821071533.215821-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_001546_744519_55789E78 
X-CRM114-Status: GOOD (  11.75  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks,
also reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/media/rc/meson-ir.c  | 6 +++---
 drivers/media/rc/sunxi-cir.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 272ebb0d97c8..795b38ca864a 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -567,7 +567,7 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
 
-static __maybe_unused int meson_ir_resume(struct device *dev)
+static int meson_ir_resume(struct device *dev)
 {
 	struct meson_ir *ir = dev_get_drvdata(dev);
 
@@ -579,7 +579,7 @@ static __maybe_unused int meson_ir_resume(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int meson_ir_suspend(struct device *dev)
+static int meson_ir_suspend(struct device *dev)
 {
 	struct meson_ir *ir = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -591,7 +591,7 @@ static __maybe_unused int meson_ir_suspend(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(meson_ir_pm_ops, meson_ir_suspend, meson_ir_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(meson_ir_pm_ops, meson_ir_suspend, meson_ir_resume);
 
 static const struct meson_ir_param meson6_ir_param = {
 	.support_hw_decoder = false,
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 28e840a7e5b8..7fd48c510143 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -236,19 +236,19 @@ static void sunxi_ir_hw_exit(struct device *dev)
 	reset_control_assert(ir->rst);
 }
 
-static int __maybe_unused sunxi_ir_suspend(struct device *dev)
+static int sunxi_ir_suspend(struct device *dev)
 {
 	sunxi_ir_hw_exit(dev);
 
 	return 0;
 }
 
-static int __maybe_unused sunxi_ir_resume(struct device *dev)
+static int sunxi_ir_resume(struct device *dev)
 {
 	return sunxi_ir_hw_init(dev);
 }
 
-static SIMPLE_DEV_PM_OPS(sunxi_ir_pm_ops, sunxi_ir_suspend, sunxi_ir_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sunxi_ir_pm_ops, sunxi_ir_suspend, sunxi_ir_resume);
 
 static int sunxi_ir_probe(struct platform_device *pdev)
 {
@@ -422,7 +422,7 @@ static struct platform_driver sunxi_ir_driver = {
 	.driver = {
 		.name = SUNXI_IR_DEV,
 		.of_match_table = sunxi_ir_match,
-		.pm = &sunxi_ir_pm_ops,
+		.pm = pm_sleep_ptr(&sunxi_ir_pm_ops),
 	},
 };
 
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
