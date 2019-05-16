Return-Path: <SRS0=Bf+g=TQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239EDC04AB4
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 07:14:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB7BA20848
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 07:14:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="egmpsTFG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hIzpxAqG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB7BA20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ksBd1RhlGFirZWclJHhBjdTDrmjjHTDFc84jhDE6z30=; b=egmpsTFGSxFZFm
	31SU45jHlCeYAkfN/zQB+B6XVOSGhsTrpc3J8SKpIFxAI8g7Nvepbq/navu01wJHwRN2voZlwl7PB
	bwIG63sdDSBZ0DDLgggwP1dAVKjmHHH4W9Dvwes0RX5TxVEQhFgCpltKfmwZhXonDzmnNavCEb2hF
	IwOGIShkh+qiC+tOH8RVAyWDqOgOZbyOYYvjxIHO61u7amE7mTOU4Wr/OzPS/IgVyfE50STsXrAZU
	TjnTKnVLCpmaQDb6/m1Fub28B4Oi8UBM0x1UPeTm9Dt2Z1dQmIOeACPjNYGO6j3OvfdIBH/3qiEWB
	3TjMktEEKG3Ml6Dsrjtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRAag-0001I6-57; Thu, 16 May 2019 07:14:10 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRAab-0001HJ-VF
 for linux-amlogic@lists.infradead.org; Thu, 16 May 2019 07:14:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so2056881wre.7
 for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2019 00:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VfCCJLVSfHmoPDAPoxVwjeh8RznaZsaWhre6aDFNPIM=;
 b=hIzpxAqGm2mhKRJYGO+YsjXJtG3/Y3HV1euq2BEEfoOJk4PDOeGY/qCyeApBn8Ueq0
 V7kJVjFDtawFjNmvTzpxqx1rbpRxVdsqbNJ4cC3WcC6pzlKnLht0aS1u8/PMjDvJnCeK
 nfzR9L6tlulhvTKK9hFXNqtrubFaHwYa0BhMwPzRgdUFY8HASnBcI9uy1IZLcZJ5NAHp
 o5lqypEEXV96kU4+iefo6p+9eXh5YLnFPiZRwzx5/06TL77E9tJozgTquElaAF6VA3/S
 RA9kg3I6agdjesBqj4Is+osqQ9hLHrzxTcs6N5hsuGH3dixd4Mf4NVgIEip32AHIpJ74
 rVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VfCCJLVSfHmoPDAPoxVwjeh8RznaZsaWhre6aDFNPIM=;
 b=MaDPON16/6NcHhEPj9vcZfF1m6f9z1ywxpP0qjuvmTNH0ZCBJcKmQ51TiYTWgCmzuE
 aRenIecblAINK6B72lpACpbI+TuvvnlBHoGcmryn55geq6JhNLV1Zn0uowH7jrY7mgov
 rRDtCqRfEF3gJhyu46Eiz6fuB996cvnNaAFxgbfxZ6TXRLKDDii0e+f+VhgmMIEjbSN9
 nC4Q0fnOBu90n7QFxM/8SthiCv/D+kbepr2hnSJAdILcDTrxxm1pINZHkdr0bZpDL4LA
 sR9Hhj5WTy+4oj7sME/2xf+ASz/FT5Hf/zLxrqu3UINrmr+xCbUqI/D2WnCn/iy7wVXB
 vRTQ==
X-Gm-Message-State: APjAAAVr44/BzfFA8JooYNDKLbLS2IyLbXsaxpWtklSos4N8iKzErnoC
 RQ4AjWYytKPyv85fvCkVmlMAkA==
X-Google-Smtp-Source: APXvYqy6tYfmy3A5aGFSOaSVHlYWAwVjpgeh4xahSE6WzNjqgCYsJB/OQVjBgZAzXUNEhgfdt/0vEQ==
X-Received: by 2002:a5d:49d0:: with SMTP id t16mr19217158wrs.324.1557990842582; 
 Thu, 16 May 2019 00:14:02 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x187sm5454331wmb.33.2019.05.16.00.14.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 00:14:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: sei510: add bluetooth supplies
Date: Thu, 16 May 2019 09:13:55 +0200
Message-Id: <20190516071355.26938-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_001406_066541_A2C0A0B4 
X-CRM114-Status: UNSURE (   8.31  )
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

Add bluetooth vbat and vddio power supplies

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 61fb30047d7f..dbfbd50359e5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -170,6 +170,8 @@
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vddao_3v3>;
+		vddio-supply = <&vddio_ao1v8>;
 	};
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
