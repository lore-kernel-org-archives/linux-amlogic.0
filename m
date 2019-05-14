Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41773C04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 10:13:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12C1821530
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 10:13:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GoUy+Awk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JpMv4Gbq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12C1821530
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3aummUAZM0YnbOxiB9hqJE7KRZzqUt8wOgwF91iCBI=; b=GoUy+AwkkJ+ppP
	ZUH/INVJgCgZOY+HLDzul9L0pLSy9AIiedSOqo1V5mIdpqwFxz3TD4fJUhezzQmK8bPeHSXMYM7ME
	fNNAcFTmAcuuxtfjYrlLXhF1Z6fhbW7KnVREBugFhVsgYGi2XYpjF5jKqK7wuh3/cM4ZUDCRkBfeC
	XFkUgQ4BKfYUDko3628D5vAzHfz8ig+ZS5OVc0QSZp+mMBO8zwM5lPMXem6jPSjKsxNIrQsobKZCf
	o8P9wQn4b1i0tOXMLDwtRMhxqFj1NHLjc0bQNsVX2T/EhV848bOLxiu+RGPLB95521UDteR/uH3Kq
	8vq0aPS1ziXnTq3fUmeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQUQZ-0003Cs-VC; Tue, 14 May 2019 10:12:55 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQUQV-00038D-4W
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 10:12:52 +0000
Received: by mail-wr1-x441.google.com with SMTP id r4so18502874wro.10
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yxpKfujHEhPIHoJPgausEqvUsELQIfSOz/WpLWWrJwA=;
 b=JpMv4GbqJSjK4Jj4Xd4VCVcTOcAHyDyms1YnbLpEFXIfuGWRxEAEN8DEq2yBaZZso+
 ccQTaMKUoE9TY1Ct/2b5Ut5bBsspH/TAQ3mZ+F6abkPS0GQ/RYQRzvsZIA3DXLkE0ubS
 3YQq5oEgutmKhYNPFnJoMNz5tk6hu7dZMSs7IkQc1SMAzj3g9/+oDG4gqG7+6Nat9KE+
 FsW8okdBNiZVHVP2YI8wdqXmgC9xD5Sywbc3mQMyTHDgxON8Fkj3C/CtUA7byfXLJfns
 3Xo5zkPIjl8vTRH+UxDS15Ft3cITovMDhO+X2Qx7iW8srmexaTk7PMvbHV1caFFQnkX8
 sZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yxpKfujHEhPIHoJPgausEqvUsELQIfSOz/WpLWWrJwA=;
 b=d7jzoA0Iu6i2luOXbHMv86RHfmjCEdJznh5PGEwgGme7Ggb9cEiGSAXOjGmB0QiR2J
 gfDz22py2SeCHGpQGmbvnKpHRwM8rd7pCLx+QJnTK4RkWT1mE4MgMB7DJXUOEGTNbgdA
 Zsrj+Kq8m7CQMkZy62PS+AFaotWm9phLngHZ99m2GGPyKLOvdwPDIshEuW7pNvXpI9I/
 zXlePXXOTmOJI4sXRrwocbykAq0Twuc3hjYWqclqa/+Yhuy1p3SnxfBEKLkOVrUwy4eW
 hIr43BkN+u5J7JUDDRgw072x7W49PBLD580SLMPgWnqgGFNhZ+O1kJf1yauCiffPx1k/
 HMfQ==
X-Gm-Message-State: APjAAAUlj0Nd3eJqFmbRU/7ncE276nU/UInfCk/orafPQ4Ss58VB1kKQ
 eozCu6cypK4okLEO4HQHTQEPTg==
X-Google-Smtp-Source: APXvYqwrnY1vJ4xCi/k6VxuZ6yScPtNF0qrWnWKDBS3cueG0t5fymBsZR5BapsPLSHbbAMMRnglRow==
X-Received: by 2002:adf:b456:: with SMTP id v22mr18917590wrd.55.1557828769848; 
 Tue, 14 May 2019 03:12:49 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id r23sm2219564wmh.29.2019.05.14.03.12.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 03:12:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/3] arm64: dts: meson: u200: enable i2c busses
Date: Tue, 14 May 2019 12:12:36 +0200
Message-Id: <20190514101237.13969-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514101237.13969-1-jbrunet@baylibre.com>
References: <20190514101237.13969-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_031251_172769_F2E485F4 
X-CRM114-Status: UNSURE (   8.80  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the 3 i2c busses present on the u200 reference design.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 972926121beb..e02534ab7673 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -169,6 +169,27 @@
 	pinctrl-names = "default";
 };
 
+/* i2c Touch */
+&i2c0 {
+	status = "okay";
+	pinctrl-0 = <&i2c0_sda_z0_pins>, <&i2c0_sck_z1_pins>;
+	pinctrl-names = "default";
+};
+
+/* i2c CM */
+&i2c2 {
+	status = "okay";
+	pinctrl-0 = <&i2c2_sda_z_pins>, <&i2c2_sck_z_pins>;
+	pinctrl-names = "default";
+};
+
+/* i2c Audio */
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+};
+
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
