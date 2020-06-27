Return-Path: <SRS0=1ECN=AI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7755C433E6
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2020 08:37:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83D9C214DB
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2020 08:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d+nvWsGz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0a7lTRj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83D9C214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TWT8aaZadAta4sf5Z4KDAC+o4YnThqXWlIzlm4nomig=; b=d+nvWsGzVDtGRPKl3NtzOmuvSQ
	H5W8HfQ6exNm0QJ8FWDKbRTKu6zW2BtfYAhhzbkTRVMOA3dlhX/Q0+lMvw8mYc+xgT3eZpU2h0n0P
	l9Hop8aoKuDrKNFDlvY+N3xM0LvxQuLWvWs6N9MWLriKCXis5CQh1Pe3o24bCWDz45+hx4sTkzA6U
	dDZtYeuUHeeNrpgsjRVEfbhsjWuthr+rk9lD8ZQCaeBdOzgPcoLGkgpY92KDK6s1WZSsZF+E4cGPD
	5NQNqfcxmljgKuWwvjdEwjwj2wio69RzdStbIEnDFyTiJNBerYA+eUpnvSLUXCyAd1RU5zDKJ/AGW
	+T6gL6UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp6KF-0007f6-IV; Sat, 27 Jun 2020 08:36:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp6KC-0007eo-HP; Sat, 27 Jun 2020 08:36:37 +0000
Received: from dogfood.home (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr
 [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AEEE8207FC;
 Sat, 27 Jun 2020 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593246995;
 bh=AGJG6MRW6cS+GBuTXX6phwza1LeF4svVTU7KsEF6MYI=;
 h=From:To:Cc:Subject:Date:From;
 b=V0a7lTRjEUQv8fjsdrmREWQ//7dF9YdyaOSIvGCntd9GuVSJ62WMT+FxlUURR1N6r
 pwc7iS6iY1yLdMX+8PdelNbEFf/urdbydvE3rINSugP05HXJO8cM+bFqTKn5yETVq6
 MqCS4dGIJHmr6gmEUAjU9SAS5P0xXEeni9No7eE8=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 00/13] crypto: permit asynchronous skciphers as driver
 fallbacks
Date: Sat, 27 Jun 2020 10:36:10 +0200
Message-Id: <20200627083623.2428333-1-ardb@kernel.org>
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
Cc: Eric Biggers <ebiggers@google.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>, Jamie Iles <jamie@jamieiles.com>,
 Fabio Estevam <festevam@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Rohit Maheshwari <rohitm@chelsio.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Maxime Ripard <mripard@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
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
included anyway. Patch #13 removes another sync skcipher allocation by
switching to the AES library interface.

Only OMAP was tested on actual hardware - the others are build tested only.

v2:
- address issue found by build robot in patch #7
- add patch #13
- rebase onto cryptodev/master

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
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>

Ard Biesheuvel (13):
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
  crypto: mediatek - use AES library for GCM key derivation

 drivers/crypto/Kconfig                              |  3 +-
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c | 46 +++++-----
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h        |  3 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 41 ++++-----
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        |  3 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 39 ++++----
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h        |  3 +-
 drivers/crypto/amlogic/Kconfig                      |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c         | 27 +++---
 drivers/crypto/amlogic/amlogic-gxl.h                |  3 +-
 drivers/crypto/ccp/ccp-crypto-aes-xts.c             | 33 ++++---
 drivers/crypto/ccp/ccp-crypto.h                     |  4 +-
 drivers/crypto/chelsio/chcr_algo.c                  | 57 +++++-------
 drivers/crypto/chelsio/chcr_crypto.h                |  3 +-
 drivers/crypto/mediatek/mtk-aes.c                   | 63 ++-----------
 drivers/crypto/mxs-dcp.c                            | 33 +++----
 drivers/crypto/omap-aes.c                           | 35 ++++---
 drivers/crypto/omap-aes.h                           |  3 +-
 drivers/crypto/picoxcell_crypto.c                   | 34 ++++---
 drivers/crypto/qce/cipher.h                         |  3 +-
 drivers/crypto/qce/skcipher.c                       | 27 +++---
 drivers/crypto/sahara.c                             | 96 +++++++++-----------
 22 files changed, 254 insertions(+), 307 deletions(-)

-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
