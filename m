Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31796C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:19:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07ACC22CF7
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q0eP1h+w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JvmXI4ID"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07ACC22CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8i38wVq5WxKyjx966uY1rYcpGUbj6qlUqu0yL9OXVw0=; b=Q0eP1h+w1bI9gf
	JMASzT68Ah8j34YaDdTh4cv8X9XqFt3cldfteh5FLOsHMFAtA8IPb9JzeAATaVIKFAdCZy6oe1EtG
	CuUTuOMjibMKC3UGbtZzamE3TlTq29n2o+rqXj6Wob4WuhuRrctLb157sbbuMP+RtY5Dl+4kBfqNc
	n9trA7u56QRz5MjjGhQzkjQH68jqEdmEbn1xjyg5zKqoKAxGbutiftuhgO/r3ds2JywrwVTqaZ0fY
	UsqRmpnBZtZBaqU9ih5Xk+WNPjKVQZnpHX2hUOLEOfIdonSbTmZUyerv30cf4ankgmJLHYw1Pl7A4
	M+4Clkb/1CYSxpBk8o7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i13rE-0002j2-CJ; Fri, 23 Aug 2019 07:19:36 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bB-00013S-6g
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 07:03:07 +0000
Received: by mail-wm1-x343.google.com with SMTP id d16so8025631wme.2
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 00:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vS6xmM1o4WiYAtnye6AaJ1yvjVsYp/heWNStiuUNd54=;
 b=JvmXI4IDuugnF0UEeIOn4C9BrsVkHnPQSawVawISluQUAsOo5lwzWS7ylrKoKm79Ax
 MtG+Ecfz3F8/PO7H+WQKxCXrRGfjinkUy8yePNuykncOuBtVBS140o4XEjcsHPlyLgrx
 CM6KsFCCOs3iql0c4n4ysGcuhAUDJWqv25PUplxEM9quaKrjs5AOQj+Xs6PMg2pGSOzM
 kDsQax7XlQGqmGI2xjPfk2xZr0js4NCHf0rliNWrKNmR0lJBDIJK3ekx1Rthvr0Y4pcf
 YC6eTbJXnb6QXE+0YK0JMp6acJt7izrmdkv3drqeBMf2voNQFgi7ZySr6YR+D89m29Dm
 fHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vS6xmM1o4WiYAtnye6AaJ1yvjVsYp/heWNStiuUNd54=;
 b=EWpQZmw+wVCd1ACPgc7Ei+7ZuBBV/LgX7z/9wDD7XMoILNfSb215LbNwYd1QRV2g1I
 LLYCI0XAKoK842/zKaY0gEpSKMSIVIDaTpp8opoMESWApGudsGfzsKlKy2pavAbLEFzg
 4hVKwbcUloXXvxeDzOe3QtYa1m82s5J/TNtnYLKU4gKBjeCT+KMDcMdtpW5ca5VdnIx2
 Kcht4Hdeqi007RaGaXKH+E12yxRoDUm5y1UaV9yitP/pCAD4CL2StsOkneJV5QYmAoqm
 WXkCVhLCmcK+78FQRlOUK7iLuAMqGIvQnp119ZFcZBei7FeUs7zcXtaQLBbKqs7/fong
 JpBQ==
X-Gm-Message-State: APjAAAUUsfjE0KcfWLwk+gZtVIl4FE+1KO0n5NTLRA4sH53XIlY/hxn7
 gqS1u+teinaEbOeeHIo8hxOx3Q==
X-Google-Smtp-Source: APXvYqx9lHpHGea6NolLMfr9QDp+D+dEO0xlkR9VntWGjp8ouTua1i3g1Oom7QpRBdEEJ8oV8s2e2A==
X-Received: by 2002:a7b:c649:: with SMTP id q9mr3153030wmk.108.1566543774241; 
 Fri, 23 Aug 2019 00:02:54 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm1741833wmg.45.2019.08.23.00.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:02:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [RESEND PATCH v2 00/14] arm64: dts: meson: fixes following YAML
 bindings schemas conversion
Date: Fri, 23 Aug 2019 09:02:34 +0200
Message-Id: <20190823070248.25832-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_000301_977302_4C123B67 
X-CRM114-Status: UNSURE (   6.54  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is the first set of DT fixes following the first YAML bindings conversion
at [1], [2] and [3].

After this set of fixes, the remaining errors are :
meson-axg-s400.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
meson-g12a-sei510.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
meson-g12b-odroid-n2.dt.yaml: usb-hub: gpios:0:0: 20 is not valid under any of the given schemas
meson-g12b-odroid-n2.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
meson-g12a-x96-max.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'

These are only cosmetic changes, and should not break drivers implementation
following the bindings.

Changes since v2 at [5]:
- Rebased on khilman's v5.4/dt64 tree
- Collected Acked-by and Reviewed-by tags from martin

Changes since v1 at [4]:
- Added suggested commit text from Martin in patches 1 & 2
- Fixed NanoPi K2 model name

[1] https://patchwork.kernel.org/cover/11083597/
[2] https://patchwork.kernel.org/cover/11103229/
[3] https://patchwork.kernel.org/cover/11083649/
[4] https://patchwork.kernel.org/cover/11094063/
[5] https://patchwork.kernel.org/cover/11106927/

Neil Armstrong (14):
  arm64: dts: meson: fix ethernet mac reg format
  arm64: dts: meson-gx: drop the vpu dmc memory cell
  arm64: dts: meson-gx: fix reset controller compatible
  arm64: dts: meson-gx: fix spifc compatible
  arm64: dts: meson-gx: fix watchdog compatible
  arm64: dts: meson-gx: fix mhu compatible
  arm64: dts: meson-gx: fix periphs bus node name
  arm64: dts: meson-gxl: fix internal phy compatible
  arm64: dts: meson-axg: fix MHU compatible
  arm64: dts: meson-g12a: fix reset controller compatible
  arm64: dts: meson-g12a-x96-max: fix compatible
  arm64: dts: meson-gxbb-nanopi-k2: add missing model
  arm64: dts: meson-gxbb-p201: fix snps, reset-delays-us format
  arm64: dts: meson: fix boards regulators states format

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  6 +++---
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  7 +++----
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  2 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     | 19 +++++++++----------
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |  1 +
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  4 ++--
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  |  4 ++--
 .../boot/dts/amlogic/meson-gxbb-p201.dts      |  2 +-
 .../boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  4 ++--
 .../meson-gxl-s905x-hwacom-amazetv.dts        |  4 ++--
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  5 +----
 13 files changed, 31 insertions(+), 35 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
