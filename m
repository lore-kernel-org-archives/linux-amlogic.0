Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C535C77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGNNn6YQkjAlvJyJWPn3/IlSLgbDQB4EAe8D+IJd2yk=; b=izJg2xF7eUGL14
	EyBCLVz8I8BdKGabTpfMq2BFd98/mzKSz0wLJrarOZ4iwPKQmVh5YAr2sfgFscNXjxK49mze76mIY
	D+igq9LuFpRPcP+XHjwXfr2DppahnCSvea7Ms9yXJdZzAT5jg80j1/ov0CdZG996ClAYr/WnRDNvr
	AXS6rvXfNNNkOCrMiBacNwxPe3ImF57xaHFDaq5FvjvVLou6r6y6LwOanM455JKgEIKuo7aUZ7vYf
	DlNulV1az2pGADQL02DllPmX80i/A3wtr2k8lGLRHN61I1ubpNrqMYKo0tygAWNMvZM2aC6z9gWfQ
	trwdfL7wnaImOFVEhvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp3Kt-004cV8-2D;
	Wed, 19 Apr 2023 08:38:43 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp3Kp-004cS2-2n
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Apr 2023 08:38:42 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pp3KA-00089X-Gl; Wed, 19 Apr 2023 16:38:00 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 19 Apr 2023 16:37:59 +0800
Date: Wed, 19 Apr 2023 16:37:59 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	=?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>
Subject: [PATCH] hwrng: Kconfig - Add HAS_IOMEM dependencies for
 exynos/meson/mtk/npcm
Message-ID: <ZD+oZ9DWiTxeo3RY@gondor.apana.org.au>
References: <202304191106.swKbBeDh-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202304191106.swKbBeDh-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_013839_902235_22109A3F 
X-CRM114-Status: GOOD (  10.82  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Apr 19, 2023 at 11:43:42AM +0800, kernel test robot wrote:
>
>    s390-linux-ld: drivers/char/hw_random/exynos-trng.o: in function `exynos_trng_probe':
>    exynos-trng.c:(.text+0x39e): undefined reference to `devm_platform_ioremap_resource'
>    s390-linux-ld: drivers/char/hw_random/meson-rng.o: in function `meson_rng_probe':
>    meson-rng.c:(.text+0x10a): undefined reference to `devm_platform_ioremap_resource'
>    s390-linux-ld: drivers/char/hw_random/mtk-rng.o: in function `mtk_rng_probe':
>    mtk-rng.c:(.text+0x40e): undefined reference to `devm_platform_ioremap_resource'
>    s390-linux-ld: drivers/char/hw_random/npcm-rng.o: in function `npcm_rng_probe':
>    npcm-rng.c:(.text+0x2ca): undefined reference to `devm_platform_ioremap_resource'

OK, this patch should fix these ones at least:

---8<---
Add missing dependencies on HAS_IOMEM as otherwise they will trigger
failed builds with COMPILE_TEST enabled.

Also add dependencies on OF where appropriate.

Change the default so that these drivers are not enabled just because
COMPILE_TEST is turned on.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304191106.swKbBeDh-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index ae508e96cfc2..f3146470ce88 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -400,9 +400,9 @@ config HW_RANDOM_POLARFIRE_SOC
 
 config HW_RANDOM_MESON
 	tristate "Amlogic Meson Random Number Generator support"
-	depends on HW_RANDOM
 	depends on ARCH_MESON || COMPILE_TEST
-	default y
+	depends on HAS_IOMEM && OF
+	default HW_RANDOM if ARCH_MESON
 	help
 	  This driver provides kernel-side support for the Random Number
 	  Generator hardware found on Amlogic Meson SoCs.
@@ -427,9 +427,9 @@ config HW_RANDOM_CAVIUM
 
 config HW_RANDOM_MTK
 	tristate "Mediatek Random Number Generator support"
-	depends on HW_RANDOM
 	depends on ARCH_MEDIATEK || COMPILE_TEST
-	default y
+	depends on HAS_IOMEM && OF
+	default HW_RANDOM if ARCH_MEDIATEK
 	help
 	  This driver provides kernel-side support for the Random Number
 	  Generator hardware found on Mediatek SoCs.
@@ -456,7 +456,8 @@ config HW_RANDOM_S390
 config HW_RANDOM_EXYNOS
 	tristate "Samsung Exynos True Random Number Generator support"
 	depends on ARCH_EXYNOS || COMPILE_TEST
-	default HW_RANDOM
+	depends on HAS_IOMEM
+	default HW_RANDOM if ARCH_EXYNOS
 	help
 	  This driver provides support for the True Random Number
 	  Generator available in Exynos SoCs.
@@ -483,7 +484,8 @@ config HW_RANDOM_OPTEE
 config HW_RANDOM_NPCM
 	tristate "NPCM Random Number Generator support"
 	depends on ARCH_NPCM || COMPILE_TEST
-	default HW_RANDOM
+	depends on HAS_IOMEM
+	default HW_RANDOM if ARCH_NPCM
 	help
 	  This driver provides support for the Random Number
 	  Generator hardware available in Nuvoton NPCM SoCs.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
