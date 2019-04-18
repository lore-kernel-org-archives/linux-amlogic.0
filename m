Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C544DC10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 09:46:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928EE20821
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 09:46:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DDrLjvZX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="giwTdgDL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 928EE20821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dm7aACvQe8eGuAn9W9mHDSDRCf+4cvEBmkQTGcu2BcU=; b=DDrLjvZXCOJPgd
	2dFc3ygAH7jBO7dARyeaZZoj+PVNYtBVZsoFHj2sKXui+m54lT9KUWYfFiWRm9H2u6AsefmK3grHy
	oerlgoGYLTKdx6Uk1Qdb+jqhyjz/lqFkPrxm6g9wyWmC5mqRLmMCWYQyNKIavGzQqyc7mUkVVRQz4
	gM0q4vg11vcCZk7tLWrvtJ2YYKjZkccEucJzZBtDCnVwUep9Vwryx9EgRfGRR+fbW7WxdAKmOtHpv
	Ud33Hbzp58DYkl0M9nZqSqzBwnZF0HgWbhC/sr6Swd/Ykuc4uDRQAZ8BVS9/caK4sbMyXlzuGIrPV
	D9K7ClKof+hU/2YBBsOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH3d1-00029k-Rp; Thu, 18 Apr 2019 09:46:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH3cy-00029R-Va
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 09:46:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t17so2116636wrw.13
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 02:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=wFOSH+TsufDrAKB6RXYXQt2TcaPAfldbSHx2BWbJYxA=;
 b=giwTdgDLtuXlOhDzfRleqFVVXN3qd49xjhg7zFvtCVDgVFM/AgZTa+wOoYQOw6ujWK
 1T2hfER+HjAbHZ2JeD1kIgpx60Wa/Nc2fR0zi/C40KkrwsEQX34oY4IOL1hTcAhrJQhV
 QZOzCpPdhw+qfOfJbx3whHzw/F3Zn9s/9h13prV9MYIUpkPK6OtESz0vbQHpFMS34bQO
 wEZYInevOA6cVpQIu/4HRp34+IS7WhwXbrjcYPBnbiABwxCPwJUHHg6A9ak9IMqqGlrd
 vsw09u/q4I+2tPXS2IDF+zwKXk4V84pm5aHBtrB55O2BNKFjYWqf+moqSM9NJd9CygdP
 CW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=wFOSH+TsufDrAKB6RXYXQt2TcaPAfldbSHx2BWbJYxA=;
 b=NiRxy0yQvZCNZzalMhn51x1EpqndAUc8JcKoPLPUH92sB++YF1S5B6i33NucEy/3gv
 ys7xyvRTPSoWUFjCZNz98TXDST5SoMiC9n58/HraG1j/CijjHCQx0mJSvKMR15j8mmHq
 ueGe+aa0uiZMc8RqCNxfni8zEZAzjvE3TFg4/YZlCX2YOqov3JFfohvITUHQXMfCegTc
 lbe6a5nZlK03DL5FJrXegsfyQ3W5ZL5hcs0WpjdrjB+Cvn8JtusU3eNuVNpGyjtlBJrL
 HT2lpJfDk9mPiBOrouFRoBUM93xdSCcEoqVU07KCt5WNG6+4ZFhyGvGVo4k4JoG9O4xo
 rIow==
X-Gm-Message-State: APjAAAW815LQAKRD23o3Meo4MkhghnCMZIIUo2ARntmn3iuBSL/949bj
 oUG06nHFY43xrld7ePX9MoB3p8wdo7I=
X-Google-Smtp-Source: APXvYqyBPw54P/D5S15QzOu6VM+WQp28dmywCDDa7fGzE5cNP9k10SL38i22EjIlOj0Gz2EgNwRrXA==
X-Received: by 2002:a05:6000:12c8:: with SMTP id
 l8mr58866072wrx.80.1555580798198; 
 Thu, 18 Apr 2019 02:46:38 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x192sm1724886wmf.48.2019.04.18.02.46.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Apr 2019 02:46:37 -0700 (PDT)
Message-ID: <3d961b5ea14a7aae4088282955f926e19b7bc9d9.camel@baylibre.com>
Subject: [GIT PULL] clk: meson: 2nd update for v5.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: sboyd@kernel.org, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 18 Apr 2019 11:46:36 +0200
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_024645_044144_F342328C 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Dear clock maintainers,

Below is a request to pull another round of update for amlogic clocks.

The main purpose of this pull request is to add the g12a SoC family
support in the axg audio clock controller driver. It applies on top of
our previous PR.

Cheers

The following changes since commit 90751f686e3f0415f1f931bf47ff14dd34316ea5:

  clk: meson: meson8b: add the video decoder clock trees (2019-04-01 13:34:29 +0200)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-5.2-2

for you to fetch changes up to 075001385c66a00fba9810b9ecb88d644384df88:

  clk: meson: axg-audio: add g12a support (2019-04-08 09:59:33 +0200)

----------------------------------------------------------------
* Do not register clock inputs in clock provider
* Add g12a support in the axg audio clock controller

----------------------------------------------------------------
Jerome Brunet (3):
      dt-bindings: clk: axg-audio: add g12a support
      clk: meson: axg_audio: replace prefix axg by aud
      clk: meson: axg-audio: don't register inputs in the onecell data

Maxime Jourdan (1):
      clk: meson: axg-audio: add g12a support

Neil Armstrong (1):
      Merge branch 'next/headers' into next/drivers

 .../bindings/clock/amlogic,axg-audio-clkc.txt      |    3 +-
 drivers/clk/meson/axg-audio.c                      | 1219 ++++++++++++--------
 drivers/clk/meson/axg-audio.h                      |   36 +-
 include/dt-bindings/clock/axg-audio-clkc.h         |   10 +
 4 files changed, 736 insertions(+), 532 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
