Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1E5C04AB1
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 09:16:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5023020989
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 09:16:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WBaVjj4G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sbkFKWTh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5023020989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J7HcEY/xHbVIyekPHmMYeDDaKWLWJ/Al3VhT8g8kMgY=; b=WBaVjj4GwoyDJZ
	mefh6KMgWyL6GHks49C3X4i9ZG34F6q10CBbOTLnDaXf2XCSoVLM/AFoCXzvfamREN7Gilfe4LOeZ
	biZBjio0A4Kq9plFQy7WejwvIVqKTjxLKQpFFUeU6bBFGm3Xw21LkvjDY7OsKMNcctZK9b0P/+Hwg
	vAapMOh42580Zlg1Xf60CurbFQrawYozZxKcjxuyUHh++r4GIECc78YI8GKJjNLKELFa3+enyRXWx
	h2I9qI0XIMqVSiunoLoNm6jnxVM1E80rZdRsJhqWmjbFaARA1n/VbewJlcXpTcKH1qk/Hxasa/pgX
	4bYfhiI4xWwKRKRSfBKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQ73z-0005Cg-EU; Mon, 13 May 2019 09:16:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ73v-0005AF-Uc
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 09:16:01 +0000
Received: by mail-wr1-x442.google.com with SMTP id w8so11904752wrl.6
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 02:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UzIz/OqhDW/aA2hwotioqmyYDuvBlglmy6CuzpgH6sA=;
 b=sbkFKWThl7SS5AJ0CygWfFeJN0O3kIB0+t9Vbb1WtqGtQop4D5UImzY3w/2zHaMszb
 i2J54jvYjY1fOlF5bA35RWmnT98jFKLSLvIVLSoO8PP7D/ve/VhZTo9Fimdobt4oUfxj
 m3qq17QF4zEeIsIs6qRq8mwYn0tpc2oCkLBj67jRJQr0z3IsE0KK+xb/bLvr4OTQ25Yd
 TQJIUmCvXxM0oUoDJa0Q6k8FlYO168/Gr9T74jKF2s0r9JAXBQ2YZGvd90GfTBMB+NwJ
 5R9/9u5Rl+S6WAEuxnfUAfG+bb0Vhht4Z7X7nKNIvwjnhJSabOZHL5GqZ43vGh9ohjih
 NK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UzIz/OqhDW/aA2hwotioqmyYDuvBlglmy6CuzpgH6sA=;
 b=lSNu1nSdgEUlIOMCJr1deiTg4QblYGcXfi1Qve4nenSSUMgaeTTI/G1OJixebyBvoL
 +enHfdjr3et0/Z16Y0p3iSud5LrzB63rvsOc29J7yLqkai1affGws0h6lTBBwj/9JyfM
 F+LtbXgmB0UltT6SFmfZp3nva0gx3iLPJGtEjt2KRj7jE8gAA+B8SB509bIQ2hz3tRuA
 0KpPz45FFuWp8j7m2ILE2/wQGL+LQCJkRAagN6KXlvd2kskX9sauSndbqzw0M9XCckxG
 dD+4El6dR/POlho2SqSEiKkK26GbGTSSuiyc+euLRaFU1aB6RCOP/j4LjLa6joTde2bN
 rb3w==
X-Gm-Message-State: APjAAAVkI7EGlX0zKLnZmzX7g64Q+LWfyN5NXyTEbJxemJ9Dhkeeq6AF
 a5Wdlu+d61vlDDESg9w7LkiruA==
X-Google-Smtp-Source: APXvYqwNxZZ6JRa6sE/oBLQu/a8gQ1CyT8Fbo4TsPCi5L/1sJXP8vvCMf7wXzFjAVlU30do7KcyBFg==
X-Received: by 2002:adf:f44b:: with SMTP id f11mr93972wrp.128.1557738958141;
 Mon, 13 May 2019 02:15:58 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g10sm10795091wrq.2.2019.05.13.02.15.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 13 May 2019 02:15:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org,
	khilman@baylibre.com
Subject: [PATCH 0/3] mmc: meson-gx: add ddr-access-quirk support
Date: Mon, 13 May 2019 11:15:45 +0200
Message-Id: <20190513091548.16674-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_021600_033390_83CB0197 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, baylibre-upstreaming@groups.io,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the Amlogic G12A SoC family, (only) the SDIO controller fails to access
the data from DDR, leading to a broken controller.

Add the amlogic,ddr-access-quirk property so signal this particular
controller has this bug and needs a quirk to work properly.

But each MMC controller has 1,5KiB of SRAM after the registers, that can
be used as bounce buffer to avoid direct DDR access from the integrated
DMAs (this SRAM may be used by the boot ROM when DDR is not yet initialized).

The quirk is to disable the chained descriptor for this controller, and
use this SRAM memory zone as buffer for the bounce buffer fallback mode.

The performance hit hasn't been evaluated, but the fix has been tested
using a WiFi AP6398S SDIO module, and the iperf3 Bandwidth measurement gave
55.2 Mbits/sec over a 63 Hours long test, with the SDIO ios set as High-Speed
at 50MHz clock. It gave around 170 Mbits/sec as SDR104 and 200MHz clock.

Neil Armstrong (3):
  dt-bindings: mmc: meson-gx: add ddr-access-quirk property
  mmc: meson-gx: add ddr-access-quirk
  arm64: dts: meson-g12a: add ddr-access-quirk property to SDIO
    controller

 .../bindings/mmc/amlogic,meson-gx.txt         |  4 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  1 +
 drivers/mmc/host/meson-gx-mmc.c               | 65 +++++++++++++++----
 3 files changed, 57 insertions(+), 13 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
