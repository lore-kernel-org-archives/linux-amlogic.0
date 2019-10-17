Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3609C4CECE
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 05:07:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 854152067B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 05:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZUb0J3jR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dRUemVlF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 854152067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bHzA5CZUAo8tp8irzsIljWXqXYGOBmjDeU4TUeXENuU=; b=ZUb0J3jRYU+NaWVJfrk1JeTVUb
	RIvEpgr8GxDfS0RPwoHFQqEb+wMIRdavEspK8axhnrdTyAKuz/s/FUu6H2VKa+n6LUqRVAoMGCTir
	Cf1d6bGm0ly6wvfDLHI2Qrldgy56HOmetIeh1JifcigWjtH1rfwXDL/6QkIaFc6QTmdJDjXMNcsmL
	2dHbCNWMFQth5h4qthrzGWZkgyg68j3D+RY9j2EzAgyx3CyzTIsmsYlAtRHPHIEESXZdlmpqKb8SA
	kQVJ2DvRCsSvOLzJ9qX92KkhADAZabE/w8Jtb2tgKh63f8eyQCB0wQqtcJKqN/NW/ggXBTk59lDMo
	L3SKJ56w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKy0G-0002vE-Rb; Thu, 17 Oct 2019 05:07:12 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKxzp-0002Xx-R1
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 05:06:48 +0000
Received: by mail-wr1-x442.google.com with SMTP id o18so669533wrv.13
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 22:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NliZFeQ9c/Qq6fBGMoYFeWbfIFjnCeTRD5spAgl/f4s=;
 b=dRUemVlFgZXe06Iwa1cQ+/QjBSoPreZqwAKc8O46K1uwcJqYL9kpym/A6G3uZ7Wt/g
 fF0/XTNYYLnvn4piLEjhJaaEbbs8dh/6vkQufKzNzGb1FrBOaKadnvHCSyoAz2c8r18z
 j3wyPn4tDVMdJMRLBAySsH/LOLg0XFCU+bzoBg7PzCTtHA04gH8Bu33+vSs2+ifUZq6a
 9qrMbPI/0AMXGrQQ0rUetL/vHr3YwsIBoM/B4Blsu/rQt7vyRHPscg3AD9XpeglZaBuZ
 +MiMMBcu0EXQ6eUCy6ST7rlZnvR4jp6t2mbGp4UHWtWKJXzhMRvVfaMOOF+r6cqp6kJc
 fIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NliZFeQ9c/Qq6fBGMoYFeWbfIFjnCeTRD5spAgl/f4s=;
 b=ptc9J70A2KYU5FDqdzdE1mIK1z8TJFvBm/62e/RfbqDpZJuFSp9YtmYZEDd5YEyDNJ
 ACTMCvKzAEBBpXxBZEMhpAXO3UlmYE3WS0l0yGxgRzkWPTQy8VtOSgdqdnU2afgi1FoI
 qiYwwZN0i69C9TaedC7agB4rYXJzEC2ufCS91pk7sbmfb85r0vSlUhwoQbs/ZjkO7pwM
 iotI0ouAcKPoA82VUM8tLQ/ihliQMNnmRq3/pUM3iJZTu6gQ+Kh2XScjTRWkEM/2U7Vb
 +HQLRXgimvDBMEpN4g73SA2GxhF4wsr/sdVNjnPdRxlYP5W1W7aUQzIDKnxmZq674i7X
 37lg==
X-Gm-Message-State: APjAAAXF9kWVPXlYFfcRifYWb6hEvDQhLMv4cvSGVLV1MGAMX2OheoE6
 /UyS+dQ58MpoFnM29nYpxaTxig==
X-Google-Smtp-Source: APXvYqwpWPAmMJBUo0MsFvw9uiPvopqY1tScgpI01QQMpwwHyjbjfcGVRkmhS52RZk9CEfhYTAjmtQ==
X-Received: by 2002:adf:fe81:: with SMTP id l1mr1128594wrr.165.1571288804371; 
 Wed, 16 Oct 2019 22:06:44 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.googlemail.com with ESMTPSA id b5sm1010762wmj.18.2019.10.16.22.06.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 16 Oct 2019 22:06:43 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org
Subject: [PATCH v3 2/4] MAINTAINERS: Add myself as maintainer of amlogic crypto
Date: Thu, 17 Oct 2019 05:06:24 +0000
Message-Id: <1571288786-34601-3-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571288786-34601-1-git-send-email-clabbe@baylibre.com>
References: <1571288786-34601-1-git-send-email-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_220645_869354_FD389171 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

I will maintain the amlogic crypto driver.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2120c74f476a..59e360ca9fe7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1477,6 +1477,13 @@ F:	drivers/soc/amlogic/
 F:	drivers/rtc/rtc-meson*
 N:	meson
 
+ARM/Amlogic Meson SoC Crypto Drivers
+M:	Corentin Labbe <clabbe@baylibre.com>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	drivers/crypto/amlogic/
+F:	Documentation/devicetree/bindings/crypto/amlogic*
+
 ARM/Amlogic Meson SoC Sound Drivers
 M:	Jerome Brunet <jbrunet@baylibre.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
