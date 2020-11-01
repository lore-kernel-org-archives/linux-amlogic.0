Return-Path: <SRS0=biGq=EH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51746C388F7
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2020 02:10:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3F3B22254
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2020 02:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EWT+dIDL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjrvHAWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3F3B22254
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tMtxaPMCXpHuOlERPFw2mafp81Uuc7x2lC8IZtsolZk=; b=EWT+dIDLepZRo2pZImXKt5dP0i
	GzFT/StSbdZRlyurSsHgDZa5lJPwIflv2ORIU1ZVb2MMVUWnKKCBUzEd6hC0SFO/Bvgi00Eq+8zG1
	UsLKh7yQOVc9eG3nplJTRYh5d6H3fUZE5GLoVWGnRWqvlpRWlTHDFtmf2y0Fb+cNQfbcfSUPkTvWF
	9rMWj6NMKF5umt9eIpmLDsSQMLRS2iTxGVr1wsSO3N9ZjoPPq5K+ClJBaUEhhN/OycX0UsnthEb4R
	27V/8yGfDjklpQFe+thrq8olF3cxKLvn+JVv33GO6ET1VH/gufM/SQ567EFfAlBKGvx3c6hLD/vsW
	9S6J4d9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZ2p7-00015I-Ky; Sun, 01 Nov 2020 02:10:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZ2p3-00014H-F7; Sun, 01 Nov 2020 02:10:22 +0000
Received: by mail-wm1-x344.google.com with SMTP id 13so6170796wmf.0;
 Sat, 31 Oct 2020 19:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KLsJmKNArZL6Pckf4sczu0a6felhVt96z+x2zjsh5BU=;
 b=sjrvHAWeIWkM7yXyzWCni0Qd5/o/ydUKaPVGM5u6gdnPDe3koYkEfIzbYiDwWzDNto
 w9cC9ZpcDrO0DMdjig0zVRG0YDlRqZ6LNGdKLlrmNW5eNhP+vb9DzKDDUwzMAZOWN/0O
 aLNkMw/6DBtegeKJ/0pnoMzcMWNvhoDM8CrFaYHFSi0lTA97ZqIwNBzZhkYAi895KDJL
 b5OGC6lfJYcdJCQJ1WzrNRftz8nEicb7kgJyH7panxdA5atChMfEjVeu3FwoXsRGOLxY
 athr3hSBYU5UB42DeUFuUY9PnrhwezwjdoZ1iQ0PMxP7WTvL5N/lRGP1PIvHB3Mwgz7+
 MlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KLsJmKNArZL6Pckf4sczu0a6felhVt96z+x2zjsh5BU=;
 b=Jv7Jl5zjUcWC/BMz5fJ4mso4/EL/j+u46UHt8n1VJMq8MMFkhBiaGgz5j2ogIFBn8a
 fz71xKn4cl6sz5hhIIlgwrxQeRiPaZms631DYkEbZwcKVWirr8rHNaK4GFnAgSaDvwhv
 kIMwgDVC/hmq2p4x/pG9rv4CqrSOoWOgWjx0s/UedWqME8H+OJLcv+Z2i7s5ABm2k/BW
 KMDjskwy3/k6xYJgYnQ48w/A7J5FdHAAIEVJj+q0dEuLcteMkhMWKRH6nzPUrvWMTRZO
 wkUcvQa8ivpBlDgm7OIvgGbzzSVcQODaNvbrxfDBco7AdkBc4yKI8/KjrV+qR2krs7BP
 h5bg==
X-Gm-Message-State: AOAM530HOezjB7eO5Oo6j/ReahYFDT69CIEwzpJ3LGmELUCoSghVnAkg
 W47FxVX8VACo8dIHvcmwOxM=
X-Google-Smtp-Source: ABdhPJzcMo1M6zDwKr7uToTCOAo8Gc/0y8/1UPRhbLyRpSvyCQuMifM4miONOBZtMBHC60wlCvoDGA==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr10760131wmj.72.1604196617939; 
 Sat, 31 Oct 2020 19:10:17 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h81sm2291971wmf.44.2020.10.31.19.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 19:10:17 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: add watchdog to g12-common dtsi
Date: Sun,  1 Nov 2020 02:10:12 +0000
Message-Id: <20201101021012.24519-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_221021_541778_6745D379 
X-CRM114-Status: GOOD (  12.32  )
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

G12 vendor kernels show the watchdog on the same address as AXG
so add the node to meson-g12-common.dtsi. GX boards inherit the
same from meson-gx.dtsi.

v2 fix typo in node name (s/wtd/wdt)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1e83ec5b8c91..314095b79a45 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2179,6 +2179,12 @@
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			watchdog: wdt@f0d0 {
+				compatible = "amlogic,meson-gxbb-wdt";
+				reg = <0x0 0xf0d0 0x0 0x10>;
+				clocks = <&xtal>;
+			};
+
 			spicc0: spi@13000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x13000 0x0 0x44>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
