Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC250C47409
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F7E2080D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZyilzT6X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HG2T15sh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92F7E2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+WfsSJW8p4xLffox9I7Jiq59MwGiGabtx5TaQ+DAjA=; b=ZyilzT6XxAL445
	45ftgLoR0Bbv0kTKqPUUCywNO/eHmtBArw2SlMk788D8LUAopg6ZrptuOWG6JanzaqclH/e9f7dgS
	dt11rvwUI/ZTk8Y0VjKKEd9KSV1xcpEjE81BVy07N9Ok0S157tpYUus304O6soNUq/jtdjBuuqOgy
	zlltCi9/VoKmnlx5dDIRy8MRI7zpuET0BB/NxaOBbHRmPN0QP+CEduZPTWksaEbgDXBcuddg1QHKx
	hReqU1aV9in5Q4TrDSkzxdEFDhWCIS2FjQlVUQzxBTLipHGFpMyCHbae1s4fE/QmSoxUlXhm5aFXE
	G+/w18dWzeVYkVTgU+Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieKBU-0001w8-Ha; Mon, 09 Dec 2019 14:38:48 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieKBP-0001rg-FR
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 14:38:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id a15so16434054wrf.9
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 06:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XVxY3z3jO25K+7clgiD3fKNA3bHm5aN4+J3uKucqrZ8=;
 b=HG2T15shJSJ54y7RsQuRt9mrYK5WEedIS6rRlx18E8uC8rXb1Y3k2h3iOVkCCumQiP
 /q/YUh2aJdEeJ7+iA9NMBNpe2riWD1AE9yPIAT6IzvopGKZ47zh3lmHmqaG4/FIeYNYS
 VUPGF+Ts1Mb5nkM21YxRdIRUX5Ws4I2q1f+GNz+SGpNhJLTVuaSY8M6CEk8s6+bJtzLU
 I9XIvMVEtyjahCd2WCrRz3mrF399h2tnImT/5d1OYU7FkkQawfI/VSHwOnnEbmVLza7B
 D1vORy1r1KY866KxIb2HccXS/5TfQfFcLDJ4iWGwFW9IOHmBXz2Hb+pbVhlmdZmJcMWY
 b0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XVxY3z3jO25K+7clgiD3fKNA3bHm5aN4+J3uKucqrZ8=;
 b=GC+vgfV2YO+ToAnoWk/4sZqYwQqldtTS8Ff+CQIM4HzVslRVOG3i+M6yJvc0NuAg8Y
 8HXkErhV0kOaQDYcKHqFDrlcNsjYV+DI5RqpAJnF9PNakcFddpe4c1AR86JKBNH+EJzD
 vtOQMEP7DRY8MnKVH8NTnFYVrF2dpceiuXBmfCJzuvhmuxVH5YNkyPH0JiNhjdiPjnF/
 3OnOP2MHh8H7mLnglTNQbaf+EcImARIpQSDYky76IbN3g3uK5ileipPbj2TCaun4GhUi
 Pb0SbCHTuXpfN94IO/OT2R4gN1MwIqQPJUgiOLpcUC+pccqDYDa1BDOSy7kg0Geov89E
 PJNw==
X-Gm-Message-State: APjAAAUmLfXk4bZP++hzN1yNQgVxYsD1IlA/fq4bKyRMoFFMZGogv9tD
 DciCb8wl/nggeKeZZm1hfoYiGg==
X-Google-Smtp-Source: APXvYqyIzQHuKh60zkXMrtB1gWGpysiz3Lj3Ozcq7LikDUwc6+3D9PG3cIvaVB6sRShCYkNXyhoVpA==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr2597194wrs.92.1575902322035;
 Mon, 09 Dec 2019 06:38:42 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a1sm1904165wrr.80.2019.12.09.06.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 06:38:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/4] arm64: defconfig: enable FUSB302 as module
Date: Mon,  9 Dec 2019 15:38:34 +0100
Message-Id: <20191209143836.825990-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209143836.825990-1-jbrunet@baylibre.com>
References: <20191209143836.825990-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_063843_532938_A00A29E2 
X-CRM114-Status: UNSURE (   7.24  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the type C fusb302 driver as module

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6a83ba2aea3e..33147f54efe6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -603,6 +603,8 @@ CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_RENESAS_USB3=m
 CONFIG_TYPEC=m
+CONFIG_TYPEC_TCPM=m
+CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_HD3SS3220=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
