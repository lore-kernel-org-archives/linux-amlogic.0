Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3253C04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 08:27:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FFC6214D8
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 08:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BNAZ254/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DCcz3Yp6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FFC6214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=89nhZWDZFAuBWO8YrW8VEDvRtDye5B9e82N24eeQDI8=; b=BNA
	Z254/vRde+7PMe+Jej/N6/IFOqMW/oObsUswtMNgPeLcmOjBPB3+LpeAzCBn6iOZhJiiZ+u69HwKt
	P8He3sR/S5UIjhQJmz1F4WZdNMyA+jclL458rxwOuzh4BTFgaA7Wf0AfxDf48hbxJtLljK37dVxXQ
	FJRuqM9Za6z6X85dcqELqnawhTyJ2HVqGvAw3+dVRuZigU/O94d8u9WPeKoRlkdVIZlsGoXAtoaDV
	mXvX9o5QUKGEagbwR3dUpWgz5cKrl6xaz9yyoE1IOyYpiFnRVJlB6ORgtvokukQ7D9dsBrjunqvdc
	C4d9v0bVvHQ+8ShsENMkXbUPVlaDv3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQSmF-0004lt-Q1; Tue, 14 May 2019 08:27:11 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQSm0-0004U3-Qq
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 08:26:59 +0000
Received: by mail-wm1-x341.google.com with SMTP id j187so1759151wma.1
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=X0toZzy5jG06W74WS/hZf53CDr/smndRtb9GSpbhzgw=;
 b=DCcz3Yp69wR3bZBKDn/QuVK0FvCSof8Ew0WzSEPM81nXrM6IGVV4Z378IW/wEmApc9
 6rJYt5azj7d//VJx3fFlxx9csNHdvyMki7rvr5x0lXeY3yt4/TBV9idded8Kfj3wGnko
 zZVMKUlZf8rv79WH6OmPz8scKITVnTsJKQwfXSdwK0y5KG61Lqd1DXDQHF8y76Osrs7I
 timrhpRIfLeKoo3xSDFVYbgKZZPLMUW2NaoCeqDtvrYVz9+f7pxgnBO0ut49nHYqsWMp
 ikucev/DepoE0LeBL3uM7ZWS+hdInkxhqj33nX/o47Qnyegi6YG8MQGwk4yydf7LXlFg
 bEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=X0toZzy5jG06W74WS/hZf53CDr/smndRtb9GSpbhzgw=;
 b=OK5DljNcA/YmA+52GiUZQtlGn45BTkXGdYfq2YzUwRs5rBQ8PGyWkLHUrUGR0HBGjj
 UUCwIhCyCiv4/7L26XWUYwsYNsAJNFi0ncLtvknrc5MeXH9FBLV1zHhcoYk1hYSAm9ld
 BY0JZ3dOvlbzXFHWrdkv3xR1sY2WgipbbFksdnMc/dL0JL7dMQdfco76d7crWH6Ymyij
 2kHTY7gufCmCf5SUV9Etpi5/HlTKuVdbS6dPlgGyYNsJoES8uX3JwS0fwTBtIQog73Hd
 2CIE0/ID+BEIpnDO3wTUWr0m+FjAp+AGrn+HweevZLLWbbxSYuQkIxeFiHCwdhB+LW4Y
 19Vg==
X-Gm-Message-State: APjAAAWp3U1m2Lnll65SgHiDWUiY2Ta4wBDCXMZl+sfAbpL1s+0yhad2
 m+o++4m2ya/cV3kRQjshCDnYkQ==
X-Google-Smtp-Source: APXvYqxnQPc8uylG3Vch3Y5Tb7DiuQJ87G8GH7fcOBvIRwt2mlcz4eOXf1LUsAUj88af8nCLk1cElQ==
X-Received: by 2002:a1c:21c1:: with SMTP id h184mr1792485wmh.78.1557822414947; 
 Tue, 14 May 2019 01:26:54 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id j190sm2450772wmb.19.2019.05.14.01.26.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 01:26:53 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v6 0/6] Add drive-strength in Meson pinctrl driver
Date: Tue, 14 May 2019 10:26:46 +0200
Message-Id: <20190514082652.20686-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_012657_001511_CE5BD854 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
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
So this patch add another generic property "drive-strength-microamp". The change to do so
would be minimal and could be benefit to other platforms later on.

Cheers
Guillaume

Changes since v5:
- restore Tested-by/Reviewed-by/Ack-by tags

Changes since v4:
- fix dt-binding documentation
- rename drive-strength-uA to drive-strength-microamp in coverletter

Changes since v3:
- remove dev_err in meson_get_drive_strength
- cleanup code

Changes since v2:
- rename driver-strength-uA property to drive-strength-microamp
- rework patch series for better understanding
- rework set_bias function

Changes since v1:
- fix missing break
- implement new pinctrl generic property "drive-strength-uA"

[1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

Guillaume La Roque (6):
  dt-bindings: pinctrl: add a 'drive-strength-microamp' property
  pinctrl: generic: add new 'drive-strength-microamp' property support
  dt-bindings: pinctrl: meson: Add drive-strength-microamp property
  pinctrl: meson: Rework enable/disable bias part
  pinctrl: meson: add support of drive-strength-microamp
  pinctrl: meson: g12a: add DS bank value

 .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
 .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
 drivers/pinctrl/meson/pinctrl-meson.c         | 180 ++++++++++++++----
 drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
 drivers/pinctrl/pinconf-generic.c             |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 7 files changed, 193 insertions(+), 53 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
