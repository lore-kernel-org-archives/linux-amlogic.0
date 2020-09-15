Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A60C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:24:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72B14206A2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VFS9TpoU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1EPC+KP0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72B14206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n3YeDJ5LLFOkwrmYqMtIelW8zjkyty110LelkS90dH4=; b=VFS9TpoU2JOf1B6R3wpFGBLLxD
	MYnb9Z50QwnwzjE34sGka+qSsf5hdoetNCYI14EDMwHq4OTwJEZPoISzLKpgRKfzS1OBIfozPgD2p
	68GUZ35t2lO8Ie6uOvUcDAOShONWj4cacCotRCNGD1rSIsjs0L6lGzStjowDi2rQn0ObfV00CMzQw
	+QZtQsLqmZh7AYjl+en9RD+qdQs5Iza2xEwhQrpUveiBoXW42MsDwCQuMK9kOVIgF+fq9PlohldOq
	1XzZLwlQj6tBMmKlzI1hqGGmht4kfiZAp7oje+IUVStDma5J6x6vlMUIFH109A+RoH9av1C9xStmp
	XMRMGITg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICp2-00081W-4T; Tue, 15 Sep 2020 15:24:44 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICox-0007y5-8b
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 15:24:40 +0000
Received: by mail-wm1-x342.google.com with SMTP id b79so3877554wmb.4
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 08:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/YvlYC1RkwagSWOgfzPVUM6G4NaBTVomn2Uo8AkuMv8=;
 b=1EPC+KP0aZPtdyM3wms/b47DbGt0Tncted7tEwXyqUDHklpcp76Dda0a18+eYz0yeE
 DwvK+rYufHdxRRKmqIcP7pT62QPTelg+haVhayfv54o66zS092EnBEV1PzliwfBBGDZE
 dlJcOv/gPGvysfE6xkTkGfio0MdZT7zWOlEsxDbuj0zgAy4/cShVq///XdVmhaCjVq9S
 1v+o6Il0aD/yxGEbZ3xymJlaL+VK8+IPkUOgo6KWpEpvw+8njbBSj+zWIYNLc0j+YQnB
 Pi4mZXFirf05Y/qmS88Cfw/HNAjdxJSJ2+KxGa0uW9QkpuZZc5kEoN4NUD4mew4GiXS/
 cC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/YvlYC1RkwagSWOgfzPVUM6G4NaBTVomn2Uo8AkuMv8=;
 b=rXGXkibTUbGqzNe4xVJKmZ5xrDsWBxKE7y1PnspXHKzmkzngjdEm+Va3atkIbvPpCg
 2OL6ioz+N9ZGpDfMoTXVbNSYVS4V6zUAKqzrf2OnUSbJTICoAzjdlBtmM7S2yv5SIKqh
 ayCH+w7BWMJV692NnQ14b56rFuEOR3cTbm3/RZhPtSU8ufCF8rkrhqxIK/55IDcN2CaQ
 ZsQgHjSO+b5zj8cMIcUg0U0m7riWdfIaB5PNjJSqMnH8byBmxmCdP5XDUkhCxVJ5vuz9
 lYAZ1fiifNHtquLC9sOSJ05jurt7wAW3QVd0GTsB6InqCElIZQbhgdEUPQXINkCIlQqw
 tPlg==
X-Gm-Message-State: AOAM5338fuOlF2A2y8w31spfjV7GeQtl4a/cAE76usiPmgpnehwLKeMH
 vtux6UajdSZEZnBrY85E994RulqqHV0414Yl
X-Google-Smtp-Source: ABdhPJyo5nS8QJrtlCFkixQwydV3HaRNx9OMlTFcstqWtdH/QmwI9+Dl+S+Kj3zh8r8GLuayAi6S7g==
X-Received: by 2002:a7b:c958:: with SMTP id i24mr5517065wml.50.1600183477852; 
 Tue, 15 Sep 2020 08:24:37 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 189sm25984960wmb.3.2020.09.15.08.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:24:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 0/3] arm64: dts: meson: add support for ODROID-N2+
Date: Tue, 15 Sep 2020 17:24:29 +0200
Message-Id: <20200915152432.30616-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_112439_453096_A38E0BFA 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 tobetter@hardkernel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series splits the existing meson-g12b-odroid-n2.dts into a common
dtsi and dts, and then adds new bindings and dts for the ODROID-N2+
which uses an Amlogic S922X rev.C chip that Hardkernel supports with
the same OPPs as the A311D.

Changes since v1 at [1]:
- rebase on khilman's v5.10/dt64
- get all review tags from v1
- use the A311D OPPs, after review of Vendor kernel, the Rev, C uses the same OPPs (freq + voltage)
	as the A311D SoC of the same family

[1] https://lkml.kernel.org/r/20200719141034.8403-1-christianshewitt@gmail.com

Christian Hewitt (3):
  arm64: dts: meson: convert ODROID-N2 to dtsi
  dt-bindings: arm: amlogic: add support for the ODROID-N2+
  arm64: dts: meson: add support for the ODROID-N2+

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-g12b-odroid-n2-plus.dts |  31 +
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 618 +----------------
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 625 ++++++++++++++++++
 5 files changed, 659 insertions(+), 617 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
