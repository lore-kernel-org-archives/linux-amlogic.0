Return-Path: <SRS0=pqGQ=YC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB9DC47404
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 08:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF2DC2133F
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 08:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Co/yzqt8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EXTxIiip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF2DC2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XN4b8Znqmo2v10oMHRv+sM5vR4N3iagliIyYy8TXLWw=; b=Co/yzqt8Zoh40x
	stub9BPoczLCIfDSvS9jQEwlY4lo5Zkqlet2KuOP6lf7opAJ5hua9wONmMGOEFk13rxrUqRHKizas
	xpP29amkufEq6TllLZDzooskLTVkjD7MprzYpanfH6R/JQp984AjnQrX+7ABAttNm26iHAE+NoqZ7
	LgxjYvXI2uWC5we5bUcy6wswbas6sFgljNL/4xxmJhSLbyKHD3+zt6WRhLS56A6VZKKpT+TWeuwF7
	dFV7zv/Kh53LKb7LudOs1Mb9T3JG1Bz0li8CDnInHlCy1B12hB+I/7CP8PcS3spXjSxOCqIjDvg6H
	yv8IVl1fqN4FDryH0eKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iI7MP-0007sL-U1; Wed, 09 Oct 2019 08:30:17 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iI7JW-00044y-S0
 for linux-amlogic@lists.infradead.org; Wed, 09 Oct 2019 08:27:20 +0000
Received: by mail-wm1-x342.google.com with SMTP id a6so1416219wma.5
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Oct 2019 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ETtimywo0QHOEXACD3eWpss97piVMA8Q9apqqhkw9s=;
 b=EXTxIiipvuSRt3WpixN9cmSOd/S6uza/iZhQU2JhNUziPV1RMySYp2fvsj53vsagey
 zR5fa6oQJP1MdHdhhpIYr7fFNG7AhLum4c8Ium/fG1aZPc3Oq54lnZYraX3DloaWyK/a
 +qbVxpyw30HziDNPNyJBd8LlBqJN+tGxqQ2QN9orrpm36i+jQrOs/MIZQMAuxA/dMgTA
 7G58AUOSO1CkiagedmeVWfVNr3fRYqxybl6tCJIzt9uDVStjjd/s5xbFs2ZI1adR1YJX
 37hkNEz7DoTTo07GyJr1LNXzFw74IcIDpUrsm6UxzQPd+tIeTXz/arf3ZcHvhvEIVo54
 0W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ETtimywo0QHOEXACD3eWpss97piVMA8Q9apqqhkw9s=;
 b=WBqX4C32z0A1i7cB+UY1JxzHnNQCL7DVfJuRv0M8otug8AqCWvgm6t+XvB2fHAdOL6
 OEqRK3nFn3drlXIEz2OOXbRa8Ox5aaQUvbm/SKefMC9ZuI3H1TIlNgbs8jyUDYwf1jvE
 d31vbpmp8Z9up3R2hKmoEut5lUb4ZefOc8T9ae+7DD+wNdcNnjALaU8V0a0cE7uDr5HT
 pSxcobx3CH7sv4RK5hx1n0VkdG2Nvlw4/AtTtvYqkdgIugMeYNoPm9486ORM43i8UapO
 XburyULn75bnMLl4tFMwKleMVd0ryTG1si1xNyUsFePAt1Q8hQJlhp919cCxBy24Lh6w
 UamQ==
X-Gm-Message-State: APjAAAWZIbAJ+ZQiX5361pO8xmaicugqFHZ2JR8lcwhZNMSdbXCXsKWz
 qQAtQ4fGtW04jkV/GgmiDwk4FnyicaQ=
X-Google-Smtp-Source: APXvYqzemyQZ1o5FQC5LcUGT4JwMcSgBGuRC2yCv1uuPFs1osQ0i4ZTxxRPbv1kvQQSlyCH9Rt4zuA==
X-Received: by 2002:a05:600c:22d7:: with SMTP id
 23mr1583514wmg.31.1570609637059; 
 Wed, 09 Oct 2019 01:27:17 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id r18sm2545364wme.48.2019.10.09.01.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 01:27:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: sm1: add audio support
Date: Wed,  9 Oct 2019 10:27:06 +0200
Message-Id: <20191009082708.6337-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_012718_946676_221736B2 
X-CRM114-Status: UNSURE (   6.27  )
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

This patchset adds audio support on the sm1 SoC family and the
sei610 platform

Kevin, The patchset depends on:
 - The ARB binding merged by Philipp [0]
 - The audio clock controller bindings I just applied. A tag is
   available for you here [1]

This clk-meson branch [2] has the necessary clock driver changes, if
you want to test this.

[0]: https://lkml.kernel.org/r/20190905135040.6635-1-jbrunet@baylibre.com
[1]: git://github.com/BayLibre/clk-meson.git clk-meson-dt-v5.5-1
[2]: git://github.com/BayLibre/clk-meson.git v5.5/drivers

Jerome Brunet (2):
  arm64: dts: meson: sm1: add audio devices
  arm64: dts: meson: sei610: enable audio

 .../boot/dts/amlogic/meson-sm1-sei610.dts     | 205 +++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    | 327 ++++++++++++++++++
 2 files changed, 532 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
