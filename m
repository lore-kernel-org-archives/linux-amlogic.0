Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3D1CA9EAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:30:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD822084B
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:30:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f40HTaaA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qEsVLyo5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BD822084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKlMJBPDjcYbl6cIy0OXcrg7SAxWyTYlu7UxIUwUOX4=; b=f40HTaaAzH/MVF
	/QsHbzdjCcZluqTQEGXluGQC3Ka+Ytao5xB2dEnC8ngX39WblwHPnzRCbCeuNpURDDk5xvuFldsRr
	EdREWM6Y5/SjmYLqHasO/9L1z0QME8oP5Yxdom86XtMO6wX7ZOJfl2gxnDGIELe6BRvIX2xNjb3c8
	bImmj+c/ZVaWBeMtTHyk6O/jbOL5Gmr5mzRE4rSNUB8hCMjMe3e0w4ZJ95bFHrxqQzST+wxJCs/8g
	Atz39B1vGYo44qf+TzSS0wwzF6fJ+hkV7rTMHrTzyGt6I+IZJFYHGFJ0R+3MSArQiQJltq10If9jH
	6cmnEj7MWobttGGKu5tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMYhk-0001Ac-SP; Mon, 21 Oct 2019 14:30:40 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMYgI-00071d-Iy
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 14:29:12 +0000
Received: by mail-wm1-x343.google.com with SMTP id i16so13582402wmd.3
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xl8dby32+WRQvYjST6zEPeGq6+V7I2trjy7FQBP1swo=;
 b=qEsVLyo5NG4gK+9ZmATJ8Y72nvHsOzQW/2XXX8HNL5FxWQ8st+Y6iNew+jhz761Aov
 AxFlS+rK7VL2UPuhfT8sGgJ93LZRlMMrES0Yg38y2tCJKtDtdepO/Q4pkDDl7CUnkFMd
 J0tCDLlqfOk9N2PIYHsisU7W/g4Xq33numuOSiZ42WKTbs/aQ431RB03tXMXGT4oAwq6
 2kS9hIYWpnDZyEYYAbPG0GDvCiKAs8q7OLUC1QeE1kSnkMQ8AFHLHuJabqmXyK1HzohU
 Utds4GE7aucsrDlURY5boNivbcp6m5FJ/NmSOoucp6ULMVqaQ50Kzif73tl2lCUUORtY
 MyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xl8dby32+WRQvYjST6zEPeGq6+V7I2trjy7FQBP1swo=;
 b=Qh6mTynIzKTvaTLFMU6NnsJ9Ab4rxbgZ38RkR7jjr/6ajduZECJsiqtVkuoGV9GOKH
 ZE9IZ9HfBwpJ7i3oKat1NSvp4nuS6QJ++sIQkN+tmwxBy5YbuKvjILkPjYIeIJ9Eqn7N
 QmEWDvMRK3sUP0wQIL/6fubOALPXZP/yn/bRG1DOYrJyU4VlRu0R1JP0WSquChLsgl46
 pAd9t4s98Q6jGLlbP49nsluj2cYCgQsD66jg5g3PlOV7SS50ltjqegWd+JEd9Gujs/aw
 gZHsQ7XQ2luRrE5zyIlamL1iMYAgUObEeR74wRMwt+UceMdh3/DLpjiUhaI6ANUyPyGN
 PNlQ==
X-Gm-Message-State: APjAAAWWjvaECjT/sdLsOha0reSsp+b1CmrzWxIZ3fIDKMhQrNmUQFMv
 a8Pn3SGNmFT0Wll9JuP5ZCz419CvzqdcsQ==
X-Google-Smtp-Source: APXvYqx3WVElzku2QZ1szzxkfQy8cYhynmJ0ewftEjT+hqo8LlK3Xt1bRuLtHgfsKsTpIcl6iOakzQ==
X-Received: by 2002:a1c:39d7:: with SMTP id g206mr20289925wma.7.1571668149171; 
 Mon, 21 Oct 2019 07:29:09 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d11sm17304463wrf.80.2019.10.21.07.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:29:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 3/5] arm64: dts: meson-g12b-odroid-n2: add missing amlogic,
 s922x compatible
Date: Mon, 21 Oct 2019 16:29:02 +0200
Message-Id: <20191021142904.12401-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021142904.12401-1-narmstrong@baylibre.com>
References: <20191021142904.12401-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_072910_635865_D606367B 
X-CRM114-Status: GOOD (  11.02  )
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

This fixes the following DT schemas check errors:
meson-g12b-odroid-n2.dt.yaml: /: compatible: ['hardkernel,odroid-n2', 'amlogic,g12b'] is not valid under any of the given schemas

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 42f15405750c..0e54c1dc2842 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -12,7 +12,7 @@
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
-	compatible = "hardkernel,odroid-n2", "amlogic,g12b";
+	compatible = "hardkernel,odroid-n2", "amlogic,s922x", "amlogic,g12b";
 	model = "Hardkernel ODROID-N2";
 
 	aliases {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
