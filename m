Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFC3C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:02:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0940020657
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iU62al2d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NPUGQJaw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0940020657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ipvN9Fsc1Fcq7piBwO9bU9r0Hem5zZMrvJuUwiVOEHA=; b=iU62al2dgIjIpO
	oLr5mzwK1wQR5u7RpByPBdx3i8au5r0j/qk99iBl2OrFXYMC1Ta7h6Jr8HWVcPCDrfc3i36O39jvj
	Fn7RYST8aOGRXz8HRIBQmwnlAZsaEUdtFgfavWkDRXozBYUdfSu7snJv6zUAVKGGgwF3omj1nkhOM
	fIoXd67CQL8z8BymQQ6cKi3qf9mKP7rAaNyZ0UOG2giKpn3D/ierC8M8iVAoINElM1xZnERHqpPNl
	A7YUJf4nVZzp0CETHPyB9OfKm8ycHGeLOMVZkcZQLUEysbun7JLTj5iQ7l49xB6ihTW6lBaQF2YAq
	XkvFuArzvQj/v3dBenNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk4Vc-0005Ix-F5; Thu, 17 Jan 2019 10:02:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk4VZ-0005IG-Dh
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 10:02:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id s12so10291769wrt.4
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uoPwbzVmG0pBQc6Fwdx/UP9yYpRHZ47Q7K07lERNqk=;
 b=NPUGQJaw4kZBQYuNueE0TOpGQ4x55G34jfUjvfSA86luMICgsgBwyI/Kz4fAr/2s+a
 b3AAcABP5foCeiXTZaG2p+hBk5oorN3aFpolQliIAiBo6ScVl7LvuYgb5/ScpWy+xz3s
 QQGnzaL6eLL24OW+5h7KAZV2A5WXtrHP+GwDLdCPIv6yXHih6IaCZmeVlclnid/aCh8B
 TuD2B/qT3p8Emh0w4f+13g4orC83BkqavRYRV8Rvbv1iX4Wh7A2WNNt7XYmid0nNf6hc
 cBG2LKgbJFZiCK4VFeJOkpj4yiyWX1lZRKj0p4WxXb2F7YcePDnPQjADZnrRajF/UQSY
 6EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uoPwbzVmG0pBQc6Fwdx/UP9yYpRHZ47Q7K07lERNqk=;
 b=bPm2lQPumWGkWQUa4thmgfarN37YEow8bBQqvNgUhLdtKBW05Q0pUl5/+5vl0DYw0P
 oDQR624qkFTmJdmV9hBXshJr/3VmUPFpAZigEw0ImjEAViZokE4qbTMswyL29n0TIqWE
 RoqOgln7A6IOAFeg4k1961Y/CDaRTctJTkda2s3dkDBVkndpsi0ngwrE1pyuotorWA3U
 thLaIO8FRQtsHU24ndTizLwaNi9NabL6PLG4QUrURN8pvRq2naMOHf/nG+A5Xx0g7GRi
 cYpXoiVEDD+Gk1JjUuFZDYoyAN/dst1bz5SEUk3bfFiFvqzKQKH099pFCnMrLrxaGtDW
 XvXg==
X-Gm-Message-State: AJcUukfJ+oIapy0FszM33wXUEIWa0quaMgRpen0vmuo5o0y2mJ/RVCGS
 nKiq3jRUB+mZ3Vv+VSaviO2Law==
X-Google-Smtp-Source: ALg8bN4tVyNpfVLViPQ5T6QpaxT+xLmF982ZuRYczgIq4JM57KieEv6D9bsniU15Fhbhe7JbKtCeyQ==
X-Received: by 2002:adf:f401:: with SMTP id g1mr11581670wro.103.1547719363455; 
 Thu, 17 Jan 2019 02:02:43 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id t199sm23557992wmt.1.2019.01.17.02.02.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 02:02:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson-axg: add efuse device
Date: Thu, 17 Jan 2019 11:02:34 +0100
Message-Id: <20190117100234.30989-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_020245_525566_1FDA2C0D 
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add efuse to the AXG family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index ae336cb34e29..0e0abb1a03e2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -111,6 +111,14 @@
 		compatible = "amlogic,meson-gxbb-sm";
 	};
 
+	efuse: efuse {
+		compatible = "amlogic,meson-gxbb-efuse";
+		clocks = <&clkc CLKID_EFUSE>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		read-only;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
