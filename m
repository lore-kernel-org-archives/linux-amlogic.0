Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF32C43334
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jun 2022 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wiF0/cNaCwKQIoIO0gFLulmVxOIWFsuBlFnu7zC5AZ4=; b=oo6p6/mnD9jsxA
	HuvF0n5JkvrXseguE2VLj8l/x0VAkRMXaLfwCUiWgG3oajjaiFopPKOqd4r+MFTyi0Bn2CEvESEet
	MqA97WktKGGcVq89tWHTJfesYonwAEzkLLriebtvaKssW/tz44ZCJx1kWMnsu2XQUbMRzhd8cxqkd
	bLuU5KLwZ9Wu5H8qJnHgYCk4+eEmHlD9pO7cnSnqgS3guIaCusuW3lW3uNQvkyKPfI5OZ8ktD3CBH
	2Df0XmIqOIfRmaWDmKYB14WdrZTT8QDxzRsTVg/JxG4wSJQcOBYABh9Wq/oa6l+pOi1UKx5zG1bw8
	1KbUuLl1FfFbA5N+IbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qpK-0030Jj-1i; Thu, 16 Jun 2022 14:50:30 +0000
Received: from m15113.mail.126.com ([220.181.15.113])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qp7-0030FM-8T; Thu, 16 Jun 2022 14:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ARBcG
	NcD3T88nKaXT4MWM/zoSyK1nZmN5buYZLmG/Ok=; b=ZsvkMzs/NznMFaHRatqKk
	O7Js+dZEmVL5eYjbA71d+mH7Q5qiWtRQDKX/1Cd1CCKuI1wHdSY146DAhF/okeTM
	uQoKKpZs43siheQnNcy0NUp9BdmddvVePiJEgy3SbaWiJ7EdSAswy1fII2+xxGr7
	FClXStbkw3rgdJmwbfTHdI=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp3 (Coremail) with SMTP id DcmowACXp5_rQqtigmn6DQ--.14906S2;
	Thu, 16 Jun 2022 22:49:15 +0800 (CST)
From: Liang He <windhl@126.com>
To: narmstrong@baylibre.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: windhl@126.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: amlogic: Fix refcount leak in meson-secure-pwrc.c
Date: Thu, 16 Jun 2022 22:49:15 +0800
Message-Id: <20220616144915.3988071-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: DcmowACXp5_rQqtigmn6DQ--.14906S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF18Jw17Jr1UCr1rGw43GFg_yoW3AwcEka
	ykJrnrXFy8ArWxtrWFkryS9rW09F1j93yv93W5tFy3Aw4UAr18XF9rurn3W3y7X3yvyF4U
	XFykJFZrtrZ2yjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjnYwUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QwiF1pEANi9CQAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_075018_557913_7A71DB57 
X-CRM114-Status: UNSURE (   7.87  )
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

In meson_secure_pwrc_probe(), there is a refcount leak in one fail
path.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/soc/amlogic/meson-secure-pwrc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
index a10a417a87db..e93518763526 100644
--- a/drivers/soc/amlogic/meson-secure-pwrc.c
+++ b/drivers/soc/amlogic/meson-secure-pwrc.c
@@ -152,8 +152,10 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
 	}
 
 	pwrc = devm_kzalloc(&pdev->dev, sizeof(*pwrc), GFP_KERNEL);
-	if (!pwrc)
+	if (!pwrc) {
+		of_node_put(sm_np);
 		return -ENOMEM;
+	}
 
 	pwrc->fw = meson_sm_get(sm_np);
 	of_node_put(sm_np);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
