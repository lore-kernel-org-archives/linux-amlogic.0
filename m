Return-Path: <SRS0=Zj77=AG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1422FC433E3
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:43:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9725206BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KvLaxWxw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHnxyn+u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9725206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E+ALKjxtOwHF4723khZRItSy+KQ06ePsAn1oH0AoKZ0=; b=KvLaxWxwZW+cz38/4iXKmHdVN
	OzIL7tiQ7Njabay7DFIBxrGt5O9nZrcKnpkavZM3l31bMCkIoOoIfws+HTuH61MLanLy0kq9TgVzi
	FGpbPbkqQsX301Ae9VtFdnSCZdpJ8CEwZqgROYyl+2gp1/gJPbztPXRQqLsQ+iL2FY3dpnv0151dj
	KQUqrPFe0paN51epozVyUnqjVwkWNEVtFxkHhccPG8tx2AkofAuZ/Ez6J+RkOISJcuWWs5buKRb1o
	2xVlL4f6pxWWCM6Ac0Xg39DJ+LpkoTF8sKZ+Qwr2zOJxWCBRcWSqAvVltRv5HoDWX0nMFg9pFeRoY
	3Ag3HN2/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joRE0-0005LZ-1d; Thu, 25 Jun 2020 12:43:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joRDv-0005Kk-P1; Thu, 25 Jun 2020 12:43:24 +0000
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr
 [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9368A207E8;
 Thu, 25 Jun 2020 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593089003;
 bh=c+inIYObGSZUVYp7oF5MvXqUUSrjOBVfIrZv9HY3hO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XHnxyn+umL7xjsWbcPaEEpz9fmEaU36nRZlbaYhyeyHyJ7svn/xv3pTucjhOHQT/U
 W+0kAGtDwk48a+grcEYWi2/HaF3cgvOlAoPQtbXsUYqHoQzI1yQ8pRlCLjoSgWsjq+
 SdGtX6T3Kq7hMNPi6uenO6mm5dmnvaEpgDvgDbdw=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 01/12] crypto: amlogic-gxl - default to build as module
Date: Thu, 25 Jun 2020 14:42:42 +0200
Message-Id: <20200625124253.1906557-2-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625124253.1906557-1-ardb@kernel.org>
References: <20200625124253.1906557-1-ardb@kernel.org>
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

The AmLogic GXL crypto accelerator driver is built into the kernel if
ARCH_MESON is set. However, given the single image policy of arm64, its
defconfig enables all platforms by default, and so ARCH_MESON is usually
enabled.

This means that the AmLogic driver causes the arm64 defconfig build to
pull in a huge chunk of the crypto stack as a builtin as well, which is
undesirable, so let's make the amlogic GXL driver default to 'm' instead.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/amlogic/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/amlogic/Kconfig b/drivers/crypto/amlogic/Kconfig
index cf9547602670..cf2c676a7093 100644
--- a/drivers/crypto/amlogic/Kconfig
+++ b/drivers/crypto/amlogic/Kconfig
@@ -1,7 +1,7 @@
 config CRYPTO_DEV_AMLOGIC_GXL
 	tristate "Support for amlogic cryptographic offloader"
 	depends on HAS_IOMEM
-	default y if ARCH_MESON
+	default m if ARCH_MESON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ENGINE
 	select CRYPTO_ECB
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
