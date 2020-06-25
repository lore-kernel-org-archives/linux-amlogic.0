Return-Path: <SRS0=Zj77=AG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA440C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:43:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD3F6206BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u7znIaqR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLKslSnG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD3F6206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sX8oqRTcXX9zsbLdfk+U3qK/GO8DcCzC3JRsdKMSRHY=; b=u7znIaqRkEOPU6PDFVDNa8Ax/K
	f+bCvwBZt66mBRWGFzktt3DwKfsXJDKNmTTRjJAuUIaGh4BFhwPl/Uesxnt6bPkUJsWYLDjVTRml8
	bAgZjkRLOdaH3/wcnojkLNKahl9NTC2OX84wTrfLGB4jjvXUMLdJENeS/jhNb4VbbGlSAJe9tIvj7
	H6ZQOGzoTgVt6hIABObB4tGQ9q1WgKNeQm/ohkJ5Z1Ig2e2Bshn11o54XCAO3sUaDmbelMVsJmPd5
	aDrGKJjcAZpzpPs0q+NcbG9cIjGYm8nVuy0Os8oc2xZe0wjG067dggeEC++AJzKe+6HwlpSoUKzAY
	UOAAcW2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joRDu-0005KV-WE; Thu, 25 Jun 2020 12:43:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joRDs-0005KA-IT; Thu, 25 Jun 2020 12:43:21 +0000
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr
 [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8631F206BE;
 Thu, 25 Jun 2020 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593088999;
 bh=L8fU5fAz7pCpg4HnWH2xhwqLiRr2Tw/EYLrtbhRzhMk=;
 h=From:To:Cc:Subject:Date:From;
 b=uLKslSnGx7g/s55qBe761CpJrI854/NuYwG6EgQgXUG+Nia3TSmvkIajhlbPwVPwh
 BDsI+JcTMOAdhdz7XuMWt2k9b9IKTRGM3fyMVcUKxd+ae7hr7JxbqM6DbbNQVMVdPc
 DqzzoonHEA1JiqOmJTfhABgOdbjp7Np/KAAZTk3M=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 00/12] crypto: permit asynchronous skciphers as driver
 fallbacks
Date: Thu, 25 Jun 2020 14:42:41 +0200
Message-Id: <20200625124253.1906557-1-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Eric Biggers <ebiggers@google.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Jamie Iles <jamie@jamieiles.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Rohit Maheshwari <rohitm@chelsio.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Maxime Ripard <mripard@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Ayush Sawal <ayush.sawal@chelsio.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The drivers for crypto accelerators in drivers/crypto all implement skciphers
of an asynchronous nature, given that they are backed by hardware DMA that
completes asynchronously wrt the execution flow.

However, in many cases, any fallbacks they allocate are limited to the
synchronous variety, which rules out the use of SIMD implementations of
AES in ECB, CBC and XTS modes, given that they are usually built on top
of the asynchronous SIMD helper, which queues requests for asynchronous
completion if they are issued from a context that does not permit the use
of the SIMD register file.

This may result in sub-optimal AES implementations to be selected as
fallbacks, or even less secure ones if the only synchronous alternative
is table based, and therefore not time invariant.

So switch all these cases over to the asynchronous API, by moving the
subrequest into the skcipher request context, and permitting it to
complete asynchronously via the caller provided completion function.

Patch #1 is not related, but touches the same driver as #2 so it is
included anyway.

Only OMAP was tested on actual hardware - the others are build tested only.

Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>
Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com>
Cc: Rohit Maheshwari <rohitm@chelsio.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Jamie Iles <jamie@jamieiles.com>
Cc: Eric Biggers <ebiggers@google.com>

Ard Biesheuvel (12):
  crypto: amlogic-gxl - default to build as module
  crypto: amlogic-gxl - permit async skcipher as fallback
  crypto: omap-aes - permit asynchronous skcipher as fallback
  crypto: sun4i - permit asynchronous skcipher as fallback
  crypto: sun8i-ce - permit asynchronous skcipher as fallback
  crypto: sun8i-ss - permit asynchronous skcipher as fallback
  crypto: ccp - permit asynchronous skcipher as fallback
  crypto: chelsio - permit asynchronous skcipher as fallback
  crypto: mxs-dcp - permit asynchronous skcipher as fallback
  crypto: picoxcell - permit asynchronous skcipher as fallback
  crypto: qce - permit asynchronous skcipher as fallback
  crypto: sahara - permit asynchronous skcipher as fallback

 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c | 46 +++++-----
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h        |  3 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 41 ++++-----
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        |  3 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 39 ++++----
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h        |  3 +-
 drivers/crypto/amlogic/Kconfig                      |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c         | 27 +++---
 drivers/crypto/amlogic/amlogic-gxl.h                |  3 +-
 drivers/crypto/ccp/ccp-crypto-aes-xts.c             | 31 +++----
 drivers/crypto/ccp/ccp-crypto.h                     |  4 +-
 drivers/crypto/chelsio/chcr_algo.c                  | 57 +++++-------
 drivers/crypto/chelsio/chcr_crypto.h                |  3 +-
 drivers/crypto/mxs-dcp.c                            | 33 +++----
 drivers/crypto/omap-aes.c                           | 35 ++++---
 drivers/crypto/omap-aes.h                           |  3 +-
 drivers/crypto/picoxcell_crypto.c                   | 34 ++++---
 drivers/crypto/qce/cipher.h                         |  3 +-
 drivers/crypto/qce/skcipher.c                       | 27 +++---
 drivers/crypto/sahara.c                             | 96 +++++++++-----------
 20 files changed, 244 insertions(+), 249 deletions(-)

-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
