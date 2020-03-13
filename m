Return-Path: <SRS0=FIcl=46=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9047C10DCE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2020 09:12:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83BAC20746
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2020 09:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jWFsF2cC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cCKgut1i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83BAC20746
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDWx09K6aOuyWSGZUQ+22XpGbdEcekJuGwrwVquxXo4=; b=jWFsF2cC6jU125
	8JQUOqfbyC990L4GuGntijzbnczIB+4AwJRVtLVK1k1HNnQivKsZDV3F4fXp2kh1uvPNGGqzwZ0u/
	KmkJrEiHnbRGT32WrkoNLEBee17c8dVmH9sET0xZZkUKFy6jvHYNkSHr2O8g+cARXP3HEgUEAsy1N
	2Sf5vsGU9sZj6cIILqQVdVu5hcKxwez1YQqdYdwiyypWIeBYQNLINoNnmjpBruyt8lIaheJYr42ux
	Jm1zV6cOIBQ5WuvXOko7iGb6VdXnGpGpr6FPu9nO9xxJlwe2VtHnDCGK0goDYLX4Dr1c5pTA0mz5v
	JwYj6ZqakIHADrmS7h2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgMj-0001nX-85; Fri, 13 Mar 2020 09:12:25 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgHr-0003rt-Rk
 for linux-amlogic@lists.infradead.org; Fri, 13 Mar 2020 09:07:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id l18so11005832wru.11
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Mar 2020 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yoy0Boq040f9O0QHUfL99rfr3yZcYOtkMxHX2mJBUoI=;
 b=cCKgut1i8Sc+EKPT9DRFmKJrBypE/0XUpuzxQIHOMtV+E+MOlxyOuqm5Z4pGLVP971
 kvv3q1TgjWtqKM9jeZhNgb5ec9MOGKi+w5ry+E4RQLrxtRw1FH8jteBEe/tqJmtj9UL4
 V7eKJtym3FVR15PjDhy7+Kf2FjwjR5iA3ThwPmGT2nk+yoIHNgZidgJ8OLIX1kz36DbF
 HpVqtJFGyR8zzJ8kJLBxgIML6dZIWV5hOMVR5gHliu37f2kstA1mXrH5F4ploIAHUtKI
 yx9P3sAXan4JzAEJzbLqflO6ItYqJpJFx4OItfbk/Ic1Ss/fVRtBwict6neAU1fmfycs
 M8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yoy0Boq040f9O0QHUfL99rfr3yZcYOtkMxHX2mJBUoI=;
 b=o/VrwYNM4ZDzucoN07Cqyz5XxhB7oS9SLKnFZA1LoEzQfIID1JnzwX5qRp/4NzN/0n
 A3QVNDS8Gc20+I3LjU1HmuCd1N1vYSp6ZXHT7ntqfYzYcCj+y9YwlBc3jz8UffREe6bG
 DqXqe2p/CbjxIn8XTCFsIbe3p0FvRTMKoSxaYLz4/zxbj/DfPHgO1bd6zBEujslv19E+
 3PKzMQ4gKkOyacvE51mFzO+WjanWDxvbOELti3MBJvNjg5p8yI4h3RgyQRiX4P898LHG
 r390l5LgFoTSUbcb1inpYt43BMZ3O/MfkUNmMshTeVnpvxaoYquYCbYW3w4Bf40pMqtw
 X+pA==
X-Gm-Message-State: ANhLgQ1dUMxjOKOZJJh4NCOKSsvMSYsmRuLMkMVjazHCpEHDgJ/peqKb
 FQIXcRQfZkO3Cb917I1eW5w6IQ==
X-Google-Smtp-Source: ADFU+vsZuMu3i6rVyy8NzpYVntivu5t4nefjuS0CH3GYC/pYx7aDo3sECAdmYZqRmUHyXeo/gKr6eg==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr17457196wrn.29.1584090441559; 
 Fri, 13 Mar 2020 02:07:21 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id i1sm61872399wrs.18.2020.03.13.02.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 02:07:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 4/4] arm64: dts: meson-g12b-odroid-n2: add SPIFC controller
 node
Date: Fri, 13 Mar 2020 10:07:13 +0100
Message-Id: <20200313090713.15147-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200313090713.15147-1-narmstrong@baylibre.com>
References: <20200313090713.15147-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_020723_986070_8025B608 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add disabled SPIFC controller node with instruction on how to enable
it while lowering capabilities of the eMMC controller from 8bits bus
width to 4bits bus width, it's data pins 4 to 7 being shared with
the SPI NOR controller pins.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index b59ae1a297f2..169ea283d4ee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -451,6 +451,27 @@
 	vqmmc-supply = <&flash_1v8>;
 };
 
+/*
+ * EMMC_D4, EMMC_D5, EMMC_D6 and EMMC_D7 pins are shared between SPI NOR pins
+ * and eMMC Data 4 to 7 pins.
+ * Replace emmc_data_8b_pins to emmc_data_4b_pins from sd_emmc_c pinctrl-0,
+ * and change bus-width to 4 then spifc can be enabled.
+ * The SW1 slide should also be set to the correct position.
+ */
+&spifc {
+	status = "disabled";
+	pinctrl-0 = <&nor_pins>;
+	pinctrl-names = "default";
+
+	mx25u64: spi-flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "mxicy,mx25u6435f", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <104000000>;
+	};
+};
+
 &tdmif_b {
 	status = "okay";
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
