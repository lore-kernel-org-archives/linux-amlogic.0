Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1D4C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 09:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C590F60F48
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 09:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C590F60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5gOYsqqT532vSeSIup+ixS8AXv4PGnCMKjNjrpYGxs=; b=HV8mVjj9T84qnU
	Fu9vIuMeRx5oRrmfV5OPLXt3yIlHgH2S3FIsvm8bKSmWEtpnNfJ1Q4yaubqi52degEYdH8/rHmdaR
	K5F7KRaEoNITclvST8q4uTDIpvcXjmHkby2vmHnD4opR3LNLxVXKXFGwmCHDARu5wapGPp2DGNWxm
	dewirRSpPMawQ/d0wZeLxnOCEvcrsgfd5103wYiDZ5ITQMlBvcAFVkEInhfhGTAsy9Dj3o4m26pcl
	gYGdsHmaYu7Gau0zeYtyVpm0nI3ddEpq3UEhmXKpDA/bpxR3ymEE9aarZufmmTBIAxVa10f5MF4qX
	Ptc0sqcAh4dqzktCH5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSFFC-0011vT-SD; Mon, 20 Sep 2021 09:05:46 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSFEy-0011sL-Ho
 for linux-amlogic@lists.infradead.org; Mon, 20 Sep 2021 09:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=k1; bh=FMuJqDCHzK4uHq
 kYECDzhFJ9tjA5iJrkLQtxJNEYXpE=; b=M3AVwcQtfiGfOsawZxa6RwHbrXn9r2
 iAUDVtMNqHHXFfUJtfGRkAMd0UzYu6PDSXzvERcwTiqISvjajEWY8jyRw7yHd13b
 QNEmAXzxn7xErxMPYbimcsnxv8I8h8srBTTqHHiL5iuFNdDkBevr5BL9TeUf/Ju8
 tNEKcsR3TkWmI=
Received: (qmail 2412611 invoked from network); 20 Sep 2021 11:05:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 20 Sep 2021 11:05:24 +0200
X-UD-Smtp-Session: l3s3148p1@FeDQlGnMCosgAwDPXwlxANIWpbLKE1Uh
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 2/9] firmware: meson: simplify getting .driver_data
Date: Mon, 20 Sep 2021 11:05:14 +0200
Message-Id: <20210920090522.23784-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
References: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_020532_900038_3E18A0D6 
X-CRM114-Status: UNSURE (   8.03  )
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

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/firmware/meson/meson_sm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 77aa5c6398aa..714016e3aab3 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -240,12 +240,11 @@ EXPORT_SYMBOL_GPL(meson_sm_get);
 static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	struct meson_sm_firmware *fw;
 	uint8_t *id_buf;
 	int ret;
 
-	fw = platform_get_drvdata(pdev);
+	fw = dev_get_drvdata(dev);
 
 	id_buf = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
 	if (!id_buf)
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
