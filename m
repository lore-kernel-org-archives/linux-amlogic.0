Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF06DC10F14
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E2A92183E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FUJIILB4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Kwi7D6/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E2A92183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=XcvjijapNPT+eWdCDb+p9k1taF6CbECUUXYXY9TB9IM=; b=FUJ
	IILB4euCebjiUtbv+kEZpuazCLH6sACLjxvJv9KvYxSP0mmC28xVNdIPEQIzd8vb6cSYQTCZU5cf+
	cJeMEL89nSpdZWM54k1LdXgq9Cp+UtIH6dFynSdlXCOQ1W6dv9/VM9m9yirO8oiY6Qq3jZ484qw23
	vUxzv+q4BDfDrOn+PMUuKCkDwFMt3QjCLKRr+5QBdTKrxA9JAVP2ZZZ/V8/G79qw43EwYKASOY1/v
	3wUnXxyceUEeqJM1Z/SoPikRNP9cPxeIZ41LLlpQ47stfWpwEU5jaU7ZH1VjxmeRcs9SJgXwIScNW
	I1yDQ1WbXKF6ZxrCTNrvmTEOp9+nd5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH6ST-0004Md-NI; Thu, 18 Apr 2019 12:48:05 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH6SQ-0004Lr-Ia
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:48:04 +0000
Received: by mail-wr1-x444.google.com with SMTP id k1so1649427wrw.0
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=zCoFO+U6J6V4upBBcgRbShJ9mBRp671ZMCkEN4roMmc=;
 b=Kwi7D6/7UCuK21K17QZqCdwlWSBCXkwz6XCwmCXGiRakEUBWbpffLd5GIPa8TOTnZe
 HJPjRXeizM+cNiyc9YSx3MH5G+uDrNhLsl1yyn782+uLQuPBx9YDYXmpkqrxT0b5/H+A
 qOhI08DFFa9e0FKEyG4jcGCXR/QGfHbhzyiFUJmVB6slQFapECurO3ytG8xtP5Jrr1Gc
 awb672/ItMblTTvml5CpIIx/pzWbMv1gaaSHbku85/uHSC4etip6hPW55RfxgkDBxlZ7
 edvkyz5woRH5rm4ybvQz8SPGT0LNFwJZr+viCZQBe8RFeKIggWClUhzssEmwRpCzzDu9
 CgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zCoFO+U6J6V4upBBcgRbShJ9mBRp671ZMCkEN4roMmc=;
 b=aoBKtnA+16qn1zB9SUUU0eNXL8MuOJIQfLqIMC8pmAx/6kVa5sihu+kebWR0fnOWcr
 73/oPce9VnRd+ndMrVWyvENE/PlM27hCviSo3XQ/ORTZmPHtK001/Glvdo1EZwjeD7sw
 P1tefHoayoWzuqNvsCg5HS4R140AujqVQR2L40vw5VcKdeO6UB7qLKeEk+1RYkZXaaDl
 q7t4croCeoYomYrkd41ZYzkxYJ73Ux6LJZW/UKZ2XHLsTwxnD2uCDB5/gFtXkHxx7R63
 JS0v9zjovqUgc3wO6BK4yKL8Z79g+TTNaKzc6jBJsULVFfOq8ms+4EWbmEouZzLy/Zfv
 1IWQ==
X-Gm-Message-State: APjAAAWT9xeJW41X6m2SoNipNkmkCjNvQ8T4BueRS0+f+3jRY7UTbZ2q
 YgUpZ37gRbJ/FK9ow9xxFIFNHw==
X-Google-Smtp-Source: APXvYqyBP9KpAvFTbFL4x8mrUe5kZzQ7GbeQs9drJWsz2j2Ip14m6nem990Rc1mGTMLzIzntsc8QdQ==
X-Received: by 2002:adf:e703:: with SMTP id c3mr7659644wrm.98.1555591680673;
 Thu, 18 Apr 2019 05:48:00 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q17sm1256823wrw.70.2019.04.18.05.47.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 05:47:59 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 khilman@baylibre.com
Subject: [PATCH v2 0/4]  Add drive-strength in Meson pinctrl driver
Date: Thu, 18 Apr 2019 14:47:54 +0200
Message-Id: <20190418124758.24022-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_054802_610472_9AB48750 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The purpose of this patchset is to add drive-strength support in meson pinconf
driver. This is a new feature that was added on the g12a. It is critical for us
to support this since many functions are failing with default pad drive-strength.

The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
'drive-strength' is expressed in mA.
So this patch add another generic property "drive-strength-uA". The change to do so
would be minimal and could be benefit to other platforms later on.

Cheers
Guillaume

Changes since v1:
- fix missing break
- implement new pinctrl generic property "drive-strength-uA"

[1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com

Guillaume La Roque (4):
  dt-bindings: pinctrl: add a 'drive-strength-uA' property
  pinctrl: generic: add new 'drive-strength-uA' property support
  dt-bindings: pinctrl: meson: Add drive-strength-uA property
  pinctrl: meson: add support of drive-strength-uA

 .../bindings/pinctrl/meson,pinctrl.txt        |   3 +
 .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
 drivers/pinctrl/meson/pinctrl-meson.c         | 166 ++++++++++++++----
 drivers/pinctrl/meson/pinctrl-meson.h         |  20 ++-
 drivers/pinctrl/pinconf-generic.c             |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 7 files changed, 174 insertions(+), 59 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
