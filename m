Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8235C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:15:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 894C220870
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTMIHO0W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bmxFBhui"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 894C220870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdUxO6I9EE5v/RNh63nYY4IGmFNADUd6bgPkjqx0D/0=; b=iTMIHO0WH9YAMJ
	gref6uKogFRnAHxAp/XvAiWL8+QX1WwJuhMThqnhPU20XW4XWFIKXiuOhNcR/4tEShJdfefSDEIUA
	5SplBQ72u907LGk7lL9+HmYPVk0zXuDclTIwlipO/yYU7WeHBtPQT82RcqfiXAKlGN76QDkUEFOrk
	AJLkA+bBCQkRw+ylf+TpWCM3Bp+F8RltG/6XnmjqHiRfhSH06+gpOUEDP+glJVvWaPk5xM8ozEYsR
	h82R5Z+iE8U85Jc18qB6cyeIvDCK5VRIX6rLuUn88ze7WPymPWApn8/uu9dEp+TEbAFoKkJx5t6D4
	WihYjIyJmOkMfFnlgHbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Mdr-0002nE-U5; Mon, 25 Mar 2019 10:15:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MdB-0000k0-5P
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:15:09 +0000
Received: by mail-wr1-x444.google.com with SMTP id t5so9352319wri.7
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fb9NUdP7aJF7aVxwxVvvXLo3BssoKq3ad2sMWdbhWKU=;
 b=bmxFBhuixM6Y0aQvp2OBhII92c5CZu8zoWhG/Djr/Wxs/v8UvKJ87mHwoAKaCcdo9p
 Qx5p9MY1c0eAPBQZFOJZuuySRiD+ECspZzTKvJxvz8IRD9ecuik2m6wZsrfOY0UX2dVj
 uZwvF9REAIHlamsFymFw4Be4Xak11G8f/lHswwxSSpCaUsblW88IDGelk4kL8twO2kSA
 qgTYyB1+aMHENtxHesc8NqsbDG3gXBJV2FM9KXTyWvW+CpjrJM0O+d0p+t+2lPpuJYTi
 rSgn3LGxJOVcRhYzEgcxlMXRTCmkyumtop+q+dOmYQ2NQpk2Ziv7J/SbrZ+X3c3k/uhw
 O9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fb9NUdP7aJF7aVxwxVvvXLo3BssoKq3ad2sMWdbhWKU=;
 b=izZtTZciNVL6y6EEVoUbvgMDLWreqx2dVCuXrY0Ai9l1viOLlV6j44UfO27RHWA5sR
 iYBI/YMB0ATH05fK9xaDw9IGIpTtfQZs+PJG7bkpWic+kJmBksEB/NcfdLTbw/wNDk0o
 XiTy2viJ7mWpNIYwB8pOBkcUsz/hoK3QeCHzRrGNicDTUgPIIM65A4tfVeO/73FvpfT1
 ptKlXL8j4iHxA97xpUV7nB2ellqDAiIVMItcplVE85puJigApK1PCijPkzHLdfulKrwe
 ijXB9a6aR1a0b4Rw+a3NkSJJz2hbfHY8kLBCV1JM7KQKPH89brAnt+I+ED7GdqbFvl/D
 xfLg==
X-Gm-Message-State: APjAAAXjoYUvz8Sqb+9kh/+H2EZFrEMVDlo4DzWnsubp1M5UiZwVnGIQ
 mBy3kunRX4rKwpnSqDaXUQFc7A==
X-Google-Smtp-Source: APXvYqxF30zrGpFl8CxlnpmOCpgJMoeWFt44u6hTpiCPoqtxuQ9V5obSJwcmGhPo544k0LTu+MC62g==
X-Received: by 2002:a5d:6b10:: with SMTP id v16mr10165366wrw.294.1553508898035; 
 Mon, 25 Mar 2019 03:14:58 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v14sm20049484wrr.20.2019.03.25.03.14.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:14:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 2/6] arm64: dts: meson-g12a-x96-max: Enable BT Module
Date: Mon, 25 Mar 2019 11:14:49 +0100
Message-Id: <20190325101453.3009-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325101453.3009-1-narmstrong@baylibre.com>
References: <20190325101453.3009-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_031501_852967_1527BD8B 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the Bluetooth Module on the X96 Max Set-Top-Box.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 0ba28491e2b0..0a6919523ba9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -90,6 +90,18 @@
 	};
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
+	};
+};
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
