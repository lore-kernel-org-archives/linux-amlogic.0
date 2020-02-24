Return-Path: <SRS0=TU6n=4M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA258C11D35
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 15:08:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BCB32082F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 15:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Td5ZPFwx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="voTRoxcq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BCB32082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n7X3Lu3Os0pzFZhoEN/0EeW/KL37UoYX4GnCm24csow=; b=Td5ZPFwxHKEjMp
	PjdppBMzLCnAKvVOoYTtj6M53oLz5BD3GMgmUOIpadCfKgfP6lIDzZMNr/9k2s0xny5BLX+j4Zlh4
	l32Q6278p+EH5/yCrBygDjZ1RldzgNJ9yAUrnyux5m62XVna75YDAI1UbMise+RgtYCM8CEQkWegR
	E5J04e9+DD/fCWKPIbXStedc7sEBmHrMuS7/oWTsERNrbiGv1LfKD5q6f0k4hB4aU3NrmMWymJEiB
	P//sM2yFmyMPWnE/bGJ1aDWtVz8m0MR+D0PgRknHlHYnBQetT6AkeRCN77FApwPD4HfWTALPcK67W
	cfUiNSLGjMfFW2XwYldg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6FLN-0007xQ-Bo; Mon, 24 Feb 2020 15:08:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6FLJ-0007rp-Co
 for linux-amlogic@lists.infradead.org; Mon, 24 Feb 2020 15:08:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id a9so9782103wmj.3
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2020 07:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiC0UNxjupTM8Jt/XePNuhi1RMoWOcMCY69tR/Q99UY=;
 b=voTRoxcqwaJF1S0FoJwsA/sFZaHPk88meZzPGjzsHJZy39PoFRGkVnQhzwrI122iQg
 549+tw/6DBzTH5iWgwzV4tkOf6IVUYno0YAoMPjYXYfPYnshTomYWu1mj245/x2qlVIU
 IvxAG5ObkcrdkmqInH/bkqwMkeYU2zMQCCBTAKvgYW5BSXKeOH4nlfKQAlUk49cMOCkn
 1WoKbNXvbZ65T1DDyHkWpJfheB6JCjblvdBdcloSbjL99Xcqg0+1Np517fDvRkHpdE0L
 tb/+GpQPKKvAiXTO2lc3ERc3RhJMchwEFjdhSjBdmnuxTt/ONIslPJXZPH9YtpVPdTRn
 5xmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiC0UNxjupTM8Jt/XePNuhi1RMoWOcMCY69tR/Q99UY=;
 b=YLTgo0vuaA/smgQ45OnMIUwjVESH/B8MYjbyY0nw4Eaq0eKN7iY+96lXFqUzF6jhU3
 TkYVFtg57wuHp/nwf2xJek8nflbxyVfNT8cMw1QzQ7b1i7n9N6BLGYd89Nw41K/a7LtM
 6q/5EBXnUCPyTwUr5G7PGoKQ5MkNNPeJKwPKby8/Xk/pSRE6fLxvkUi0KUzVYVMXAkcT
 q/Y8IdVZZbcJq6y9sL0P2HJqI9PMtiw/siJRUTZ+dwPeF+b7oHxn2wgtavqwpSkMVnI6
 Ao7o0ikmsdywud/JxOPXlXWyUSVdib5YE3FWVxGT91fZgYvqb3uQ2OvHbtfJ5lVUXCGY
 ppBA==
X-Gm-Message-State: APjAAAVOBhWIe0O41WzVYKp1UFsSPIdISvX+gnHbm4xQGqvCYqboIc7D
 SSoyHQwSlSqQpNzLcDCcf/awpg==
X-Google-Smtp-Source: APXvYqzvcmberQ5l9nmdoppBhLeUg4S5HsFfNYSmYNZ2n4XKzlabx2Ja5WbW3NBF9NZEBsg9CimSdw==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr23255620wmg.92.1582556897336; 
 Mon, 24 Feb 2020 07:08:17 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c15sm19074794wrt.1.2020.02.24.07.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 07:08:16 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/3] arm64: dts: meson: audio fixups
Date: Mon, 24 Feb 2020 16:08:09 +0100
Message-Id: <20200224150812.263980-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_070821_443551_4A88F792 
X-CRM114-Status: UNSURE (   7.20  )
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

This patchset provides 3 minor fixups related to Amlogic audio devices.
While related to the same topic, these fixups are independent.
They just improve the compliance with DT spec and schema,so no functional
change is expected.

Jerome Brunet (3):
  arm64: dts: meson: add pdm reset line
  arm64: dts: meson: s400: fix sound card codec nodes
  arm64: dts: meson: sei510: fix sound card codec node

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts    | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi        | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 1 +
 4 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
