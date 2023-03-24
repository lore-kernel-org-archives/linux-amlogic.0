Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D66C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 02:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bw6A8RaWDrEXQ3Oc4UGCwMLVmHurF6FUAftzfmXeFAc=; b=N8A
	8S/FLLaFOO68waScjMXqtczR2gOHqWSp2xP2EoVq/oiNUxoHAtGVSg2+HoWo1xOQ1ojBv26N1ilje
	nckScQcApavPSaagE/cMysYqAxyZ/M17HicVlrFTzXjcMicU2m4z6awU/HcF5Bi1qm5OMTnvRqbwz
	Sy7mJd5zpEZevkYjJGyt7kBHbmkFje1IQf3T9GmsQSBwmJGytVYFtvqGD8T5D+dpvTAm9tUjFPiiO
	8T1SmHKwQlaqcxXY5MPQqDa596jWW+DVAEilEBc8VXlUqfB+DzxSDLYyKYJT7VdWWOjuJ3pbcn10/
	mPdvJpvwuCxanU3xWeYr/O5t+Qcg+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfX2X-003Ndd-04;
	Fri, 24 Mar 2023 02:20:25 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfX2U-003Ncg-1e
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Mar 2023 02:20:23 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PjQsZ3qSsz8R040;
	Fri, 24 Mar 2023 10:20:18 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 32O2K9qP002019;
	Fri, 24 Mar 2023 10:20:10 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 24 Mar 2023 10:20:11 +0800 (CST)
Date: Fri, 24 Mar 2023 10:20:11 +0800 (CST)
X-Zmail-TransId: 2afa641d08db27e-acd4e
X-Mailer: Zmail v1.0
Message-ID: <202303241020110014476@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <glaroque@baylibre.com>
Cc: <rafael@kernel.org>, <daniel.lezcano@linaro.org>, <amitk@kernel.org>,
        <rui.zhang@intel.com>, <linux-pm@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSB0aGVybWFsOiBhbWxvZ2ljOiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
X-MAIL: mse-fl2.zte.com.cn 32O2K9qP002019
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID 641D08E2.000 by FangMail milter!
X-FangMail-Envelope: 1679624418/4PjQsZ3qSsz8R040/641D08E2.000/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 641D08E2.000/4PjQsZ3qSsz8R040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_192022_706782_0C1AE8F9 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/thermal/amlogic_thermal.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 4bf36386462f..3abc2dcef408 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -262,11 +262,8 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 		return PTR_ERR(pdata->regmap);

 	pdata->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(pdata->clk)) {
-		if (PTR_ERR(pdata->clk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get clock\n");
-		return PTR_ERR(pdata->clk);
-	}
+	if (IS_ERR(pdata->clk))
+		return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n");

 	pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
 		(pdev->dev.of_node, "amlogic,ao-secure");
-- 
2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
