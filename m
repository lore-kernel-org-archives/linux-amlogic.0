Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC82AC282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:13:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9639E2147A
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:13:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ghdzpSHq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vJfO6znI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9639E2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mVxiWhLCa2Ud7B5NLplfITe7DxCOs1GspBB+PJoqgT0=; b=ghdzpSHq11ou00
	LQcVliwjhrb/o+00YbyK9p1mM3QeEfr5iYAnabbNadcAtM8wmSAkPsYx1ngIw/qyqHKUqCfra3MrT
	swoBt8ukfXbRNukc8UZnynZ4J+7bZNP4i87MBpDrPLDAukNAvL4ScyQF1nHoCjL3nq14ilVv+O6Nb
	lUbaJhOAO8eeGZQ2y1hkt7CHRIA0UXo2iqieyNB5Qb5fn4rpbThokIHyWtv6yQKvbU3kcTevFmRf4
	aFozNKV6uTLj+631BiDXgUVDGLw7zwZZVViZBjb78VvazJ4H8u97vmylqdlHn2Kpz9QEPjv38Btjb
	j4xm3OjZnAnQFen7Nomw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goBPh-0003Ms-Dj; Mon, 28 Jan 2019 18:13:41 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBPT-0003AV-3I
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 18:13:28 +0000
Received: by mail-wr1-x441.google.com with SMTP id p7so19220355wru.0
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 10:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MKOMw3GPLwhaK3fZEE540FDtl/EyZN/SvnHp5Licpnc=;
 b=vJfO6znIX57dbSA17Zj1WZVcEav0BNGNJew2iC+PC4KHJJAHIa8yrSf4JSY+c8AkvI
 I8v5BQKQgCNQy3DT5+4BwVL3xS7CWeMFNnGifi2Htly5aaPJesuNm9/00a/WektGIrlZ
 80R0yO9t/+XePNCS/VYsxIYx5vURsQAIMSWEUMvRR4jzY/ysPFIRlxyYrwHn+gYoFFbv
 vFQGjIBs4hMnENePpPbvu+F2KAPlFjE53u2DZxIcSwRvnSfSl6jmPnvjVqvc80WG2rJv
 lcFpdLz2Oz4uVaurm/rtBntnxrA5s239X9AeYCijzhcGkO6e4thfO43S2jlYds8zTAF4
 wKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MKOMw3GPLwhaK3fZEE540FDtl/EyZN/SvnHp5Licpnc=;
 b=SsMjdHLQ8H4d/Tz+jr1AbAIrpHK8V9BKgSBW1AhtDS/5rW9/LPDjHltlrGMios5PgD
 A3K3KwcDaRM1MblLccE4O60o9qpWWzOpDzqTkBzA9FZqu6+eBaKhBZf4TlMkS6mM8iWd
 vt2LKvXSb1sP3rFwL/QavED8bDKRsLdYXgmL6zH5ogbiJ2OZtuP9TkiXFVGBLyU2T/5C
 MYA+ZeLwqAjoYZGWrSA9klM5vp1hPGr6j2zJE9HOURHdznbUpIWxlZkYd9bZf61qykLq
 lGuMir7VeDV2JWNfb/6er93HDTs4foSxij0hrWkpHR6EU6j/3yfCFbSpRQ+YPN9FT6U1
 OM5A==
X-Gm-Message-State: AJcUukcb+VwBEadXCzbjp1TNPEOPWBD6YqqEkmK8Mqb8GkymzLlrC8Iu
 tyL7WBz3aBZHdY1Ta6NJuCGIDwAZbOI=
X-Google-Smtp-Source: ALg8bN6QrAShPwPuJHzGpFBgZ0o1AQLzcLrTEbHIEXHrhsoJ6UprNweLT6O0dlWgnKuV0T1dTQl4rQ==
X-Received: by 2002:adf:bc02:: with SMTP id s2mr22163043wrg.255.1548699205641; 
 Mon, 28 Jan 2019 10:13:25 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id y185sm110654wmg.34.2019.01.28.10.13.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 10:13:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/2] reset: meson: add g12a SoC support
Date: Mon, 28 Jan 2019 19:13:13 +0100
Message-Id: <20190128181316.30814-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_101327_141309_CA8FFF35 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds new dt-bindings for the reset lines of amlogic g12a SoC
and the related compatible in the driver.

Changes since v1 [0]:
* Correct patch 2 commit message.

[0]: https://lkml.kernel.org/r/20190128141330.21927-1-jbrunet@baylibre.com

Jerome Brunet (2):
  dt-bindings: reset: meson: add g12a bindings
  reset: meson: add g12a compatible string

 .../bindings/reset/amlogic,meson-reset.txt    |   7 +-
 drivers/reset/reset-meson.c                   |   1 +
 .../reset/amlogic,meson-g12a-reset.h          | 134 ++++++++++++++++++
 3 files changed, 140 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-reset.h

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
