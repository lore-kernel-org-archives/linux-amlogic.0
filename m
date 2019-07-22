Return-Path: <SRS0=kT+d=VT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3095DC76188
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jul 2019 09:55:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8BC62199C
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jul 2019 09:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qt/23Q9C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WhbT/meS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8BC62199C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QPhNx+4YlfVPtL/bu0TdoTrLSTEpgXCKKcDotPKbPQ4=; b=Qt/
	23Q9CMW+H50Bb/5NFEmyk0uanKhZG9mns2WSjn8hVaenQWtAb/7HXVrZ6xqVnoh6hGZUeX+9E5d8e
	12XlODKGyZMV5VfOMqZpeF6HmqzosnXlH2esYZGMYJyX+5Umv86iH9Xyv6EFbcdm0md4mB/HG9gA/
	AjXAyAepC3wSplVGoRnufwSu1/pXftIHj3cUvcYus0yHQtUfhkp2Hi50IwSFYzB/4WYflPoSJuZqz
	3n16WFmOHXhN4yzhrZ7S4OiKhtgwMaMmmDt0ajjAio5rmLVT5g3KFKNjeZhLf6mLlwlIJfaAUJ7qc
	CGzF1RQCwJaH/MXSe2U/q3xDO9f24CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpV2W-0001NC-GJ; Mon, 22 Jul 2019 09:55:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpV1Z-00084P-Hq
 for linux-amlogic@lists.infradead.org; Mon, 22 Jul 2019 09:54:33 +0000
Received: by mail-wr1-x441.google.com with SMTP id x4so38679085wrt.6
 for <linux-amlogic@lists.infradead.org>; Mon, 22 Jul 2019 02:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=bgvq9lq6LGXpxNw9zfixyWK44sZokPcHvbjpJArgXSg=;
 b=WhbT/meS6VWf8enxjpNxCA+h2RhhAz5ChlSWG8CfFeZ9UePIK1a9Hnre9k7keWJM8Y
 DrDNvwIPg2/h04urY4AtGYyJyi3AhzYwd/7KazMsJ6jhURHR1HsdMFbrTYQcaSvL3iCV
 XVGOpayXdvjcReahnENQc3/cdf4gFxlQG6MSh5W0RBdY6vEyUct1BsNbtMvtd4ANyHJr
 H1rFGOCnTJWT38cQ6tdDJvUVh3fCTtYhkgSixeZxjgaA2cArzNYQ2fDW19S8VN6RPS15
 XNE2faizVhRdn+kDo3hOQAyiPIS7XfN+s8jABPAjKmPpWXkhiq1sfzmSF4BWDIpkMa+F
 MdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bgvq9lq6LGXpxNw9zfixyWK44sZokPcHvbjpJArgXSg=;
 b=PDCDjHBf1MR60vzApz67sJ6UBMe7AWZ7E5+XYTKA0gLHMmFbTuGiOgIwKz58M318DK
 2Y2iP1I30xWHewyHYCC1FCQpTz7NiLoSUQ1gQqn9DMiWndsJEn9DhKzZ6uiByLIFaGz/
 VZDn5FDd6MQh5d4aNoaJdkewClQqejpJ0MoOmnA05+mgTBNcXsRNYjBHGRqW9KdgnKnQ
 Dal8H+BBTwIp3wDwHMlLWWADYhbtP1ww6FMKWtPJo3soMswL8gkIlzmzub1aoKwx0LjI
 shHbk/Bi3Y+CAnjMBVZ79AanjvHo8wEAxA2hGu8HS9B6HcU8LkSGgKsWxjA3RJToevJM
 TusQ==
X-Gm-Message-State: APjAAAV8JixST6+NEXx7e/Sm1xTtVtqCliTWGHRJpsdltGc13/bFRJR5
 VdgJ7qpgsY1I7YxSKjDDVBmfig==
X-Google-Smtp-Source: APXvYqwivBi379wi/Mp2lCw90zmNjgCUUdXb5W548a5fqL/+oTVTmKPQ1IHQg1T8EqZWsocnX8BxLA==
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr19076152wru.288.1563789268373; 
 Mon, 22 Jul 2019 02:54:28 -0700 (PDT)
Received: from pop-os.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 91sm83158469wrp.3.2019.07.22.02.54.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 02:54:27 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 0/8] clk: meson: ee: use the new parent description method
Date: Mon, 22 Jul 2019 11:54:17 +0200
Message-Id: <20190722095425.14193-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_025432_072789_3A84ACE8 
X-CRM114-Status: UNSURE (   8.94  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Meson SoCs clock controllers use the string comparison method to describe
parent relation between the clocks, which is not optimized.

Its also use bypass clock made from device-tree clock to provide an input
clock which can be access through global name, but it still not optimal.

A recent patch [0] allows parents to be directly specified with
device-tree clock name or without string names from localy declared clocks.

This patchset replaces clock string names by clock pointers (as possible),
removes bypass clocks and uses directly device-tree clock names in parent
assignment.

Tested on GXL, GXBB, Meson8b, AXG SoCs by comparing the clock summary
(orphan too) before and after migration.

[0] commit fc0c209c147f ("clk: Allow parents to be specified without string names")

Alexandre Mergnat (8):
  clk: meson: g12a: move clock declaration to dependency order
  clk: meson: g12a: migrate to the new parent description method
  clk: meson: gxbb: migrate to the new parent description method
  clk: meson: axg: migrate to the new parent description method
  clk: meson: meson8b: migrate to the new parent description method
  clk: meson: clk-regmap: migrate to new parent description method
  clk: meson: remove ee input bypass clocks
  clk: meson: remove clk input helper

 drivers/clk/meson/Kconfig       |    4 -
 drivers/clk/meson/Makefile      |    1 -
 drivers/clk/meson/axg.c         |  207 ++++--
 drivers/clk/meson/clk-input.c   |   49 --
 drivers/clk/meson/clk-input.h   |   19 -
 drivers/clk/meson/clk-regmap.h  |   12 +-
 drivers/clk/meson/g12a.c        | 1086 ++++++++++++++++++++-----------
 drivers/clk/meson/gxbb.c        |  646 ++++++++++++------
 drivers/clk/meson/meson-eeclk.c |   10 -
 drivers/clk/meson/meson-eeclk.h |    2 -
 drivers/clk/meson/meson8b.c     |  696 ++++++++++++++------
 11 files changed, 1773 insertions(+), 959 deletions(-)
 delete mode 100644 drivers/clk/meson/clk-input.c
 delete mode 100644 drivers/clk/meson/clk-input.h

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
