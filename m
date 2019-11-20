Return-Path: <SRS0=YQie=ZM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776BCC432C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 15:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325A720709
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 15:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BEkf0mIO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTD/GPgb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325A720709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tx5gYD5SAN0fvABr8KRRYx4CWnoxa7dkpEHn8tHrPeY=; b=BEkf0mIOcts6TxSoqcmnQDvDHO
	QxkpmkkkDPLFI7KBhFjgP62PmtkwgrgBUdPnDndmfdqpERt2H9vzNm6SI8fJEHaCOY4aLioETMQu8
	78nMeicEIkH1Bn0kMQixMPsdeHTQsAOLkYIIcoIqqrbBiXHtV2T8P3UpkBWRc4iCp+CdnHsxEB32r
	iLwkfp/L9CPncPGce2dQmLbLmn0Wjg9ncg4bPwgWC/mnyqZEuSyWa8Ga/g7gHMHhZQh+1NdM5Nori
	1XRGRXPNqBS8NIfFk7nWEZmahxBbvRZFrheNFyI+fuZ6Xs3R7sIj41xv8RN3mu1tS66oH9URbdAsP
	dH6uKx3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXSBw-00046N-Mb; Wed, 20 Nov 2019 15:46:52 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXSBC-0003Md-3f
 for linux-amlogic@lists.infradead.org; Wed, 20 Nov 2019 15:46:07 +0000
Received: by mail-pg1-x543.google.com with SMTP id b126so2132504pga.6
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Nov 2019 07:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=AgDAyNnziZ2/rpXVW+6uZm6qCS/g3MtXyy21omVhiKk=;
 b=TTD/GPgbVJlqWJezadRMyot/6RcSAW4tTnmkmdhwjB+qH876bPgz4yk5cS7IiGyP3K
 trLYX6i0Vl5wNDbXS6dOb4z3Jji0Zde+ZejgKmxq+3s/LVxGpRJbJv8Gl2YzYZ2azXgr
 J/YNU2VewuB697Ynqi/+TODfrCjqZ3gVhcTfO13sryD2gZlgriNpW636jt++tlGJQZQP
 d6nK84JZI6WOMBLBBUMqz4sR9NWbVcGQ2fRx3/ctZE88lH5y/l2gMKLwbSOxWVXk/j53
 atgnWdYX91MJ1T3R5xvOHUtLt7nF+uncFHBbik2aiHOtlUqjlO4/wzlwJ5J3nE2GEpua
 Fppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=AgDAyNnziZ2/rpXVW+6uZm6qCS/g3MtXyy21omVhiKk=;
 b=UmcJV26TI+vOK+JxnEdW4V+oALsRky4SRd/IYaE8KBclBHCDct5/V5lSqawA8qKIVT
 DLIy3S87/oBRc0zYYjw5VhGvWabTqMxQ74Ky9h816NZ289VebQJ3DBwq9SYMo3kPYUs8
 qj1F89LOVcXp7W0f9ydlbxW5gupI9X1XAkZFBt8221ZK8OgjBlz3Nxfb05qAHPc6wRCB
 sA4nVOwcrUP17N/82IivnXHoVFYz+c4OPharfSHywLafawRjETOv0iqK45SuxsoMnt4D
 QZiIwKt212KrwTwfJQjReAn3EbQAczA7dsN/ppDvPd9a6qSiFaPFme6Pl8CJVf1JLjaP
 PGJA==
X-Gm-Message-State: APjAAAXkAvkakpmFzYncbCadYD4Il5bNViZKLX3hMoiaXLT+2tIJvs6t
 ZfO/10IPjq+1ed9Y5yS9B2PLkg==
X-Google-Smtp-Source: APXvYqyB7lY58RH7CXaXDrsbQa1IXAGZ2t49P4RvoB6lsC3HH+gC0HPsfAEo+5uM2xZEinvTSMklGw==
X-Received: by 2002:a62:e119:: with SMTP id q25mr4862880pfh.161.1574264765290; 
 Wed, 20 Nov 2019 07:46:05 -0800 (PST)
Received: from localhost ([14.96.110.98])
 by smtp.gmail.com with ESMTPSA id 136sm30313724pfb.49.2019.11.20.07.46.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Nov 2019 07:46:04 -0800 (PST)
From: Amit Kucheria <amit.kucheria@linaro.org>
To: linux-kernel@vger.kernel.org, edubezval@gmail.com,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Javi Merino <javi.merino@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jun Nie <jun.nie@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH v2 10/11] thermal: amlogic: Appease the kernel-doc deity
Date: Wed, 20 Nov 2019 21:15:19 +0530
Message-Id: <139c9191f1a18d528b5f94376facf40291d28244.1574242756.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1574242756.git.amit.kucheria@linaro.org>
References: <cover.1574242756.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1574242756.git.amit.kucheria@linaro.org>
References: <cover.1574242756.git.amit.kucheria@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_074606_199090_6733040E 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix up the following warning when compiled with make W=1:

linux.git/drivers/thermal/amlogic_thermal.c:78: warning: Function parameter or member 'A' not described in 'amlogic_thermal_soc_calib_data'
linux.git/drivers/thermal/amlogic_thermal.c:78: warning: Function parameter or member 'B' not described in 'amlogic_thermal_soc_calib_data'
linux.git/drivers/thermal/amlogic_thermal.c:78: warning: Function parameter or member 'm' not described in 'amlogic_thermal_soc_calib_data'
linux.git/drivers/thermal/amlogic_thermal.c:78: warning: Function parameter or member 'n' not described in 'amlogic_thermal_soc_calib_data'

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/thermal/amlogic_thermal.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 8a9e9bc421c6..ccb1fe18e993 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -67,7 +67,11 @@
 
 /**
  * struct amlogic_thermal_soc_calib_data
- * @A, B, m, n: calibration parameters
+ * @A: calibration parameters
+ * @B: calibration parameters
+ * @m: calibration parameters
+ * @n: calibration parameters
+ *
  * This structure is required for configuration of amlogic thermal driver.
  */
 struct amlogic_thermal_soc_calib_data {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
