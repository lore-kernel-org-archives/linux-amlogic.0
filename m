Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC743C28CBC
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 08:07:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5432B206D5
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 08:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XvhPK1Xa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QDOkJjkI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5432B206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ugue+8FpkwT2nV6f+odXW1vqYZXiekie2FPyCEw2JjQ=; b=XvhPK1Xa2CQ6ky
	Y4gNZnRr8ZpR7YQ1gwLG810NVAIVHjypPaVwQrHBEtZnvHvMobLCjk5h4BVXxDEHv+TvfqljthKRd
	7ILnLOmYyH2IUzf3yYFv10946+9FZ7OTmc7oiXZS53/6n7h9bPPGE3So9W9pacB7dMbu0au2KmaBU
	JrPk9XioU948sf/B9vkn9Xve3ZiKLc2wioJoQSO9CRwtLIJ2jF+hOrUXlmMlKEp2YM0nxR18DdrQ8
	WvBwUUb2da6+Kff2YmYMFhTMPCapBGVqFeZP6F3jnGyDdIW84Ne6jzhzI4TN0hFqaqG4Cm+Ml9H4j
	H0AcE5aQplICIbwKNOoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWF5E-0003BR-SP; Wed, 06 May 2020 08:07:12 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWF5A-00030X-PA
 for linux-amlogic@lists.infradead.org; Wed, 06 May 2020 08:07:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id w7so190960wre.13
 for <linux-amlogic@lists.infradead.org>; Wed, 06 May 2020 01:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OUoKNxV4vqNDiSef+ICdZkoAIRUHcuIito46USVrX6M=;
 b=QDOkJjkIqKcQFKzMtVFjf9SjZTn75nCiyUVtEd6/RVU7pmbDF53lIX6A6pzHESbBQn
 EaBb90lnUbW8TJE9AwRJnT5uWamLTS+P+d9dXTNafMthB2LP746m4B6OyFprwbAxVfJc
 zYIItU2Fb7iUBdzQ+s2XmdsDkuh38HfV3EpwQzWyWRuRTBMcOSfaC0OJN+NCoqMMnc6V
 z0eTeuse+KwoI6EIc2PB+rvwEmmczcyElkBHX0Kaq5SoBQVnPRgUUz3Mu35CYVOdsc77
 c/EABh02rWBGO/NX33BtZ61A/lMERYWNfW07Qqd2DPxFr6k7Gx2d4166hYWlXG6Jf9A9
 PXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OUoKNxV4vqNDiSef+ICdZkoAIRUHcuIito46USVrX6M=;
 b=aMd5FGev9XbBsFFljKQTb9egfx3a2YteWkuHHN0RmBpHbmoCLCzdhaQQCP8KFL/7ek
 KF0z9gazSKc/cTkYqPBo2pFTGEnUC2GXNTK68VHfO7Zc2rDWp4qoYnWZsoFlwZElpBhV
 Rh9XBkR1gyrKaj1PqzzAA6YjPQVlbkf1vFCzYH6djybf5xIATeGnrw3nHNhFUaVTbZlU
 4K1GLdtbYktsRtv5Es6wzAFtS9J7MfoZM4687A/9+PgIb/TMuBS0l5j9NtJ8mkf9IYRg
 vZgFnQhLEWlceiM8aRhfwHYCuGGYbo+81fa2ApBgMyGYq8ZIsI4LzxMZuUKjZiFTa4vQ
 /+vg==
X-Gm-Message-State: AGi0Pub6NVKYDrPn+Na5FlTY2r4ObzsNXsVahqd5VWnND908/8KSlPYv
 rIyLplpZs1jYd5ujx3rYLzpEiA==
X-Google-Smtp-Source: APiQypLFXloAanL5BZXsPuyvyXKqG7TKKwVlSQtxJg0wIvbD0RxyshxpV59rlJmEtRwk/c2IWPXQcA==
X-Received: by 2002:adf:a1cb:: with SMTP id v11mr6651006wrv.39.1588752426703; 
 Wed, 06 May 2020 01:07:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id
 185sm1872098wmc.32.2020.05.06.01.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 01:07:06 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 0/2] arm64: meson-sm1: add support for Hardkernel ODROID-C4
Date: Wed,  6 May 2020 10:07:00 +0200
Message-Id: <20200506080702.6645-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_010708_854911_A833FA0C 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This serie adds support for the Hardkernel Odroid-C4 single board computer.

The Odroid-C4 is the Odroid-C2 successor with same form factor, but using
a modern Amlogic S905X3 (SM1) SoC and 4x USB3 ports.

Fully functionnal:
- USB2+USB3
- USB2 OTG
- eMMC
- SDCard
- HDMI
- DVFS
- Gigabit Ethernet with RTL8211F PHY
- ADC
- Debug UART
- Infrared Receiver

Missing:
- HDMI audio

Changes since v1 at [1]:
- Add missing IR node

[1] http://lore.kernel.org/r/20200424124406.13870-1-narmstrong@baylibre.com

Dongjin Kim (1):
  arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4

Neil Armstrong (1):
  dt-bindings: arm: amlogic: add odroid-c4 bindings

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 402 ++++++++++++++++++
 3 files changed, 404 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
