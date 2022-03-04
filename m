Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4897AC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Mar 2022 18:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnV9Dk/5HNcs1214Vy8R1Jr306YAERZ1s8Wi///tW9Q=; b=e4WgUF74qnufg1
	SWtTdjMu/mmgNaRCWlbnhX1975zXjrpJZVMonNVs6sjaqbrIpZUPAXypUcOy9chbgbr++zNbV6Aoq
	Awp/9zsuoBEj2AN1aKBmOdxHna8zUk9A6n6DzQFgQImDqN23oAaaFwJmx7W1Romtb9WGAbYL6dL9F
	Mxzvjkdxk3N+o028mL4nxTHBjCQ/U+Lyavx6K2aLW/fJEI0aezS7OkRFMo9WsKFT6nbDmYutLTqFs
	glv0PCDR+NfGoCZaQJk1J1VH3ItttbTVfl4nyDgBDUGocXF6IRWnomuT43Qyy9tlfU2wETdUEsJpC
	eeWo05sWK9WzkZYvTXnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQCny-00Bewf-L2; Fri, 04 Mar 2022 18:37:30 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQCnr-00BeuI-B0
 for linux-amlogic@lists.infradead.org; Fri, 04 Mar 2022 18:37:24 +0000
Received: by mail-ej1-x62a.google.com with SMTP id yy13so10388642ejb.2
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Mar 2022 10:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=09N1QN49YKxRhEIn1LjCDFBtShHoPdeuFT9UB97L/Cw=;
 b=Dq+QfdPMGLA6HE1ym+z7hDcxBF6iwrTk2XShYDu2DGXGBdaGhKmeZGOJ88ej7U92lP
 zRXDk1UGs1qTDhhf4Q65bCVp2YSu76UGjiCbcVpL9CJHjrLLp4LdqIQDYVfErtGUp7Dx
 769BVNy/SzeTdpCaeRYdfxddWLc1WaNhwVAIffV6Zqrf0JUNWhP+75ug9YABSRPsVHWv
 sp2UKAhaKDOoJRfYzEHf9lTxOXDeFsj3FyLce0z/F/yj3LFCsHjpPpu4ycyNKfda/zl/
 5dD8h1ofH/q7fq5wxzyBrheSQPAMWeALb2unU3CowR4RcSb5UyhwLfL43MEv40B9ZlEL
 ocqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=09N1QN49YKxRhEIn1LjCDFBtShHoPdeuFT9UB97L/Cw=;
 b=StuvhuLIvA+44F6Wokf18+WaPS0UPOY5i+KTT94plMlHzOLKGvBSdkJxBKj2jT0csC
 KTTBbb7OX5rZaiN2pYEpkREOpotqaY9knRGkyz3Mygi+fvg6DjijMJy44NrBkTePMtR9
 TwiOalz5H3TLQS3u3rrXSCe5U5ZhCoVdo3XtAqT6uOwISMm8gI2L6BHzX4CO1qtj/Fq/
 md3aYqTkMKop25sXkm4n5oQTRLtVDV8V2/296bEZHzDJivFguW1sG886RrSwZsUEE7t2
 eUd7yAnfQ1gKaniq9agMVpIn6c+FVl0n7/5eS9en6lYQVM2B8Ed37xx0OrcI/eoB4dg/
 Gq3Q==
X-Gm-Message-State: AOAM530If3qW5B7t35f/dTiKPvpZ4JUxcMKtItf3DxwFY9nMlZyb5oHy
 y0ZdSq3elO/43/VAyhMSHyw=
X-Google-Smtp-Source: ABdhPJzeJcGwu1DKue/A6+wQ2Hnx/O0WYJ3eZscuyHECzbbA79iTk3Y/ds1fUUSYaBfzJJAf6UzaKg==
X-Received: by 2002:a17:906:aed4:b0:6da:aa56:c923 with SMTP id
 me20-20020a170906aed400b006daaa56c923mr80865ejb.148.1646419041874; 
 Fri, 04 Mar 2022 10:37:21 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318?
 (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de.
 [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
 by smtp.googlemail.com with ESMTPSA id
 f6-20020a50fc86000000b0040f614e0906sm2383081edq.46.2022.03.04.10.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 10:37:21 -0800 (PST)
Message-ID: <854f54a4-44bc-2a54-89e9-ae2486068d35@gmail.com>
Date: Fri, 4 Mar 2022 19:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 4/5] usb: host: xhci-plat: prepare operation w/o shared hcd
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
In-Reply-To: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_103723_422893_0F9E3789 
X-CRM114-Status: GOOD (  12.49  )
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

This patch prepares xhci-plat for the following scenario
- If either of the root hubs has no ports, then omit shared hcd
- Main hcd can be USB3 if there are no USB2 ports

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 484c7fe3e..0177d8564 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -191,7 +191,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct device		*sysdev, *tmpdev;
 	struct xhci_hcd		*xhci;
 	struct resource         *res;
-	struct usb_hcd		*hcd;
+	struct usb_hcd		*hcd, *usb3_hcd;
 	int			ret;
 	int			irq;
 	struct xhci_plat_priv	*priv = NULL;
@@ -344,21 +344,26 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_usb_phy;
 
-	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-			dev_name(&pdev->dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto dealloc_usb2_hcd;
-	}
+	if (xhci->needs_shared_hcd) {
+		xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
+						    dev_name(&pdev->dev), hcd);
+		if (!xhci->shared_hcd) {
+			ret = -ENOMEM;
+			goto dealloc_usb2_hcd;
+		}
 
-	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+		xhci->shared_hcd->tpl_support = hcd->tpl_support;
+	}
 
-	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
-		xhci->shared_hcd->can_do_streams = 1;
+	usb3_hcd = xhci_get_usb3_hcd(xhci);
+	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4)
+		usb3_hcd->can_do_streams = 1;
 
-	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
-	if (ret)
-		goto put_usb3_hcd;
+	if (xhci->shared_hcd) {
+		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
+		if (ret)
+			goto put_usb3_hcd;
+	}
 
 	device_enable_async_suspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
