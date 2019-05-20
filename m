Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9EBC04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:38:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2051021721
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:38:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U0SAjaM+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LKmA84tL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2051021721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hJ0ZmxGOqOB/lsQSm4yfuHo4mRCIfgR0ERo99HFMF+E=; b=U0SAjaM+ptYae4
	+l769hYyfy6m86jQ3l0CCz15YxC01+IBkI9trb+ongGleqW0Ie185cd6eRJQop7di4EAtnAtQzZbS
	RhFfZeLmLQXAIWfA9H4SZHnUcummpytZfK+b0XmABRQrWfzsqd4CwFKSQDSC7D9pwR6JTsE5B+0yu
	RxwxsitqE7iI0pPNANPNLm2FZuonXJOxg8qIrAGTThE5/CEMpAyMHwEYNKi6P+rUnI2UIcwXzrxf7
	1W6NEAKITqtgAHmjsAbQW2VhOZk6XPX8FCIyqjELQuziUTZi/rsbuSfjjNxNkOC07O5T8iCNdbKcP
	MgkmqO/ETLR1BPZRmymA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjRA-00073y-QS; Mon, 20 May 2019 14:38:48 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjQe-0006JF-5U
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:38:19 +0000
Received: by mail-wm1-x344.google.com with SMTP id 198so13570651wme.3
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qPErLrIi2TqGTXmqPusukwp+5dK1tRC/mOkp9SybAko=;
 b=LKmA84tLspOC3dfQvPmPXP4G3MGwvU9fFL1Qw8krD5TnvhXLlsPrBYz4SDv+771req
 tZ28MfmFpF8aV+qH22r9G89LNY7z/5BM8vRbLyxq0unrjvsEZSNLjaZJIcamsElvr9Wi
 7v0Atn04/0XH5KhhL1WTm9fJ8NhpFRiL6x55i0VHCM+zaEt24js9GiijnKCIhGhD7Kmx
 aR3ZcZpV071XAM8c1vPLxbF2H2l+AJ2Qg9CYRJMJYdh3QPOEV2ld6DDP6+314na/6TzE
 Bt2ZjVKD0nV80O3y29GEi2CpaajMEAFCw3U/suvT1vDxiYh0Z8oVdOuKvyre+1Cu6zz1
 r2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qPErLrIi2TqGTXmqPusukwp+5dK1tRC/mOkp9SybAko=;
 b=t34SVFYF6m3kUEbWHFepOrrM4iTxl3G1t1/Fpg44oXjh88uRAK00wRAWS2mUuEff/O
 zL03fJRAJ/kOs71fpXc/761xm5eZ62Y85h45IRMtc+SPMZ5kYyyQMy8eYADZqwav4dRS
 ZUGhHLC2Wd1k1gSeUXQzQq40mGpGv/GqkR0/IyF0XsIZj2Ki3J9XHD6EuDmLcvO4M0Ar
 /3Rgv30YQbZ48r7YCy/gOHCQTmadlZPfGiquoEbv6FiINuopksnZBXDdlOcfXJh6c1+g
 IV0kG/hi2KF4RX8ttFwxtpJhicrgfagBJonaKTryMJWGztHuGF6rkBdypLE40sPZXhdW
 cQng==
X-Gm-Message-State: APjAAAVzGL0hChd58Mam8lmzBucRofsNaXjdfq14/5nkHlzlGqW/uKRf
 SDZeFliHEV6B6qD5TJJDpgDmtA==
X-Google-Smtp-Source: APXvYqzqGlMUt7XMKaF9kFn8qoRcnhBeXJcmp0cRColc1Kpm2osu1wfI5WPOgJXKJ0djYeIX+7dboQ==
X-Received: by 2002:a1c:ed16:: with SMTP id l22mr5582854wmh.96.1558363094267; 
 Mon, 20 May 2019 07:38:14 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y4sm12505976wmj.20.2019.05.20.07.38.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:38:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 00/10] ARM: meson: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:38:02 +0200
Message-Id: <20190520143812.2801-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073816_664312_DF908C70 
X-CRM114-Status: UNSURE (   6.54  )
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

Update the SPDX Licence identifier for the Amlogic DT and mach-meson
files.

Neil Armstrong (10):
  ARM: dts: meson: update with SPDX Licence identifier
  ARM: dts: meson6-atv1200: update with SPDX Licence identifier
  ARM: dts: meson6: update with SPDX Licence identifier
  ARM: dts: meson8-minix-neo-x8: update with SPDX Licence identifier
  ARM: dts: meson8: update with SPDX Licence identifier
  ARM: dts: meson8b-mxq: update with SPDX Licence identifier
  ARM: dts: meson8b-odroidc1: update with SPDX Licence identifier
  ARM: dts: meson8b: update with SPDX Licence identifier
  ARM: debug: meson.S: update with SPDX Licence identifier
  ARM: mach-meson: update with SPDX Licence identifier

 arch/arm/boot/dts/meson.dtsi              | 44 +----------------------
 arch/arm/boot/dts/meson6-atv1200.dts      | 44 +----------------------
 arch/arm/boot/dts/meson6.dtsi             | 44 +----------------------
 arch/arm/boot/dts/meson8-minix-neo-x8.dts | 39 +-------------------
 arch/arm/boot/dts/meson8.dtsi             | 42 +---------------------
 arch/arm/boot/dts/meson8b-mxq.dts         | 42 +---------------------
 arch/arm/boot/dts/meson8b-odroidc1.dts    | 42 +---------------------
 arch/arm/boot/dts/meson8b.dtsi            | 42 +---------------------
 arch/arm/include/debug/meson.S            |  5 +--
 arch/arm/mach-meson/meson.c               | 12 +------
 10 files changed, 10 insertions(+), 346 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
