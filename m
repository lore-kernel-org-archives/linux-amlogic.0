Return-Path: <SRS0=MYl2=4W=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC90C3F2CE
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2020 03:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8751D2070E
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2020 03:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3rYB6z0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBqRIV3m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8751D2070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=G/ty/kTn8p5ODDPJHulHlUDPIw5w0fDs1WgBBwnX1Xo=; b=d3r
	YB6z0ZWn2VRFAn+5xrJkRDnO/JjOXrC+RFJS+Uc7d1PFu4uD+Cvb2pyeb1JYpyGyc9C75GGpkBqHx
	UOl319FEr0P/3mtfFQg02fpO72LyXoKYSf8l4fJlsSwnh7kTMrE5QM6dm5+Cztl/CzPLA0GIwXj6h
	RIUJfoxz1b2U1D5rwOR2pVODZmL2BE9J2XcPuqkTzH/XzwnWo7xdWjQzvXhYykFrWcvFwnemjIIj6
	iLYvB8xYRqPV1kNzbPzjM2dxUB97/rvUFkQvm39wMIUR3CFx0hq9Qooiszpsv1SKRePyJT+zSsZ63
	OBCS/07LwxLf5HFEsRsHtqzS4OtMl7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9h63-0003ew-FB; Thu, 05 Mar 2020 03:22:51 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9h5u-0003Ws-KV; Thu, 05 Mar 2020 03:22:43 +0000
Received: by mail-lj1-x241.google.com with SMTP id f13so4417315ljp.0;
 Wed, 04 Mar 2020 19:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3mB+9DFC1lhPqKCLUg8wWNOr6OLdsbgJhYt45juNV4c=;
 b=ZBqRIV3mw57AzVzWvfRKqbJP+qj4XrMyTc3hniC+bx8+Agj8CUUIZ5v3MHzOTOhlyZ
 +9S6xfpvbS/8sDF/ipsgcmrHF2666OlRC53ZU0gxPEqxgdhcY6M3KUykkPsTtF1jWwMS
 fVGjiF0eyxO4DoUU4mrQ5SowuqCRSRDjX3Ho06fgKMcSyJkfC7YgbB+D8jQkmGWyAwUv
 VV+SGQD/cocVl9eJw65LLYSE2FXMN74/e8kmTTSqr4Us48ZQ1kvOWWuEPAx+64km0XRM
 bNFOhGCHKVVnXkvaArgsvKRBCGZR+sxd4urguclTv/DsGN7/PNiczl0XVZ0979C8s2kg
 /aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3mB+9DFC1lhPqKCLUg8wWNOr6OLdsbgJhYt45juNV4c=;
 b=DMzLgVt2YM8wf0Qm8P09cyMLZizQXD0hlBnA4l6MiR9KyOFJPE1pZk0ClgS19f6XvA
 lgqit+NW6oap7eqUC+jOb4/NNFxU+RTuqA3m7K3E0M2YQdw2Yrl9gMUeEvpMrrJ5f/2w
 5+BXqZsRKPLapG0WnR6D1wrBg5R0VyQXifbePoXo++NV9+xxzaZP/wc6df751m04S3ql
 Fcf2mrOCix9vNZkcbysYa5WQDCkCR+iJJhKDnWzjj0JwTMmLhFaxtQi0ynKL1gKw6+OE
 R21841CxyFQklIZzqy7WQR0HblMnJ1RuqcOk8AAOgfYYhIxLl7D2Q07OcUbpc/nxnAfq
 6QOw==
X-Gm-Message-State: ANhLgQ3PVyTM1xyJ7CcTOin+0EZADACYy9LJ+KAfyAWxdTm9m8Alxwdl
 YKs/5sPsFrL3cfzFtq2Ia74=
X-Google-Smtp-Source: ADFU+vsT8c8IQQAuagnGyzjVSQWhLBYwqhCPXVcX2ouaJon7zOHjLn7537bD/t2sH6K53/W2qY5BnQ==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr4067684ljk.220.1583378559246; 
 Wed, 04 Mar 2020 19:22:39 -0800 (PST)
Received: from localhost.localdomain ([37.76.255.38])
 by smtp.gmail.com with ESMTPSA id u5sm2865688ljl.75.2020.03.04.19.22.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 04 Mar 2020 19:22:38 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: meson: khadas-vim3: move model to
 g12b-khadas-vim3 dtsi
Date: Thu,  5 Mar 2020 07:21:48 +0400
Message-Id: <1583378508-14312-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_192242_700365_43C8DA65 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The common meson-khadas-vim3.dtsi is now shared with VIM3L so move the
VIM3 model name to meson-g12b-khadas-vim3.dtsi.

meson-sm1-khadas-vim3l.dts contains the VIM3L model name.

changes in v2
- fix typo in commit message

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi | 2 ++
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi      | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index 5548634..2b2d72c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
+	model = "Khadas VIM3";
+
 	vddcpu_a: regulator-vddcpu-a {
 		/*
 		 * MP8756GD Regulator.
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 90815fa..0ef60c7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -9,8 +9,6 @@
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 
 / {
-	model = "Khadas VIM3";
-
 	aliases {
 		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
