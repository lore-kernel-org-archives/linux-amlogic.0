Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29E6C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 11:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D34F206C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 11:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N9wcyjXr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rmxYgcnh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D34F206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WfznmEeh0PvG7GsI+nZ1O0mHP/yOQYeLKOVP63spCvA=; b=N9wcyjXrF5Swpy
	7kydhmfrA4Z+TrUZXI6dXEBNd2kiwy8TTzm1UCgI5w1op7vguqaAthrVhgUAzLTd8TfXIifj2w3Tp
	lss3fD2QxsWDBHaCBuxf1W6DvSm/uo3rrqab4SJRfWxvYRMCrH2T8o648yFbBUpHkXBm3G98XnXRc
	tgQbJofC+7CX9S0KUznZhBmdFEPcb/MnEpQbnIp0QC/JdPjbo5eNVglT6qm0tf5qMm5hAM7yOwzxo
	L5oX0jwWgnhoJoBn8F7bKmfH8lLpyWut1kt88Ih7kuaxWGbfMQGCFYsE7U5+JmSFoXYoNvOsyoOHj
	671U4IoTxZdJHDR/5M5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjjU2-000810-U1; Wed, 16 Jan 2019 11:35:46 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjjTz-00080c-IK
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 11:35:45 +0000
Received: by mail-ed1-x543.google.com with SMTP id g22so5132247edr.7
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 03:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wjyk91Od83sfIuBjh9nXzgFyBOa8J3XFEoLvNR59eXs=;
 b=rmxYgcnhmDwd+1GoVPvqya+jYWM25PXwHMS4Vbga68wfZCbKSKoXYdW2DEtOcaJpYD
 OIRg/xlJ7W23ccVDohmFDJ+zUIVP37BYczHV61KfKGmmVYBfNrTvVKzruUMQF2Iz7jh9
 pq13v+zn6RIawkvpV1bXcOP+/STOxSgGHxmLuxyi4XjiJaLQ3gK4z9IbzicuqA1R7AH9
 +WLqG+7yyCHjKetM0zPzyFp8579zcYeW6rgpA/72gu11ZaKVuFp9LagIkpOPj9A/2Upm
 Xi9NDmvJwjDxN55NWdi92JBbcCTvAtMKTlrwZRrlGO+hLwJZ3sr0llHBRSE/J9gxOXRV
 jw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wjyk91Od83sfIuBjh9nXzgFyBOa8J3XFEoLvNR59eXs=;
 b=rP5gEPI2hCuMzYGsPEf94iLlFDoDwBUAHdDKZpYIZ7cq0V2xD3SM03cwz4uHdnl07l
 rQ2MMsTtxHePklN2wnkjWLM0Er8ZJSutchxVbNhUFIdDH82oVXZ3qTTEykDE47NGwyqt
 CUN/OnRrFjb5DiCyTPATYOBQvPW5aWJQxrkAw3xc1tsxNZRq0pEGIYrioX/f6Jt+wAzL
 P9fliNyz16wTsKcaPk8SGyxHhumn8dCXr1i4UnBUIru7ymEzcJBuMyHkWZatp6NfFTmG
 Aild9JRiTIFQDEV4eepTQafL4mG/MTPHRCYL5s/wFne7qKnTJ7hIy5UNVzYE8aNZpmDV
 AH6w==
X-Gm-Message-State: AJcUukel9/rlLQpf+Zhyz/OySpwuNdZtnq6Hz/LOahzakpFl7IruBrT9
 640LPY8PHFGTOXaZI7GlaFjCbg==
X-Google-Smtp-Source: ALg8bN5TH6Xa/gcud5yIgNmG7v8HNLMdHEGSnMfPEBRgeZMX3Ciad+3DYVtXxKGhuXL1/dIbegzulQ==
X-Received: by 2002:a50:e610:: with SMTP id y16mr7105838edm.163.1547638541191; 
 Wed, 16 Jan 2019 03:35:41 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:f7a1:ce00:5105:4b7b:c922:7c6])
 by smtp.gmail.com with ESMTPSA id e35sm5563276eda.13.2019.01.16.03.35.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jan 2019 03:35:39 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: joe.hershberger@ni.com, u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org
Subject: [PATCH u-boot] net: phy: realtek: Add functions to read PHY's
 extended registers
Date: Wed, 16 Jan 2019 11:34:50 +0000
Message-Id: <20190116113450.27238-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_033543_609551_D73A9039 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

According to the datasheet to access the extended registers we have to:

1. Write Register 31 Data = 0x0XYZ (Page 0xXYZ)
2. Read/Write the target Register Data
3. Write Register 31 Data = 0x0000 or 0xa42 (switch back to IEEE
   Standard Registers)

Hook the missing functions so that we can use the `mdio rx/wx` command to
easily access the extended registers.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/net/phy/realtek.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index b3e6578df9..3bea1fa9d0 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -57,6 +57,31 @@
 #define MIIM_RTL8211F_TX_DELAY		0x100
 #define MIIM_RTL8211F_LCR		0x10
 
+static int rtl8211f_phy_extread(struct phy_device *phydev, int addr,
+				int devaddr, int regnum)
+{
+	int oldpage = phy_read(phydev, MDIO_DEVAD_NONE, MIIM_RTL8211F_PAGE_SELECT);
+	int val;
+
+	phy_write(phydev, MDIO_DEVAD_NONE, MIIM_RTL8211F_PAGE_SELECT, devaddr);
+	val = phy_read(phydev, MDIO_DEVAD_NONE, regnum);
+	phy_write(phydev, MDIO_DEVAD_NONE, MIIM_RTL8211F_PAGE_SELECT, oldpage);
+
+	return val;
+}
+
+static int rtl8211f_phy_extwrite(struct phy_device *phydev, int addr,
+				 int devaddr, int regnum, u16 val)
+{
+	int oldpage = phy_read(phydev, MDIO_DEVAD_NONE, MIIM_RTL8211F_PAGE_SELECT);
+
+	phy_write(phydev, MDIO_DEVAD_NONE, MIIM_RTL8211F_PAGE_SELECT, devaddr);
+	phy_write(phydev, MDIO_DEVAD_NONE, regnum, val);
+	phy_write(phydev, MDIO_DEVAD_NONE, MIIM_RTL8211F_PAGE_SELECT, oldpage);
+
+	return 0;
+}
+
 static int rtl8211b_probe(struct phy_device *phydev)
 {
 #ifdef CONFIG_RTL8211X_PHY_FORCE_MASTER
@@ -336,6 +361,8 @@ static struct phy_driver RTL8211F_driver = {
 	.config = &rtl8211f_config,
 	.startup = &rtl8211f_startup,
 	.shutdown = &genphy_shutdown,
+	.readext = &rtl8211f_phy_extread,
+	.writeext = &rtl8211f_phy_extwrite,
 };
 
 int phy_realtek_init(void)
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
