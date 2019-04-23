Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AF7C282DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:15:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65395206A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PwPYZwQz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F9HZc8MV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65395206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NoR+bbg2zyl8gOfof55OZHMddzohClGXGSjQ7kL2H9Q=; b=PwPYZwQztFnlOg
	Kl3H+DEn9+W8VOmYkr2Aglc95/PV2e77EGV7Gus5WwBKSLOlv3RgyNxztyYBR3a0mxErF8px/Q722
	awJeGz5ovbw0F1/2n9xiQuDlPqcJfp9tu7Dd4UVqMNpqYxX7ju64hr0wH4aruzF8hoWIgdHWT2Gyb
	0awH2eHXzcm/HAfay031wkeCwYR1C+jw85B4Wa2AieJ+TZQk0IhSeo4OhOQh4w/so8yh8zcdehSsn
	n+sgbJ4TSXK2W/hEeYe4EuG9mWt9ipchjpRxe4I9k46LDrmanYCIy0Mr++NtTjkPDAGkMqCUXE8Uh
	ido05+mC4kF/ACgdUJ6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrWK-0002uu-Mm; Tue, 23 Apr 2019 09:15:20 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrW9-0002jK-A6
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:15:11 +0000
Received: by mail-wm1-x343.google.com with SMTP id z24so17964904wmi.5
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEpgBoCDht4RP4PwgNxCA0pxhZltSrLODlaosGYp0d8=;
 b=F9HZc8MVHjpTa9CRrAQafrQVIrBphyy7Lb0h2edvMuDsCMf0gYRMn1Tohm/Mhjvinw
 1bwktUtXC1keeIQuGnhcP1/WSj6C3I21plZB+V9YSgilJHqbWYefnNsb7ehTpE4TOrjm
 c9cntMdXWsFNuZ9wmfya+JtUz/prIGzLSwk5/ARl3UqgL9HPvIIoVzt/5uLb81m2k7Ww
 hhlAZ53aQAw2Nr5T2EUiil3kx0WsjAxFhQZCAIuRc97qEo8pC92NDX7oCjwsOmycibq1
 hnteGomN54Z5k9AKKoi8AI6HkQj9tYW6QFnWKj+ZHZuabvizTw/gQTdHXZSifEDUN/n1
 QS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEpgBoCDht4RP4PwgNxCA0pxhZltSrLODlaosGYp0d8=;
 b=MwULQcn3xp+LC2GpeIqXvA3ByUmkvdMGKe5n/ziaRT+T1UYhYHXpEckVAa47deQdV+
 T53PoBRAtePt5lhUJtR98Qe0u8gRyc26w+hfaLYU010RnU3wSnds5WUMlgWFyJwcBJGJ
 pLXVUt5xLXE/uSqzLNqqUHReZ7bm9Ls/tsPIp7h8Ctt8tLcCX3+lmkg5wGS7qESzsnTF
 7/rSVsRzvbhHcWXtkowdAv+en99tu3fznZQGgsbKVG4C0tmBPaGOFnnVodyX4s++MGl2
 I53tjS7+Zsv9Luv7YviE5HPmEGzDZRx9lEmyYVTW0qQrM3UTag3hsSu9ty22fa4PEpWr
 t2qg==
X-Gm-Message-State: APjAAAX/6h3x5W+nt58/0gUpgza8WxaFrJzbJ27rrHBOG5lO51xS4Uzz
 5i/Zf/SHLb31Ssyva65eO+WRsA==
X-Google-Smtp-Source: APXvYqzLM5So+4KWpmNl1mDMA2rbtz4sa3W1/fPFvpctQtpkvQqBfU0YMiTAxzFUAPYVRa9YQsnyvg==
X-Received: by 2002:a7b:c086:: with SMTP id r6mr1388086wmh.123.1556010907660; 
 Tue, 23 Apr 2019 02:15:07 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t17sm12241272wrr.26.2019.04.23.02.15.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 02:15:06 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH v2 0/6] arm64: Add initial support for Odroid-N2
Date: Tue, 23 Apr 2019 11:14:57 +0200
Message-Id: <20190423091503.10847-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_021509_360348_30A2114D 
X-CRM114-Status: GOOD (  12.47  )
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

This patchset adds basic support for :
- Amlogic G12B, which is very similar to G12A
- The HardKernel Odroid-N2 based on the S922X SoC

The Amlogic G12B SoC is very similar with the G12A SoC, sharing
most of the features and architecture, but with these differences :
- The first CPU cluster only has 2xCortex-A53 instead of 4
- G12B has a second cluster of 4xCortex-A73
- Both cluster can achieve 2GHz instead of 1,8GHz for G12A
- CPU Clock architecture is difference, thus needing a different
  compatible to handle this slight difference
- Supports a MIPI CSI input
- Embeds a Mali-G52 instead of a Mali-G31, but integration is the same

Actual support is done in the same way as for the GXM support, including
the G12A dtsi and redefining the CPU clusters.
Unlike GXM, the first cluster is different, thus needing to remove
the last 2 cpu nodes of the first cluster.

G12B clock driver is very close, the main differences are :
- the clock tree is duplicated for the both clusters, and the
  SYS_PLL are swapped between the clusters
- G12A has additional clocks like for CSI an other components

Dependencies :
- Patch 1, 3, 4, 5, 6 : None
- Patch 2 : Depends on Guillaume's Temperature sensor Clock patches at [4]

Changes since v1 at [3]:
- Renamed the g12b cpu clocks like g12a counterparts
- Rebased clock patches on top of Guillaume's Temperature sensor Clock patches at [4]
- Added AO-CEC-B support to N2 DTS

Changes since RFC at [1]:
- Added bindings review tags
- Moved the fclk_div3 CRITICAL flags to the gate
- Removed invalid CRITICAL flags on the cpu clocks

[1] https://lkml.kernel.org/r/20190327103308.25058-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/20190325145914.32391-1-narmstrong@baylibre.com
[3] https://lkml.kernel.org/r/20190404150518.30337-1-narmstrong@baylibre.com
[4] https://lkml.kernel.org/r/20190412100221.26740-1-glaroque@baylibre.com

Neil Armstrong (6):
  dt-bindings: clk: meson: add g12b periph clock controller bindings
  clk: meson: g12a: Add support for G12B CPUB clocks
  clk: meson: g12a: mark fclk_div3 as critical
  dt-bindings: arm: amlogic: add G12B bindings
  dt-bindings: arm: amlogic: add Odroid-N2 binding
  arm64: dts: meson: Add minimal support for Odroid-N2

 .../devicetree/bindings/arm/amlogic.txt       |   6 +
 .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 185 +++++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  82 ++++
 drivers/clk/meson/g12a.c                      | 453 ++++++++++++++++++
 drivers/clk/meson/g12a.h                      |  20 +-
 7 files changed, 747 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
