Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0ACC2BBD1
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D7F2065C
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oJl10vtK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="028KlmU2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D7F2065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ssa5ddeVerAPe7/cFW3PvIGCDePnT2defjuFwhPu3YE=; b=oJl10vtKmaXZENAmaLanSvl2E
	kOMC9DHWDkkyCozFnixlBVinaSQKlSuING2uZ4nLIrPzeeNQYGycy+Iz16s6qsPoK7cJmA48L6gG+
	Z40DtknhLEWSq5RTrmLRlRlaDzeGjMpJTvNx90yqjCAiD2AVrOuEJH04olFv5Yv+hDgpbeqCDxWc7
	tIUQ7K9HThnZGae7FJU5NB5ldQZfZ2+hwKdi70ma1ZsVA4CdP5oQJzkUGVkHoUwQ3Bvm+HOCpfj1J
	dN7Al1Xi95JlRcoNg/mTIQXdiwm+Do+wgR038fA6H8cggvAdwmQK6NXK6DlqdXXbMDj+IGF0UjhMS
	AHaYbBJ1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInuW-0000ec-HY; Thu, 17 Sep 2020 07:00:52 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIntn-0000Ls-6C
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 07:00:12 +0000
Received: by mail-wm1-x343.google.com with SMTP id x23so839755wmi.3
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2020 00:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nh4GdIJJbybBRmBf+gZ13SWErJtKYoaJY9ok96suIOo=;
 b=028KlmU2+WuM/M/w6dvQvAw4gzelsPWlRz7bmqYfPpZX3WFwx431DJAvmmBtpDgZYj
 Q+LJ/9h99RBMQISoeUEKAJiy4EXP0SNcahPA1kbNDHAAKar3Tz44sc0X89XO4X2InKMZ
 Ee7ARd/zXqotYZwIpxHkmgjKfOUruIm4DfT6gyByi1jE3OoAPCKBqCJ+KYPDmrJCbkjB
 88kt9S2JioJwL3MFUDnrvb5hGomGHHu/erXlTQ3gjo+BnWqC8qTSPQGsilUNAKa5YurH
 Z1WMD/eH8xvjfdt6+g/FDGN3M1vTG+UNnkOwwnLY7C5+7c2yvE8xH///FhwNZw46htBs
 5oPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nh4GdIJJbybBRmBf+gZ13SWErJtKYoaJY9ok96suIOo=;
 b=nWtiuVd3QaGM9lJz5OA6zEmOQC/QWZxpV7vyr2yJ3/2oX/4lWHjrcau6ZbLfOcHSDU
 FQkSDsuf0kgEzrgveE/CcnetnakkOKndm92d89/3ivsqGc7ZSwEq5CFLMWeIROV8Gcjo
 a+ovVRgz7cxW6jjcdTJzCRMNmVU+s3M2NTezDWsJne0jQq8und9G7MAQo7tQcVAD+CWb
 7bIE/5jQVGFceS0vf/fb1JkbQFzt2ghG4fXe7Mo9xtxWjJAL/SzN7deCBvfH7ZhkutfQ
 PBgxO7Ltt/xELll3w8YDXP2iEkBICtUOazCb0aZKg7GjDJ9L2/eSoE8G9toJRKoN/2Sy
 /RyA==
X-Gm-Message-State: AOAM5328034egdaGtvgE+me6YQodcKmYjZmJNaS/6p2S62KMtZ+8Zf9i
 xpID8w0zlkDbPIEB1OTHP1bOFg==
X-Google-Smtp-Source: ABdhPJyjeIXkATG0vP51yK2uo6XEBRO8bjCqeGDjxeohvfzbr3xkDk9Axc8TM3MAeWczPQ7AZqJEvw==
X-Received: by 2002:a1c:2e4b:: with SMTP id u72mr8469691wmu.69.1600326005809; 
 Thu, 17 Sep 2020 00:00:05 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z14sm35709055wrh.14.2020.09.17.00.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 00:00:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 5/5] arm64: dts: meson-axg-s400: enable USB OTG
Date: Thu, 17 Sep 2020 08:59:49 +0200
Message-Id: <20200917065949.3476-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200917065949.3476-1-narmstrong@baylibre.com>
References: <20200917065949.3476-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_030007_295064_D7D430BD 
X-CRM114-Status: GOOD (  10.25  )
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

This enables USB OTG on the S400 board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index cb1360ae1211..7740f97c240f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -584,3 +584,9 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	status = "okay";
+	dr_mode = "otg";
+	vbus-supply = <&usb_pwr>;
+};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
