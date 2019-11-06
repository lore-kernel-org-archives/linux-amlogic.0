Return-Path: <SRS0=HwYM=Y6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DC0C5DF62
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 13:30:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 525E620663
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 13:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OI8eQsaB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKaw0thV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 525E620663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k24gCb63njPhv1vrK0s2XybYeuRqPHWTsNqJYx/zIiA=; b=OI8eQsaBDmlKXS4ejIEp4MVvaD
	9XXaF562QBBX43seoqegCbugcxNdWMh4EbsMmn312sbVDQ3efmwpnyHBPt3O5uRGuPK22fkkRob5A
	k0ohRV1+N6RGghDpO8abCTMmBMUjIejYsEO/hKSLEjJ+VJLPicMKnbuEQCdlvUtPL2baG6hu1MxBc
	Xg6lQT44Bd26SHJJ3Xc1cnJG26U+cQ4hwZvzvGQHwSelZ5lBmi7acjXw1FHhcB/G+ylHkwWxsrdS3
	INYsf04K+3S0qsM5O5BDHTyRvz8G0T1qTx9i1kw0LKVsiAMIfaNzoycnYv4B7bizdxZJBqFs+pR6U
	CNLFJJzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSLNj-0004Ry-AQ; Wed, 06 Nov 2019 13:29:55 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSLN7-0003qP-0B
 for linux-amlogic@lists.infradead.org; Wed, 06 Nov 2019 13:29:20 +0000
Received: by mail-pg1-x541.google.com with SMTP id l24so17141422pgh.10
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Nov 2019 05:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=0/+bQx5JHQOuiZKynMK7gLFGYPX738NgMSopvzkwjoc=;
 b=vKaw0thV8SCCNxndmd8ReWx7owdb6CYDzHnrVasmMSUyjnLsYByCBUxwC6BIPwswFD
 9XVykLdF9C+khBoYg22d3yidwUdQjnFxZI1QZo+hN7LVFNoE+RquwAdieDc1JEsP/D8c
 lOVq3XwJmwgUTrDceyVfL+6lsrxT/7PhwOF3c5Shy0hIa/qI7y+OB1POpA13KVF+E5XO
 /KJ56h9Q26ntU1d4iQslEZ7bH/Tcbuv+SyBCGQnXnJO+6hbo9v8BeSKHUcbHhsMKVqfa
 VVul77IsGuDvX43/uBx8RamZRPHu/y0+k9/5G9FwIURfnsznL4L2F0uV5LNT3BT6aaCb
 13mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=0/+bQx5JHQOuiZKynMK7gLFGYPX738NgMSopvzkwjoc=;
 b=TLe6xRhuLAHxI2jAKBFq8O3bp387dLGiY2fvRsINWgpYIKtHIZMFVGAxNxsjso5+QW
 2VbXmKvJ15YYXP3aA7MF6VHOQNlUPkQrXxd9Gr2GO3vAfFDOKEVTUK+7qTgaMJos72nb
 KH0COhr3Mp1BClpWujAqyr/kC0jSZ7CsYjtUyzZDNNwTQS5+oZA2IA2WPT35jM32fy8r
 L5KUep306F8VMwo0LEVWZp8rY0kEls8i/ubAn6cRo7nIJxGMpdhsV+e+l8v4yB2xwu4L
 80oOGqOM0s9JnGRZSUURnmsqYUnhQCr0nA+ztleOoN2Kcj7t/QWJ6u/KERy4F6+yq/kM
 PlZw==
X-Gm-Message-State: APjAAAXdX3twHqEpL19ppUJrR7ysBUrBYjcX4H0FTFAUABbheBcSsnIf
 BpjjaqjxSWo0ZbCdmbzY8Vhq+Q==
X-Google-Smtp-Source: APXvYqxvZgZab1KEfHyZn23Q8fAfHbj7kAdbsruoNK1+DZhbhLOnlkiWUa/oLodrwE6PPX4nAUw5wQ==
X-Received: by 2002:a63:1065:: with SMTP id 37mr2843407pgq.31.1573046955366;
 Wed, 06 Nov 2019 05:29:15 -0800 (PST)
Received: from localhost ([49.248.202.230])
 by smtp.gmail.com with ESMTPSA id c9sm34805754pfb.114.2019.11.06.05.29.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Nov 2019 05:29:14 -0800 (PST)
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
Subject: [PATCH 10/11] thermal: amlogic: Appease the kernel-doc deity
Date: Wed,  6 Nov 2019 18:58:26 +0530
Message-Id: <2fbace543c7a45799f29f87d9aee82f2ed1a7dbe.1573046440.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1573046440.git.amit.kucheria@linaro.org>
References: <cover.1573046440.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1573046440.git.amit.kucheria@linaro.org>
References: <cover.1573046440.git.amit.kucheria@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_052917_232948_4ED64057 
X-CRM114-Status: GOOD (  11.83  )
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
---
 drivers/thermal/amlogic_thermal.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 8a9e9bc421c68..ccb1fe18e9931 100644
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
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
