Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08F7C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPHyIaTUHPB8GBtTqxjCHvMlBuVUPTf2G/HfFh72AEs=; b=dQKXKOWqbiiY2l
	IzchvlwTyWD3O8hDFrt4/9uHU3aGtfq/n/So/pA10Xyf+mSboWYuiEXg4Jasjxabd98QlXVmASdiD
	3FaaC874vOouzu+saz4v3dw8Hm3uOyxz+k3MGBh5K1J0LkHFM2owAmrJH9cGsijzv8NbmgyL9H0Mt
	njGQzggKeygXMhXLVM1jxESUePIzjRednxJup2WSlJOOFnI8SmYwmEfc6LZ+yZ0cu+gidq64Cecwa
	d/43kiaVSlPtQO1aECaRxvz3rq/dmGQ7YSnHs0BTE4E20MiKDSWz55D6PDnAZ5UycxEOAASIsCIhy
	nPUV7GMuz7LHgFKv6P8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p139G-00FOKl-Uh; Fri, 02 Dec 2022 10:20:02 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=formenos.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p139E-00FOIe-EJ
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 10:20:02 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1p1394-003CCS-AZ; Fri, 02 Dec 2022 18:19:51 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 02 Dec 2022 18:19:50 +0800
Date: Fri, 2 Dec 2022 18:19:50 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Corentin Labbe <clabbe@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] crypto: amlogic - Save a few bytes of memory
Message-ID: <Y4nRRtV3ZCr+DJlM@gondor.apana.org.au>
References: <c797dc5e9248498918916a6eeedaa25de2196e8c.1669154149.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c797dc5e9248498918916a6eeedaa25de2196e8c.1669154149.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_022000_500881_7EE6776B 
X-CRM114-Status: GOOD (  10.70  )
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

On Tue, Nov 22, 2022 at 10:56:19PM +0100, Christophe JAILLET wrote:
> There is no real point in allocating dedicated memory for the irqs array.
> MAXFLOW is only 2, so it is easier to allocated the needed space
> directly within the 'meson_dev' structure.
> 
> This saves some memory allocation and avoids an indirection when using the
> irqs array.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 1 -
>  drivers/crypto/amlogic/amlogic-gxl.h      | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
