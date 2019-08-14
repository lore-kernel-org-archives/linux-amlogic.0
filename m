Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3629C433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 999732083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ltu9oxbw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VAPOmbqx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 999732083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lurx/vIeJFOh2YJsoTMUCd4XGrl1kVsThKHpMBO5jXw=; b=ltu9oxbwKRhkLd
	DJruA9CaVvebr0Z4ZQ4o9UGi55Glmtoc/Z9LYan7WMWwLvg8gJ7k2nLC+oPJqKpv+QOD1J4OTAaXj
	hf0PjRplYNWCV7TuM+rgOJ/664YPAV0pdSohCG6ZcZnG0M/+sCfelWWgdEcgvZ37nW9sCa/SEjv8g
	Kav9tPZqsYg2ohsISSyUegG9xjOcIXREya123gooeXOVXnwZWBG4h2bxPJlQg2tzyWgYZXcbJxHs8
	nUvHW05WdRjpyz/TIkU93Fh6LMrHfBTXphSEv7c58ZluncHjOiNd9BJp9XgAFNOIEo0uIyfs/H8Fr
	VZtsapsPYFwOgB/vv5LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuHI-0002Zo-5j; Wed, 14 Aug 2019 14:29:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHE-0002YP-Jh
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:27 +0000
Received: by mail-wr1-x441.google.com with SMTP id r3so17571024wrt.3
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2IzMeyCw4b+7DKgb/SLhUrPAysAZa9vx3wztCpi4ATU=;
 b=VAPOmbqxGPwOnu/ahhV4JorGqlJkzO90cqNgECVmwc2YqbZP4mROMy3dXJ/1sfFI2J
 jpBnqHM3N6+eifsigJK3AM8SWvVHh4wWhSehha9PO4sAK1anbFSn/RGHNHxq7dvKwqTy
 3waODWYiIhnsP9Qs3ebrS22URajl2LL9ObAK0jz+9ntmB3EaVgVpsMlH3xLqe6dYn/ac
 C5xCtCa6nzJbuFhbESygbFQb8Q8Twmz0CT0wMj7r4ZhgGWS35T2jXiBnmdRZqpIFo5PD
 eXitIImiYDiCADlNI6CfhY4pRc5db7iQCHmxtlXUjG2D1ZCcjZt6OBQlqsBYf9Gd5FU6
 F7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2IzMeyCw4b+7DKgb/SLhUrPAysAZa9vx3wztCpi4ATU=;
 b=UoBP6xynt+sRQ4oCK2wWXiB3QhzuuhH+z5li3hCXjuE04vwEm6bmXRZ3I0Hh09oA9k
 NhjnCNy13Fc7p/6bGT/S5hhOS8kQAHB2FOWC26S2608dmiAJOgOxwC8w07r1Jsq8IVeM
 qIpHYYsiIz7FyKZfuORIFrcQJtUdvg/cwyME3fBX56MNM3pFGxq0q1BeVJOayxlo+QSI
 /pPsYRWey80Tigk02Sj6JGkOD8nGx7lFtc0deCx6LE0PC0it/piWGlwZnTP29jQZ1Wbw
 v8c7jBvJWSJXIxPfwkbwApRCV3QWc8tcyGGF3EQp5llPXn2IrpktsJWFrVLdStDzkLSB
 ENqg==
X-Gm-Message-State: APjAAAW4J/e0kYmJLi1Bp/UJ59zxXLptTzFpK5TdBTkjt/Kx5rG8tSkv
 IzurdIRDZjdvmIXSMe0OBz9+3Q==
X-Google-Smtp-Source: APXvYqytAei+jJQfHJhChYLVNukfzd1vwskFZJVslXGn3U/8AlBoTjX7g3J6RtLDiVTl/Q6LfDLoGw==
X-Received: by 2002:adf:fa42:: with SMTP id y2mr53881666wrr.170.1565792962947; 
 Wed, 14 Aug 2019 07:29:22 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 00/14] arm64: dts: meson: fixes following YAML bindings
 schemas conversion
Date: Wed, 14 Aug 2019 16:29:04 +0200
Message-Id: <20190814142918.11636-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072924_645830_C64BA12D 
X-CRM114-Status: UNSURE (   6.27  )
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
  arm64: dts: meson-gxbb-p201: fix snps,reset-delays-us format
  arm64: dts: meson: fix boards regulators states format

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  6 +++---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  7 +++----
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
