Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD563C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:35:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F876205C9
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdrJbDmX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QTlSeDd6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F876205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kcPPW3CplmO0IrW+vjJcAZN72M3wfz2RfedTcXKxYtI=; b=qdrJbDmX1DIGe5
	0Nh7uM+cGLfeNnBZYAYW10e6ZYQQgRaMJS8G9Mbrp43up8aJ53Brgxu11orpANNv7TYy67H1Uld7F
	h0zrEcIx8f4kPL5fD7N8U2sFxYFjh2xcGgQ4pvcmH3/vErdG57R0kIJ0Enfl4b1GBps+lMsc5IbHR
	wMs+Afh5YuAah9OH6s0hTCR7GglmqYBCXE9xsYyt7Ky8+VyyAOdG6XnEzkIeNXxp5uq/rmuCZfg+S
	/AQ7A5w5ZQEizBV4whBiMuuWr4EN1W3nZwoUUow2lPW5SlTOnME0mdei0MZLoEMjUTki+2XsHvXuL
	8Y7RA0tLDTfVLcocbhUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8TV9-0006IY-FU; Mon, 25 Mar 2019 17:35:11 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8TV4-0005h4-Io
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 17:35:10 +0000
Received: by mail-wr1-x444.google.com with SMTP id k11so3778393wro.5
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 10:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lnQ9Y1fYzcSZfxA2CD5Z1Q398yaxdzQe2+YWsYEaBVo=;
 b=QTlSeDd67uLHBe+FyH15m2BDagLrsgMib+10miZWoY2yIkcUK05Ihr60F7Dl2shnsH
 N370gM83t4G/TwCC7+lQMTl3OzIHDog3SnKahLSFFl/899oh5qJqNbDgluzxGSuwp8It
 Dj46USmAqe2w6fs4PLc2OVzR+Ce765D2XmFP5qdB9TLQOjd/FVRJ9dEfjhmKh2N4nDKj
 XSkQyWuAbO15Ns/Fe/BHjHT8dbo1UYDox3afIDjZEw/hwHJl8OgFyN6v6btlpj5MsmzZ
 lABMYdFbYU47x/be11XzM3zPQXchWHEmTQ1c0pDAW7QySPfZDINtSGuM++uhp43VM8Dk
 oEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lnQ9Y1fYzcSZfxA2CD5Z1Q398yaxdzQe2+YWsYEaBVo=;
 b=CzWxtXS2G25dtlVNax5mWj2lAqCmckfizkzwE6kZLTzTdx1lK34TwNux3ZULj7CE2K
 sdGrkqTQBOLMAAg2XDrk2FkC4ZchkfQeU8LkMpbQ7jqNgEnlz7Ro6UDUePspQikDDVfD
 rUNnfCmwOI5Wc0eSFZOHaIdT3I/N7tiy8i+kiktcDPvzELj48LgiIbg3dd98DJNC2aKr
 ql/2tmuUfvYz78HCgUFSJYSJIS9xkaghVXT32vwaN1x+Vi7OgIoblOdaf28Ho8EoE18J
 lKzanaILwNYzzNk5k9/IRBuMU7KyfUsHHlHvx/fRjMd9geugGKYXhMQH7r7zT0dW+x84
 Hh0Q==
X-Gm-Message-State: APjAAAVW92suL7glvFuEzTorQ7hZhAN+SfVBqS0x0aEN6cC9NzOUALw2
 BcNPtMErKuQXROXeqLvAaXesmg==
X-Google-Smtp-Source: APXvYqwVTL/cSQffrQXPHLK0MEqsQrIXElwzTpgSM7hG2Dumj7gxFlTg1v5MUFq1zot14ZXI1oR85A==
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr16672219wrs.166.1553535304504; 
 Mon, 25 Mar 2019 10:35:04 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o15sm16003227wrj.59.2019.03.25.10.35.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 10:35:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Subject: [PATCH 0/3] media: platform: Add support for the Amlogic Meson G12A
 AO CEC Controller
Date: Mon, 25 Mar 2019 18:34:58 +0100
Message-Id: <20190325173501.22863-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_103506_631788_35408AD1 
X-CRM114-Status: GOOD (  10.99  )
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
registers will be named "CECB_" to differenciate with the other
AO-CEC driver.

Unlike the other AO-CEC controller, this one takes the Oscillator
clock as input and embeds a dual-divider to provide a precise
32768Hz clock for communication. This is handled by registering
a clock in the driver.

Unlike the other AO-CEC controller, this controller supports setting
up to 15 logical adresses and supports the signal_free_time settings
in the transmit function.

Unfortunately, this controller does not support "monitor" mode.

This patchset :
- Update the bindings for this controller
- Add the controller driver
- Update the MAINTAINERS entry

Neil Armstrong (3):
  media: dt-bindings: media: meson-ao-cec: Add G12A AO-CEC-B Compatible
  media: platform: meson: Add Amlogic Meson G12A AO CEC Controller
    driver
  MAINTAINERS: Update AO CEC with ao-cec-g12a driver

 .../bindings/media/meson-ao-cec.txt           |  15 +-
 MAINTAINERS                                   |   1 +
 drivers/media/platform/Kconfig                |  13 +
 drivers/media/platform/meson/Makefile         |   1 +
 drivers/media/platform/meson/ao-cec-g12a.c    | 783 ++++++++++++++++++
 5 files changed, 809 insertions(+), 4 deletions(-)
 create mode 100644 drivers/media/platform/meson/ao-cec-g12a.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
