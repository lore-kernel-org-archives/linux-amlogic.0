Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF98C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:27:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5672054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r85Nbx4s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rfkmg9+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D5672054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N+x5QoGECYBoT1bHipBzl5Takcln/MF+zKP/wVA9ra8=; b=r85Nbx4sj6n+o+
	Uz0AnDDN2Npjp3TnOFXPr4zeJp1iRM/y2CPIq/3jDe+/p1h4xKq6kBUTbvs31vhW0exKRtg2J6HEE
	tpkYnGhXzoTFqyt49uqwqDUgU8WQD+clo2bN4vpOBRMwlhNs6bkyYhwtylsACb+YJ46TB8qzNWnPO
	6XVUHijVUzBb2+2NsuyJxNsOrAlkepPIORr/1EfWaDZBJJddRyn0f3g+nTqy7ahGukQCHLAw1nD/k
	g5MWpp92kig6ex9+z+IOQwVdR66cEjON8ebIzfnpG7+Z17LmjvS+Sam30Gc2SBltvkn0Mf6EGEaHl
	or4kdHrKGu20pF8kIGfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk4pb-0004gU-T9; Thu, 17 Jan 2019 10:23:27 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk4pY-0004fZ-T7
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 10:23:26 +0000
Received: by mail-wm1-x341.google.com with SMTP id m1so452823wml.2
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 02:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eKFGlyePrqXLCsc2FjkWti75c8kQk+cr+YrqmnNo64w=;
 b=rfkmg9+6zBqjgCNRsiGDNHDjIePdJgrZu2eFFmoURnX1zGrO4DVQrVmkrgB/AtBdZx
 u8z+WU2fdACnYyUQFkyfKrx96BFgRZb5P5HNJnj47LbVzEocZK/Duq7o5eTPNTbX9h5C
 c76vffJtC4d35LI0w4/93Qu8zG8EDE6ivUGYwEQulcfSNS6jpqqJ60eJUBI5IFOiQFbC
 AoB3mFYm1/Yvo1reit2jHsq+3ePUjMa5H3eQDojhoIKxQox1ryUwJ4LNC1mZTGM+Yq7a
 lfSFE5Svfe0SeBkGPEYKrsM0y9nwC5QYv1+7GmHBpoKy853TDbSjm1oFCOOyra4uhZ2v
 mi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eKFGlyePrqXLCsc2FjkWti75c8kQk+cr+YrqmnNo64w=;
 b=Gl940cBphbTINYOIsnvH3p2DkvXBIvXvaCT9YR7QjbzLmlzlDS2iPZZ0NaYqazoF4Z
 zfftDVXG4ZC2Pxz+5taF7cX1SKYFkLgfb+XqE6SP1hjqhKNWAR3xXk0cP7hO5T8DqJ1F
 uEEwBNtXBrqtRa26AlYPwyh9ZmysUst6s9B+4Xf5awqccDq8jXre8Rllt9HGltanxpVo
 qdTv5xGfEy9ioRR5+HC/JDPkvFwzkLs+GKC0AkltgPFqjBFik2hHS8dQqVc6ipPXBjld
 +nDYf+I3noZkjuepmo4tMYbXUtiJ9xGyqhYUiOwTUiigpYiqj9Ljheag0ZOYopPjNWt6
 8POA==
X-Gm-Message-State: AJcUukcCPfiKD8kn0UOzawTRrBzA+bpCgXoUxMT0C3gMRJdo6LaPTzd/
 pC7MQXH68kPhQO1Kg4kYsP4bRg==
X-Google-Smtp-Source: ALg8bN4I9wCh1M10jclA58pcFRDWiTD4vrOfQHJrFIfZZthLmhj4bhC4fl1X13mOxizqVok2G3F6Tg==
X-Received: by 2002:a1c:1688:: with SMTP id 130mr10675193wmw.86.1547720602762; 
 Thu, 17 Jan 2019 02:23:22 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id u10sm66400530wrr.33.2019.01.17.02.23.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 02:23:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/3] pinctrl: meson: g12a fixes
Date: Thu, 17 Jan 2019 11:23:12 +0100
Message-Id: <20190117102315.1833-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_022324_939503_4D6D3610 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset fixes the initial pinctrl support added for th g12a SoC
family, which is mainly around the register regions claimed by the
driver.

Linus, would it possible for you to provide a tag with these changes to
Kevin ?

ATM, we can only use the devices for which the pinmux is already set by
the bootloader. Enabling the broken pinctrl driver could cause regressions
in kernelCI. Having a tag, would allow us to start using pinctrl on this
SoC in this cycle, w/o regression. It would be nice :)

Jerome

Jerome Brunet (2):
  dt-bindings: pinctrl: meson: update register descriptions
  pinctrl: meson: add optional region for drive strength

Xingyu Chen (1):
  pinctrl: meson: fix G12A ao pull registers base address

 .../bindings/pinctrl/meson,pinctrl.txt        | 10 ++++----
 drivers/pinctrl/meson/pinctrl-meson.c         | 24 ++++++++++++-------
 drivers/pinctrl/meson/pinctrl-meson.h         |  1 +
 3 files changed, 22 insertions(+), 13 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
