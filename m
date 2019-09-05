Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D064C3A5AB
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E1A421971
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="itVQz+CI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ssbfMIbU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E1A421971
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tzXQrVy25d3FcA9u4SYPWKcIClszYAz+FtxyvdUmUqM=; b=itVQz+CI7uaGOc
	z2eFW9wJUyJdvtIbK01ngSLqnnYdwtnQrgbE5mpTme0NtEXpyCN39cT5a3Ybjjdk8WbGgx9aaJYyL
	MJb/OdjHn6eVOvLZM+1RYUXFiTW8+MIe58UZDWV4HjcBWqRTQBjUmwEpzsFeoz/b9MqO3/RNkSsk5
	4NRYylVorPJqacDuozdUBDwlbQvKWou5Lg+9FHpg+vfvLAnUl/yLoxtcgcrJl8ht+mUxrrZYPUC4k
	6j83pIg6ol2c6iiWwpcF/YeV+1iZa/biae3kda/Awfy0rIHFxyhGqfY1LIqlXG4GOic0Q6X4Iuy4G
	mgFSG6TnxaysRIXraBZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5rMu-0006RH-Uh; Thu, 05 Sep 2019 13:00:08 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5rMr-0005df-1s
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 13:00:06 +0000
Received: by mail-wm1-x344.google.com with SMTP id n10so2937873wmj.0
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5v0Dy23bszDikjahnfR50/JyqF0JMw3pYibReU0maQ=;
 b=ssbfMIbUr7q1MBCXJtcNYU5Zqq2x2YbEn6f2TIT7lyHcFFxlKU+8ADEwzx8bzJEb7D
 PmwjjhQRmOC6USAlOkBj0jll64frnU14pbOsMRquXNYt7uTQjSZs3g7cejUtFI1CUXS+
 7LkylxpucT/6N12qSu1uwK9QvFgG+Hi1mwRzaQlPQf764Q8fvn6ymvrIuhOMEiUrQiPR
 lt1pOl/xLCiVPZApcw0iFrEE+EDMWHfe/YDUTBtIeFtYhl7aK7vOmaylNiZURMOa1kHh
 uZITr3iTK532vd+ITf2HJwsULPvriuet+8+c3DhjhfFa8Wi0zH3RKtsJXrxIBCDmHSfq
 Pbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5v0Dy23bszDikjahnfR50/JyqF0JMw3pYibReU0maQ=;
 b=ebOzC/Uy4jSyWHNNqZXumY6JCgyZQbFsqKuZAvkqs2v6y5oJBCX9ygY5ovmREkJB73
 z5Vf1WDImKkbiq6i+nnRkNAfUUt7K/358qfgSCEbzSVNHc9GDuxf4iCyW3G6UfyY14Am
 JsyGRXb1cSWPIhbEfDQOLrWIiPIWQR78lxiyIyAbf0mbogE+Fo9CMZVUTrebOYNhCyHz
 q3yVlkG/7DUgVC7AqKJdQv7WU5CYcnfRLVZORDU/A+Froz6h3Og9WvyHg688kfQjee+x
 XFnNQJmD3BEQ3TiSnfYYAgWwFn6ZTyCrtSnke6EHNWTnNF3vnDbjm3h8KL0jcjPQn5ZZ
 ziRQ==
X-Gm-Message-State: APjAAAXlE27OHn98b9pNRUOTRgvaEX91hRpxTuk8bzltAQ+ujOPsmH++
 o4G+EEjkU7iWDlArYquH5LV/0g==
X-Google-Smtp-Source: APXvYqyJ5a4GKbnNy6ifNCJ/h3sAEQrmaDMw8nRKCghJv8Y44i3udTkVE2loifhIC9yyK/Y6ScVf5A==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr2872266wmc.152.1567688403371; 
 Thu, 05 Sep 2019 06:00:03 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z189sm3727903wmc.25.2019.09.05.06.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 06:00:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/5] arm64: dts: meson: audio updates
Date: Thu,  5 Sep 2019 14:59:51 +0200
Message-Id: <20190905125956.4384-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_060005_108682_7ADA7CB5 
X-CRM114-Status: UNSURE (   8.63  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patchset features a few updates to prepare the addition of the audio
on sm1. It fixes the register range of audio fifo which was incorrect.

It also create another layer of dtsi, common to g12a and g12b but not sm1.
The audio related device are moved to this file.

This was done because the audio bus, which was at 0xff642000 on g12, has
moved 0xff660000 on sm1. Overwriting the reg property was option but it
would have left confusing node names on the sm1.

Jerome Brunet (5):
  arm64: dts: meson: axg: fix audio fifo reg size
  arm64: dts: meson: g12: fix audio fifo reg size
  arm64: dts: meson: g12: add a g12 layer
  arm64: dts: meson: g12: factor the power domain.
  arm64: dts: meson: g12: move audio bus out of g12-common

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  12 +-
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 320 ----------------
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi    | 344 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  15 +-
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  14 +-
 5 files changed, 352 insertions(+), 353 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12.dtsi

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
