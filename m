Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666BDC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 14:30:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1ED7208A9
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 14:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rjxxhCf0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rP8nrwen"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1ED7208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OwgH5ShrELvavsSjpHKWgJlIrFUMKEQbBS3+CYfxfQQ=; b=rjxxhCf0cuwDbE3RJ/5rKZfifS
	8Q8WuU9FvkvIVfKNmel1Wpn2bsKVeflJZ0IcITXRkX2lsXSwHa3TFMGG5rSU1C7gRJQLmGv4P73qx
	88liFUhzOBWgxMvoeZ2Soea/ep5nxtNWXxcL6j+tP24dn43SkhAsjsTe7Tst7LaIPx1veicncXVHL
	f8mCtcnfnpqJB2CfL9PYLItm7Mme4gUOQuV/c7u1EQSK13Dr+XPqe/m8DFzpP+Frjk+bXlzJI0rh1
	pF4TrZzP5JRnFjRsIfCv9By1+b0+5qcnndGP0MdEY5vN5le4dTJysodlbVZ5pBoH2xeG15ulqgm2n
	0Nj4oULA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLoji-0004rU-5E; Fri, 25 Sep 2020 14:30:10 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLojf-0004qZ-5g
 for linux-amlogic@lists.infradead.org; Fri, 25 Sep 2020 14:30:08 +0000
Received: by mail-wm1-x344.google.com with SMTP id d4so3226211wmd.5
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Sep 2020 07:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=rm1AfqsGccu2J+rmTHRUHzmxx9NRlcAECDkFtk/4MDM=;
 b=rP8nrwenoYqgMPW2Q/YDwuKVuZ5Grbh+GJw+NK5U2U3NnKk2h2JIMD4jMN5D8zMzyk
 IA3cDJ3Nw82fz706WPGOgmQdbKQg8XGfRyDW5py+e/lh8B1eT7BRhSQ+GUMa7ktDpg0s
 eAcEu7Y8qg6sRF0BXO8JrD3ZavEto3LKHFXvJoUU8kGM7/s7BN5G9Zrd49P9JGsyNtQh
 Sw+R7NsZC6JqnCHCFgWgJ6q16w1lgfdSlx+foxv75579OoLsYD6IRRmvhQiUIw+YjIYo
 31Uq8Xzf1rZoDFT1+5vmPey7RqMxsZkE4RNgHlaSWNqaaWb5GtIThnhgL+Jm7cQGgO2K
 hLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=rm1AfqsGccu2J+rmTHRUHzmxx9NRlcAECDkFtk/4MDM=;
 b=jqngDb7/B91vfn08bn7Grb5PK00wB7ndtiZLPy6E5/r2gw83KLHUilQewTBua7ynO9
 MvfUim77Y9Y0o/70FCSCuC4y4zT1QyFT+YV2ddeFaUbtlYCvszVho0UI/alZlvUC5Cld
 CoxDxw+UD90utXdbF34a/B4wPVzsZOnp1uu1ydbtJj83IRPNOCVqr8NpJLAWwOrzHObn
 dWYBMikk47500kFU8NmHKu55bwi7+gWZYGFE3zYfcNFUKgggHQRyRg4d7ykCXOkCPcbv
 80dIWM95uHE65OFM32Nyizh6jGj4rS3laKQ2DPgjN46Aw/7uMq0HgRvbnWfEv/2418zw
 dRiw==
X-Gm-Message-State: AOAM533m4vn2JZtvLspm9KXF79Bk5sQOvHxIfqvRAqOEa9tHt1y+wH4M
 iqaZLyIFGeQUl1vYgTxqH5KwuONtKFftcA==
X-Google-Smtp-Source: ABdhPJzz4D1Hh8prQZy1FzzJHMH2E9Em1fWA0Tmln0lEqsPsAws3U82rvPsmihLLfjwBlWL5Ub90Iw==
X-Received: by 2002:a05:600c:2312:: with SMTP id
 18mr3402691wmo.141.1601044205652; 
 Fri, 25 Sep 2020 07:30:05 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id u12sm3178295wrt.81.2020.09.25.07.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 07:30:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] ARM: dts: amlogic updates for v5.10
Date: Fri, 25 Sep 2020 07:30:02 -0700
Message-ID: <7h7dsikjyt.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_103007_276340_AD5761BC 
X-CRM114-Status: UNSURE (   6.50  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt

for you to fetch changes up to 8bcbcdb7293cc24eb7b24b67ef2b29b3a45a49e0:

  ARM: dts: meson: move the L2 cache-controller inside the SoC node (2020-08-24 14:15:36 -0700)

----------------------------------------------------------------
ARM: dts: amlogic updates for v5.10
- minor cleanup

----------------------------------------------------------------
Martin Blumenstingl (1):
      ARM: dts: meson: move the L2 cache-controller inside the SoC node

 arch/arm/boot/dts/meson.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
