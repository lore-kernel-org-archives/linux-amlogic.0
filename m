Return-Path: <SRS0=T9/u=VP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF73DC76196
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2019 09:03:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B39E72173E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2019 09:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NDpeZtyD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LdU4BFG6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B39E72173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QYKqxBG2ZZgItppkoIcF7yF1SA9Synov35s8Cnln+5s=; b=NDpeZtyDLnT1iY
	LOJNvCP7DI0MlwXC9cOOfAjPI1Bt2+v0lKCpH9TguIsdIAnjkkbzTfig9FD73+CZ/1R0LpphjF61z
	bsLwGRKZjhUXi114wlzIpNm4zWBK+/egzcHilJJVbQHHVwmCZ+0fZ4gh0Kl5RMS7dTCQq6mVEuaAZ
	t9RmY57+EIhgfmcOwPf9HeDjpRuwdHiLEv43iYqRciXD3M1FJ+nuhsNKPNOwGvXBHZLQXv5IxH76L
	Ewb5scOKsXAfx9tCLg3abf/n0PqrzGuRr3H9vGtwIc/ivaqC96DKhvMC2PWFfbPO+xv+bQKf8LsYq
	K0jyt8MN4mFvMdW859rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ho2Jh-0000IW-DH; Thu, 18 Jul 2019 09:03:09 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho2Je-0000HB-JC
 for linux-amlogic@lists.infradead.org; Thu, 18 Jul 2019 09:03:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id p74so24744871wme.4
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2019 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EEPWlaAynzEB3uxsoiThbGJKcclFNIT5ZtJlhLSr90E=;
 b=LdU4BFG6jyQN0ybEhyRRtezrlr27adz7Nni1HrDS5uDhm3eEhhGg76GdQLPNK/Xr0e
 T2ynKqeXJPYKKa9MKyn9Vdq/KpYPDOe4WqRI7zI5hJdrKxT9pZQu91U0NhJRmvUyddds
 3OzicjHVjv9HFhjuWGyOO61buxfPu3i8eXEG21rf5AA+kEwhMY4JXtzYO/0iYwtsA48s
 ZahszRQeFg25USwhJRGnEgjAudmCQf08nBohRckYr/8ITe8na3WyeZhdnqrzPmatqwBE
 lm6Cw8ZhzNNTxpNsn9csJ4iYVn0iOWe2E6aekkKVhW64J1AyTDHCg+psSdFovb5w/S01
 iEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EEPWlaAynzEB3uxsoiThbGJKcclFNIT5ZtJlhLSr90E=;
 b=N3Onymsu5DnNzSYJC9IjS0Rq8RLLM+Wz7O/rb0Jp2KJUy2c6WVhQHL9xHOA9hf/aCj
 Lm41BRDGOeoyZET58ByqrctJElKWINsf35LmIKSBPWYQwq9JK1Mhu4sbTEaif6igVr66
 wStlgG9oc8gAmatratxxSIEwO+NX6aR7pDZX26mpR6qgGYXACvEr4ZKADzWxWG3zJ9bh
 /GqG8a7rYGN11KujXhCDvSYmccns+3mdquDeJZgKA0r1uvUnvR/2zR/stxOVKHMgRpht
 mBSOcOII9GEFFVlmLSFZI7+uSQVi0XbUDWu2Mz4nQ0L0618U82KvpHlh4SfU5KHf3zma
 wBBQ==
X-Gm-Message-State: APjAAAUE54H4TjuHb3dzQlg4GQl+MYRmqSE9B3vJtOgHoXI9EJCVaGvj
 2ToK+WloxnKO+3IvAfbX5gLx0LVEjZM=
X-Google-Smtp-Source: APXvYqye1+eu3ZjWx6OKok5TLOmerHpIOZsjS6dB9eYlpDt//yNdZbHxT3GY30mSRDNU7QZ1zpI+QQ==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr40703700wmb.39.1563440584464; 
 Thu, 18 Jul 2019 02:03:04 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z7sm23825652wrh.67.2019.07.18.02.03.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 02:03:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: add ethernet fifo sizes
Date: Thu, 18 Jul 2019 11:03:01 +0200
Message-Id: <20190718090301.19283-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190718_020306_638594_1A362541 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

If unspecified in DT, the fifo sizes are not automatically detected by
the dwmac1000 dma driver and the reported fifo sizes default to 0.
Because of this, flow control will be turned off on the device.

Add the fifo sizes provided by the datasheets in the SoC in DT so
flow control may be enabled if necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6219337033a0..12bf959c17a7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -182,6 +182,8 @@
 				 <&clkc CLKID_FCLK_DIV2>,
 				 <&clkc CLKID_MPLL2>;
 			clock-names = "stmmaceth", "clkin0", "clkin1";
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 0bb9705a33f1..c8b9b9754598 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -150,6 +150,8 @@
 				 <&clkc CLKID_FCLK_DIV2>,
 				 <&clkc CLKID_MPLL2>;
 			clock-names = "stmmaceth", "clkin0", "clkin1";
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
 			status = "disabled";
 
 			mdio0: mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 74d03fc706be..e62aad5bf867 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -493,6 +493,8 @@
 			       0x0 0xc8834540 0x0 0x4>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
 			status = "disabled";
 		};
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
