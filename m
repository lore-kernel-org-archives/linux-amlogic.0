Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B89C04AB5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 10:04:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE1D828075
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 10:04:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VcMJpVVt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rPw9psU0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE1D828075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vapQy3nmC3JwCuDevr+BuYMt7jw11dDMj8SayZohZz4=; b=VcMJpVVthsrgh8
	hP7TKNfU/wC3wf1YRYUQkZIIp0UWqel9sHLE7WVtgvlGRV3hQeNx66UbPte6vSRWNSA7xxS7Chkz9
	JES2hCtyUb21f8Hbyr8bpqJsxbjPmrzp+R+tTmblx8aHld2N+eq/vHWM08UsSMh+QGp0BEDNjb39s
	6gBFm+Ryh4N3FuOsfs6TFPruUe4arxPHz7fmMscx9htxaDJhFFP4YNfNcRvsaYEbYAFCWTGXJD6Rv
	7VozWsfiVKqsf2UgB2MCZMIHSTwu9dgwikS+vzLmHtN1EjinWglQYBDZ1L2pGcSW1k5Mzhyv6QvTb
	B+d20MCdVb7scnIyBqQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXjoy-0006Xd-Lt; Mon, 03 Jun 2019 10:04:04 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXjou-0006Sx-Jp
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 10:04:02 +0000
Received: by mail-wr1-x443.google.com with SMTP id e16so3112757wrn.1
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lz9OcKEPelvnCTb/4HXbu+GQFwOtM8R/fqmIrzaf034=;
 b=rPw9psU0swuxQ2q59Mun4xuZGqhb6XWh+KB/ARBwpCrMc6WEKYooJQtgv+frptln59
 Pj2CNCp5FMqHvmnUoaWb8uNQGwu1NcyISOH72PTAY+8u31iMcrBvTsxQ75y/xj3sXO9r
 gpBomJX9dOdqQI8rgkf2OFUUzEjRv71LOh+2Y41ZOST6g98PnhT9ijtBswPTzDi9+dnw
 qYpuGTq+EHW6yxXBeFaOckcTJAP6sIqTJrK7uKWI8hTTmaAz0XFhnZHhXdj4euRrtMFJ
 h8gdXxlKXW59NgQxO9nZF9eYYSzVExNizaRWWJeG+vc9MwOaWnkRsWbGg9tWwLEis+aP
 w2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lz9OcKEPelvnCTb/4HXbu+GQFwOtM8R/fqmIrzaf034=;
 b=RHks5f33+w1BfqRPvQUsiXE6WfO4lymrp9ZJ1d8AV5ly9YGF942NplCfELvkZTR7l0
 1nM+Bpm6LKAiwKXpTfX5vZ2jUsjHFOeazvlEdeVwNsK8YIVXqdpaBjGJw3EObKIC50C8
 Yt1WDmT1ojr5s7+4BGx6IIzQbDYLALzfPxEwkSkSqabQiV4vFHgrm3+XIJ1p2m8ksyPj
 NZUvyN0Vn7Y/R0lq3wKPtlFV1P3pi4Udx2QosIaJB4BVk6Z/N0BgiUSftfQAyDMxVzKY
 3dAVWKIsdjs67jqU9MB+/mSBUjSatWjQQiUEscL20LfVuar4BKt1T6ASSMkZOIjKQ0DN
 TGvA==
X-Gm-Message-State: APjAAAWCSmyVeFMMzU9kYmdaT7tpP84BkOKvOXLYJVuRINDbBDA+RzBZ
 Y/AnemBAPWXjJ7ZA4PJhDgr/Kg==
X-Google-Smtp-Source: APXvYqys8eAbHlKxvZAv6SoAZtOgdOJvJkrgQOulcdQqFHoUWUcyiOOCeYEecwvO+6qn0qRh85UPYQ==
X-Received: by 2002:adf:eb45:: with SMTP id u5mr1827103wrn.38.1559556239004;
 Mon, 03 Jun 2019 03:03:59 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o3sm11282098wrv.94.2019.06.03.03.03.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Jun 2019 03:03:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/4] arm64: dts: meson-g12a: mmc updates
Date: Mon,  3 Jun 2019 12:03:53 +0200
Message-Id: <20190603100357.16799-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_030400_792380_69E40482 
X-CRM114-Status: UNSURE (   7.55  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset :
- adds the SDIO controller node using the dram-access-quirk
- adds SDCard, eMMC & SDIO support to X96
- Add SDIO support to SEI510

Guillaume La Roque (1):
  arm64: dts: meson-g12a-x96-max: add support for sdcard and emmc

Jerome Brunet (1):
  arm64: dts: meson: g12a: add SDIO controller

Neil Armstrong (2):
  arm64: dts: meson-g12a-x96-max: Enable Wifi SDIO Module
  arm64: dts: meson-g12a-sei510: Enable Wifi SDIO module

 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 48 ++++++++++
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 88 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 37 ++++++++
 3 files changed, 173 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
