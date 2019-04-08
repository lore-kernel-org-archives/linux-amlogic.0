Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A422CC10F13
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 12:18:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74905214C6
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 12:18:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZN474lC2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="o/rvHZTF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74905214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mAIXIQhjhFcBwSoX1RZkObJ/nE1lCTCrb8ACUkXEOHc=; b=ZN474lC24o9Ig9
	RTDv/09up6/ayeWHP6LMT+2CycPAGJ+MRWRpae8X8EXoSMBUy6rWk3KwIkAb4tH2ob78GHXC6lFG3
	3aeCLPbBlMRSR2KR0bsXIaBh5dT63aipe16T5csibW9+gmmUabGzSZFqT0Xqv6haAvxySLsIyqp4l
	CRwhWYQehVNvkWZ1XZQ5CCKrE36tPJ1xY1clbL5d+MZyUkjqrukwjEnmZzGG5P7AzsJtfzuPBTKZt
	Q0JzvDdTze5oqoLmOHC8+rsUN3bX6TJrg799Loe96kfnr5QjZH+ihxN8AtBB5+SGmzKYI1QhcJHqB
	G6Dd2Wlwc+mkc0d4KDyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDTE5-0008LJ-Py; Mon, 08 Apr 2019 12:18:13 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDTE1-0008HU-Db
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 12:18:11 +0000
Received: by mail-wm1-x343.google.com with SMTP id v14so14446735wmf.2
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 05:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8UpAj9YfdUW4CMDRxIiHz7xX8khEqdof0qRT0yl1Om0=;
 b=o/rvHZTFAe0VdbSzgTiiC99n/h4CzCWZe0CTp2ayr1+YHssIea0MmB9jYzr5+9LWd9
 0MO9ytqi0WMvFDguDixKX9s6xDFoDaZcSccQOeJvU+OX5PoNGreS4m1AwGJXXvtpICCZ
 Z4iGah8tY3Bp3XvTIj5qlSYcAnnAVn92FXwsvM4sZM7WE2nIcN2M2LPxQXeNL43SD34I
 sRoyIXDRK3k8hz/MKTYVr23UtPnn/4mxD+IsjvvqWLcYyYjOhf6CRlhfm+ZA3seLfOz8
 8J5VkxEFMQl4GxN5P2GRwLjQPIgBIVWNW+X14qMWOE6o3StUViVfsU7Hf9vh4NEyn3vd
 ulKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8UpAj9YfdUW4CMDRxIiHz7xX8khEqdof0qRT0yl1Om0=;
 b=tT0TYG32+2DY6qhET/DEb+DS64rPZIrOfrCLaaj3Lh4h3vIA3bboH9oOicPYOhL6ja
 XLYNbhCxNqXcrVN20lSIMp+Q03MSUsFVOaHe8ee+WLtZyNBvuYOaCuISRaNnYmfYPrM6
 qGacFrAToX1boYyAKN5yq38Ng9nSKg4OsxJJJobdw9b9VV+EYy7AP286czUauPkE1+CO
 X2NnoeUFRL/u6vYyiK1/7md78tIcAYAFISt9llfbJmP9F2tXz7lSjQvhv6U9yz1Sksta
 k/HgYTIHhACDxv/RXqOPC4/wF6n2yJ0eo86C/GfVI36c0u0dW37umUkVb/7fjepvqO1z
 cDzQ==
X-Gm-Message-State: APjAAAX50+zA4KE6IqzCcYbWItYpdyHw6rR0ccvMR2EE1BJ0O7hNSBf3
 6TPyEcQ3R5K9jAaocHIAzcXnlg==
X-Google-Smtp-Source: APXvYqzLuoC3RfA2e2x0g4Fs95byB5EytlhVbbhVCctSoT7tKo/dTwrmxUbR2pSfQyOoo8Fat4opfg==
X-Received: by 2002:a1c:9e96:: with SMTP id h144mr17941211wme.33.1554725887208; 
 Mon, 08 Apr 2019 05:18:07 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e1sm52865103wrw.66.2019.04.08.05.18.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 05:18:06 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Subject: [PATCH v4 0/3] media: platform: Add support for the Amlogic Meson
 G12A AO CEC Controller
Date: Mon,  8 Apr 2019 14:18:02 +0200
Message-Id: <20190408121805.2870-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_051809_457827_C4F9F506 
X-CRM114-Status: GOOD (  12.32  )
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

Changes since v3:
- Use the cec_notifier_find_hdmi_dev() introduced in [1]

Changes since v2:
- Really fixed compatible used in driver
- Collected bindings review tag

Changes since v1:
- Fixed typos in bindings
- Fixed compatible used in driver, using the bindings defined one
- Fix regmap return value handling
- Fix irq error handling
- Fixed wrong clk unprepare on oscin

[1] https://patchwork.linuxtv.org/patch/55513/

Neil Armstrong (3):
  media: dt-bindings: media: meson-ao-cec: Add G12A AO-CEC-B Compatible
  media: platform: meson: Add Amlogic Meson G12A AO CEC Controller
    driver
  MAINTAINERS: Update AO CEC with ao-cec-g12a driver

 .../bindings/media/meson-ao-cec.txt           |  13 +-
 MAINTAINERS                                   |   1 +
 drivers/media/platform/Kconfig                |  13 +
 drivers/media/platform/meson/Makefile         |   1 +
 drivers/media/platform/meson/ao-cec-g12a.c    | 779 ++++++++++++++++++
 5 files changed, 804 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/meson/ao-cec-g12a.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
