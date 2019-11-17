Return-Path: <SRS0=wynk=ZJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8489CC432C3
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 17:56:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E732084C
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 17:56:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iwsoFvlS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpFVHO2O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57E732084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URfGzdmxVwv3KQNMmFkHlYX02kf2jGmEjagc06O8jt8=; b=iwsoFvlSp2qrKq
	AakLcS+GpjcdtMFxIlQLZ9b9xkXKrS+O0MprgT0MsUORmA0EfCIy03vfJzpaNXzR4k+TRGb0mI+TH
	bhhGUGYtizlm98q06yGXXbAeLaLi5nFAWYaSwEWyikcZN4npl7dgWWcgHLpVUjQJJMSrPwbeVsa+D
	cNX0DmyoDrgewFi53+7QcgrW8yhIPY+VGzIZpgeNfmai2inLf3fTqzK0iOhbtCypVVSulG3YlM+YA
	QRIJwknXQ7fHCPJDlFWk8uxTARqgyFF6JR/yX4moXl+qe5RrsP22zLXjq33dTNrQVW3FeoIHwKIyQ
	e8LEHFgEdnx/Jm2pVLPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWOml-0002Ge-5L; Sun, 17 Nov 2019 17:56:31 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWOmh-0002Dg-Sd
 for linux-amlogic@lists.infradead.org; Sun, 17 Nov 2019 17:56:29 +0000
Received: by mail-wr1-x442.google.com with SMTP id w9so16814380wrr.0
 for <linux-amlogic@lists.infradead.org>; Sun, 17 Nov 2019 09:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xrlHyn/zKHye+GAnh7De8qb9y10xddfAIfezFOlqYo=;
 b=PpFVHO2OzcW+yW+E90oxLBuFpIw+nu3TOOdkf1Xe2dnqWz3iZbrHdLXwphAwrb2ekm
 5fpyjk81zVFkW/VG5LtZ1e4Io1WjnSN3ibXw15+TVZAIj3c2CrsNf4FFLu0vFzpzC0hs
 mPagAINrysa7uVt4IbFKUy5/WJ+DSGvfrE4B1h6suSayHS3ekEQFaSS7TaXyDRCDd0+q
 18RprW5WFCaMoKIl3ovvlgc8TPcFGG6hX0jF9Sr0dGkvqEgx86Y4W1u4jIsZ7Jqp8cxv
 HwBSYHFckP+fFOuMlBfzVyrwdHk55yDKahXcfEC96x9Cp91j+yPrN+ohYEIOSblrCGPB
 jE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xrlHyn/zKHye+GAnh7De8qb9y10xddfAIfezFOlqYo=;
 b=V+xYBNm9rTRIUpHPL3sNE2ihoJtJE9pwaU6Yg33RrqX7FKkiRM4dFNytf5LTHrYUaF
 6UtluXlQMdVclaS3Wz4kHN0AzTrCwtPQKO6oHMMKUShSwwAhmu18Zz3aDBYx8XIiqvAm
 pFzJ1hV4/fl5kavNde4DGjHWfTNogSd5dQnRzLZzI5zXdo6EMaWU+o2KjqLRheMGguZl
 ZQjEmWqcPgl0wpne71/egIA5+t2VgwMt6P2tKjUig98vBi0yXZACJlK+/9EzUsAzadOX
 aXQT2jIuRUN7g/in0vi4Tled2dNLjqseM7zbAoyyb9Qgh/Ij4jmg6by5KXrMAoxS++iF
 eF8A==
X-Gm-Message-State: APjAAAWD9s2akpwePRnTlquA1oNQx5hkpgUYCb24XmyzAhTeS6BpRZi/
 RpXLouHz2tc87+2ok5fvvSIT2/NabuqIbw==
X-Google-Smtp-Source: APXvYqx8QHWUHIGY40LTa8n0gtDc2T+YB+/sFkE0wXCESE6N5Descd+yIcErtU/ukNX9O3OGVsOtiA==
X-Received: by 2002:a5d:4684:: with SMTP id u4mr24866517wrq.352.1574013386499; 
 Sun, 17 Nov 2019 09:56:26 -0800 (PST)
Received: from localhost ([37.238.189.25])
 by smtp.gmail.com with ESMTPSA id t185sm19395198wmf.45.2019.11.17.09.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 09:56:26 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-amlogic@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>
Subject: [RFC PATCH 4/4] Bluetooth: btbcm: Add entry for BCM4335A0 UART
 bluetooth
Date: Sun, 17 Nov 2019 20:56:06 +0300
Message-Id: <20191117175606.5050-5-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
References: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_095627_977565_B2FC115E 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Mohammad Rasim <mohammad.rasim96@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the device ID for the BCM4335A0 module (part of the AMPAK AP6335 WIFI/Bluetooth combo)

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
index 2d2e6d862068..22464bf8cda3 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -339,6 +339,7 @@ static const struct bcm_subver_table bcm_uart_subver_table[] = {
 	{ 0x220e, "BCM20702A1"  },	/* 001.002.014 */
 	{ 0x4217, "BCM4329B1"   },	/* 002.002.023 */
 	{ 0x6106, "BCM4359C0"	},	/* 003.001.006 */
+	{ 0x4106, "BCM4335A0"	},	/* 002.001.006 */
 	{ }
 };
 
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 7646636f2d18..7eba10b0ae6c 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -1422,6 +1422,7 @@ static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm4345c5" },
 	{ .compatible = "brcm,bcm4330-bt" },
 	{ .compatible = "brcm,bcm43438-bt" },
+	{ .compatible = "brcm,bcm4335a0" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, bcm_bluetooth_of_match);
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
