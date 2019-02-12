Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933D5C282CA
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 15:16:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58AFE2075C
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 15:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jMw2G9KF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="P40er/r6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58AFE2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0SCBgp7Y7t9hv5JGvHsV5Awielk8Lv3DlFc3DANXgA=; b=jMw2G9KFRePzhh
	WrytbN+riZZLGr7uBW0RHE63u7LpZ+itAIDu5mZzK16Z0Nm+dAsaX2HeFkr106xNVCd5NnH4qW6FD
	iqU9l1uRUH0rIwydX9f9Zp3vEBYwonuA4z5eRa/NIjE7KKQRiE7zyvQRZIJrSe73hN9WfKPk9fJ0H
	G5TZ9JwUr7Td6pfdscrNhDsk/AT8jToH0+NGx1oZ+UoI8WHiOrRbUkToDX+jw9VaJhiwSetLSKpVo
	mEB4qcFcbLEMkmg6SdKpJHSkpo3Ji7qpfz9ev7GvLajHEMYoCD3ZKB8m8Q+FSSy5DJwDNzClTlECH
	Y0u5ufY699ZcyYKHNIIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtZn5-0000x9-Uf; Tue, 12 Feb 2019 15:16:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtZlV-0006bF-RL
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 15:14:40 +0000
Received: by mail-wr1-x444.google.com with SMTP id q18so3064491wrx.9
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 07:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVuAZg4+nnaFhkjixBpLWEg1hgwoQXD2AQa4Piwf/Kk=;
 b=P40er/r6P/7FvxPmzAj4Jeqy8C+ftJ64TIv40uLZkY7eLCYXjxZA+ihx+B20EsjfOe
 d8Hcj4JN0Y1mgW13FXKJdnNsPdIvnn4Xmy4ZC/0fjyc25lButzdg+S3xXRFD3ltPbJiu
 99Xf6iHMirR01tgRgRITZr/oZQuiHNipmXMt6WSf8sRCHCc+UTR4Oa6rfVvZUsEbvLwZ
 4w/3opyC0gV6FjVWVbOoPDe86j+cAY6HyoQnzOjnN0XLmO6uib9zk0HFnnM71OjbK1IZ
 kvPFijmREiVFgfQHmg+wM+P0P4acTS0OfZVyPL+tSQWpxS8SO1WlW+jkzyDF1c638jZv
 3gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVuAZg4+nnaFhkjixBpLWEg1hgwoQXD2AQa4Piwf/Kk=;
 b=Dp/qxQvqWmQ/Hzl1Vgxx0LtUXwBKA74Fb9J5ZfWdY00XCFqAl8KqOMkLpTh9bZ+lb+
 RoXvuHtqUkLMp/JRCwpmUvsc0T6gVxRkrpN8AxT1I0l7TzHhBvB0NVtnmhnoY6IW2uUp
 zsIsyYO5Fx5bWEobOuh6t43SAfTRxFWDhrWiZmMDM2HeaY1VmyjaSz2p7Pt+soM+g2b0
 jKLoSBfTKJ9uLfgaeK1CsGkahhsQ+wlg9kcVxu0Oce3NGaXLOeuXRyteQhez7D7B4jGP
 bSPUKfNKWLnxR+tMkWm6rt7jSo6wFP/ebazq5yCOnK+pKxQ2Xtam/nWX6IUpY+PiU/Qe
 l0rQ==
X-Gm-Message-State: AHQUAub7eWt81oxIUHwgVjPrmrYuBDII+K+ja0ADiMa0ADZ0h55qbupG
 n92aPkdWIgd2pIsqHIXKhleO4Q==
X-Google-Smtp-Source: AHgI3Ib8qsN5pafZuMij0Y61VcZJP+TdDFNb8ylW8TSsoKfu3Xta3Ek2WjN0TpRQVeMJggKMsWws5A==
X-Received: by 2002:adf:df08:: with SMTP id y8mr3104780wrl.23.1549984468407;
 Tue, 12 Feb 2019 07:14:28 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c1sm1589515wmb.14.2019.02.12.07.14.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Feb 2019 07:14:27 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com
Subject: [PATCH 7/8] usb: dwc2: Add Amlogic G12A DWC2 Params
Date: Tue, 12 Feb 2019 16:14:12 +0100
Message-Id: <20190212151413.24632-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190212151413.24632-1-narmstrong@baylibre.com>
References: <20190212151413.24632-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_071430_503599_901CDEF5 
X-CRM114-Status: GOOD (  10.71  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchs sets the params for the DWC2 Controller found in the
Amlogic G12A SoC family.

It mainly sets the settings reported incorrect by the driver,
leaving the remaining detected automatically by the driver and
provided by the DT node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc2/params.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 24ff5f21cb25..442113246cba 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -121,6 +121,16 @@ static void dwc2_set_amlogic_params(struct dwc2_hsotg *hsotg)
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
 }
 
+static void dwc2_set_amlogic_g12a_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->lpm = false;
+	p->lpm_clock_gating = false;
+	p->besl = false;
+	p->hird_threshold_en = false;
+}
+
 static void dwc2_set_amcc_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
@@ -167,6 +177,8 @@ const struct of_device_id dwc2_of_match_table[] = {
 	  .data = dwc2_set_amlogic_params },
 	{ .compatible = "amlogic,meson-gxbb-usb",
 	  .data = dwc2_set_amlogic_params },
+	{ .compatible = "amlogic,meson-g12a-usb",
+	  .data = dwc2_set_amlogic_g12a_params },
 	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "st,stm32f4x9-fsotg",
 	  .data = dwc2_set_stm32f4x9_fsotg_params },
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
