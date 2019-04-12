Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06D2C10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:31:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DE632171F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:31:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PPE7ylcN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EgRKAfxi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DE632171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wIOJYSXk2ULGI4kNnBelr7BSMR/vwA7glGyKK0mX3bo=; b=PPE7ylcN1Moxvl
	WXKBeS+xDr2H8hnvj7qWUT4catuzBfS1XI4616sCvXqVlHYF1wV1DvZpevwLKeZq8L2yox9dqBQ2x
	ussyJkLUtWQmlwoHzRNxWfJTi4ZMhwMg/JJQdFMFOYpT9igGo+lPUsAE1TZB9G8y0hDuThNORHjjf
	ESHYKnjTnHvQxeInWgOKt1upeOog5gCR1y6CUg+b2bFtmRAUzd/f7wrxwXhgYlwWtKAOMJ1x3Br54
	kitfsnN0/uk2ZdE1lKlze9AGsv1KQ2890JlGkv/wItBjlY8OnrzDiNThhSRznZvX+MhDbfpX5R/0G
	d+pvaFtuJuu3/ZRXkRsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEran-000262-D9; Fri, 12 Apr 2019 08:31:25 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hErac-0001w8-3P
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 08:31:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id j9so10807501wrn.6
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nD0E6tvz5YY5blNDuqlTgUoxXWGGIerDYPpbiC5BzT8=;
 b=EgRKAfxitsVdBGjPWdMUZjFwye2c9N00X5az65pVszj0chMAgMcaKkYIDmRR4hQWj9
 AH+SIz1zBUV5gS/CiBgY56vh6/7vJYNxKzXJu3LKQ3JMojEEt0Pf+BSuD17uJtBtc/BU
 id2+oDFixe7eCFxaWEXFFku5Ls5Jim6vU1X057P6AsVhC3AG33vruAdinCBSSJO9qwNe
 JVsyAX+s4YCpfRTpc5llav0yEMplLflJ97khEd8CoRrDS3p4Kp8Na9WKTiwiDLtFgalm
 WoLfkHZ0gVijqVwYb34w8hy0ZHlqn2D4GybOQCNicIvo9boh6FDi0j9peCdKLCp850Dl
 NQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nD0E6tvz5YY5blNDuqlTgUoxXWGGIerDYPpbiC5BzT8=;
 b=G5W1iIA73+OrAUxEhS9qIsYEvO6rjI5mXiHqd1gZt6LpqetEf9ttnSKawEkPdllSHG
 sLjZDSAqVf9myBJ2bIPmNnxNXVH4UzZl7Q+yZmhESHrjhpjXPGMJ1wTs2w1+NOK1uVPW
 BasRQpbMGk6VERfpw3Rt9sRA+rVek8d9OzQ9RldFkpy2x2xdr3XPkqzjMnCt0XHhLHeK
 2coBYILABL0WdvZo363FCNOfNhPsBWZnhWhe/4GOVkCu/JNgUhMnPvoIALsRQ1WjNTG1
 aOajceULAZXWl3b3sxU3P8zJ4mY3TwahRvQeqmfqxhNOm2EHdkXdIMWkqUa9nAnHbtEc
 xbfA==
X-Gm-Message-State: APjAAAXFUT7o2af4DOrJhcQwhEh3Nj/paU5SI0r7VQLsl+on0w6gj1+8
 bSymz7HgM0SGzhFfpd50z/piuA==
X-Google-Smtp-Source: APXvYqyj9qhtklu5zlotJHBRMnpz1f4ODSoQ6hdMNzhFrM7HYZ3UpvCzBSC8eFhwzrEng6nmndsCpQ==
X-Received: by 2002:adf:ee07:: with SMTP id y7mr32473119wrn.219.1555057870812; 
 Fri, 12 Apr 2019 01:31:10 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w11sm116054702wre.15.2019.04.12.01.31.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 12 Apr 2019 01:31:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Subject: [PATCH v5 0/3] media: platform: Add support for the Amlogic Meson
 G12A AO CEC Controller
Date: Fri, 12 Apr 2019 10:30:57 +0200
Message-Id: <20190412083100.4070-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_013114_190531_4AFB767A 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

Changes since v4:
- Rebased on top of [2] to use cec_notifier_parse_hdmi_phandle()
- Added Kconfig dependency on COMMON_CLK and OF, and selects REGMAP & REGMAP_MMIO

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
[2] https://patchwork.linuxtv.org/patch/55588/

Neil Armstrong (3):
  media: dt-bindings: media: meson-ao-cec: Add G12A AO-CEC-B Compatible
  media: platform: meson: Add Amlogic Meson G12A AO CEC Controller
    driver
  MAINTAINERS: Update AO CEC with ao-cec-g12a driver

 .../bindings/media/meson-ao-cec.txt           |  13 +-
 MAINTAINERS                                   |   1 +
 drivers/media/platform/Kconfig                |  16 +
 drivers/media/platform/meson/Makefile         |   1 +
 drivers/media/platform/meson/ao-cec-g12a.c    | 779 ++++++++++++++++++
 5 files changed, 807 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/meson/ao-cec-g12a.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
