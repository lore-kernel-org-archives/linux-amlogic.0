Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C0DC982FA
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuXu3P/Ma/2wvJsdo06jenmUZL8BmfKMWM9Mo8zVuPo=; b=Hjw9dR2GFxswAC
	KZBb1yYr8uBRnVJ9K9a9VbniCw5CWbWni7k7nVDJhxXfRqG+5be0NxVyEt+7+wcz2ssW4CLW/09ZV
	N76Ew6z7mAx7IXE6oubmnw9XnkQg2BgU9LY+DZ6+mS3LkFCX6L6FdOsxmOZyPsyB5bhEIS8UnBuU6
	qkzTOLZToEFyhGFtUxRXh91SDfqYIIv7EvXDgC+XynHtyYdFM4CEcCsZAdNrp7Hp55LPEifX6sTA3
	4ZI/1cSiWLz8i2zw9NCWqMmwfZjaUZgmc3ojBBGIyu0chmZk1P0geTJUBCaYOU0jsZh4RmRcBpMpN
	Cdw4dNPbgPgc3/cHgogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Igg-00000007bFz-2Spd;
	Wed, 23 Sep 2026 08:50:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Igf-00000007bEm-3QBl
	for linux-amlogic@bombadil.infradead.org;
	Wed, 23 Sep 2026 08:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mLJwPVslVmxbfOK/h/qXZ4Q2+9Q1t7IyYizljFrDCCM=; b=Itm0dE7NY6RlZHC9zHjZ9lJROR
	Ksb81eQWbLRhkFZqoWHIWUCUJzle9gj+yX3UDwt7apKyfprRy/xV0zUPNaDT87WnTTWu6eO4sJ/af
	j9DG5vYJvTVHUr/E651BSzgLGEii6yjw11VM2sUuFT6nje3wMA5giBSVzWMF5c/fLHWUHqflwOTYS
	LNwpVdbfJkBEBKT/Tfu557MvJWqCKlSRh/7m7E7l5kB/kDl+Tbd0PToZuNU5eYeez3NumVViP4X3z
	ueP3/j8U8YvzitDuQ/5A70gFuzlfvEpIAUmiQxbrPcL6MKV+xsV2bB2e8vYgYgPPoNrh/ktRyEO/L
	Ot40ewsw==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9IgZ-0000000EXqS-0Vwy
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 08:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=mLJwPVslVmxbfOK/h/qXZ4Q2+9Q1t7IyYizljFrDCCM=; 
	b=YBMp5weZE87ZVfePbHM5EY5IJozWbIw/V8aY0fxIAnNbin+ESql1b3qIcORFUgzxy+D0jBBpWP0
	gDGj7pneeqJ5RHlrg1B9dNONzQKRtnQGwBi7/nMBtG4FPBJTZenjyogOli/4tVyjW+6tHdw4FlK3Z
	vkvjAI3nTt5NkwonVQ+y+PcdvsfW2FAppTNQe9oVA5sgzWc/ST+iLlj3t97q0tBF6aLXZzkM2Lj07
	7ODy7lt+wzsKKFu9bN4snYSV+Zdix5T5hpqTb+g6YGvr9TqUedXccxGLLUZu5S02zzgvhRk7qcS9k
	uZ8+K+aLPHBtpB3W5NTCdS6xUTBisyR6YFRA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x9IgO-0000000GyDQ-38EF;
	Wed, 23 Sep 2026 16:50:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Sep 2026 18:50:28 +1000
Date: Wed, 23 Sep 2026 18:50:28 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: clabbe@baylibre.com, davem@davemloft.net, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, jkoolstra@xs4all.nl, lkp@intel.com
Subject: Re: [PATCH v4] crypto/amlogic: Use devm APIs for clock management
Message-ID: <arOS1D2qj8kZd6dK@gondor.apana.org.au>
References: <20260916174227.5581-1-raizudeen.kerneldev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916174227.5581-1-raizudeen.kerneldev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_095041_450745_95E63B15 
X-CRM114-Status: GOOD (  13.69  )
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

On Wed, Sep 16, 2026 at 11:12:27PM +0530, Mohamad Raizudeen wrote:
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
> Changes in v4:
> - Fix typo in meson_allocate_chanlist() function name.
> - Add error_chanlist label to properly free chanlist if IRQ requests
>   fail, preventing a memory leak.
> 
> Link to v3: https://lore.kernel.org/all/20260916154941.7254-1-raizudeen.kerneldev@gmail.com/T/
> Link to v2: https://lore.kernel.org/all/20260901024302.5407-1-raizudeen.kerneldev@gmail.com/T/
> Link to separate IRQ fix patch [1]: https://lore.kernel.org/all/20260908160120.4805-1-raizudeen.kerneldev@gmail.com/T/
> 
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 31 +++++++++--------------
>  1 file changed, 12 insertions(+), 19 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
