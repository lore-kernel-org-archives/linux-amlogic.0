Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF3DC88E41
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 05:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imigu9cVQ9Y3pA2MNqvhLdiyiVjvqJTfVJ7Lv/E2wDc=; b=WR9i6ZEMPGULxg
	1F5AztmyiwQfOfmiZYqNk+IwwqQSGdvXxYofV0Kek1FJwkYImm/Jts00j29TT0OyOGSp08tyRE49Q
	sY6H58pQsYe345ObB4nBuv2D4hc/TagETuGU/R/ponOLQl0G/bGfUkPiMh5pBnp3U84tvg1OVz3d0
	g0g7BzsoP4nF7P0LMkOUNrR6LMNstiXGHJiSIcIZqLltnGoA6Bmkvb6U2hkcRwAkCOilyMcv0iLBK
	ybNjPwQJj5SeDt8XeyO8iMLrsbHFJLHDsza2EqGjx6algeYZp6XLnCvHOoZwVIwdb5gkm9zkjkh6b
	2Oigd0MDR5Cjmcl85BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tak-0000000FqbL-0DvK;
	Fri, 11 Sep 2026 05:14:27 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tah-0000000Fqai-10Le
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 05:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=1+xY5QPHr/IOqkEDcXfU4kirKBllz5ddpdORVXBfRBs=; 
	b=H1JQt/U5qeQ4l5pgkCrThdNzM+VGzhdKTCUCQjxmSwipKmYIxD1DDuKzUKX8a0BNojDOLKl28Uv
	4RKN4+EVelSC3bwSe7OcohPwu3cPhp8pbUFXDrEhhGgleWAZGxfaOYOQbeXIMSZJz65sR4RKQ/1JR
	xDVI/j4Wpeld3O8AdumCH2kc3toYha/MQiGqTi6xTHbHjDQZoBE3IJ85nFakuqMHcWhbuQKebRN9U
	TD1L0rvkwZpxUfhkKL7NO8pc90TJaPHC1EFdFYmwf6EgNX97vLDhFwjGjxLaYK0lQCFE+khHuIz+h
	YrBSGwYLgBaUalBTiBOt0+pn3NZbo77rtxPg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x4taY-0000000Ctvz-2Vl8;
	Fri, 11 Sep 2026 13:14:15 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 11 Sep 2026 15:14:14 +1000
Date: Fri, 11 Sep 2026 15:14:14 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: clabbe@baylibre.com, davem@davemloft.net, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: amlogic: Fix DMA memory leak in cipher error
 path
Message-ID: <aqOOJoA2mVT9270l@gondor.apana.org.au>
References: <20260822084509.26385-1-raizudeen.kerneldev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260822084509.26385-1-raizudeen.kerneldev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_221423_284653_4E0AC4EA 
X-CRM114-Status: GOOD (  15.33  )
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

On Sat, Aug 22, 2026 at 02:15:08PM +0530, Mohamad Raizudeen wrote:
> A DMA memory leak occurs in meson_cipher() on the mapping error paths.
> The driver jumps to the end of the function without unmapping the
> previously mapped source scatterlist and key/IV buffer when the
> destination apping fails.
> 
> Additionally, a memory leak occurs when a scatterlist mapping succeeds
> but the returned count exceeds the driver's MAXDESC limit. In this case,
> the driver rejects the mapping without unmapping it. The BIDIRECTIONAL
> mapping branch also lacks the required 'MAXDESC -3' upper bound check.
> 
> Fix this by introducing proper error labels, error_src and error_keyiv
> and unmap resources immediately inside the calidation checks to ensure
> all successfully mapped resources are cleaned up before returning the
> error.
> 
> Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
> Changes in v2:
> - Add missing '> MAXDESC - 3' upper bound check for the BIDIRECTIONAL
>   scatterlist mapping branch.
> - Unmap scatterlists immediately inside the 'if' block when the count
>   exceeds MAXDESC - 3, because dma_map_sg() actually succeeds in this
>   case and the mapping must be undone.
> 
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c | 25 ++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
