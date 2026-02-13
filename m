Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1CCEF48CC
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Feb 2026 07:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rCbN0IfPhQuU86NmPeThiq/poum/2Oo+c9TMR4RqalM=; b=4joWpyrPoLx7yH
	MZjpdXywIWouasXynTJyuU4nkIBdlXomn+83xp7owuntGe/UOQLoXpkfMBaeFtKCYIeNMdHqDUq4A
	2LWC9goGyC2f+GHEXr78qrKrQ1or6AW6PcMiKtbI/3gIL+RAV9WcylCtCcWBSZ6o1HfW3RJqFIwMJ
	tryZXpNY/kf+2RJsu6BH4ngIdq1EGkbeKkwuxs+peK/oIWFRU/fvvvMYUZ/oRRdg/6CHF6ksLhaln
	Y/8tbHCBV5x73yLSk4rw4GohiPne/oqcrpJWCqdkJwdqmwZogrpQMFBd/rz0mIxQE1KiRjnOEfgzL
	KKmyd+eRKNzNUyiWKATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqnkz-000000037A0-1CR7;
	Fri, 13 Feb 2026 07:38:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqnkw-0000000378T-3lbc
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Feb 2026 07:38:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-436356740e6so669809f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Feb 2026 23:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770968305; x=1771573105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vWiuB+OJ5TMezpUq3g297LZQT9wOrkp2zD9EqhVqw8Q=;
        b=UVzY08/SGEX0P/xueIKTUpL2gdu75WfbB9+wOTo+J0DLNZ3rinMgCyU0BczWUMfBOL
         utcc8M4oZzWA36O7JeXIMBSLM1dd+irpLvoQV4Hi7ju9zMdRN0QMCUqEJYQst+hPbD2c
         tGVnxKzwUnsDHPIFWCl7roW1EMV4rCR40p0jo3VsbUBULEKIM7/VWBQ9AMkNwNY1DKGn
         /YmxeIXDhQsX5WJewlrAGVyIWScGCXqbJrIf85LE++f2H8/nAwav1jaLGzM3aZqWhNmO
         TVHLsQ3eFd8pPALb0DzRJcZhsrd+7AfLZN96wgO9ClsOJmCurlqV9h5AS6EHqpftaY+Z
         JNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770968305; x=1771573105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWiuB+OJ5TMezpUq3g297LZQT9wOrkp2zD9EqhVqw8Q=;
        b=MTwlasgeARXpyTFnREJLHbCiuXOhC+dZpBbDSsiGDdNXjHxPQEMJh1KAC0rI1aC9bD
         UOEoWNrH5uj1CB7aiHwRTBNpmSodekoW8Sv+Xh97+1R0GUdQTVcGkeWJiczlPnIWY3Rn
         FCEMORmAz28y20TQjlATrFlxd7EGGe7CBG4srxgzIAw/eBCEn0jC6fzWsyJu2/DjQHZa
         oJN+PQm0Xxo84sqXzv23Zjy2LLwIjyyMqgAvlq7h6hNJssjkR/+15HXxs9zPGGW4JQLz
         Wz3EdX39gI0wr7yOwjT1uyJf3q8drzYr3YKs+3i/Vn3pWotkHqXmkM62boIrdPdTAafQ
         WbrA==
X-Forwarded-Encrypted: i=1; AJvYcCVdLzcPk3URCo/efH9tmJvnN0mG43FarRTScGQO9BFPdk182yzcJexDbh91jV1Gzj1HD6vyQOjrXAySPpU+@lists.infradead.org
X-Gm-Message-State: AOJu0YzQpcS0Pc2K2FwXHizsJRM2Z6aXfmn9IOrsLhDVjHRNtt+w6lD7
	yHIOx65XJpuzOTmS47nTP6GwbUQi13J95gONdXutzvYk2JeGbDRyyE2T
X-Gm-Gg: AZuq6aK0Aq2ZsMvjSB/wgGR03EtFDPAXWZhKgfI+/w/h/YropEutKYPFUrMF33WTxQK
	DuWZzQQZfjDEQrHXDRztJNF2Wc1oo9VGeiXuM35QK9RHxpXnn9H4HL/TD5S1Bu/3oNbvRdAt3qB
	bLa1TZcEh+jOGftmFb+9O+cDQIkoAD4TzFDx6TJTQDSqtKkNecuf+8KtJCaTvQSUK/pSR0LZAcl
	chDX9OeYxIVGS76GDvw80YpEtOWkSTNBEzSME4Hm0gcq0zqmyz43vq3rEN/FQOPUsrysnY5ArRQ
	+oTCPcBxHBkD51wrZFehGVZM8lmajZ3w+jvjQG/pXnCzgqY8m5myVyYVYXgv6AjLTcQ1gVGrQze
	ISVNDW0k7K6Wgj1h/dAszTapWiwEPWpt4fV6qrVwD2B1nAqhp9qDjD7Dr0KGhUk7XhmymMZQDIY
	af8aobK65CIxelwUmsj1gx
X-Received: by 2002:a05:6000:22ca:b0:434:32cc:6c86 with SMTP id ffacd0b85a97d-437978cadc4mr1730591f8f.14.1770968304335;
        Thu, 12 Feb 2026 23:38:24 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a53:6b71::1002])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a5f0sm3622107f8f.11.2026.02.12.23.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:38:23 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	yangxuan8282@gmail.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH] arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node
Date: Fri, 13 Feb 2026 15:38:10 +0800
Message-ID: <20260213073810.552341-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_233826_940065_6242D7A3 
X-CRM114-Status: UNSURE (   7.31  )
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

The Phicomm N1 uses a CY43455 (BCM43438) module with its Bluetooth
interface connected to uart_A.

Add the required device tree node to enable proper functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
index 393d3cb33b9e..dea3a60e8527 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
@@ -30,6 +30,21 @@ &cvbs_vdac_port {
 	status = "disabled";
 };
 
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+	};
+};
+
 &usb {
 	dr_mode = "host";
 };
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
