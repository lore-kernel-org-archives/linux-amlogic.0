Return-Path: <SRS0=hY+l=TH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9732CC004C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 11:57:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64EA5206BF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 11:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mLuU0/ke";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="x8IfvxSV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64EA5206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4atHMYWCsGk0tr91j6nkiJagcD1J0GPmNNGJkcI6rQI=; b=mLu
	U0/keQLKmZxUVgolBaOIV5qJQXWmSRxsjgVLfqk5rGa3sHfqLvPKe8dHoIjxUKs1hqv2I8K81OI9F
	oF8yFLDuS0bHyt4MAPkV5QSQvrZ38rkA4Kd35JtXLqZhZmRK3rO1XQHx/2AAbedN4V7G02A0V2kHm
	MPcIu+CTz7D8F2nrKHXMJKD1dBBy3zKIuX3+SNeF3irKqYIOyNGnxjg1nwXIQaU/u19wW30CuGTxI
	+Qw6IyU1633PgVCBWOot/kCGZQdDrCL2EcQZcWO2ogka3NPWLxBWwUWpYeMqcYRadGoMap+o0xUcW
	SYB5OeBDdAyxGmeeBsua6YknJKj2Mug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNyiz-0002fg-GF; Tue, 07 May 2019 11:57:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNyiv-0002dm-Q6
 for linux-amlogic@lists.infradead.org; Tue, 07 May 2019 11:57:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id o189so9168757wmb.1
 for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2019 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=OPHdfYWKRwJAQs5uJB7kF0RzPQn+beeGrm95NylS/7s=;
 b=x8IfvxSV8xEyOX6DuO+iRYAmA4ddSLYPKfR6dboTkoILy/QRKBArxlBAqvMLlcmJL1
 /5D8PHaON0JpgYnLnNZnWq9uxuReXFmxTfcDj+3heSe1vSpK7rUgSOtcnqBuDb40cG8W
 DONlXDGPv3EnkrEbbGS0r8GTGdxvqbI5Rs5XAAjZoOIa8sj36Xmvbvpd8hGuEXmkVlXA
 kKUSswjcq87zaGBGK5mK3W9Cz9wP0qjY1Nc7vL857HnFB5qcKLNbMeNDbSo3uv05fbno
 KB5O8EZSr1mMGwCqRxSoVtld61l4K+vCXFWZyiYf8EauwQ4Qq5xWoxE1LSw2ed6XxKGE
 UPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OPHdfYWKRwJAQs5uJB7kF0RzPQn+beeGrm95NylS/7s=;
 b=OVFAw3skDiteuEgrw2wsXrzfWvIpiy7sbguIQyGy3DPPXZGdgjW+oEehUPRDG5YJ5D
 0BGLlp2X8fXIHgwImcHuBaNq2DydRE0ni8FJoRM2NoI1qgE15DJPYF3M3p4d4rj9gBD3
 QzJTLw0dLErbKDoITTolAd5LpsEdXBlxiE+9kIAPTcSAcEtXqdYnVrCC1KmF2aQuxU8C
 EraS3i2B4/2z7Q8Ax4yKdjUPFV12fFhRrslSuSC1zOY/zVnrhpCR42A1/WU5g4Z/Wjkc
 /hDHyJl9WUmlRBm/ws6LsjeEu2WSAwAUYshsMkU4ic1dz4E+rR9KCsg0o4nLvaJYmASH
 rC4w==
X-Gm-Message-State: APjAAAWr2PFo+tQS47J2X3scWB9Tq79Utz85bL7TwLTi6Ieuj2c74EyI
 vQmP+TbEM6Mk4w9KGI2Gqw7oag==
X-Google-Smtp-Source: APXvYqxq1oFwTc8aEPHZEL8JAQfGOWvAnNWHmRNXvEeDBiKqtaWlXMyzKk+kWPFbz7vEnwL3O1Lq0w==
X-Received: by 2002:a1c:1903:: with SMTP id 3mr20479100wmz.103.1557230248087; 
 Tue, 07 May 2019 04:57:28 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s11sm7120274wrb.71.2019.05.07.04.57.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 04:57:27 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 khilman@baylibre.com
Subject: [PATCH v3 0/6]  Add drive-strength in Meson pinctrl driver
Date: Tue,  7 May 2019 13:57:20 +0200
Message-Id: <20190507115726.23714-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_045729_985963_4CA77F3A 
X-CRM114-Status: GOOD (  10.75  )
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

Changes since v2:
- update driver-strength-uA property to be compliant with DT documentation
- rework patch series for better understanding
- rework set_bias function

Changes since v1:
- fix missing break
- implement new pinctrl generic property "drive-strength-uA"

[1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com


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
 drivers/pinctrl/meson/pinctrl-meson.c         | 177 +++++++++++++++---
 drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
 drivers/pinctrl/pinconf-generic.c             |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 7 files changed, 195 insertions(+), 48 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
