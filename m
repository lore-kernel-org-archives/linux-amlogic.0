Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF5DC4360F
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC57720850
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Flp1stLi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="v++2uJ/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC57720850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qA8qffoKCqoexaWZbJFOgWwo8Xext5+2ys6cRc5jY58=; b=Flp1stLiW7DcxY
	+lh2OCj8LP+wHkBlIIK01YMX5QCi8UOZlph3lvWu0LzkhTWRTs/cJc9F8T6uVqM+0vEFXLvhYL+Bl
	qU6tE0gGRmBy/CjPNLrXlGx05QJd4sd+D8wrrt4zErqCg7yNiX2sdN+Cokd/roXl/vFAKJfnQXFhr
	FrfOk8ZLgX2zktUoXJX+CQyuvbNT1JxWh2acG3RnVNAxJT2b4hw0hYx9l6eghHu0kpatFYzMrYpSr
	2GpOd77WlRclhtaJbxnxzDeiXcUWDJVnSoJMzdY1arvl9VwIzaPszT6gdG30WViJVeXj/0I/xf5rp
	lluSHChj7F6yJWYzxwWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Hgb-0001uf-DG; Mon, 11 Mar 2019 09:57:33 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfV-0000Iq-MT
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:33 +0000
Received: by mail-wr1-x443.google.com with SMTP id d17so4296152wre.10
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vq3Rt6EgSxT8wPyvueXvlvQmKgRIGQTLWAAEmCmO554=;
 b=v++2uJ/bnOOVQB8dCle9HOgIr8mybhyNr8dL31jwh0V6fSmS8GnkKX/T4856bZC0i+
 x/k9PXLhVfR3rbQm37OgRUf4jAt/J2y8Kc0uTIJrBChye45nWxDeL1BI/bcxJCDsOUl+
 +U89ifH63K+k15+XaFfeVrbj0LfB1EMcyeIVS/jD59ZQKjdpspZRKB/gu++oLgx6ZYgL
 C18i0z679SLyLAyDJAhaEBXwWxEO8yJaQhGafX5E5EEvWD96kQ/8O58SAfFXMpASajta
 KvOubHDoB/ZltLI5yElZTJZJmcGQnpN9Te5FfcNJts53w8x+dhkM5+pznfV+k2eGC0rT
 xGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vq3Rt6EgSxT8wPyvueXvlvQmKgRIGQTLWAAEmCmO554=;
 b=H/r6KsaVy0Yf7YfN83lfwXrOYLTcjDF+22ay+bUm1/thh8Mn3s/etAFEQdyJZM8lhO
 SVcYfIp2X8AbERRxjnCNXW7qHtHw9wEC08Csx+CL/Ogy5vdVrxm2gVHjwJ7bbkKvx/Fu
 gSop/Go/oglVbS9Kocbg94dPTpRQ6r5UKsozNVLsILas5wp2DxqhGEVif/SEpbPvsbHB
 30FathqHSVspPDnjBm33saGtLq0DN4uosgAVZimh3/t7CXQi1MJCz9JNs8iOX+i0eZ4p
 LU/oQl60bJNG/iBAEGhseUhaHYn/arQT0kQsw0K8PtpX6K8pzV0K3psMdbw2lz5bBUR+
 xCkA==
X-Gm-Message-State: APjAAAW25PzBnP21RdlotFTfeYEJuVNV2LsJsEXQcolgwi7QGJcJgmcR
 PjkpKBeXm3H+KzpTCHjxUFMA3A==
X-Google-Smtp-Source: APXvYqzzyd1axhj/Hi8hHaoH+kaSxc3pe76K2W4+iiG2IZRth0V4nDjkB3cUN7FMkFbS07EQRDPFfQ==
X-Received: by 2002:adf:e8cf:: with SMTP id k15mr18689289wrn.193.1552298184237; 
 Mon, 11 Mar 2019 02:56:24 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 09/11] arm64: dts: meson-g12a-sei510: Enable USB
Date: Mon, 11 Mar 2019 10:56:11 +0100
Message-Id: <20190311095613.11371-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025626_016883_D7BC0BCE 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the USB2 and USB3 Host ports on the SEI520 Set-Top-Box.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 3d230545122e..5762bf3d6898 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -124,3 +124,12 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&dwc2 {
+	status = "okay";
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
