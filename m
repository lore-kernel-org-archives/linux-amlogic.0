Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7D3C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:20:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C13F213A2
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GzttWV2r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TYWmbyIZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C13F213A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tcuWibzEcCamOG147cay13iihwl+8vwzN2ReTbh2QK0=; b=GzttWV2r+tV30d
	w1fgGnKFuTcC4G0ZnqkngLgii5/341/EYa1Wy10NcnR0p6BRhvgNBGOQ3sE/06RGHWsMRI44hsfH0
	5J7VGwwxuRhth/kvRuFJ0HGg9wFgTP5Lubr7svF3EZd2Zg1jWhyG3RElk7RZ1XZOspBmQclCdJKPr
	dXA3MWhNlWfuj3oNcocCaQ9qhWb6n+3nsufNmrjs9B97WX63xyDmUfxjMPG0ADLdpfCteScdfaEoq
	xPm7TubA3C3qszNVr6KlKTonqEAZfEhTSinqYRBsw77kf/X/joN+0zMDB5RjxUd/zVI8xnLvdg75x
	GtsCnncb53rqixYMdcUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAsB6-0000Cl-1i; Mon, 01 Apr 2019 08:20:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAsAm-0007E2-7k
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 08:20:20 +0000
Received: by mail-wm1-x343.google.com with SMTP id q16so9315267wmj.3
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rEg3FUE78pv51fRzdo9AOI1NgLqP/dc+g1COkhcT4wU=;
 b=TYWmbyIZi+MZUrihq9REeBWs3zAwmeZkWmcF95pUtVGlJvVYMrM30ptbFUy7Lbf2Yn
 GiFTO0SwZpPAS7mxwl6rptKVTrTPr68fj1JFyIH2r/6MziRwObhIrhvlTm2uQeZuBvO6
 EA5eS4oeQwKOYI5z0TYO2ebCbzkB1NP9VnVuS/uipYq6LUNQz/AXM8vy6EzF7Mw666JK
 to/Hp8aefDnTJ/rkh8tOZLiZjvaHBV/MJWpEJ0GOjZe+A/zmzKtszn671dih+OUm9XTb
 uS1znov/jtg+NMubMC0vjNUs9iDdKRv7xvMPWD3EpYlghck8V2f/8cjdc2Z7xhg8syug
 7IqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rEg3FUE78pv51fRzdo9AOI1NgLqP/dc+g1COkhcT4wU=;
 b=EB49WYF7HLTTE8Qo6UVIVDkEBoiIz1M4FSXTZsgBglSlW3PsVT1jYXOyWs6+ML+nvy
 AykCFUOYb0mf4V/h3K0v2ZQhmkFpzJcu7WfDujzPosC7KwUYbahrQ5fuxCfTvKy3nmPv
 3dwn9vtpgy/Bv4J7yKnpfSaTeU0zfr/7dy349t5MYkI4/tPqBkPPyTuVe4dSJetPYIzE
 vAJIew+Pxy3wW/PHCm9vHhR21UQwQmHzxfo5eEINpJTkK1nL6vlkUppjtWUaHP5euB1b
 bDG+lpFXHj3rBwMJgMNc0mZu8rTACSnt4oaSFsE/HuqKq3HiwJbcFkl8XHMl8oLYHCeY
 aoTQ==
X-Gm-Message-State: APjAAAXSiGb11lqTcHz68IkzK2JugkXmGiONcr39/GHQQdMdY74tKTuV
 jH7uqKZ7izhqpRHj7JnT+xniWw==
X-Google-Smtp-Source: APXvYqxkLbBHJz4aZZ0hB9WF1VFFL4/zSQWx3FvY8SipCuhxVAGxXg6xedviDZAljU4qfFU2GHVv2g==
X-Received: by 2002:a1c:f618:: with SMTP id w24mr11630071wmc.3.1554106801798; 
 Mon, 01 Apr 2019 01:20:01 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id r196sm10053534wmf.22.2019.04.01.01.20.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Apr 2019 01:20:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Subject: [PATCH v2 0/3] media: platform: Add support for the Amlogic Meson
 G12A AO CEC Controller
Date: Mon,  1 Apr 2019 10:19:56 +0200
Message-Id: <20190401081959.16474-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_012004_431911_4C6B0F12 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A SoC embeds a second CEC controller with a totally
different design.

The two controller can work in the same time since the CEC line can
be set to two different pins on the two controllers.

This second CEC controller is documented as "AO-CEC-B", thus the
registers will be named "CECB_" to differentiate with the other
AO-CEC driver.

Unlike the other AO-CEC controller, this one takes the Oscillator
clock as input and embeds a dual-divider to provide a precise
32768Hz clock for communication. This is handled by registering
a clock in the driver.

Unlike the other AO-CEC controller, this controller supports setting
up to 15 logical addresses and supports the signal_free_time settings
in the transmit function.

Unfortunately, this controller does not support "monitor" mode.

This patchset :
- Update the bindings for this controller
- Add the controller driver
- Update the MAINTAINERS entry

Changes since v1:
- Fixed typos in bindings
- Fixed compatible used in driver, using the bindings defined one
- Fix regmap return value handling
- Fix irq error handling
- Fixed wrong clk unprepare on oscin

Neil Armstrong (3):
  media: dt-bindings: media: meson-ao-cec: Add G12A AO-CEC-B Compatible
  media: platform: meson: Add Amlogic Meson G12A AO CEC Controller
    driver
  MAINTAINERS: Update AO CEC with ao-cec-g12a driver

 .../bindings/media/meson-ao-cec.txt           |  13 +-
 MAINTAINERS                                   |   1 +
 drivers/media/platform/Kconfig                |  13 +
 drivers/media/platform/meson/Makefile         |   1 +
 drivers/media/platform/meson/ao-cec-g12a.c    | 788 ++++++++++++++++++
 5 files changed, 813 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/meson/ao-cec-g12a.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
