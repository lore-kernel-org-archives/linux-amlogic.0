Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E407C10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 13:31:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D37A820724
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 13:31:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="igxOP2At";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yGpVXdf/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D37A820724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6h+CBzM4aTzv/zhfJYwDgEa+nfUowP+TRPNbJvAcZgk=; b=igxOP2AtqCbuwH
	y5Ynk7k74FIuWyFDRIoBr0IKGNfPiP9NAT7qz1GKQbB7T3PE5avQmQertDUZL/UgD0CrWQEThBrf+
	+D27yZG4NUKZ2WS9CQNZByhsOv4Vuaid2eEKIvULL2+usKXldmm7lqTV3eFPURRg3DjVVa3+piqyq
	ewOfN8Sdj8Pv/ClCTtsZWEgQA/vSNjptPboCD/QpCkgBAADz3JzoqRFZm2iELXu+ftbW93IPKdiyU
	BljHUORFa3iFx6vjpCUugkGI5vvV2tzot3pLON2ozt/lxSIlUsSUJfSmirYPxEMpM7SIOLCEqF71D
	i5W/iu13F1i/OiCx/T2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCNw4-0003TZ-GJ; Thu, 12 Mar 2020 13:31:40 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCNw0-0003Rm-AZ
 for linux-amlogic@lists.infradead.org; Thu, 12 Mar 2020 13:31:38 +0000
Received: by mail-wm1-x343.google.com with SMTP id a132so6122532wme.1
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Mar 2020 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mKsXFRcK8AcNaumHFcbmSoneU4WCI5BNbLya6zWwdso=;
 b=yGpVXdf/zvaZ2oK6Mt2+1GDAOyAcjE2YL1fV8629Sl0fjgJVBfCic1VwugB4VQba3I
 3QveKXHMnoAegaDY0ROjo174WbRvRCFA5sWlFur932L2a0dceZAXJDFyDaY5+5A+5YQI
 gNC2vQqUjVLeasn5PxXhMAAa7j/16lkRClmD8g5CGiEYmRvidQtzxIKvij4ppKqbZRJ9
 RkonPce8pXKdXw86YvlInePQdX8c1ic7TFrlbZy+1zYerMEU8IIr5GeiLhknxM4jhMEE
 lugULtEYx7q1Bn7ALGTjrbKvlBzUa/kFM7fjsRe4EgyRj6vQWW02NEqOYJiEk3YcI7Oh
 V+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mKsXFRcK8AcNaumHFcbmSoneU4WCI5BNbLya6zWwdso=;
 b=O2XYidUSSKtlOdOCngFwgr3wn6KPG7zDYRzaQqSzAmIRX9sbuY4EMJlQfobvAjczQA
 XbvoWWsBbSBspY0OKro8ubZ3bheDEZp85O7U5ZYyShKaMgYaZAAtKfoTAuDcSEGdn+Cl
 OtLrZHj4anbnxvFGMnbyfAOMlGY0VK0xiX1f4JDJ0tUOeYnuCX6jtPBi5rggetzRZHKZ
 yIEt4nqc8tJTu/UcziFMOEbw+j/XKontkqjhx6R5cPTQtBqpXFLJpFZ5yY+08OOhKIJz
 t5c2dAYG5IJu4g/CH+r4Q8aRMTH3o5hlABXjRxhKusgasPYVvaY6eo4mP3TjGlyQ8ypQ
 DdpQ==
X-Gm-Message-State: ANhLgQ3j2p3kSHaZv93snnm3iDWW7F23N9UAzX/kIIoDxWMkOBjl0QyO
 QSNBqeewLZNxqvaE4exvFgBJQA==
X-Google-Smtp-Source: ADFU+vu4/CzgwwWNZw4DY6j6M6oytrcB21iZBNHToT/4H+n6Y97GqaxPnIoWB+xUtDlIT2K+uneEpQ==
X-Received: by 2002:a1c:c5:: with SMTP id 188mr4903051wma.89.1584019894533;
 Thu, 12 Mar 2020 06:31:34 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m21sm12242885wmi.27.2020.03.12.06.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 06:31:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: broonie@kernel.org
Subject: [PATCH 0/9] spi: meson-spicc: add support for AXG and G12A variants
Date: Thu, 12 Mar 2020 14:31:22 +0100
Message-Id: <20200312133131.26430-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_063136_368355_EC68D7EF 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SPICC controller in Amlogic AXG & G12A is capable of driving the
CLK/MOSI/SS signal lines through the idle state which avoid the signals
floating in unexpected state, is capable of using linear clock divider
to reach a much fine tuned range of clocks, while the old controller only
uses a power of two clock divider, result at a more coarse clock range and
finally is capable of running at 80M clock.

The SPICC controller in Amlogic G12A takes the source clock from a specific
clock instead of the bus clock and has a different FIFO size and doesn't
handle the RX Half interrupt the same way as GXL & AXG variants. Thus
the burst management is simplified and takes in account a variable FIFO
size.

Now the controller can support frequencies higher than 30MHz, we need
the setup the I/O line delays in regard of the SPI clock frequency.

Neil Armstrong (7):
  spi: meson-spicc: remove unused variables
  spi: meson-spicc: support max 80MHz clock
  spi: meson-spicc: add min sclk for each compatible
  spi: meson-spicc: setup IO line delay
  spi: meson-spicc: adapt burst handling for G12A support
  dt-bindings: spi: amlogic,meson-gx-spicc: add Amlogic G12A compatible
  spi: meson-spicc: add support for Amlogic G12A

Sunny Luo (2):
  spi: meson-spicc: enhance output enable feature
  spi: meson-spicc: add a linear clock divider support

 .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  22 +
 drivers/spi/Kconfig                           |   1 +
 drivers/spi/spi-meson-spicc.c                 | 496 +++++++++++++-----
 3 files changed, 392 insertions(+), 127 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
