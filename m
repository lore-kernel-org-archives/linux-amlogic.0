Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F84C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Mar 2022 22:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtPrkWR2l00O/O6R186hXqVFee1gP7uA/K+VAwVml/g=; b=oLN/kRBfZbi6dB
	A/JSnq1iwVNXc99KVtvytQExgolnQpBSz8Qw+ZC2/J4ujX2dux7lGYcrRQPth30ZuajVB4jutvsUh
	iMPwEC0SOlQMBfak0y+4/FxuVEKcqeagp59HCpQjDdX7NGAE4njHHJbiKbu2KUiBQqFcfjgGoeeIC
	FYqW223uCFkK5AKG7yP5WYbwztaTCiDt5WMNBOG24fcG6eq80QaRLPWXono9tZ9Uhtzv4OA4r70h0
	aNkhfuMzGTRqTxBIkITH/AFJgaHjJSdm2/u6FaPUgICY6jUajvf/J8wz60zz7IWHwSeqgPXl07Jzk
	RQfCtyWEHR+CDCKjMHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUbsm-00EPig-8n; Wed, 16 Mar 2022 22:12:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUbsi-00EPhM-Ug
 for linux-amlogic@lists.infradead.org; Wed, 16 Mar 2022 22:12:38 +0000
Received: by mail-ej1-x635.google.com with SMTP id hw13so6983433ejc.9
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Mar 2022 15:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=d84l6wYcxRO0cEaO9IcZrp8h8jURQZcOK4qYQT4QMuA=;
 b=o7eEzQ+ASLlkjYaFVSPfsXli4290UKATThIPg/XT58iIlalM/ED/pWH2FP3/21sxDC
 0sKZtVS7ZqBIzNz2BY0YsCyP/M5L9S0/gEAR286IuOlWX7GA3X2f3rCvXEG9pMXaLza7
 VbCQPCsI4Cc2vHlkpwIjpRAgyy7i8V3ECLClT1bGmxAmgVbku1uhxZy/9AxnpvcHoqxc
 87mt/iaus9NyY3g+DW63xRR9oSRv9QiYYxk3y/2Mzoy903Djep8++gp6URP1JeP8VXHn
 RryY1TWIsjF9qbHjn7yjimFDaHShQOSSF6nWqMVnHgh0GHiZKzpD7VNkDpt0Lv7OL/Wx
 UqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=d84l6wYcxRO0cEaO9IcZrp8h8jURQZcOK4qYQT4QMuA=;
 b=0gSP9xSPAYGycE/i6k8MeYWER83260LsJ2QrZcuX5V75N3bq5bO60HNyY/IPBlbiLI
 8zy2JgxGoj3hd1RDZvyfuCtsjymJ+GTpYFfCATvG0lg6an0d4ToIsitpOrYWjUNs1XuZ
 k0P9JWb+MepDdkVNqg1Te1+Hsjv5VDvTy0AFDm1bcU5cGm+chrgc7y9ZeePqOHgA562y
 qHFFXN0xCZFB6dspiBBKJjUNni7djn8GUWHNw5dtcfSa9bYcNDxnTR8eVczZdov72+/S
 b4Psni40EbQ9xf8vvp6dU1jsb5rZ6lSEIjjs3zBnb0X5G7fP/jwOcX0cCOnpfFAiuuoF
 VvJw==
X-Gm-Message-State: AOAM533KqX54uq3xW0BjD415E6pq95AsN6wHuKDubzIEgvqa8ZVLhI2f
 s7nMsOVWiQ15feH/Qdz1y5E=
X-Google-Smtp-Source: ABdhPJzy3/y1+m2wuz92O7wzDv8zztpXffG3dqpbRODppWqqPJBVfnzd79rWEYVEEKorP5Tz9n85vQ==
X-Received: by 2002:a17:907:6091:b0:6db:ef36:f0ff with SMTP id
 ht17-20020a170907609100b006dbef36f0ffmr1737966ejc.505.1647468755639; 
 Wed, 16 Mar 2022 15:12:35 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66?
 (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de.
 [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
 by smtp.googlemail.com with ESMTPSA id
 si13-20020a170906cecd00b006cded0c5ee2sm1478461ejb.61.2022.03.16.15.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 15:12:35 -0700 (PDT)
Message-ID: <5a364ad0-fb48-5a6b-c04f-479afbdca532@gmail.com>
Date: Wed, 16 Mar 2022 23:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 3/5] usb: host: xhci-plat: create shared hcd after having
 added main hcd
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
In-Reply-To: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_151237_025711_F135071D 
X-CRM114-Status: GOOD (  13.02  )
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

This patch is in preparation of an extension where in case of a
root hub with no ports no shared hcd will be created.
Whether one of the root hubs has no ports we figure our in
usb_add_hcd() for the primary hcd. Therefore create the shared hcd
only after this call.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 649ffd861..5d752b384 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -283,12 +283,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	device_set_wakeup_capable(&pdev->dev, true);
 
 	xhci->main_hcd = hcd;
-	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-			dev_name(&pdev->dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto disable_clk;
-	}
 
 	/* imod_interval is the interrupt moderation value in nanoseconds. */
 	xhci->imod_interval = 40000;
@@ -313,16 +307,16 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (IS_ERR(hcd->usb_phy)) {
 		ret = PTR_ERR(hcd->usb_phy);
 		if (ret == -EPROBE_DEFER)
-			goto put_usb3_hcd;
+			goto disable_clk;
 		hcd->usb_phy = NULL;
 	} else {
 		ret = usb_phy_init(hcd->usb_phy);
 		if (ret)
-			goto put_usb3_hcd;
+			goto disable_clk;
 	}
 
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
-	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+
 	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
 		hcd->skip_phy_initialization = 1;
 
@@ -333,12 +327,21 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_usb_phy;
 
+	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
+			dev_name(&pdev->dev), hcd);
+	if (!xhci->shared_hcd) {
+		ret = -ENOMEM;
+		goto dealloc_usb2_hcd;
+	}
+
+	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+
 	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
 		xhci->shared_hcd->can_do_streams = 1;
 
 	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
 	if (ret)
-		goto dealloc_usb2_hcd;
+		goto put_usb3_hcd;
 
 	device_enable_async_suspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
@@ -352,15 +355,15 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	return 0;
 
 
+put_usb3_hcd:
+	usb_put_hcd(xhci->shared_hcd);
+
 dealloc_usb2_hcd:
 	usb_remove_hcd(hcd);
 
 disable_usb_phy:
 	usb_phy_shutdown(hcd->usb_phy);
 
-put_usb3_hcd:
-	usb_put_hcd(xhci->shared_hcd);
-
 disable_clk:
 	clk_disable_unprepare(xhci->clk);
 
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
