Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BC1C4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C4E20873
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:32:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PrGDRM2m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cRqLzJK9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C4E20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=PUqBEmJJAgivDeD2BVpOFYoSfejlLSClj984MBv4HRI=; b=PrG
	DRM2m17D1Vu0cjEPF4CXG2wpar6a8Jj6wu+4+PvjNKI2YFOS2WfIv05KH6fBhmDsEXjnghJHHnM4D
	pR93xQ1//VtToc8ywGapBhlE4XjKRS1IyMmAHlAEmfdMiyei2Un2NeV9LmuaxAf5VBzZQvUsi/kN5
	Z++Aik1rW6YrHImWLQhmdGPIeUep28lARIxYW4S0JdrIRCwEFr67F5hsOmr7ty9a1d2U9W7H2UUe8
	JpGQgt5oCUcuqoCnTkZSLgG7Q7alCA3swr30fYoq/lD4rjeXLUM28wLgLuYwBjKlIPnyE2YRYsKbX
	Lh2OqmK/uvNVqSJYY7urRHbNE7hXD7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJsxk-00051N-W8; Mon, 14 Oct 2019 05:32:09 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJsxh-0004yy-N8
 for linux-amlogic@lists.infradead.org; Mon, 14 Oct 2019 05:32:07 +0000
Received: by mail-wr1-x443.google.com with SMTP id p14so18038266wro.4
 for <linux-amlogic@lists.infradead.org>; Sun, 13 Oct 2019 22:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=VV3IaZnskbUr1GiFO2X9yDGhA134LORR3NXQx0QiOlA=;
 b=cRqLzJK9lJrzLH1r4rNUMpRvPCQQKB5rPJ5QPg7YyDp8fMfycNYirondsQkTjFceJ6
 ioRTE6ZkDNPDXDmCf6sTrknQZiOwRWOksZXeJEd02Mj5bccyQkq3nMd1FAR3Pl2k2Uvg
 5g7rTSB/9hCW3YLuNKlwgkVri0Uu+3vwu3vLvtCSmmxV+PSAp4ZQFZHZNNx0tYJ+buAf
 Imgshxznob8AnLOBG/3Ks6qNfWlJ7S9sw3a6P9jk8Osn1lkzKvXDVCSSmzPoSP53bhON
 7QdhfrUpN14Rd9ujAvdrOuon50Yj8UUUEz0SsI9F2u1JCT8xgQLyOkQi8Vi9HTl2Qa+p
 pUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VV3IaZnskbUr1GiFO2X9yDGhA134LORR3NXQx0QiOlA=;
 b=E4gZm2fksxyw0/i9AzsIL5rvue3MhruGZU2SRLpo4nVfUu0L1W6JlysD4jSDRbmhxp
 4V0BprmKYClIk6FnxRwfbTnPy83AtMp7+jhVX4NFt0ZU/eaEzA2oO0UouVKgMeEGR643
 klx7dSmpK1n+joEa+F5Te9iVDGSSK/LWWMn9lIViOt1OAqjDOOKpCUR4w5oTo+NaAfEY
 LgEFHK+JOejqyo7dZdcQb8bYku6AcqY+pZ8FjKfigkHI3GIWFcD07RxPnb5VBh5jBqcb
 7gJmqX53C/2/sgDt8GONnLNuxIacnGynD1xo7J7Krg/tC2KIjjPgDWly/XawmvyfZsIQ
 Sfrg==
X-Gm-Message-State: APjAAAUiOg1Pp/pFJbH7v6eGhRzO3jyvUQ6oA3MPp8y2Kd7tbXKd0H9k
 x4SIpg/I2LkdQCNeVYTryXDhWg==
X-Google-Smtp-Source: APXvYqwaGzOSKxB6TEqQpVVf3oyhcigvwBtITeEf+3ldzPzepGPpOShz3H63eqnPZOaXvDvtl9vrWQ==
X-Received: by 2002:a5d:5488:: with SMTP id h8mr24154767wrv.284.1571031124058; 
 Sun, 13 Oct 2019 22:32:04 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.googlemail.com with ESMTPSA id o18sm44238772wrw.90.2019.10.13.22.32.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 13 Oct 2019 22:32:03 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v2 0/4] crypto: add amlogic crypto offloader driver
Date: Mon, 14 Oct 2019 05:31:40 +0000
Message-Id: <1571031104-6880-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191013_223205_819862_C91AE636 
X-CRM114-Status: UNSURE (   9.81  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello

This serie adds support for the crypto offloader present on amlogic GXL
SoCs.

Tested on meson-gxl-s905x-khadas-vim and meson-gxl-s905x-libretech-cc

Regards

Changes since v1:
- renamed files and algo with gxl
- removed unused reset handlings
- splited the probe functions
- splited meson_cipher fallback in need_fallback() and do_fallback()

Corentin Labbe (4):
  dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto
  MAINTAINERS: Add myself as maintainer of amlogic crypto
  crypto: amlogic: Add crypto accelerator for amlogic GXL
  ARM64: dts: amlogic: adds crypto hardware node

 .../bindings/crypto/amlogic,gxl-crypto.yaml   |  52 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  10 +
 drivers/crypto/Kconfig                        |   2 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/amlogic/Kconfig                |  24 ++
 drivers/crypto/amlogic/Makefile               |   2 +
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 381 ++++++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl-core.c     | 333 +++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h          | 170 ++++++++
 10 files changed, 982 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
 create mode 100644 drivers/crypto/amlogic/Kconfig
 create mode 100644 drivers/crypto/amlogic/Makefile
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-cipher.c
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-core.c
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl.h

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
