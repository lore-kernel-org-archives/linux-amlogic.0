Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAA3C2BA19
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:17:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9391C20B1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HSYDxpYk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/Y02tiK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9391C20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hMyUbzu2GCzMgMmRqLct3dJEQuJbVHOELbINQEknBq4=; b=HSYDxpYkjzyMpG87zyb8oQIAL2
	zQBKWTwCRSo8hUdCu7Dfx0N3PuBna18SuNTe5C+7Ki0CZTceoFwTD4Jvh8b+QhDBlqsNB35D7tAGD
	xU1CI7hXTbiTcDStHscQAOKBDY2qPbIiO7oLyQasvvtf3M+XMjxiPgGKZgdoudCwY9KMBkWOYQmS/
	PFbjpKRG4sQB5ggwj5DWvcG5Yv8sp9nFLB1jQTlc7RDluncyGuvnIh2S5GnCGGRpSRDCKPJz/LmiE
	Ojje1+98wC9VPVhSmy/W1sqHeFiNCJ1aVwsoI4oklRoVadgosVOP10L3fhKu92apSGrvgkK3i7gcN
	mBc+uhyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQo5m-0007EM-QM; Tue, 21 Apr 2020 08:17:18 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQo5g-00078I-99
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 08:17:13 +0000
Received: by mail-lj1-x241.google.com with SMTP id f18so6992849lja.13
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ialMFur7X9DPC+g1oI8+Dh4E5wgzi1y2UDjvZas+VmA=;
 b=i/Y02tiK0l6yFkhBoRWAQ8ngsHcCX2xSBJfxJBCKCAqshNvz+LHCKRSQOeBQSscDkp
 p2Ar6wq5imowYLqGgI3f3VLhVycp2WNHEFZOMea7PNS/6XwegC5mrJN5tIljf0EAoRvV
 bfipIepYuz9k8vEJSb+R/Xj5YVbE/W5ILgTUZhX2/rOJX/9W34BT2S3gN8X2Tka03bEM
 8e18akw6yCponIlt2G5gF7mRNBzbS46aAJqaqXUj6Osgp+CZwERfcBEXYvyozVwEcVN0
 45bW6IzA1SHguZHrUKsEyNZXu3ORrGCXWoAO5ofRxFV/d6hTkOrdKeQcmLBVIpRNXgBh
 XkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ialMFur7X9DPC+g1oI8+Dh4E5wgzi1y2UDjvZas+VmA=;
 b=YbfMMo1a1ZgCuAGHXZE7/MDF9BfimBbvQ6B3Jl6f2/lgPyNHV6d5Qic9QIioa040Jg
 6GXetRIbKIXAnCqSfj+NXbWEYxFZQexvCs00VAz9xTqXn0Yqb8m4eqVlAroSDHio/MOA
 i7eQKw2+ZOPljzcOErx6J3ISxS543crKw+PLxRItr49CZ4RxwOrnPj7O1t5VDSjlLbtX
 AoQqhlLFGZVO0F+BJhza+GsEpUeCBFVBUy8BmE0nz9SiIXSQ4UGBGAwpuPb8qARaLL15
 6i1eUVJyLwTcHb0T1Z9Mg5Nyi7eT4vBxnW+19jbRkEetVsPWy4pUM2+oGnk1DnvgAjM+
 vVew==
X-Gm-Message-State: AGi0Pua6th1mhXwKov3IBxzWp5KtwNKibL1WNx0qlWoO8w/jR3MHvbeL
 L/DqLM+IkS18/UEwOqlmr/s=
X-Google-Smtp-Source: APiQypIznA9Jxu+DKX+UuSMPdggfsfkTowEcFTLr3ooT4JKu6jZ6T+ctpSYQn4/3cR9ftldZA0SfKg==
X-Received: by 2002:a2e:800f:: with SMTP id j15mr10309809ljg.27.1587457030910; 
 Tue, 21 Apr 2020 01:17:10 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j13sm1472756lfb.19.2020.04.21.01.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:17:10 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Bluetooth: hci_qca: allow max-speed to be set for QCA9377
 devices
Date: Tue, 21 Apr 2020 08:16:56 +0000
Message-Id: <20200421081656.9067-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421081656.9067-1-christianshewitt@gmail.com>
References: <20200421081656.9067-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_011712_340696_72E57D63 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Move the read of max-speed from device-tree out of the qca_is_wcn399x
if block so oper_speed can be set for QCA9377 devices as well.

Suggested-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/bluetooth/hci_qca.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 6f0350fbdcd6..b63ec7a0ac9e 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -596,10 +596,12 @@ static int qca_open(struct hci_uart *hu)
 
 	if (hu->serdev) {
 		qcadev = serdev_device_get_drvdata(hu->serdev);
-		if (qca_is_wcn399x(qcadev->btsoc_type)) {
+
+		if (qca_is_wcn399x(qcadev->btsoc_type))
 			hu->init_speed = qcadev->init_speed;
+
+		if (qcadev->oper_speed)
 			hu->oper_speed = qcadev->oper_speed;
-		}
 	}
 
 	timer_setup(&qca->wake_retrans_timer, hci_ibs_wake_retrans_timeout, 0);
@@ -1865,6 +1867,11 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	serdev_device_set_drvdata(serdev, qcadev);
 	device_property_read_string(&serdev->dev, "firmware-name",
 					 &qcadev->firmware_name);
+	device_property_read_u32(&serdev->dev, "max-speed",
+				 &qcadev->oper_speed);
+	if (!qcadev->oper_speed)
+		BT_DBG("UART will pick default operating speed");
+
 	if (data && qca_is_wcn399x(data->soc_type)) {
 		qcadev->btsoc_type = data->soc_type;
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
@@ -1889,11 +1896,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->susclk);
 		}
 
-		device_property_read_u32(&serdev->dev, "max-speed",
-					 &qcadev->oper_speed);
-		if (!qcadev->oper_speed)
-			BT_DBG("UART will pick default operating speed");
-
 		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 		if (err) {
 			BT_ERR("wcn3990 serdev registration failed");
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
