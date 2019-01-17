Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C92EC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:55:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E02F20652
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eeJeFSWR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZMMVlo6g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E02F20652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=v7xg2j7IeCLOvxgpWcbhHI06Rn9w/GoOzNhZ78pgoWA=; b=eeJeFSWRQmtpo8xSGKmGLYZ+Wj
	D1oNIw7ItHjS97oN4o4o12L5hArEjT0PdgkCIIp5rPtlYa3ZAl/uJP5e6wm6TcFbrpE1Shl6kJzXr
	PY05dEGh5TLRXGyxKQ2YZIvlgT0SxkRONmJbAqutDkvgoDMeQHcwmoAB1rtmqatATmsF36DVLzEau
	RNZPe8ZxAc9Ulz0nh4E8TbtBCZQtrGgkTmzWZyXhl+qhYwo5QLU33wK1Cu7Rxx/N3L8YEqqyzVUst
	5RX/SJcxOmZnXRO1+VRkJkwIDg/pyj70f5Snau34FLae4GyTbhGMewZvJD1PpQCgZtWRtuT9bNCs2
	23fnVVqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkAx3-00040c-Iw; Thu, 17 Jan 2019 16:55:33 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkAwH-00024i-7y
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 16:54:50 +0000
Received: by mail-wm1-x343.google.com with SMTP id r24so1515025wmh.0
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 08:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9j/4jxpYoQpPS/+1F1W02eb69wy8a+vueBOw79dZhl0=;
 b=ZMMVlo6gORfpCiJzCTh35BEQkxOT58yOVe7R5axxirvuNI7pvedOR7BDZIct9vWjLH
 xHFV0uD762SYEPELWy4SofB0e6QtGlu1ob1ua8RM8TeB8wbwRVposUIq87sy7IaoQn4u
 73tRkOcyhtSpHqQ0gFzkYRaCC/4ktaZ1QjvMFQ8tfT05X14fL99Z6kMFrPJ8kIkGwmBS
 wA7cpklVkVKdRsxjfAaDoI+My9hdnV7DlJTPEc6bMhFY6A/WkZwKsKXOb2/pJF4B0fZ8
 WWuAEJg8YGYgiJu+N9hyMjQA3uHnjko42yKcCo7o7E/UHMMHU7estb/PGK65ii1164Hd
 Lhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9j/4jxpYoQpPS/+1F1W02eb69wy8a+vueBOw79dZhl0=;
 b=F5Gi2nN21TErV+ha5i+XmPcIM1abGKp9qElOgPW7hm9BvNqeXiVdUHek2FAay2zOJk
 g0uoij3LbrRx7niiegWpVd4xjKD6KmsRwB+g+X3ArbiE9lM+f40NavNF0c+gFQJiS6Eq
 ar4JYjBmLckTQQ+//1yATPLk7pcrz1XzLZiGovzOpn2Vya7ExTlq4BrDz1ZRY2zoNHCA
 2Lia2b3St9oVTZL1FLnfLL8ZaepG/BkioaaAc+wc9gvMHsggwiD/FWg0iKqa24a41xqZ
 YWt8ucBg8NKAqxVxWWCDiKXAUWBMKqzF1l2XKNZg9yYWSG0+m49RZpY2oZcFZykB/csS
 Bn6Q==
X-Gm-Message-State: AJcUukduBi9GGgq5W0GMdg7KP+xChZera6iVKmC9j50kUodcDi7AbADh
 nf+FvR1kL/LJxVNBRYMyv+ZB6g==
X-Google-Smtp-Source: ALg8bN4JFH5Al+JSn0k9EAkO6wjhzOlxBRiDe8ShCU05xJYXuEkqlX6BaZPLbL8Ttdb1wmQQMZyM6g==
X-Received: by 2002:a1c:c60e:: with SMTP id w14mr13223913wmf.18.1547744083821; 
 Thu, 17 Jan 2019 08:54:43 -0800 (PST)
Received: from loys-ubuntu-BY1835A49200471.thefacebook.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b12sm65309630wrt.17.2019.01.17.08.54.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 17 Jan 2019 08:54:43 -0800 (PST)
From: Loys Ollivier <lollivier@baylibre.com>
To: devicetree@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 3/4] gnss: add mtk receiver type support
Date: Thu, 17 Jan 2019 17:54:33 +0100
Message-Id: <1547744074-28308-4-git-send-email-lollivier@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_085445_362613_678846F0 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add an MTK (Mediatek) type to the "GNSS_TYPE" attribute.

Note that MTK receivers support a subset of NMEA 0183 with vendor
extensions (e.g. to allow switching to the vendor protocol).

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---

v2: renamed from GTOP to MTK.

 include/linux/gnss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/gnss.h b/include/linux/gnss.h
index 43546977098c..36968a0f33e8 100644
--- a/include/linux/gnss.h
+++ b/include/linux/gnss.h
@@ -22,6 +22,7 @@ enum gnss_type {
 	GNSS_TYPE_NMEA = 0,
 	GNSS_TYPE_SIRF,
 	GNSS_TYPE_UBX,
+	GNSS_TYPE_MTK,
 
 	GNSS_TYPE_COUNT
 };
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
