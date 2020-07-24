Return-Path: <SRS0=y/h1=BD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DFEC433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2020 18:41:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C7B2065E
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2020 18:41:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fC9KJKiC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zyIbpROi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32C7B2065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wOAeKy+zbcGOSCYOMLA6DNv3Aw7XQzx+viRyTWimKk4=; b=fC9KJKiCOcW5IxjGW//sA4bMjC
	M6mFV6w94sIbnOyDl3vEDU1a7VifI4i/ix3Av2oDOFRyYc2zE7SKvZANp3uiKsQGzUk5XvA6AldUs
	L0sotwSIkcgN8jwJQ0SBkxpbvhF5vp/aaMG3hMSX5fNOzjLI8kL6sXqd0KkCeSIgK8R6pU3BpUH0I
	fPIXPHx3MNC0P+i2d1JAwpIq2I1/sptT50Srxmi+s0cdSV5ejPI0WHQG3UdmrxDpYkZV8ICM90jnP
	57DrP6hPGDenVavwbcN+jnBgSBrxAkrvPpfnwg3faq/Op9MczsDHqxNcj12LEMgwZmhPGRPZYhYmz
	uAPOCDTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jz2dA-0006U4-1B; Fri, 24 Jul 2020 18:41:16 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jz2d5-0006SJ-Mz
 for linux-amlogic@lists.infradead.org; Fri, 24 Jul 2020 18:41:12 +0000
Received: by mail-pj1-x1044.google.com with SMTP id k1so5792902pjt.5
 for <linux-amlogic@lists.infradead.org>; Fri, 24 Jul 2020 11:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NRp9N+LUNHDWTm5XoG27BNK0Q9pDdXscQ/YYGp7MMpo=;
 b=zyIbpROiQzeS/KYZCq2fG4kpgDW9kZq1uA6fJ6IR9s6d61HQ5crm1HgMBKYmK/LYAf
 8YdfLiNKmOKYFc8iKCICkkwlG1XhgdU6CTuH+e28QP7sR5vKCdoS044JYikH/SrweBGN
 XbijN9jAhqIk6+ryB9ghItXsv2SyMw5VS7IkJwQt3oLAr/o8c7RntQnf15IqF1IZKQlj
 hH47RLXIFfGdpen+A4GhuYVZMj5Vo42v4efV1P4hnmAZ86dYY/CzumHYymMN6/0vRrh0
 q8rWOLgzhbkh78ZKEV1H8XbFXuGet7UCVyETLHRDCEOvi3jnUGRdnHwvbe+rnrcvSk8I
 6X3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NRp9N+LUNHDWTm5XoG27BNK0Q9pDdXscQ/YYGp7MMpo=;
 b=e+EfFG4f84yDWFwBsZe21bYej+kcWRRzudB2ynEXUwIAdbIqQw7ZpGZWt/ilI/m6ET
 vq2JY2w3du8T2+NKpnjUt6PUa1ZSwi9BUULPEI+AuUmsZ1CBvk1UWSbi0oGVf8AKiJzl
 ngaFleBIDBmDTl+d9AAJ+4yewSS3UodRmIkMHnjGNKz/MpBhI6y2mbfhJzehisl9vXGn
 oHR9dq/QLeTXilGG7dQY+oQAZ+Buy9xFA7iNrrl9KaIQNHiiSilAAYUuxdWSTYhNEaz3
 BSF8ZLUkkWJg7bJet01wTTPQ9rYEp82sp7/4FIZps66iiEGQKIXZ1F79aDITJzV6D+0o
 4huQ==
X-Gm-Message-State: AOAM5336BSwGKyeHAURN6gjrciL97i2EZlMjMPgsCIRnVMb2HA1S04rn
 AtThGiTMd6QzKo9A28ZBptcuzg==
X-Google-Smtp-Source: ABdhPJzy3lxM47VaWGyft/mvkuI151xvb3WWUNMhLYDZH1wSetXuk34DMMn04oQnGOilP5y3WNZAkg==
X-Received: by 2002:a17:90b:3101:: with SMTP id
 gc1mr6537710pjb.215.1595616068201; 
 Fri, 24 Jul 2020 11:41:08 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id m6sm7078760pjb.34.2020.07.24.11.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 11:41:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] MAINTAINERS: arm/amlogic: add designated reviewers
Date: Fri, 24 Jul 2020 11:41:07 -0700
Message-Id: <20200724184107.24600-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_144111_817018_7A573E68 
X-CRM114-Status: UNSURE (   6.75  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

It's already been the case for some time that Neil, Jerome and Martin
are doing the bulk of the important reviewing.  Update MAINTAINERS to
reflect reality.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Arnd, Olof: feel free to apply this one directly, otherwise I'll
include in my amlogic pulls.

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68f21d46614c..7f405aea706f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1597,6 +1597,9 @@ F:	sound/soc/meson/
 
 ARM/Amlogic Meson SoC support
 M:	Kevin Hilman <khilman@baylibre.com>
+R:	Neil Armstrong <narmstrong@baylibre.com>
+R:	Jerome Brunet <jbrunet@baylibre.com>
+R:	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-amlogic@lists.infradead.org
 S:	Maintained
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
