Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB8AC282DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:24:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C9DF21905
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDCn1QMq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FaQFMj/o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C9DF21905
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iUTqCKD1M/f5hKDO5O7u3LZ56ymZDVI3HRmbL1u4zR4=; b=kDCn1QMqXSRybR
	LRe4XkMMJ9gtfDlwKJIGlzK2UwPa/S4NrmxfmG46ujN597Dzi3WoIGHpP7sVBmja6GXPi2n6NEuqs
	BoPkA14behSaAzxzrYecvJ74mK/RBjam3w9A+zJ2oF08kGMavOfz6sCLgh1I9LgEJCM+M6uaRBS1g
	GLae4pXIlEJEiDLNfec70UzCscPFL0MUSikfW3dWD8xTXVCVd+m3IzU6KIrZGLOFYycMgM4lbMiSa
	QZlv29U+z5GFfwMyFdK2SdMRNwHR6Sv4ib5tL6QobYNIlptoLJRs6Ik8hYsYURjmSdVqi3qfZVmMw
	ikCZXSJwXo6osBWbHYGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDQVj-0003Va-Rv; Mon, 08 Apr 2019 09:24:15 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDQVY-0003Ov-Mu
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 09:24:14 +0000
Received: by mail-wr1-x441.google.com with SMTP id p10so15482221wrq.1
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A5Uny1FpPc/winyYxn8pHKsj17b/jtLMie4lrrPoSm4=;
 b=FaQFMj/oNV6wcMNBV8gzYSbmSIDfc7ZSOVPJlRQMQUDnm1UpZjA+VbtD1nqlfzKDrV
 Q/3fh92G3raq+ISSPEXWzqwrwLAcfHpQmbb10hOK7NORa6tbUloJrRqzrHL60FQu8Ent
 7c1nAPUP5GBmflS6AMbi+tpCLH7QcVSilReOS8A8aNw6SzNccjEUoXfgdjqHQVScnkV3
 agIx1P5K2GU+OAo9hvqMPJ8764kRKOJhKJXfZKg+eHoSvPJ2Pr4nJfc/ZmbXgAQGWj9T
 +U518baxQz6oKUijkR21cSrYbVweRifzvc2P3opQUpUcQqQiD1jz+4AmlEaGx4/L0cT+
 pTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A5Uny1FpPc/winyYxn8pHKsj17b/jtLMie4lrrPoSm4=;
 b=R3y0UYFndTXSNbtAz4YmrXgtX8v1c+sYXPaL2tM1+TNby1cNea9T4DGETwaxZV2tNY
 SMBSRrT8Xjq99qQD6TSUc2HsXHigkuCIHHvOJ2Mpld+Dtq/bNbBmQQDxvDXmBumHEZlm
 Ezu7RlPhm6j2G8LF0ZardgqtLSXko9ywVZHkakjJs5TD7asKpuxdXHBSZmHW8NS22NmC
 6pcp+FIjsH/ea/EqsYhBgDI2cotgt7qYk2APBS7azmfc7R2GH/jUWAtfy/QzjubP0Ab3
 ewgmJElFloA3FFwyH//MM/XObBVgfLPXOBtFi3Geq0rBD/nqDZIdLS3PIeAVU2iQ8/hg
 HI3w==
X-Gm-Message-State: APjAAAVBIgg8ycr8SlzPJpWLincHihS+WL0PygXfIN5sAolVEovzWaHt
 47NnPt0IjjkpoTouypQYBcuGBQ==
X-Google-Smtp-Source: APXvYqyvxOgBmrGCs9EGNc2CTiXm97QS5dwHHBvroH9tiDHtGi1VGk2O7U79DZdP28qc3B14j1LeUw==
X-Received: by 2002:adf:fecb:: with SMTP id q11mr772730wrs.252.1554715443187; 
 Mon, 08 Apr 2019 02:24:03 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j3sm70528221wre.51.2019.04.08.02.24.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 02:24:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Subject: [PATCH v3 0/3] media: platform: Add support for the Amlogic Meson
 G12A AO CEC Controller
Date: Mon,  8 Apr 2019 11:23:55 +0200
Message-Id: <20190408092358.25894-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_022404_965027_74BF5D48 
X-CRM114-Status: GOOD (  12.25  )
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

Changes since v2:
- Really fixed compatible used in driver
- Collected bindings review tag

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
