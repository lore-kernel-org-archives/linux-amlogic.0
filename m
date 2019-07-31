Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC65AC32751
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:14:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4A5206A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hHuAVGe7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wq+OcFSy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E4A5206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nGhg1KrG0Pge/mCZvdnMV2x9tz++gae62bNq1fMiFu4=; b=hHu
	AVGe7z/2oOtxyvaQqSwhHDr0iGeC1c9wfn7W41O7dmfoC8vKmc/NQ6jQBjU7L8POR1Tn8T6f5AgKk
	Wli4QwncP29M7v6aou2Ypyouu/trXOBeVV2MV/WjN0GZS07AX7865g/yZzUyuz90c0c2hmoCRZJUK
	eL/6je5YuTK7dxM9bHVglJYnQSb+8YQyqLE4SSJmHyjPItR+gwsVQhDchiUA3+AF3M+Gqi47YOIHb
	DN6TBmlvoXr/MFDcSIZPq5Dy9LYqDZPhtWYqycv7I/K094xmqORhw1bwfScWASbCSn1BtTLabiIPd
	jOpFhsGHOo/wmFtne+ZxTEJyhKOD+gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsnUy-0005dC-6i; Wed, 31 Jul 2019 12:14:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsnUl-0005OG-Ab
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 12:14:17 +0000
Received: by mail-wr1-x441.google.com with SMTP id c2so66204538wrm.8
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 05:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=LjD7zv10OSEEYASmHj/VO2M7lzphFAaxTy5j9pYxJDo=;
 b=wq+OcFSyqHwlGFEmAGphrBhbP+jw2ZeUDJvnr2ryt0UBu4Kc8BRJiGhW6nT4CpumyV
 SKOb8IQMeNonlQPsKhQERiB/vwfGBTE0wB75t/eaDiGV22IphLZrF1IBc1ENghpzhQel
 ZYhMZKVg3ke0P91tgzfMITOJuO4O8bOJTwI3GPQteEg68oqQb8yfK6SSaGQ0qaQazN8x
 8t8ESnrCXgYEnHfjqb7iJQmssQOB0Al/KAIWguYzWba4gqqGSoYAoZAqEzF9AsSUX7Up
 WaZ6pwGSnfOltvm6IF58V/oAvcv+TGqUo0y3gUuOSsOl361ChIoMnUMxB5ahxtY1gEQj
 ooJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LjD7zv10OSEEYASmHj/VO2M7lzphFAaxTy5j9pYxJDo=;
 b=mBrY6fPxJLZCrLqotc/pnr8DRO8U4rD4rkizlyoTAfnGvLNkJpVMg4VIIR+rvlYwMh
 bIZ5TT50pSXilte3TrFx0CeE9erYDPdy3fQgkQXNpprjuvYWIZolV035uCI5p3jBi183
 aYhBcUiwxFs5R0bcaW1u0vPuOx764R69gAxQPxZgT1f4JysaTS/vr4Y26fX25DlvZEsU
 aSDiVWKVmSbIJ9Udb0XOmRJcxMwxYW+nVrLQNdLRWZh4/hTZ3om0wmC41DTdV+bLG+JD
 N1EHnb2+DtKHAqQkJ9z1ccIhahRsHylWXgR1Fz6jNV7kFnVjGQAuMHwNdkPusNGcCw9O
 qwkA==
X-Gm-Message-State: APjAAAVwYEPXvc9OOixrDk74c797zWLnotUp0k6V7NbW76ElaSVaN6Zb
 Px5xMbanp/1GZIdV3c0w8k/hUQ==
X-Google-Smtp-Source: APXvYqxJbSn0OApVvnN6CpKmYBH7g0bhbbP4QJ0hUCNLf17qIH6FUg3NTYWzUkcC4F/NvISPNemGcw==
X-Received: by 2002:adf:db46:: with SMTP id f6mr5645832wrj.212.1564575253424; 
 Wed, 31 Jul 2019 05:14:13 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a64sm3613713wmf.1.2019.07.31.05.14.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 05:14:10 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: daniel.lezcano@linaro.org,
	khilman@baylibre.com
Subject: [PATCH 0/6] Add support of New Amlogic temperature sensor for G12 SoCs
Date: Wed, 31 Jul 2019 14:14:03 +0200
Message-Id: <20190731121409.17285-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_051415_506786_B6C0D54A 
X-CRM114-Status: UNSURE (   9.15  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchs series add support of New Amlogic temperature sensor and minimal
thermal zone for SEI510 and ODROID-N2 boards.

First implementation was doing on IIO[1] but after comments i move on thermal framework.
Formulas and calibration values come from amlogic.

Dependencies :
- patch 3: depends on Neil's patchs :
              - missing dwc2 phy-names[1] 
              - rework on G12 DT[2]

[1] https://lore.kernel.org/linux-amlogic/20190604144714.2009-1-glaroque@baylibre.com/
[2] https://lore.kernel.org/linux-amlogic/20190625123647.26117-1-narmstrong@baylibre.com/
[3] https://lore.kernel.org/linux-amlogic/20190729132622.7566-2-narmstrong@baylibre.com/

Guillaume La Roque (6):
  dt-bindings: thermal: Add DT bindings documentation for Amlogic
    Thermal
  thermal: amlogic: Add thermal driver to support G12 SoCs
  arm64: dts: amlogic: g12: add temperature sensor
  arm64: dts: meson: sei510: Add minimal thermal zone
  arm64: dts: amlogic: odroid-n2: add minimal thermal zone
  MAINTAINERS: add entry for Amlogic Thermal driver

 .../bindings/thermal/amlogic,thermal.yaml     |  58 +++
 MAINTAINERS                                   |   9 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  22 ++
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  13 +
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |  13 +
 drivers/thermal/Kconfig                       |  12 +-
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/amlogic_thermal.c             | 335 ++++++++++++++++++
 8 files changed, 462 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
 create mode 100644 drivers/thermal/amlogic_thermal.c

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
