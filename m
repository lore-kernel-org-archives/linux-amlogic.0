Return-Path: <SRS0=LiOq=L7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37B5C07E95
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 17:19:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E20A61C69
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 17:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E20A61C69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6qh5QTzXKrI59tT9ZpdTdL/Sh58ELMuieDS+1Y1PIs=; b=Z4KqpBwQruBvV2
	8pj6EDBb98v7zBUnPn5RrsiXfTFBkP+h5W6t25bacOXGqUoEjoqZCYJvb9DOTYmUK3ttTVdpu5jk/
	6e6v8M/M7hQaf3auENjHSfhsHVe8OdzoTPBpPlIYQGdGdotYf2I18ssxXdnql7T8KqFKQOanauWsD
	+fQD+NQ9HPly+LhvICmu/3ZUsSINRRWwvuk1Uy9oC7Df3oEE2XOsdi1hPOQn1PYbzWFos95Y2LaZX
	lhiWDohDiYnYf4JGFhGIFEstS1ieAp9uqMfmM+4TBwanyHLXaBBc0a11RIQHP1Ebk4+/qyvJah75E
	WmxaQUNTygAVO1HdE9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1BCK-00FN1n-DJ; Wed, 07 Jul 2021 17:18:56 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1BCG-00FN0h-SF
 for linux-amlogic@lists.infradead.org; Wed, 07 Jul 2021 17:18:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id r26so5797571lfp.2
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Jul 2021 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ypxDnWif+H1Ur0uToOJNpXylwlZDL/gdovpiZt5z82o=;
 b=IC5AgO9ygAj8ApySXTjmmQ1KSRN0cdqozzHfdj+K2tcM8hm0jOqYro9VjT7rBDRTuG
 vq96jbhyu3H0Guey3tXVh2+IDVFs5M/aOsu0/rfVbG+21L/qlTgU4I9U46fPByKW8Z1A
 YSIzGUUAZik7JSRdzuYfI72eXdMQZNJ/V7EUYDenIDFA/A//+T2mgyV55iCj7mBd0qyL
 kAFVP8K4L5rCkyJJ3dYeFk3J3rdnHGDI5UaNh8w76d4ErteHIqVGV5cTGkBaGG0IJsSn
 ebBCdUf6GuHyd8JUGxxSD+0ZrrEzX+HxaIz/Spjeq0R+bbGQdev5Ew7FeD4yLgwYv9vz
 YRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ypxDnWif+H1Ur0uToOJNpXylwlZDL/gdovpiZt5z82o=;
 b=Z5rW865hW/vTibtUyJw0hnSSm44jWIA2N/dNsCl7I5jfMtMT2RRxCNHtca6tDaHPVr
 8ts/Yc8QoUrZmvTTSAxl4Iyf2+qecJDsANmDXZJUvzHmx7BQFnjLP9v3DUd82MX0DTDA
 j7ALOERu+l/zh5zZefWhQtpwZgqxTyw0dkzOKnGv9PxhY98mZOxYsVy7pqiD0N2jpJdK
 apM4chwIPg8K0cGvTnhmeNH5jVKyrg3sqKsrSyItlIsb1alnxsOwyHEcFGOyM4bqSQl2
 72LrsR8jhguoa3rDnmkSKCS/5Aet0gEcci+1h1H3UAQ5pECpLSnqs+JOUFh9w1MsZwe8
 MvPQ==
X-Gm-Message-State: AOAM5302g/r1e+NZhgkBHUuDj1wmZlrvwI0JzCFAzpFhxV6Q7NeeLbn9
 h04GIt8L+rcZyR+kS10fZui9HQ==
X-Google-Smtp-Source: ABdhPJz8VSZiE1GbRIW2zEZJUmJvzpwEzRHId//RA7YGJlorwou9uYQ720aDMZGQWPSk0jqptMEGCA==
X-Received: by 2002:ac2:4191:: with SMTP id z17mr19059617lfh.457.1625678331172; 
 Wed, 07 Jul 2021 10:18:51 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id z9sm1652235lfu.120.2021.07.07.10.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 10:18:50 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH] fixup! media: rc: introduce Meson IR blaster driver
Date: Wed,  7 Jul 2021 20:18:28 +0300
Message-Id: <20210707171828.6967-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210707141323.20757-3-viktor.prutyanov@phystech.edu>
References: <20210707141323.20757-3-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_101853_017310_61F7AC6D 
X-CRM114-Status: GOOD (  10.97  )
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

Fix building error. I mistakenly sent the patch from dirty git tree.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 drivers/media/rc/meson-irblaster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/meson-irblaster.c b/drivers/media/rc/meson-irblaster.c
index bfcdf47e2100..f6cb47593392 100644
--- a/drivers/media/rc/meson-irblaster.c
+++ b/drivers/media/rc/meson-irblaster.c
@@ -215,7 +215,7 @@ static void irb_send(struct irblaster_dev *irb)
 {
 	reinit_completion(&irb->completion);
 
-	dev_dbg(irb->dev, "tx started, buffer length = %u\n", len);
+	dev_dbg(irb->dev, "tx started, buffer length = %u\n", irb->buf_len);
 	irb_send_buffer(irb);
 	wait_for_completion_interruptible(&irb->completion);
 	dev_dbg(irb->dev, "tx completed\n");
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
