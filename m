Return-Path: <SRS0=nr/o=3B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F252C33CA7
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jan 2020 00:16:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 306F720848
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jan 2020 00:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HBpdZ1if";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UH7MWGgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 306F720848
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kj21+v/VmtXJC6JAWbvRBZaP0vNZAz/uAUPoJkx9jM4=; b=HBpdZ1ifc1tmRm
	sB4spUw8KVHarYn249jCYQkFiyNJOAMJ6yZnL7DLt2kQUNLF7IekmHL6wEbMv4slamzXaanlEb76Z
	lR7lTviUNU3UpHQ33FwQpl257k9+mviOzQTm/+AdekDslfyXYxC1FaCimmeCT//keyvX0IM02PTR5
	C8f/sImEKHM+pdW4uRORGnxM7BloQGG9fWSsdVdIySMl5F9LdTeLNP8Q+e79nduCxCAZeim/0tBTE
	8Bf4hVNGXGW3HQmWpwZPAW89OVyBFjwdaK6GfGRPr8GDBgDRa0T1Cs4wOM+6jteJdO6M7pUUQnURq
	9I5dnjYtMKw352ID+ZUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqQvy-0005fO-MJ; Sun, 12 Jan 2020 00:16:50 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqQvu-0005cV-GP; Sun, 12 Jan 2020 00:16:47 +0000
Received: by mail-wm1-x342.google.com with SMTP id t14so5826354wmi.5;
 Sat, 11 Jan 2020 16:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TO4ro9G4vD3zIHyJt/0agdTa39l4m1TB7ZW3wf7lrf0=;
 b=UH7MWGgmwpk+vFbDOSAfRRM5C2mVjwsDV1I/lidLxqldDbgNh2mQf1YvA9C/MsU15K
 eSNVEdudBaJL3+6RGJN2DaZN3xbK4vXy5fdslb47DmZYmpER4EKUUIMYxqpmcOntHN1l
 h0OGL18OHKnXe/pn/dS+JeYnlNQ36lO5c+iEAPAm95AnQBFva2HCmFAgf9whFsoL3rPk
 vAP5147OME9RQ3F9CGQP5epoyqVAK/twGXgZIFxRjJM97l6b+4qqcaRMLldmjvfZtp/g
 hTifIsQG74JrK5hFgARq04sLxGb7P2nGygPB1DnFV1tFlija8XeEg34NvACoT25k77PD
 2ThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TO4ro9G4vD3zIHyJt/0agdTa39l4m1TB7ZW3wf7lrf0=;
 b=TwZw27TvQI7W3XYlZKcvLqvJgsBT51YofG3RJmIy6uP6UH/zmPOUYwjEZHYWf8qw0C
 rUVJGSfifwBXek28fbIU7kjSvTuufONqoR0B87q9zFk4MuggGf24/HDqPaNFlLqVJZm3
 1K6FKUfXmEgH9gDKPTn1Uwr9s5hCCohZd/7yy44cz/VoasjHSCHdPA2D+XJhV7rmaeE7
 aoW6eo1eFnMz/m7yRP7E9UEeexc/OorNnc9kfqEADjEWUshwZLOIjCiz56pWYa83io+R
 L8scwJsLdHYtkNYzFrkZCfw8iCHJck4O1zLOv4Fw3Xqt/bWkj+BOuQBdCA4jJEpofjQ0
 60bw==
X-Gm-Message-State: APjAAAX9twXFujOt/2qTdxev8xsRuJBUedf4A85uU+iXmug5v+sfX+la
 hpcXb+5FzdbmldFuMJ9GS3I=
X-Google-Smtp-Source: APXvYqxwsOHaGPq94M95EVR5OBQt7fgZiB2P/O5Jg9DgUSfO9JLb4kiGFlvW8Na/knMYtda6GHHQNg==
X-Received: by 2002:a05:600c:230d:: with SMTP id
 13mr11799060wmo.12.1578788204957; 
 Sat, 11 Jan 2020 16:16:44 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id h66sm8575535wme.41.2020.01.11.16.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2020 16:16:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 steven.price@arm.com, tomeu.vizoso@collabora.com, robh@kernel.org
Subject: [PATCH RFT v2 1/3] drm/panfrost: enable devfreq based the
 "operating-points-v2" property
Date: Sun, 12 Jan 2020 01:16:21 +0100
Message-Id: <20200112001623.2121227-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112001623.2121227-1-martin.blumenstingl@googlemail.com>
References: <20200112001623.2121227-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200111_161646_542040_A89DF5B1 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rockchip@lists.infradead.org, daniel@ffwll.ch, sudeep.holla@arm.com,
 linux-amlogic@lists.infradead.org, robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Decouple the check to see whether we want to enable devfreq for the GPU
from dev_pm_opp_set_regulators(). This is preparation work for adding
back support for regulator control (which means we need to call
dev_pm_opp_set_regulators() before dev_pm_opp_of_add_table(), which
means having a check for "is devfreq enabled" that is not tied to
dev_pm_opp_of_add_table() makes things easier).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 413987038fbf..1471588763ce 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -5,6 +5,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/clk.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 
 #include "panfrost_device.h"
@@ -79,10 +80,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 
-	ret = dev_pm_opp_of_add_table(dev);
-	if (ret == -ENODEV) /* Optional, continue without devfreq */
+	if (!device_property_present(dev, "operating-points-v2"))
+		/* Optional, continue without devfreq */
 		return 0;
-	else if (ret)
+
+	ret = dev_pm_opp_of_add_table(dev);
+	if (ret)
 		return ret;
 
 	panfrost_devfreq_reset(pfdev);
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
