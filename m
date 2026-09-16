Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08748C88E77
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMc7/OyUtnxE9zz4t5wAo2QX/nbQCSOnxX3Zkdw2PeI=; b=mlHxLzuA4BNGrV
	z0fHJO2NjXdpEaswZbsQ7btDKWuAv7M0FT/ESlk0VOjSBBvCPIoELgJ7gWJNckDCV8+b95IajlL6s
	UUvC9jN3IhDOWaz7zpT7iWVQB47jW4TMGguGGhEMpFc9HdkJh1GBL11Twwk/HZpCE7NXSIF/9KWsS
	wJ+lSyaeKuWNCT6fgjfnmh3/IlBf35sJTBmBh8kYiKFXp3aJm6Ui+m2K20QByQtpGkZfwIsBRmBJ9
	MKU5wFQl9xaYULrEw46b6uHXP0V3HAUC4lXMrJPCeRiou4IdGyrwE25svleJdEh+Bscw6y54l4IV/
	/FxWStbIncPxGGQdkhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mH8-00000008tOh-221D;
	Wed, 16 Sep 2026 09:49:58 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mH4-00000008tMV-0McK
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 09:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=njikc4nORIsTPxlkCFcPQm3BO/kRWtHCUlB4reb5W0w=; 
	b=NetxLrsx/2fBWdXmzAZ44G444i0SA0dSDU6XvfWx6LY9NeKda8ptCKgQ0fTVgPwKcOJnIO0rxkJ
	wWmbTCu/15PZVHNApw6jkFEozSWa4KLcNS6OtPLgjOn69LBn5xv6LIRfNSwKv8GsoFrps7mnFwxTB
	dYm9vsv+TZqk2o6CVAK2cVSk4bJgBKDsGLMi3QPlpOHfrFULTuNrZdCJT7qreP5smQtnjKCXXYBVG
	xlrcbl1LJ/JqLTx4CEtlBg7YTFgPURsqjTIwg44CW2ObZA4ca+Gh2C3fne+PfBheL1iYer0tXmzBI
	xiSACKUIijQnwlojV/kbYlOB8Ru+HNgZti7Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x6mGx-0000000EYyY-0Ta6;
	Wed, 16 Sep 2026 17:49:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Sep 2026 19:49:47 +1000
Date: Wed, 16 Sep 2026 19:49:47 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: clabbe@baylibre.com, davem@davemloft.net, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, jkoolstra@xs4all.nl, lkp@intel.com
Subject: Re: [PATCH v2] crypto/amlogic: Use devm APIs for clock management
Message-ID: <aqpmOzURNFOm78ls@gondor.apana.org.au>
References: <20260901024302.5407-1-raizudeen.kerneldev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260901024302.5407-1-raizudeen.kerneldev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_024954_130097_E6FC61D0 
X-CRM114-Status: GOOD (  14.43  )
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

On Tue, Sep 01, 2026 at 08:12:52AM +0530, Mohamad Raizudeen wrote:
> The driver currently gets the core clock and manually enables it using
> clk_prepare_enable(). This requires matching calls to
> clk_disable_unprepare() in the error paths and remove function.
> 
> Switch to devm_clk_get_enabled() instead. This lets the kernel handle
> enabling and disabling the clock automatically, which allow us to drop
> the manual cleanup code and keeps the probe function simple.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608310329.QgxCCMs1-lkp@intel.com/
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
> Changes in v2:
> - Dropped the devm_crypto_engine_alloc_init() change due to build
>   failure reported by the kernel test robot.
> - Kept the devm_clk_get_enabled() clock cleanup as the sole focus of
>   this patch.
> - Link to v1: https://lore.kernel.org/linux-crypto/20260821151303.8150-1-raizudeen.kerneldev@gmail.com/T/#u
> 
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)

Please take a look at

https://sashiko.dev/#/patchset/20260901024302.5407-1-raizudeen.kerneldev%40gmail.com

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
