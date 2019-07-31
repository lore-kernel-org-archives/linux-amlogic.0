Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6967FC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 15:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FCD3206A3
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 15:35:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RNPRHbkp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0BPP66us"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FCD3206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bl57vhXATL1F3XhaNyrz/gqMqFLJTRDn+Azn79M+Y5s=; b=RNP
	RHbkpnP82GxGqYjf1GdcEu0LiqDAPVoQLAKfEyoE0i8IEquazLbQalBwvlkei9jt2J+qWliXBM6dD
	84LgFpqcIaNrJo2L7o8su15OoiXY+REwvtIP0S3QwFDYtnALZ4/rn4vHG20gXIcaEGe+GvJaUdnr1
	fBjcuhsjs89PukM1Nvlcx6MkzqTA6JWE+7hGxVA39Q7fwQOhNIXdW1QXb3tvMnH+zcc4KpvjXMROG
	kdVYIT/dX6WVF7YdzdsY+sXjmrCc8D9MMGK+DLco+oVfhtE8Sxj06ZepVIeOdqxZ+CbhLulY5AoPc
	iVStuQa+US99LbQRBLtRTvU5+aNTN2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsqdc-0005PK-DQ; Wed, 31 Jul 2019 15:35:36 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsqdZ-0005Nk-Lk
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 15:35:35 +0000
Received: by mail-wm1-x342.google.com with SMTP id s15so38891040wmj.3
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=7WLjxnI8g1thWsUDdq2Hfl/ujp9OHSJIwkbSbhOm62c=;
 b=0BPP66usc+st7NTNLiYHcT9I5K1u3a3FEnCC+97RYYsl5JXVb4fBlUXZzVS5LwBf7n
 JTbKUH4p+DVBgg45Nl6ztxJKXrgO+YkenDp/0q8Eh3Ydn+k4m+f/ktpR+xKmoRLE+g6+
 4X6jN7AGogvDcQWFlsSg8svTa1InuOjfbGbKMGHVxQbsqoGXyDdABcwqcJIHeSKTXv69
 /gefxIJ4R8j1z5lsN+g3Z+OwfZVRSfu+Vqw4JiTWNhmI7MuIho7o3To837fdMnqrN7jP
 Sd5lBLUmT8egE95rs1uVvzchYHQ3G/g+300vxT6y+sc00+5YRAV/HDgkPf/iOGFu/oY9
 aMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7WLjxnI8g1thWsUDdq2Hfl/ujp9OHSJIwkbSbhOm62c=;
 b=qHstX0kuGxNngci/Kss5QdLZDc4MlC8m5p9KPfiN0q2yyfasdvlDm9BItxNEN+Glzg
 kli4Nrzo91p72PW4+221p9QHGmgojM0+iqrhj1OvguI9QHEQrAFHH7fnvmDI9zZKg1fg
 kNK+jqd2Sw9e+QvCfd+rN/ASafVIj9q8pexGULSmygK9FtHh/TuNf6tSugbr6YWqKydO
 OoKdNrjc7z5oyRIvD2LuwRm43xrkXYEZ6aJFd8ITheDpYEwVALEpFphBGVkt6v4egt2p
 8BwMFkbscfJB+jsVXF2Oc+yl3UGwuanmMkGXNEkoBwd8bwYATJMxf/AXfWdkWBrH4+fU
 onVg==
X-Gm-Message-State: APjAAAU5Xqwj3lgp9jfqpnIQB8ftXaUpZfXFcKXRKw6odVtRQPTX0ZT2
 K5SkJw9CjTOj/M9Nf6JyenpwSg==
X-Google-Smtp-Source: APXvYqwwJjY3FtKTWbfPIEqttUCqL8C62yZwUYcZbMGgyaXoMKyDjYkpr7m8Tzh4baLNN8dmQs3MwA==
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr114781417wmm.153.1564587331749; 
 Wed, 31 Jul 2019 08:35:31 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i13sm62834396wrr.73.2019.07.31.08.35.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:35:30 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: daniel.lezcano@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v2 0/6] Add support of New Amlogic temperature sensor for G12
 SoCs
Date: Wed, 31 Jul 2019 17:35:23 +0200
Message-Id: <20190731153529.30159-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_083533_716842_C9138B7F 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchs series add support of New Amlogic temperature sensor and minimal
thermal zone for SEI510 and ODROID-N2 boards.

First implementation was doing on IIO[1] but after comments i move on thermal framework.
Formulas and calibration values come from amlogic.

Changes since v1:
  - fix enum vs const in documentation for compatible
  - fix error with thermal-sensor-cells value set to 1 instead of 0
  - add some dependencies needed to add cooling-maps

Dependencies :
- patch 3,4 & 5: depends on Neil's patch and series :
              - missing dwc2 phy-names[1]
              - patchsets to add DVFS on G12a[3] which have deps on [4] and [5]

[1] https://lore.kernel.org/linux-amlogic/20190604144714.2009-1-glaroque@baylibre.com/
[2] https://lore.kernel.org/linux-amlogic/20190625123647.26117-1-narmstrong@baylibre.com/
[3] https://lore.kernel.org/linux-amlogic/20190729132622.7566-1-narmstrong@baylibre.com/
[4] https://lore.kernel.org/linux-amlogic/20190731084019.8451-5-narmstrong@baylibre.com/
[5] https://lore.kernel.org/linux-amlogic/20190729132622.7566-3-narmstrong@baylibre.com/

Guillaume La Roque (6):
  dt-bindings: thermal: Add DT bindings documentation for Amlogic
    Thermal
  thermal: amlogic: Add thermal driver to support G12 SoCs
  arm64: dts: amlogic: g12: add temperature sensor
  arm64: dts: meson: sei510: Add minimal thermal zone
  arm64: dts: amlogic: odroid-n2: add minimal thermal zone
  MAINTAINERS: add entry for Amlogic Thermal driver

 .../bindings/thermal/amlogic,thermal.yaml     |  58 +++
 MAINTAINERS                                   |   9 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  22 ++
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  56 +++
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |  60 ++++
 drivers/thermal/Kconfig                       |  11 +
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/amlogic_thermal.c             | 332 ++++++++++++++++++
 8 files changed, 549 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
 create mode 100644 drivers/thermal/amlogic_thermal.c

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
