Return-Path: <SRS0=5BKV=TY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A075C282E3
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 14:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C9082184E
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 14:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJ7thpiY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZOww9yLU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C9082184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IDizq/Humjn3a6NfbqQ83ydv+Zub6jZdcU1b15XOQc=; b=PJ7thpiY004vfe
	0JMGEWeXm6CfJVNMomKddhCFLBCq8yPdyd3a5Ea+30MLjmhRv6cQsilsJiJaCAvpcG+bv25ISBBke
	z46Z97f9NlPez/UUMxUJtBaL1CRqwq5b20rryz4FQpMD5lHsFNl6ymZasJ3ngR1ye+DTDBJaF/rKA
	pseJgSyY1bmLFxPZ51cJBhIkV3qBpJgQwb8CHNDNx+hCE40BXdjDSwj0A8QvPYCnlg7IMDS6EHwIn
	yTyQ6Cq/7Xc7SkkTk2l41QIBWoCDiEpTFHrfGfsbTLOYJ3RRkuGjIhbV41RYLnRWidURNmk7VdrH0
	mJg+W4v/gAoMUcU+MzJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUAnB-0006V9-JN; Fri, 24 May 2019 14:03:29 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUAn7-0006TF-Ts
 for linux-amlogic@lists.infradead.org; Fri, 24 May 2019 14:03:27 +0000
Received: by mail-wr1-x441.google.com with SMTP id r7so10138232wrr.13
 for <linux-amlogic@lists.infradead.org>; Fri, 24 May 2019 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJO+puwZK6RzCFU2E9wohjn3CAPQY0mhK89CaYjzY5M=;
 b=ZOww9yLUDApgLL5TUAoXfOGMzpkCgGDxw0plJtaFTLSk+wi8FDjn2GqkP2BCeo+5jX
 enylShZI4X3eWHu7OJW0RXlAt/fBZ7UmhFV/E6Inw4lXFYJWCGGXEUBTjp2FmCq1blZk
 YrfGDKLp5Mc40tTWU4btARTPvSroJukzK3zH7XQXJEhyV8esWK5UTf8PcdTm+X+PpMP8
 wFNj4uHG6uG4GUOUsNZWuvS1uWps/RFVqGOkILjlJEVpJZo2O+gK2mwR4TGoawrFioip
 w9bBBGNUsp/c7EbfBnxh/n474XEaYICIcZU7s2KaYF+d0a0eB0w8PyhCDz9Ze6LSvxYD
 5mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJO+puwZK6RzCFU2E9wohjn3CAPQY0mhK89CaYjzY5M=;
 b=sgfznuMMbgmjTIDsfFVOD9/X0UDBrTTyainLlebvFla3gnrEKOw3CggErGnLLDT3xP
 9WCldjSG4Cg+NJYfOvLiawyfY0e/O2LNbr+u1QrZX24Y0elIC7TTEEXg8jdOSnvATVE4
 9dA2gKIO3PedcQVYIoibraEcIsg8eQzCn3sMOwh78apZwPWtCRvcQvJQvDkh6syoDQsf
 OUQnxMu6mxjEXPniSUcvlGpPxDOwc74vM8tv2i72s6PWLN+leff2bjWf2YzL59Q+XbpJ
 qmISSHOJumz2C0h3QeaQc6soPMSPukVCBJUOFnuq2DAru7pIjbU6abS1tcEAiOUxgL8J
 mXcw==
X-Gm-Message-State: APjAAAWjHZgh2GWbQ6mvUbQfVTtA6mY/Cby7AYup3Ltahj7X1GF74HzP
 5ClpYrNcM2+8spURda7cbHbxYg==
X-Google-Smtp-Source: APXvYqwPqM/A9ghI9cWm9xIbx3Gh9KcPOkIzeLjObeDa31TAuaJDFYcB71ff+OvnhdyV3PBR2CaLmA==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr94660wru.339.1558706604206;
 Fri, 24 May 2019 07:03:24 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t7sm2797114wrq.76.2019.05.24.07.03.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 07:03:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: sei510: add max98357a DAC
Date: Fri, 24 May 2019 16:03:17 +0200
Message-Id: <20190524140318.17608-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524140318.17608-1-jbrunet@baylibre.com>
References: <20190524140318.17608-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_070325_961726_DB784EB3 
X-CRM114-Status: UNSURE (   8.01  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

The SEI510 board features a max98357a audio codec for built-in
speaker

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index be1d9ed6d521..c6d032ed9a8b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -32,6 +32,13 @@
 		ethernet0 = &ethmac;
 	};
 
+	mono_dac: audio-codec {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "U16";
+		sdmode-gpios = <&gpio GPIOX_8 GPIO_ACTIVE_HIGH>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
