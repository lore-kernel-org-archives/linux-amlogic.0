Return-Path: <SRS0=3vaB=QP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF07BC282CC
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 10:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 973C52085A
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 10:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ugA8QTd+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="woVIpI75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 973C52085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5J/rR+uSIeuIzzmieBaZ2h7mR9ueC0zwqZZ6nWJbbv0=; b=ugA8QTd+69SzlG
	xJDd9iLm+NYKYVPoBOIDQyYyZ5/ruwu8WoODxaKeFs619elQtoGX33hNoxfP4GmcXGNoHMHqIGBIm
	pAVWG7wz7AvdRJVwtH7TyF4l1DzCq31hHBjK0nOyvkj5rgz587TQXCRfdSorIFE73jG/gj+eFec24
	qbhvIatpXpB7WgchpxbhDtf1fFCbAQLzaPB0L6KCH7NnZhutyNOvUwIwnFU4mPrgGxpcpXfWcoz4y
	W54OBDxPYILvWj0tb13GrAkv7xAGC7QfVtDxDIHyPOWKdnnwFzroZioisD5dNr84hj5w0oBGJ/e0O
	BTXj/DUKofimg5cdZSJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs3Az-0005uZ-5u; Fri, 08 Feb 2019 10:14:29 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs3Al-0005iZ-Rk
 for linux-amlogic@lists.infradead.org; Fri, 08 Feb 2019 10:14:17 +0000
Received: by mail-wr1-x444.google.com with SMTP id v13so2939969wrw.5
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Feb 2019 02:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3zn3JOSJAc4hdaP9Mkzt+bH/dcyOxwOPiRCe1msLmt8=;
 b=woVIpI75R2onKuLVvU/eh/8hQU4toisewRsIhrbW7f+Obs9bRDOyrAU3DYTZwjh9iI
 ujLtmqFD1l9J28mYZLrmD/aWlcLCydrstDcus2oiEJRzWc+LHEAr07QvkY6H2pveeXvr
 QVbGy7LjQcqzT1xeUiWZSSPgR6fVk/O+VgGor5yUZAWi6vkG4kJV5MUwUs5kEAnMb0dP
 Bodwm/EcVwI+S32DbZbpKKahnh3owE4ShC08Vzk41kyFU9u/mQBPnjZQWOtQ+gzxJjl8
 fQc2phbm47MwwKE0EsVnzW+L/mVf2Z/GZdI7QD1fATxPDvmPopI0ZyvHX1CFT5wSsDY5
 YwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3zn3JOSJAc4hdaP9Mkzt+bH/dcyOxwOPiRCe1msLmt8=;
 b=fKv5UsZibTOFI33NBY4blgLMxt+FsK8uQFFVifhi9QFcZc1WzN5x6cxsuV2bPQcL2O
 8z2Gua9ycjh0B5PggJbo/I43vGUkcovCU8eyFyIu3xdOsUGXxUIb3+P9b9NqdXb1AvFw
 8d5knkIXJYCRWiYExqRAg/L2mXY6va8Cj90elwKMX7VfoDlrZ0cNYOvcrQlfdoZKBmlD
 2EY2al5IBtUdhSpo7WtlRPcMCfEJpASVRz0YS2bkO3MoowM0TRvGCw8/dbE2pm7F+RZ/
 iwQ4ikA5aFT7bwblU/tWTUsklnLT5TL7VnxqNfa6bnURXzU4Gs4SEU45qdm0ILw3kKmF
 h9tA==
X-Gm-Message-State: AHQUAuZk9TxoF9ciSQJk/gES2VnUCqamn0p9MMUDES5ThQPkWpcasvKe
 1W4HxgPw73bZFPigkC5hc4hONA==
X-Google-Smtp-Source: AHgI3IY1wm8tkmbulxHtX5Dv8fsligY44Jwu/yc66xpoVIdD0vR0Nduk84O7XAgYUnXshw+DOby0gQ==
X-Received: by 2002:a5d:6803:: with SMTP id w3mr16299802wru.272.1549620854103; 
 Fri, 08 Feb 2019 02:14:14 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e35:2e9a:6060:2ed3:c463:803b:b085])
 by smtp.googlemail.com with ESMTPSA id
 a62sm1901634wmf.47.2019.02.08.02.14.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Feb 2019 02:14:13 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] arm64: meson: g12a: enable peripheral clock controller
Date: Fri,  8 Feb 2019 11:14:03 +0100
Message-Id: <20190208101405.25699-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_021415_982620_E1323F8E 
X-CRM114-Status: UNSURE (   6.33  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset selects the required configuration flag and adds the
DT node of the main clock controller for g12a SoC family.

FYI, the configuration flag and DT bindings have been introduced by
this series [0].

[0]: https://lkml.kernel.org/r/20190201145345.6795-1-jbrunet@baylibre.com

Jerome Brunet (2):
  arm64: meson: enable g12a clock controller
  arm64: dts: meson: g12a: add peripheral clock controller

 arch/arm64/Kconfig.platforms                |  4 +++-
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 13 +++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
