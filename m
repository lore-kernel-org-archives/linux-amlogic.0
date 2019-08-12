Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1028C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 17:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B35E206C2
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 17:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rc5mofbe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gzhvT3Y3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B35E206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKg1KAhYzpMlxXjmOIGk0lCjBxxkE+EC55ByhjCWTbE=; b=rc5mofbeg33GZk
	YeQL1fdfrbj7ci7kVjWrxc0pFYl2QprYsUo6xJfJu/6UJiBsm0u0RQAsPGF0MIP7sUYK/HIVlaw2w
	meyf762jVEIGIi/oDtvkbck8028/S254neZHZAR5P3nbokoDZZmHyiClOxBBcTDn22DnmyS6ir0EY
	uaXpM0HgESNdHEMnCxMHWjXJiZHeINRaDBQdV74b6XYZgruROvQS8JGmm7xdZ6YfyglNIYW3U+fLb
	zjHbbsHrXR/LEXn/AfOREZdgQOz1jFQA/Q0rUN0nts8OmmlQxbGdrCfBXzuEM8AqH7bEMJNqlTfp8
	9c2uE00AYkjjGMbka45A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxESu-0007kC-IJ; Mon, 12 Aug 2019 17:50:40 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxESi-0007Xb-FQ; Mon, 12 Aug 2019 17:50:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id r1so6246528wrl.7;
 Mon, 12 Aug 2019 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rYFGvb7oXPg06EB4hMkcpx/M0H50/uoG4GdzYeuMMDQ=;
 b=gzhvT3Y31bmaJgXF9bJ1bBvQrLxKqF5bIvlL1gIfFRH4sN4vFcSizEsc4gk8uVVa+a
 E5Ddrfy9r2Dp95i6Z0TaqRdjFP1hm++W8xQLTPimXf1oJg/eDVaDuFnNIofx5WRZsX6y
 GBrRnNMTDLNQckra2ycTiYjs/ArMlsZSY/ez8uqa91OCt7VkXlydXef1j6x8k8dZg+Cx
 Wu7xk1IHXJSugjBI/yBA2PA4ymO6MoRcArCOzYv7daBnX3pZ0u4bHNM0xoeiPqDlWQ1J
 +a2imMYHv7it3o9mYkq7RF0SzHqmbBUsco7ZIY76ouQWdxVrG0IZAjoXPAW9wjdKFvyr
 8cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rYFGvb7oXPg06EB4hMkcpx/M0H50/uoG4GdzYeuMMDQ=;
 b=L9UVRA3LwjoX77hbp8pxrJ9hithFptTbJ0MOhv7+n9S1qJGjcCtPKKXKOdanO9GIqV
 ZWAsF+tfttmPKpBeXdIo/lYZtDY4D3frR0RKrFSDRDuDa+ZvKmbmi0aND1+8uU0GFL2s
 FhVMI3IZZuMYd/afCTb805zJDpPvlZef/cA02Xk26FhKGZOE7o5oMRl6nZIV1/SqVx52
 IPtU0PChCDYXJ2cNY/mzaQ2S7NrIei7e3VWTv6Wz0R0/FtvvnLaOIMd3Br6Wjnfkt+VH
 lfcU6IDwoUZyJsMMmKvsmaUb/i4L8FVfgOrOOo+WLtFEGTa7CvD/OT69GJ1e2ZfxTh1p
 kQ1w==
X-Gm-Message-State: APjAAAVaG2gmjoB5dNtU6oV4nYwGrAXCgeznLeBUYnsO8u4wpkbYVoiR
 Xm4wKBo/6bPfwmiQ5sB+uLRV/wDV
X-Google-Smtp-Source: APXvYqxWnv0ITEtR3W0OiUar6RwPSC+dvO5i525YNm4PyQOdB40LxzasVZGae86n5vj7QVJ+kOecxQ==
X-Received: by 2002:a05:6000:1189:: with SMTP id
 g9mr45051993wrx.51.1565632226276; 
 Mon, 12 Aug 2019 10:50:26 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C1F600059A26DE113A463E.dip0.t-ipconnect.de.
 [2003:f1:33c1:f600:59a:26de:113a:463e])
 by smtp.googlemail.com with ESMTPSA id u7sm4084858wrp.96.2019.08.12.10.50.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 10:50:24 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 1/1] ARM: dts: meson8b: odroidc1: use the MAC address stored
 in the eFuse
Date: Mon, 12 Aug 2019 19:50:04 +0200
Message-Id: <20190812175004.24943-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190812175004.24943-1-martin.blumenstingl@googlemail.com>
References: <20190812175004.24943-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_105028_513254_B304DF3E 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: narmstrong@baylibre.com, linux.amoon@gmail.com, ottuzzi@gmail.com,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Odroid-C1 uses the MAC address stored in eFuse at offset 0x1b4 (which is
defined as a "standard" offset for all Meson8 and Meson8b boards, but
testing shows that MXQ doesn't have the eFuse values programmed and
EC-100 stores it's MAC address in eMMC).

Add the nvmem cell which points to the MAC address and asssign it to the
Ethernet controller as "mac-address".
As result of this the MAC address which is stored in the eFuse is now
assigned to the Ethernet controller and consistent across reboots.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 90f66dc45115..a24eccc354b9 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -190,6 +190,12 @@
 	cpu-supply = <&vcck>;
 };
 
+&efuse {
+	ethernet_mac_address: mac@1b4 {
+		reg = <0x1b4 0x6>;
+	};
+};
+
 &ethmac {
 	status = "okay";
 
@@ -200,6 +206,9 @@
 	phy-handle = <&eth_phy>;
 	amlogic,tx-delay-ns = <4>;
 
+	nvmem-cells = <&ethernet_mac_address>;
+	nvmem-cell-names = "mac-address";
+
 	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
