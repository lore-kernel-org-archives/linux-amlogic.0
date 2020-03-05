Return-Path: <SRS0=MYl2=4W=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24559C3F2D1
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2020 09:48:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3432073D
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2020 09:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gg/4i+pN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Z+TR8WC9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC3432073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J9WIdjO5XzK5DJqFFq58qPufRt6sKPWzomiQJecRs+0=; b=gg/4i+pNQjgXDp
	wKnJVQHnDmZ096iOoc36Yd+lHWOi71KZUaaD7m2IGeZRKjpDpDwYafOe/EsSLlRdJ1LlHzC5sAOSm
	LW3lYnsXnTZTZ/b8+znvvR0kDzgWAgSKLi97h7y72Q1afv6rBifNd1zL0H2eSPl3STOjokQ1NJKoN
	zSzzj5MCBjgq0gMiUwQIgvrhZeLxbaW4BYjfqkCdpIA4VCn5nw10SJffm0TSHS9gMBKQ6DOUAZ/KW
	+tEGLIUnBQ4gJFnCSbRUNx3Rb8cJXQzZxlkg4ZgiU3d5dcVR75Yj+J2HQuqhpB16IyGdj4PGvPL2c
	ASf1jIpCShIL5LVp9Cjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9n6m-0006FN-Nw; Thu, 05 Mar 2020 09:48:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9n6j-0006F6-9s
 for linux-amlogic@lists.infradead.org; Thu, 05 Mar 2020 09:47:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id a132so5447402wme.1
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2020 01:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version;
 bh=poeMjG8rAZ3jdKnjKjqMvGT7pDny+HSkArRD2RHp7Ek=;
 b=Z+TR8WC9GscfVVlIMbVCiyN1T1cgCr0p7tMMPO6DQmgGM3/HOjkGzfWssnxVcsAP2O
 HxpquAX/l9yekwLvk4/xCtwYMcldU3p/V8NWt5JAVld+7p75wg4Nx7FKT6nnLAXXbR3K
 ZKRf9q3Gf7C4z/GxNBK6G2ZLmYLybWnVYqmcQvXotqVEyvg5NpqwrnhcVy93pPHHr0zG
 a6tkga8Z6b30zUDb0OMrm9/0rrDwkPH0pYf2yTTr2Qe14gwrpaie4agtfd9DKh71XQPU
 HxkET4zzKD3VaKvsD61/KzC6i3rl5/3BXC5H7bQuF8yhu7rRucmNX9RQ45HE//6d7KwZ
 Q6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version;
 bh=poeMjG8rAZ3jdKnjKjqMvGT7pDny+HSkArRD2RHp7Ek=;
 b=JoadrT2a7zlSIaSSaEJBZrm8NbNAg9HhLdJRBTX6h6J9Sy5tE5Fx2/HoVRUicapG5n
 fksQMuEBEwjFbYHLmldFxu5QYTKWAFkFR5qAsm3CBmrBQE8lATOOlC4iDfBFi/DSEL3e
 7/BmLdGdS79w48p0istYmoU0uUfuZ8TAm8XwqJX02YmH7g+pF0+zh1c+4J0D1w7cw+GR
 8xWwZrWhVtcSU41DB0+jRh2f/u9byLWA7T+82oNoxpezMHzYLzPBxIwsxbpFWwgQiRcU
 Mm6J4Hg/O5T5/VLg43VX1oNU+OTl+x6dwEocV1NDZGn7q+iq4BAwQE1aN7fIQ0+/k1Kh
 LecQ==
X-Gm-Message-State: ANhLgQ2upq8srGUpV8EqnM4k37nzksvo42N61x5Ui+9JZMdeWYGKmqCr
 gaMSAXySULGvw98CIwDN4kneLEP/BcU=
X-Google-Smtp-Source: ADFU+vsIK4VLakdc5xbQnKSxaaDlv5HL2uAuTWY7gEvbKwA9rEzZpQtHn0hJwR3p+tHf022aDVWNFA==
X-Received: by 2002:a05:600c:104d:: with SMTP id
 13mr8474198wmx.50.1583401675396; 
 Thu, 05 Mar 2020 01:47:55 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s7sm5452352wrm.13.2020.03.05.01.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 01:47:54 -0800 (PST)
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] Amlogic clock updates for v5.7
Date: Thu, 05 Mar 2020 10:47:53 +0100
Message-ID: <1jy2sfnnee.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_014757_484425_411E3C54 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stephen

Here are the amlogic clock updates for this cycle. 

Cheers
Jerome

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.7-1

for you to fetch changes up to 71202c412478d6553281726a6772d0d5510c42fb:

  clk: meson: meson8b: set audio output clock hierarchy (2020-02-21 11:44:41 +0100)

----------------------------------------------------------------
First round of amlogic clock updates for v5.7

* Update audio clock gate hierarchy for meson8 and gxbb
* Update g12a spicc clock sources

----------------------------------------------------------------
Jerome Brunet (4):
      dt-bindings: clk: meson: add the gxl internal dac gate
      clk: meson: gxbb: add the gxl internal dac gate
      clk: meson: gxbb: set audio output clock hierarchy
      Merge branch 'v5.7/dt' into v5.7/drivers

Martin Blumenstingl (1):
      clk: meson: meson8b: set audio output clock hierarchy

Neil Armstrong (2):
      dt-bindings: clk: g12a-clkc: add SPICC SCLK Source clock IDs
      clk: meson: g12a: add support for the SPICC SCLK Source clocks

 drivers/clk/meson/g12a.c              | 129 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   6 +-
 drivers/clk/meson/gxbb.c              |  21 +++---
 drivers/clk/meson/gxbb.h              |   2 +-
 drivers/clk/meson/meson8b.c           |  21 +++---
 include/dt-bindings/clock/g12a-clkc.h |   2 +
 include/dt-bindings/clock/gxbb-clkc.h |   1 +
 7 files changed, 164 insertions(+), 18 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
