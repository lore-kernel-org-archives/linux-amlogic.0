Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A17C2D0F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:26:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2491823126
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C0sDdL+X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="SrTd/ro7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2491823126
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JJJQ8yGOgiywMgmEKUtkpQQtGRZqvgkuQS4jGlrx8Y=; b=C0sDdL+X2kByQg
	N/ylT7DZsWGC/1UwGbf3rOKO89bzwDo48xjyx55M4nEdLiwwj+EvMmY+RKf8xdUV/ksi/FusZMgRq
	tjHP56uNzHpzw9KtoTDSiGKkzelIYk2hvxFtoIi/77BQ/uPxSG74BsWb84H5k2V4/9yx4UQxxcK4a
	p52JOr+kdieG62xidKQv8VzONhoeVzEcYiuaicu8TWJQqheOjxDMcAfy3APoRz7JfA2arRGjhVFAx
	5i/5C9taJqfVrw1OnTgjDprIRKghCWU69wURza77AR7y0C2jK0UW+TFED0WRUBlcgtUAuGhxdcxBF
	uJpaSIpeP2ifrwc4ChOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYdMC-0007o4-52; Tue, 12 May 2020 22:26:36 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYdKM-0003fQ-Jm; Tue, 12 May 2020 22:24:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id g14so10386855wme.1;
 Tue, 12 May 2020 15:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T6/lnxUNaPxPPXlTLJRj6AhR7vTkkb3EZ8aqBlM0OWk=;
 b=SrTd/ro7AvaEauxrrPTxDh3wvmrjWHigYFTwI6OCAchA0LTOoEpBuyhjdECOi3W5JP
 nloq0YQb4LVaFJ6VN6jMc4vp45mu2GK2NfcpiPSB7PZcjFY/G4TJ/29TgVI+riddVEoL
 zUHupnteXosHUlb6g5tBM3MRUBRaAsYsPgJw5YGIK6TJcOeGeHWH2noAhwAjEgJ7xuNp
 NNWp6qZDm9EDrFYn8eWry4sxi1E95y7tlM33Mvgvv9fYzK+5509XDCTKjRnTh53apiu2
 Uz9wc7CXgR42yew0ceWmexHuk4qJEcsX4qtzfW0GyiDsj0ePezsQiGlpEqBQz3rQxeQC
 ZpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T6/lnxUNaPxPPXlTLJRj6AhR7vTkkb3EZ8aqBlM0OWk=;
 b=eErfbnQ+0QxJmAserSkAvDjD2wtWmjANQloBMDXYxc6cFfMgJFbxT3ScL7aLacWdFq
 YNeyTpuw2zUrxxOFLMMH8jo20mTCTgm8hXGe7TUA5Oeuje190P2sIgusSARDy0VC7LvP
 6+b7a4I3Mk09ETNTE2Zo8jtMl/q0n/AVsetU4FkZWlxnZwHFjVSILc4B0gsuFnAnGh7o
 I/NJ+F77Q9ozMVYDPXs0bDdKe55E/KMoM67VKyH7hds34khFy0uzqHAOSQp6AUxk4/4Y
 I2souB7myZ1Qeb4Adcv0lpvcLUG4yBEfLEwzLL9s3iL3IS7Kfpw5EJ6YJrXJIDZ5y909
 Y08g==
X-Gm-Message-State: AGi0Pua+nxCYhIuWZ11/3LwFqljiRJzFyhcutDdE5eljMBJoikpNxkyn
 G70Ej7vmN9IyXiEl3fkQ520=
X-Google-Smtp-Source: APiQypIFFG9NZZdOzQj9vGlbbtC4ygVpYGhkLOO2LmO2sp/3GaDT2eT9UR+jUxCZfNfk8KIGsqyO7A==
X-Received: by 2002:a1c:f211:: with SMTP id s17mr43022273wmc.168.1589322280765; 
 Tue, 12 May 2020 15:24:40 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b2sm21758758wrm.30.2020.05.12.15.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:24:40 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: kishon@ti.com, robh+dt@kernel.org, vkoul@kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 6/6] phy: amlogic: meson8b-usb2: Add a compatible string
 for Meson8m2
Date: Wed, 13 May 2020 00:24:24 +0200
Message-Id: <20200512222424.549351-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
References: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_152442_666052_18A466F9 
X-CRM114-Status: GOOD (  12.96  )
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
Cc: narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thomas Graichen <thomas.graichen@gmail.com>, hexdump0815@googlemail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The 3.10 vendor kernel sets the ACA_ENABLE bit on Meson8b, Meson8m2 and
GXBB, but not on Meson8. Add a compatible string for Meson8m2 which also
sets that bit.
While here, also update the Kconfig text and MODULE_DESCRIPTION.

Tested-by: Thomas Graichen <thomas.graichen@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/Kconfig            | 2 +-
 drivers/phy/amlogic/phy-meson8b-usb2.c | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index 3495b23af797..5ec53874d1ea 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -3,7 +3,7 @@
 # Phy drivers for Amlogic platforms
 #
 config PHY_MESON8B_USB2
-	tristate "Meson8, Meson8b and GXBB USB2 PHY driver"
+	tristate "Meson8, Meson8b, Meson8m2 and GXBB USB2 PHY driver"
 	default ARCH_MESON
 	depends on OF && (ARCH_MESON || COMPILE_TEST)
 	depends on USB_SUPPORT
diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 436dfa1a8a04..03c061dd5f0d 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -302,6 +302,10 @@ static const struct of_device_id phy_meson8b_usb2_of_match[] = {
 		.compatible = "amlogic,meson8b-usb2-phy",
 		.data = &phy_meson8b_usb2_match_data
 	},
+	{
+		.compatible = "amlogic,meson8m2-usb2-phy",
+		.data = &phy_meson8b_usb2_match_data
+	},
 	{
 		.compatible = "amlogic,meson-gxbb-usb2-phy",
 		.data = &phy_meson8b_usb2_match_data
@@ -320,5 +324,5 @@ static struct platform_driver phy_meson8b_usb2_driver = {
 module_platform_driver(phy_meson8b_usb2_driver);
 
 MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
-MODULE_DESCRIPTION("Meson8, Meson8b and GXBB USB2 PHY driver");
+MODULE_DESCRIPTION("Meson8, Meson8b, Meson8m2 and GXBB USB2 PHY driver");
 MODULE_LICENSE("GPL");
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
