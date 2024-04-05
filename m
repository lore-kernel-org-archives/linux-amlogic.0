Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A60CD1296
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2024 06:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEspr7towODGholRiwcHrJbpusTeMv9ogLfaeM0BG9o=; b=Ryo6I3rDpvRh3j
	EiKHPdcA3n8JwLF5bSV9sjtIx/H9bW47DB3HMVsBC/yKItydJQ0y/VXMQamisIuyjGh8LtwtF7YEc
	qWS4XNPNrzQdWc6Lt1ne0tQD5Ws89QL4qVnhzD+VaRTyMdBDEkvRBp3mvSLpatiEWGsLNUNrWT4nX
	ben8r33VzcNJKc+lG4w7dYGz/skoG/u7Ew2wAa6jpx/SCEh0FUi1rixAqkpEHrHI42oZz9wf58sM0
	K8Vy0OugqaDG6LijT7kKE2PST0YDAUemndACxeYZbKjmyCp+unNYTvCSUu7uY+kUEJLFXKSPZu6of
	0Tn+L23pw7AO68t3IZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsdUa-00000005Yeg-2p6h;
	Fri, 05 Apr 2024 06:56:04 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsdUW-00000005YbP-0LeU;
	Fri, 05 Apr 2024 06:56:03 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rsdU3-00FSp7-Re; Fri, 05 Apr 2024 14:55:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 05 Apr 2024 14:55:48 +0800
Date: Fri, 5 Apr 2024 14:55:48 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
Subject: Re: [PATCH v6 10/23] drivers: crypto: meson: avoid kzalloc in engine
 thread
Message-ID: <Zg+gdDZQG1GeKwGn@gondor.apana.org.au>
References: <20240326153219.2915080-1-avromanov@salutedevices.com>
 <20240326153219.2915080-11-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326153219.2915080-11-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_235600_162929_F27B9A34 
X-CRM114-Status: GOOD (  11.30  )
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

On Tue, Mar 26, 2024 at 06:32:06PM +0300, Alexey Romanov wrote:
>
>  /*
>   * struct meson_cipher_tfm_ctx - context for a skcipher TFM
> - * @key:		pointer to key data
> + * @keyiv:		key data
>   * @keylen:		len of the key
>   * @keymode:		The keymode(type and size of key) associated with this TFM
>   * @mc:			pointer to the private data of driver handling this TFM
>   * @fallback_tfm:	pointer to the fallback TFM
>   */
>  struct meson_cipher_tfm_ctx {
> -	u32 *key;
> -	u32 keylen;
> +	u8 keyiv[AES_MAX_KEY_SIZE + AES_BLOCK_SIZE] ____cacheline_aligned;
> +	u32 keylen ____cacheline_aligned;

This doesn't do anything to guarantee that tfm_ctx is aligned.

You either need to align this by hand, or you could use the
crypto_skcipher_ctx_dma helper if DMA alignment is what you're
actually looking for.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
