Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86596C4708F
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:01:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AFF4610A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AFF4610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7EnCi7NGP6SymPdVo44HTFAY1dKLiLzPOf8GTP8yfCA=; b=PwAOAR9V34na4t
	Lxd2qPIkdRU/Z5yfQv10GxEXSyo8IikQjFDPvrzadGGWm/EszGK6mPxO5I7QnpQzVC1shO7eGJ/8F
	cqVwE6+oS1FP563n88np9d/PSSK9Nt/uHw8U5dKkw5oJEShogsEk0QVWLXmDRHEJ6OMWFG0EHdVnT
	uAuuLirlLM42RMFtoRoy21v7NXEydLkQB97rhdYzEBWjFpTrb/dN+WPG868egzd/zoASqcvzXMV7Q
	HQ0mGXno3/QsN/MrMB8ofYmf7WAfbgtI/Ocepcs1vPqAJUufMOZwfLRLB1/tx648/8T8Tj4GWSy0B
	UOe0RuW0+En0SJYOWK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0HX-00FU0I-4a; Tue, 01 Jun 2021 09:01:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0HU-00FTyi-6H
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 09:01:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id n4so13433939wrw.3
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 02:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H9dfP/HQ1yF3ZJ5TmUZw5lMApDC92t3a+q6kUys8fVY=;
 b=idd+HJfKG+Zdo73JZhpgtRchcqEUFfQmMYU0z4oybPZ8/oViz64390Z8g5s+agS81w
 dxIrJWwTv9FF89gTnkI8H4FlbjP2od26UXcSNdYiz7WGpeXYhIss4zbwCsNnP9qINbwT
 AH/V3CdaLJE3BaCPIGYvkHa0fgNoufSw+hoh4KTgEKmdPIy4UII1ixRvXd5qBP/ZopUg
 5Pmb4ZMqgtSNS5DwLOAyutsSsCQchuLz2vMimHDwbBv5lrRg8k2moMrxzySrFByfcrno
 e+ocZ2IlOM20NQIR5u2Sm1pu3HGN1H9tZcYmjn38xx9x+E37fra3nrA6pHCYWzpiHjOK
 mRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H9dfP/HQ1yF3ZJ5TmUZw5lMApDC92t3a+q6kUys8fVY=;
 b=qTHF5p/pIG8f56cNPPOqLNrpH4YSnkexPu4BBgCGhdJAc6o9iZW17BP/XeEbD5NB4B
 HpvIcijwOHEGXyw2EP7ee6XxVvE7N1RgfHqOyYaab4krxh6uNWYq/d/vPbMx/7lVSZDL
 pvLuF6A0YE54KEdH+Ibbzpr1dDzv0ih0C4YLxIUqgpRoRBlMuez9nv3n+BGiKkUspufG
 l3i32YaEFduXXPgDMhh+CXOPN1vi3TQt5V1Jj3gGF0RprUFDr8NMzUK3wJVbjU1NskCl
 2mE81ZNIV17kyvZuCCglzkLi/6kPvY5kgsnvymN0S1ll5KVCG0TI5QWEYUcBNngR/qwK
 jzmg==
X-Gm-Message-State: AOAM531lWtwv3rd5DnLaEsg0fHyUH02ZAC7DhbO5uSC//7zrLUs7SKtm
 29gvbzCVv84X5IcymRKw3Wjb4Q==
X-Google-Smtp-Source: ABdhPJyWNee91rlrkyHrxtfHXXaevKWNzRZgcWNhOc33JucXy/8qbsNzfmrRfeJYp19DawtZCKY68A==
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr25954364wrw.278.1622538106584; 
 Tue, 01 Jun 2021 02:01:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id
 e17sm2668199wre.79.2021.06.01.02.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 02:01:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/6] arm64: dts: meson-sm1-odroid: various fixes for C4/HC4
Date: Tue,  1 Jun 2021 11:01:34 +0200
Message-Id: <20210601090140.261768-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; h=from:subject;
 bh=8nRsuZr86WQw9AoOI6YGZLPKyM3EFdInWfYap1old7E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgtfc4xme7MUjlZMeepvitfBk1HtzgR5Ve22CmQFZS
 HX6gqHSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYLX3OAAKCRB33NvayMhJ0RgnD/
 9jz6aefNbz7RrYSBAtjO8VmDQtqWVPTsv04LmUfz0RKR+qApk7q1qOmZyDIVR8jIP4wMv3+/gfL/IY
 lb+Q477lR7V1nrQLV+1TUEGefQHvwD4o5j3jnoYiY/Gv3b4B8fiip9Lwnn7wyOyOldivuPQAWd4AV3
 Ys/fRL1ULy7+ueo8YkiSgMe75NgRr0qsaE+Q4hvcuVyxwk+jfa1xtVJrAZCGgEyHYmZsMx1ICeCcwz
 cdH2C5TOGv16vMmD2iDhFODagexGtEmo4Hpb0sPasgk9vBZmbOKGqUbsZef9mgTHxAu3QDkyq/fkg8
 BUhWt3n+2Wk68beJEWRFapq/tqfMzDbzcSmlHEbtOPG++E+OWVAMQy8Uv1Ucjop+VwTHaZR2BJqMXr
 0Uh3/+t8Ql+1YBnbYaXh5BffNWUz1lFiO8YbpF775EplXCse6xWvnNPQX2Ovaff9skhu0YCf2BXkhN
 1lEhzA8y1FadbssTF3v3wtd68oeTxRCytgl7I1VB/+HFC46Pw/FEvvWowMVXX21hMq5Fw4R4nRCohM
 Mg/NlFvtf5FEFxeNU6XxR/G/GAIP0A3T4oyLwA3eEJIn2hgRUnVkuphjg4jT9/+6S09wTBdMhG09Ol
 I8nICBPmVtpG4uAx5zevSVJyzOFgD8UACwcxH419FeSWhQcQJolslyISxUAQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_020148_238841_5887B8CC 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Here is a collection of fixes/small additions to Odroid-C4 & Odroid-HC4 concerning
regulators handling, USB and SPI NOR Flash of HC4.

Christian Hewitt (1):
  arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4

Neil Armstrong (5):
  arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for
    tf_io regulator
  arm64: dts: meson-sm1-odroid: set tf_io regulator gpio as open source
  arm64: dts: meson-sm1-odroid-c4: fix hub_5v regulator gpio
  arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0
  arm64: dts: meson-sm1-odroid-hc4: add regulators controlled by GPIOH_8

 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  |  2 +-
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 53 ++++++++++++++++++-
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |  7 ++-
 3 files changed, 58 insertions(+), 4 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
