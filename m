Return-Path: <SRS0=FRsS=6H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFC8C55185
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2020 01:35:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9408020787
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2020 01:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p62EAR7h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbXkS909"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9408020787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gb93+W5t+ATKT6Pb9L7sjggxnt2+OT3eAkYafk92qWg=; b=p62EAR7hQQ1iXcVLOqYeDAMOdO
	axxEluzKBI4+BkzMLZfIGCSQoyrO2ClYhGYcDYUKp/FlP4PBxoEvrUJUN4I+rFJlhHPQNH5I7nehE
	Ba/jyTXmJ8NdPRGtyqjoN6fU7rCLbt0lS5dNdO7b+5R3dChQ7ssK2u2Ez+tQDjETGnoqIg6QV7Y1c
	hmuLStYP7eCxWDyEtVbe1Li/UdlqwiNatNoVuGA32GZRsfMqm0sLoTZ2ta97pJg+B3GOHHSQynpEV
	X/nC7RcJkK19G3VBihviXGirMIIMXL+xzq4s4J/9Ad+l7mP7sMyxegDnqKjhapMuen/iBX0EW+uKI
	YyKRnUoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRQlw-0001Z2-Eb; Thu, 23 Apr 2020 01:35:24 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRQlK-0007AZ-Hi
 for linux-amlogic@lists.infradead.org; Thu, 23 Apr 2020 01:34:49 +0000
Received: by mail-lj1-x242.google.com with SMTP id n6so4465892ljg.12
 for <linux-amlogic@lists.infradead.org>; Wed, 22 Apr 2020 18:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G/DeIfTtEEjBtBecf4XcPLs4Cf8wCiNe7uM2NSD391A=;
 b=cbXkS909FJhTEQvWCuDzuQzaA0NsuulPznjrsSh2fseMwmYC9aqjcVnQQRHBxMTVhI
 9umfMk5Oioqb9J/NQvDFcGkpkb8LwVeE7Q8ZqQhgdHdges9SF+H48RBNlFto9zTe9nPt
 rX19Rjzhz8h9r6GH9DayRPMprtydudX2lnKvHOH8KqTOO+irilhzeEqvA1JqmZ/yTyuZ
 IThNyyZF/Q4IqP/hZ0+DAibGHUkJw8huJzTCOsd0/BBKaqB1YRVlb7y9po5ZIQqlIU9P
 ZPJB46QxH2eLJjlZIDH2BFMuGl23H/C3Tc88PAg5vAbAGdAhSqFJzvdenRrz8bffHAcT
 f13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G/DeIfTtEEjBtBecf4XcPLs4Cf8wCiNe7uM2NSD391A=;
 b=lX2pwzRmrZUhLB3qRd0d7nNaCMzuGmGFlfIgZdAHQKBktRNNCsqgxQyHgcLAU3jMAD
 q3G2yx8/SVbjlfXujWxmMUDzuRES0YF2iC3GnvqWIkgj6DTrIxM3kI3/MH1cxDFlZooT
 /+NiOeEpwVurXRmqK9ysDWLRA2841Kh+7pQbjNnj9KohZqM4mURTYCKMtJcee74aJ0Rl
 yGOA1bRg32OhW/d6AAe1iq8GLmQEOF++hiMZMzDBR9LCAEc4N/77/1d7agVitZ66IWGW
 +rQmIDjiLi+7t7v1e9tTDyUI/GVINEhCLE4SwA4xw97Y/rtMu7mOfGtjsUn8UK+wzPVx
 a0PQ==
X-Gm-Message-State: AGi0PuYCgw1/BeOW7ClY26gHRBDbJJhwqvIKGTrNEnjwzWRUSgZag4S4
 x4gqfXrSCLR7eivDg0XkICg=
X-Google-Smtp-Source: APiQypLEtOmKh2USJECy+faxyw6KIO3K2LuNbi6t5dbfIDcM6sEn5dFCwSCsnaBlpW8RcqdtOAUciA==
X-Received: by 2002:a05:651c:119a:: with SMTP id
 w26mr891073ljo.53.1587605684557; 
 Wed, 22 Apr 2020 18:34:44 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h21sm564967lfp.1.2020.04.22.18.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 18:34:44 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] Bluetooth: hci_qca: allow max-speed to be set for
 QCA9377 devices
Date: Thu, 23 Apr 2020 01:34:30 +0000
Message-Id: <20200423013430.21399-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423013430.21399-1-christianshewitt@gmail.com>
References: <20200423013430.21399-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_183446_592937_9C7726B6 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Christian Hewitt <christianshewitt@gmail.com>
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
index 072983dc07e3..b3fd07a6f812 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -597,10 +597,12 @@ static int qca_open(struct hci_uart *hu)
 
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
@@ -1871,6 +1873,11 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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
@@ -1895,11 +1902,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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
