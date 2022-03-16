Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08225C4321E
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Mar 2022 22:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cj/r0uGbMjcZy7Ac90XyKa9pQgR7iICxwjaXMVmaY8=; b=IuW6T2c6CY5iTB
	ILvGPvleucFHxTfkTTmxNWI4Tlcl5+GbC0hI3tS6J3/9mDHumLMhNntNO6x5D8IVzRynxoJqpLd8S
	YlUbnkxGjMdqCXugcefJ3vJWojprJ9jj7c932I6ZGezsDdzfU1Fkv+FQZiKCUGps5BsFj8ziK6yN2
	wRRQARjYc/FLrVE1oYGbbM91wG/YFAlGSO1U1KcLuCq9xMhqcU4q04b+m6qSZIISYP18Yya+9oR3g
	CJoue3nMFSoWyDnhqHsF3MoJeq40O7itZssMZvkXVwOJd0+uV+8nVWtzL4pbXHQc76/tjqXqI2Se7
	Et0JS4/psQZKTZCz+vWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUbsn-00EPj3-0u; Wed, 16 Mar 2022 22:12:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUbsk-00EPhf-Hz
 for linux-amlogic@lists.infradead.org; Wed, 16 Mar 2022 22:12:39 +0000
Received: by mail-ed1-x52a.google.com with SMTP id b24so4408354edu.10
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Mar 2022 15:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=Mbk9eDgtV28j0TWUuMi3KlCoJjoq5ox4im4qxu+j5Ck=;
 b=SmhRYRQhoXZPq4H8FSWuHTlBLFyJmoQ8H9PxDXvVqGz+Myc/4Kx9o0TKTuo1gXBIgl
 8lazzj1K2J7wvX/iEG3pOjANpIdSfgP5YCKS8nnCETMFlTFdpl0yF1M/64fl4tc+QR/R
 xszvesuLHTL1GJ7qJJZ0e2QV+W+C+Aseaza7EGvktqdlVs/nR0R7rQ0YwfL1HHIHElSf
 8OjHRgzHqND5IbDVDoT7YtTFW5FYTNy+P+/pomkyAPQbRegIVij728nORfjyVUooUZQY
 kSCry2bhKdTt+bkMl1liOGajsKjWctE0+Fyr4Y6RfABK01fcxqYnduOBON3/2DHl6Swt
 CocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Mbk9eDgtV28j0TWUuMi3KlCoJjoq5ox4im4qxu+j5Ck=;
 b=Gb4QutecS9oVcQJHFeQHIzEi0qx7+7jAK7GrMFaO7epZ1hmdgVyfjbvCycCmmgJzgV
 hMMQwgFeKBvCtgEgIvmCbkSVuPmAs6LCUBeTeErMKdfwW65Ms+JNE5X3ucSc409P0eFb
 3Uwc8Im5UbxzEnqgccbSvMaJJ0Up9Pte34hPji4H1pVWUcUq/z3Ey+CrFdw5fUDuFE4U
 L+AaMcInEvPow6yQSZsP8khNvHhaTjK4ryPVIBDL26M4HqlBf/dVL2Sirh3/UvxLp5lA
 H0faEKKKdY9HPOs3w47Vrb1XjEInxYfnN5kKI4x/N13FkXxBvGNuxLAvFlmhK2aH8r6I
 TdHg==
X-Gm-Message-State: AOAM531z40fYvsXfw7w3gE8Enewq6Oer+TBW7bIBnF8MEe0yk270spc6
 CGCyCr82Ibnc6xJf80+ruy8=
X-Google-Smtp-Source: ABdhPJyOYTPz8Lm6U+5GQXq3v/ePt7jRdvqzUwNvaWYE2Emf9uwGbx2vo9KvFKvzAOWYR5pDdSLSwA==
X-Received: by 2002:a05:6402:50cf:b0:418:ee57:ed9 with SMTP id
 h15-20020a05640250cf00b00418ee570ed9mr1494329edb.37.1647468756890; 
 Wed, 16 Mar 2022 15:12:36 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66?
 (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de.
 [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
 by smtp.googlemail.com with ESMTPSA id
 ec21-20020a170906b6d500b006d170a3444csm1424902ejb.164.2022.03.16.15.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 15:12:36 -0700 (PDT)
Message-ID: <506113fe-5bd9-bdd0-7858-2b702ca32d53@gmail.com>
Date: Wed, 16 Mar 2022 23:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 4/5] usb: host: xhci-plat: prepare operation w/o shared hcd
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
X-CRM114-CacheID: sfid-20220316_151238_631276_CEF9FF6A 
X-CRM114-Status: GOOD (  12.73  )
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
index 5d752b384..c512ec214 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -180,7 +180,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct device		*sysdev, *tmpdev;
 	struct xhci_hcd		*xhci;
 	struct resource         *res;
-	struct usb_hcd		*hcd;
+	struct usb_hcd		*hcd, *usb3_hcd;
 	int			ret;
 	int			irq;
 	struct xhci_plat_priv	*priv = NULL;
@@ -327,21 +327,26 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_usb_phy;
 
-	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-			dev_name(&pdev->dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto dealloc_usb2_hcd;
-	}
+	if (!xhci_has_one_roothub(xhci)) {
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
