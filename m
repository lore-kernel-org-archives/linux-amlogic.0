Return-Path: <SRS0=JCZT=UJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C01C31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:38:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CF1920820
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QgupcGE+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="c6QlcPSW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CF1920820
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mNGPgiJaWhGHN7w6AnX6ekcjJM+eMFcYyRtW1eNtnOc=; b=QgupcGE+sxGeC/
	Wu9a/GgTxEzYd0SXNP9rx0YI3uAzGFs3qhotm4m4gbyrjJtkWqCxO5FzQb+bEbWd7vW2ymMvYiviP
	lGyIzJvlESoldTu9RpHOf9kEh4ixvobSWudvctxAUA8dG6VaCBJJO0a3gvpuFuinGehMfJMkfONMs
	HQlMxF0qktMovOG3mBXr/7OGKHbBuRFRFgg3f5AtyUWNvmDhFbiL9ey9mVWDMx+pE8oZJMYrxNBG5
	01CkTf+LdxLU3HE5ewypX++frd150MXhRt6DVQPJKfw8Ge4TzaBbNtXYi443EzDapU7kWHYtycSke
	rJdHwGuw7nuHOLYGOsgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haNJ3-0007H5-8m; Mon, 10 Jun 2019 16:38:01 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haNJ0-0007FP-9F; Mon, 10 Jun 2019 16:37:59 +0000
Received: by mail-wr1-x441.google.com with SMTP id f9so9847398wre.12;
 Mon, 10 Jun 2019 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sh13vqQhVeUIp4ueCnaiflQcpY8w0hvllTIAtF32R/Y=;
 b=c6QlcPSWKF3BsvTZ/GIitZ8/3RkBf+tAU+lNnFvq9R0cwY7ZSTiKjHM58uNS9AvEuL
 8sykECWPbbVW0Po663W/EyEhlwwIZRkAmPC7YUl4tL+VGMSmScl+W18I7BYC5kCPXz1Y
 35WDuuUcnqFmF2kH9d0/og7OAQbbBIFTdfyzP3jmbVgb1RRena6AxnKrtesKwdr3sqs6
 33uVwN3IyoM8VTpXPN5emJgiwxo3HWFHTLyXiTX+TPGTJY4IBA7MB1WicpFOwY/pmDMb
 EjP1W140eDFQ20VCtf6Byv0h7MwSkzqDV/00u81EHXq1iM/5aGRJi+3emTRpE1s8HDxb
 mLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sh13vqQhVeUIp4ueCnaiflQcpY8w0hvllTIAtF32R/Y=;
 b=HYVsA+kK0l+bX8auCw9Cdj1cfkyiytVXPdGkZzkkLEqWaancHDqe+SAHtmZqfMbRhN
 C+WIybUUGXizA8UZl+uluIUoyPFVqKTppSTN6Y9JHrp6m1IQntsxVo6fW+1DfKGsWem0
 3nByZJPigzJtp6Cz/W0uaJLeA/yW7kziZalP5oQbcFd6creikitmSeyce+CCKpd6JdVT
 ryAkFaV2sSlFSbt032dMd1AhZmJ6tK4uJxd5R/4bFIvI4zJ9bI2E2QNoFNzATMKXQufl
 4agRIPO4j1jK6TLNfci59LmKTxZiFy16ulEnV6xu7oyF0LdEN9Vd4dq65+/Ea47x02v9
 s/4A==
X-Gm-Message-State: APjAAAXmXm3xjCkdA+xUQ6n2PTAhCPXKLW0UBeO9gKzW1wpZSJEryLhs
 3debGCtQDIwfNkJ+GJaQGyPtC5Nq
X-Google-Smtp-Source: APXvYqydlQA+PLFxW4LDdRVC2OqHQ48h8LCrH5vskDoOkpLzQroMIZP5WjRCaEJpvZm70zC3KggTFw==
X-Received: by 2002:a5d:53ca:: with SMTP id a10mr32962184wrw.131.1560184675468; 
 Mon, 10 Jun 2019 09:37:55 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA40000C4C39937FBD289.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:c4:c399:37fb:d289])
 by smtp.googlemail.com with ESMTPSA id g5sm13900517wrp.29.2019.06.10.09.37.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 09:37:54 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/4] Ethernet PHY reset GPIO updates for Amlogic SoCs
Date: Mon, 10 Jun 2019 18:37:32 +0200
Message-Id: <20190610163736.6187-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_093758_334184_7B03A4DC 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: andrew@lunn.ch, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While trying to add the Ethernet PHY interrupt on the X96 Max I found
that the current reset line definition is incorrect. Patch #1 fixes
this.

Since the fix requires moving from the deprecated "snps,reset-gpio"
property to the generic Ethernet PHY reset bindings I decided to move
all Amlogic boards over to the non-deprecated bindings. That's what
patches #2 and #3 do.

Finally I found that Odroid-N2 doesn't define the Ethernet PHY's reset
GPIO yet. I don't have that board so I can't test whether it really
works but based on the schematics it should. 

This series is a partial successor to "stmmac: honor the GPIO flags
for the PHY reset GPIO" from [0]. I decided not to take Linus W.'s
Reviewed-by from patch #4 of that series because I had to change the
wording and I want to be sure that he's happy with that now.

One quick note regarding patches #1 and #4: I decided to violate the
"max 80 characters per line" (by 4 characters) limit because I find
that the result is easier to read then it would be if I split the
line.


[0] https://patchwork.kernel.org/cover/10983801/


Martin Blumenstingl (4):
  arm64: dts: meson: g12a: x96-max: fix the Ethernet PHY reset line
  ARM: dts: meson: switch to the generic Ethernet PHY reset bindings
  arm64: dts: meson: use the generic Ethernet PHY reset GPIO bindings
  arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY reset line

 arch/arm/boot/dts/meson8b-ec100.dts                   |  9 +++++----
 arch/arm/boot/dts/meson8b-mxq.dts                     |  9 +++++----
 arch/arm/boot/dts/meson8b-odroidc1.dts                |  9 +++++----
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts             |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts    |  7 ++++---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts  |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts  |  9 +++++----
 .../arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts   |  9 +++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts       |  9 +++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi  |  9 +++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi     |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts  | 11 ++++++-----
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts   |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts        | 11 ++++++-----
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts    |  8 ++++----
 17 files changed, 80 insertions(+), 66 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
