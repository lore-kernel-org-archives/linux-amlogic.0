Return-Path: <SRS0=YQie=ZM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB97BC43215
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 11:02:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C672230F
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 11:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ebpi40vS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXv9w2q/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2C672230F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Joh4zdzeZGk6LVefvke3sEcUBlq7qhG2l6TtSb52nyw=; b=Ebpi40vS9hMExL
	HVRYp33p4TrkUzeZQB6w5LCzEIdPOiW7ljhAWv+RWy315gBXqRk+MjADvHH8f+i7jxOnedtc59esG
	QZyN0kdy21ciSBcQ08n4ODi8/27z5ejKADhogExKa0kXhrj8k5GmT1OsD3tk01JpQU2laqZnsadOB
	wQg370MmXV1141wiAHCA+3ebbjWTtZ6CVvhCVHzZ6HPs+481hL02fpF2k22lemwdHnxzEfxYiYB+P
	XPPGXPD9VHb2ApHiQPlaa0LujT1LzQ3asmaJpWyqf+DgLAhLEWWG9j5jSHAr7OiHbjPmljV3Hbg2B
	ncO3h0gBokENprYRT2EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXNl4-0002vR-TK; Wed, 20 Nov 2019 11:02:50 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXNl0-0002tF-JQ
 for linux-amlogic@lists.infradead.org; Wed, 20 Nov 2019 11:02:47 +0000
Received: by mail-wm1-x343.google.com with SMTP id b11so6490247wmb.5
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Nov 2019 03:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=raniJMYfoIyetXFqCcX/xH2yHuG8ZQyELBDZ9TlUojc=;
 b=SXv9w2q/i+oLawAIkAeayda3JPGMI/vif0JCn9PkCUB4MbWvO5vXlnqtsKmLNk35YC
 NUB+xy5gPDz2w2yplxuXr4rBuTeDWACbrVlKQYooiV9imb6JWBA6u6hLN9IF5vmyfj4y
 x8T/B3NiISZevNUqASjlXcx0r1n0iPCkYdHw154w7d5qDjCB4icJYodNYMeSAckcnwpK
 3GWUJwhMbj/futK2E1bLhywWJT8FpZAPZQexj2TOEJp8l3r/IJ1imwqDIgEeIO0IDp1g
 kWjxBkll/0yFMBDljw/cxeRCWXFLR2w4Cp9nm1v+ADj1DaxdOTLl7J4wWis0plaMT4SD
 wbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=raniJMYfoIyetXFqCcX/xH2yHuG8ZQyELBDZ9TlUojc=;
 b=Vo5Hgg9kZmB+tm1dRHKQ6YMhRLSTNB2ab2zmPw8jCoS8jYy63kPQ7mmp92ouedFWPN
 waUjDbQmfSNvCPIZOygNJf9h2s5lzzw5AOA1cyhldPiddi0Z9BB9AodEUrq7h+nV6I/o
 Ks+HkUXb9URy9Go50oeNnIMU8DoqZJN1IFI4+M3c0UJWhSXjRmmX6KyTgLIv8iHFh15j
 X+WuMufHfl5S5GFHmmwOBA8G3hdXYpp7fU/9Uhb21HvGkj9FUqKIZTouWtNEv2epg8cS
 ryqEJ6VZZTOWokdOvZqRZN9AI5WmBmDekLEuVEu4qtNTgV7PjQYWXJEkwzZZuzX0+3Wf
 K/vQ==
X-Gm-Message-State: APjAAAVtSY9XGFOFG891blx2oh//8K/u6mF0do2aAPzdUSSw9zQFYTdG
 Jtq6Ak73wgPdUsUICgAMHPs=
X-Google-Smtp-Source: APXvYqyN5cSRbLFF30uL6zhsIJ3ygU//UCVB+3SOIN9g/KbyD/xEE1fHMTzEXkHR//4GpnQx5AZtmA==
X-Received: by 2002:a7b:c858:: with SMTP id c24mr2545599wml.174.1574247765330; 
 Wed, 20 Nov 2019 03:02:45 -0800 (PST)
Received: from localhost ([37.238.189.2])
 by smtp.gmail.com with ESMTPSA id r15sm34592413wrc.5.2019.11.20.03.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 03:02:44 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-bluetooth@vger.kernel.org, Johan Hedberg <johan.hedberg@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/2] Bluetooth: btbcm: Add entry for BCM4335A0 UART
 bluetooth
Date: Wed, 20 Nov 2019 14:02:35 +0300
Message-Id: <20191120110235.13987-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120110235.13987-1-mohammad.rasim96@gmail.com>
References: <20191120110235.13987-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_030246_636101_F289BE9F 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the device ID for the BCM4335A0 module
(part of the AMPAK AP6335 WIFI/Bluetooth combo)

hciconfig output:
```
hci1:   Type: Primary  Bus: UART
        BD Address: 43:35:B0:07:1F:AC  ACL MTU: 1021:8  SCO MTU: 64:1
        UP RUNNING
        RX bytes:5079 acl:0 sco:0 events:567 errors:0
        TX bytes:69065 acl:0 sco:0 commands:567 errors:0
        Features: 0xbf 0xfe 0xcf 0xff 0xdf 0xff 0x7b 0x87
        Packet type: DM1 DM3 DM5 DH1 DH3 DH5 HV1 HV2 HV3
        Link policy: RSWITCH SNIFF
        Link mode: SLAVE ACCEPT
        Name: 'alarm'
        Class: 0x000000
        Service Classes: Unspecified
        Device Class: Miscellaneous,
        HCI Version: 4.0 (0x6)  Revision: 0x161
        LMP Version: 4.0 (0x6)  Subversion: 0x4106
        Manufacturer: Broadcom Corporation (15)
```

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 drivers/bluetooth/btbcm.c   | 1 +
 drivers/bluetooth/hci_bcm.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 0bb9023ec214..689c7f36fea2 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -342,6 +342,7 @@ static const struct bcm_subver_table bcm_uart_subver_table[] = {
 	{ 0x220e, "BCM20702A1"  },	/* 001.002.014 */
 	{ 0x4217, "BCM4329B1"   },	/* 002.002.023 */
 	{ 0x6106, "BCM4359C0"	},	/* 003.001.006 */
+	{ 0x4106, "BCM4335A0"	},	/* 002.001.006 */
 	{ }
 };
 
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 0f851c0dde7f..d2a6a4afdbbb 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -1425,6 +1425,7 @@ static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm4330-bt" },
 	{ .compatible = "brcm,bcm43438-bt" },
 	{ .compatible = "brcm,bcm43540-bt" },
+	{ .compatible = "brcm,bcm4335a0" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, bcm_bluetooth_of_match);
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
