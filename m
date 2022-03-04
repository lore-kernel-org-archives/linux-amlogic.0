Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E91EC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Mar 2022 18:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjOxljibqE9K57e0o2UDGXVaKWSxldq252Fbobrws9A=; b=2AOGpxzaZFO5vF
	zZLwT92nN+ykAP1CFyVOOlpLFOx3ToidOaDfbYmeSc4bJh0gjlB3+cXPwCJfpEcoGuawDRVfoji58
	lw+wHxFW27Jo/CU9evIbycHxK5QWYJrE0Y1hxUMZ9ZfdpLvvyYknLAkCbze7CFVLmbvplh0si3V+E
	unpb2azspqXa/S0tmY8a0L+h6g/EE/Im0ypS/jI8PWmn+VkOWJ4fvBkdDstar31iuiOx9j6l3uQx3
	XgzpfSMhobFWb0ibiqDpt/oqUV0b1BuOIza3gUfFMDR4QNxegppQg3eQqwZe7dYeb5OVLL8jzFtSA
	+TzWihzeNGZuSr/A6A8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQCnw-00Beve-34; Fri, 04 Mar 2022 18:37:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQCnm-00BetC-5Y
 for linux-amlogic@lists.infradead.org; Fri, 04 Mar 2022 18:37:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id a8so19222245ejc.8
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Mar 2022 10:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=efc4guVCDN5LLszeccB5jtPV6jvB3vn6Khwu7Qxa6tM=;
 b=LZg6Jion2ZkKJ7hUMFyw4XZ+eubN222n4hmMpGu3OjwFYtLgKWGAMUUw85CQOYWYn0
 5LhbauI/dlm+oMaeSgFZKxR0WwnXFRTZZVzWFYFePGHQyywidN0AY4AlffOyfR36/KRN
 AMP/yVWp0+s/SGQjKnjJxWRjstZSnQzQt/4mp22RoI5p6I1QOnGdjiME/F5egK5DubKb
 7c4JH5/D1jtvjLTrORK5YUOYpVJmpw6j76/0M6WbgjfrdnWFY8JpTCaEeHjcXbhXuO+9
 2sy6du1YCle+8eb2IixVEkdjfebJ7bpxwp5FN5WT3AjHLOTX+6f25n4P+Dc4tDXbLYkC
 f5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=efc4guVCDN5LLszeccB5jtPV6jvB3vn6Khwu7Qxa6tM=;
 b=IwsUrV+VHOXH75Tp28xxstKkhv/Qyczbg3XX53LRUop+CYusupvtBZGwHcdtF7eeOv
 pnccmW0LjhoIR/bGV91Pqys9N9gG4yYWwisurZ5jqlg6NL5RTHgaraLGkR6QPAgqYDkk
 CkmhX797KPRU+QlOjyXK+wHZ/r+1KXMfGT/nzkUqQftWE8JTENo9Gz+cHKxrs/AX3spf
 analaZM6AJilf81eZh8G5NRsHfEc7THTLWJXWNEl55hJUkvfe/fDAQG6NM8JaW4yOEaP
 SS7VDHpAPmVZsvFil12JT8b4IRX4IAwiU79kmZx3YGclArzIY26+Nmf6xZ16Cb96qpoq
 RRzw==
X-Gm-Message-State: AOAM530gG7Ij4ahflSf1x4xRSlutYs0WA+k/TrHqZmHWo0u8jLxXwhIB
 EycgxA0qFq7X2GeHA9l0ph7EbiTVe88=
X-Google-Smtp-Source: ABdhPJyvHiAA3DD5YgAzFHTnBnsK5rKnQbyYUO8i16bupKT9nZRDm1Ej7ZhF0RGK39BBKHO4rd0aDw==
X-Received: by 2002:a17:906:8616:b0:6ce:36ab:a289 with SMTP id
 o22-20020a170906861600b006ce36aba289mr44145ejx.127.1646419036915; 
 Fri, 04 Mar 2022 10:37:16 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318?
 (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de.
 [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
 by smtp.googlemail.com with ESMTPSA id
 s14-20020aa7cb0e000000b00410bf015567sm2344863edt.92.2022.03.04.10.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 10:37:16 -0800 (PST)
Message-ID: <ffee4668-f087-66b9-a52f-d2dddf617a77@gmail.com>
Date: Fri, 4 Mar 2022 19:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 1/5] usb: host: xhci-plat: create shared hcd after having
 added main hcd
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
X-CRM114-CacheID: sfid-20220304_103718_268586_7E8F9B74 
X-CRM114-Status: GOOD (  12.93  )
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
usb_add_hcd() for the primary hcd. Therefore create the shared
hcd only after this call.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 8094da348..484c7fe3e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -294,12 +294,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
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
@@ -324,16 +318,15 @@ static int xhci_plat_probe(struct platform_device *pdev)
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
 
 	if (priv) {
 		ret = xhci_priv_plat_setup(hcd);
@@ -351,12 +344,21 @@ static int xhci_plat_probe(struct platform_device *pdev)
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
@@ -370,15 +372,15 @@ static int xhci_plat_probe(struct platform_device *pdev)
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
