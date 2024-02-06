Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1977AC4828D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fo/l90vkMLvYIDsk4CrSkRJ4/3Czyuig5P6zo+Je7w0=; b=o68maNo3wo0aVg
	FRR8ivNcWfGpiYs6jadIPXoRxaPpzd6a/U/Hs9IiUbnCpoXBHljC8YlJV2UGZJ1VZwir8JwJSFQ99
	EEJ82PDlrSDDqz+PYXcCr9wu1QhjjnNRJ3zQru7rXwMSTjYg/7hKoheNk+GQPPOoH03+uf+uvrBCI
	4Gm7H227tISPYXMaJhJykb3bLzfzsDP97+4iQt1e7RMhExSQ6lxg7YuEf+W6FeLf860MP9TMY462q
	xpxswYrRhXQlgnGWHTukDQ909z6/SJID2BhcG+i2gZZW80Cb58MvtQZfJLTI9egpLHG51Qg5ii5hi
	sJC4nDPXm0bXCW9xXQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXM73-00000007ofD-3Gbk;
	Tue, 06 Feb 2024 14:07:49 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXM6z-00000007obz-1XQg
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 14:07:48 +0000
Message-ID: <f4ff9d98-a1ae-4214-9740-c6f921d1bc48@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1707228460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQ1uNrQgl7Q6ppJI7ZiOp0IhPwQJqVIgFs5DYq1SlBY=;
	b=IcAd4Iv/HZ4cSLrn8NbUVcz4NyCZptygJT1QmfoU7zAShjb6RlNpW6z9vHqXg+fwVdiTYp
	o0JwJIltEuV8fZj7vXnm395Yp8bun24KAEat+Nn/vIjgrZwl3CbJCjGDP5W5Uu0zfZ9wOj
	x5HkYaq5CGaU0tfvwDhN6n59gASF8E4=
Date: Tue, 6 Feb 2024 14:07:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3 09/20] drivers: crypto: meson: process more than
 MAXDESCS descriptors
Content-Language: en-US
To: Alexey Romanov <avromanov@salutedevices.com>, neil.armstrong@linaro.org,
 clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240205155521.1795552-1-avromanov@salutedevices.com>
 <20240205155521.1795552-10-avromanov@salutedevices.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20240205155521.1795552-10-avromanov@salutedevices.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_060745_891040_3DE2DE8C 
X-CRM114-Status: GOOD (  23.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 05/02/2024 15:55, Alexey Romanov wrote:
> 1. The old alhorithm was not designed to process a large
> amount of memory, and therefore gave incorrect results.
> 
> 2. Not all Amlogic SoC's use 3 KEY/IV descriptors.
> Add keyiv descriptors count parameter to platform data.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c | 443 ++++++++++++--------
>   drivers/crypto/amlogic/amlogic-gxl-core.c   |   1 +
>   drivers/crypto/amlogic/amlogic-gxl.h        |   2 +
>   3 files changed, 281 insertions(+), 165 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index c662c4b86e97..9c96e7b65e1e 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -17,35 +17,41 @@
>   #include <crypto/internal/skcipher.h>
>   #include "amlogic-gxl.h"
>   

[.. skip ..]

> @@ -84,176 +295,78 @@ static int meson_cipher(struct skcipher_request *areq)
>   	struct meson_dev *mc = op->mc;
>   	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
>   	struct meson_alg_template *algt;
> -	int flow = rctx->flow;
> -	unsigned int todo, eat, len;
> -	struct scatterlist *src_sg = areq->src;
> -	struct scatterlist *dst_sg = areq->dst;
> -	struct meson_desc *desc;
> -	int nr_sgs, nr_sgd;
> -	int i, err = 0;
> -	unsigned int keyivlen, ivsize, offset, tloffset;
> -	dma_addr_t phykeyiv;
> -	void *backup_iv = NULL, *bkeyiv;
> -	u32 v;
> -
> -	algt = container_of(alg, struct meson_alg_template, alg.skcipher.base);
> +	struct cipher_ctx ctx = {
> +		.areq = areq,
> +		.src_offset = 0,
> +		.dst_offset = 0,
> +		.src_sg = areq->src,
> +		.dst_sg = areq->dst,
> +		.cryptlen = areq->cryptlen,
> +	};
> +	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
> +	int err;
>   
> -	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u flow=%d\n", __func__,
> +	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u ctx.flow=%d\n", __func__,
>   		crypto_tfm_alg_name(areq->base.tfm),
>   		areq->cryptlen,
>   		rctx->op_dir, crypto_skcipher_ivsize(tfm),
> -		op->keylen, flow);
> +		op->keylen, rctx->flow);
> +
> +	algt = container_of(alg, struct meson_alg_template, alg.skcipher.base);
>   
>   #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
>   	algt->stat_req++;
> -	mc->chanlist[flow].stat_req++;
> +	mc->chanlist[rctx->flow].stat_req++;
>   #endif
>   
> -	/*
> -	 * The hardware expect a list of meson_desc structures.
> -	 * The 2 first structures store key
> -	 * The third stores IV
> -	 */
> -	bkeyiv = kzalloc(48, GFP_KERNEL | GFP_DMA);
> -	if (!bkeyiv)
> +	op->key = kzalloc(48, GFP_KERNEL | GFP_DMA);
> +	if (!op.key)
>   		return -ENOMEM;
>   
> -	memcpy(bkeyiv, op->key, op->keylen);
> -	keyivlen = op->keylen;
> +	memcpy(op->key, op->key, op->keylen);

Apart form invalid if() you try to copy op->key to itself.
I believe it should be removed, because you initialize ctx.key.addr
later

> +	ctx.keyiv.len = op->keylen;
> +	if (ctx.keyiv.len == AES_KEYSIZE_192)
> +		ctx.keyiv.len = AES_MAX_KEY_SIZE;
>   
> -	ivsize = crypto_skcipher_ivsize(tfm);
> -	if (areq->iv && ivsize > 0) {
> -		if (ivsize > areq->cryptlen) {
> -			dev_err(mc->dev, "invalid ivsize=%d vs len=%d\n", ivsize, areq->cryptlen);
> -			err = -EINVAL;
> -			goto theend;
> -		}
> -		memcpy(bkeyiv + 32, areq->iv, ivsize);
> -		keyivlen = 48;
> -		if (rctx->op_dir == MESON_DECRYPT) {
> -			backup_iv = kzalloc(ivsize, GFP_KERNEL);
> -			if (!backup_iv) {
> -				err = -ENOMEM;
> -				goto theend;
> -			}
> -			offset = areq->cryptlen - ivsize;
> -			scatterwalk_map_and_copy(backup_iv, areq->src, offset,
> -						 ivsize, 0);
> -		}
> -	}
> -	if (keyivlen == AES_KEYSIZE_192)
> -		keyivlen = AES_MAX_KEY_SIZE;
> -
> -	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
> +	ctx.keyiv.addr = dma_map_single(mc->dev, op->key, ctx.keyiv.len,
>   				  DMA_TO_DEVICE);
> -	err = dma_mapping_error(mc->dev, phykeyiv);
> +	err = dma_mapping_error(mc->dev, ctx.keyiv.addr);
>   	if (err) {
>   		dev_err(mc->dev, "Cannot DMA MAP KEY IV\n");
>   		goto theend;
>   	}
>   
> -	tloffset = 0;
> -	eat = 0;
> -	i = 0;
> -	while (keyivlen > eat) {
> -		desc = &mc->chanlist[flow].tl[tloffset];
> -		memset(desc, 0, sizeof(struct meson_desc));
> -		todo = min(keyivlen - eat, 16u);
> -		desc->t_src = cpu_to_le32(phykeyiv + i * 16);
> -		desc->t_dst = cpu_to_le32(i * 16);
> -		v = DESC_MODE_KEY | DESC_OWN | 16;
> -		desc->t_status = cpu_to_le32(v);
> -
> -		eat += todo;
> -		i++;
> -		tloffset++;
> -	}
> -
> -	if (areq->src == areq->dst) {
> -		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
> -				    DMA_BIDIRECTIONAL);
> -		if (!nr_sgs) {
> -			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
> -			err = -EINVAL;
> -			goto theend;
> -		}
> -		nr_sgd = nr_sgs;
> -	} else {
> -		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
> -				    DMA_TO_DEVICE);
> -		if (!nr_sgs || nr_sgs > MAXDESC - 3) {
> -			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
> -			err = -EINVAL;
> -			goto theend;
> -		}
> -		nr_sgd = dma_map_sg(mc->dev, areq->dst, sg_nents(areq->dst),
> -				    DMA_FROM_DEVICE);
> -		if (!nr_sgd || nr_sgd > MAXDESC - 3) {
> -			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgd);
> -			err = -EINVAL;
> -			goto theend;
> -		}
> -	}
> -
> -	src_sg = areq->src;
> -	dst_sg = areq->dst;
> -	len = areq->cryptlen;
> -	while (src_sg) {
> -		desc = &mc->chanlist[flow].tl[tloffset];
> -		memset(desc, 0, sizeof(struct meson_desc));
> -
> -		desc->t_src = cpu_to_le32(sg_dma_address(src_sg));
> -		desc->t_dst = cpu_to_le32(sg_dma_address(dst_sg));
> -		todo = min(len, sg_dma_len(src_sg));
> -		v = op->keymode | DESC_OWN | todo | algt->blockmode;
> -		if (rctx->op_dir)
> -			v |= DESC_ENCRYPTION;
> -		len -= todo;
> -
> -		if (!sg_next(src_sg))
> -			v |= DESC_LAST;
> -		desc->t_status = cpu_to_le32(v);
> -		tloffset++;
> -		src_sg = sg_next(src_sg);
> -		dst_sg = sg_next(dst_sg);
> -	}
> +	err = meson_map_scatterlist(areq, mc);
> +	if (err)
> +		goto theend;
>   
> -	reinit_completion(&mc->chanlist[flow].complete);
> -	meson_dma_start(mc, flow);
> +	ctx.tloffset = 0;
>   
> -	err = wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
> -							msecs_to_jiffies(500));
> -	if (err == 0) {
> -		dev_err(mc->dev, "DMA timeout for flow %d\n", flow);
> -		err = -EINVAL;
> -	} else if (err < 0) {
> -		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
> -	} else {
> -		/* No error */
> -		err = 0;
> -	}
> +	while (ctx.cryptlen) {
> +		meson_setup_keyiv_descs(&ctx);
>   
> -	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
> +		if (meson_setup_data_descs(&ctx)) {
> +			err = meson_kick_hardware(&ctx);
> +			if (err)
> +				break;
> +		}
>   
> -	if (areq->src == areq->dst) {
> -		dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_BIDIRECTIONAL);
> -	} else {
> -		dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
> -		dma_unmap_sg(mc->dev, areq->dst, sg_nents(areq->dst), DMA_FROM_DEVICE);
> -	}
> +		if (ctx.src_offset == sg_dma_len(ctx.src_sg)) {
> +			ctx.src_offset = 0;
> +			ctx.src_sg = sg_next(ctx.src_sg);
> +		}
>   
> -	if (areq->iv && ivsize > 0) {
> -		if (rctx->op_dir == MESON_DECRYPT) {
> -			memcpy(areq->iv, backup_iv, ivsize);
> -		} else {
> -			scatterwalk_map_and_copy(areq->iv, areq->dst,
> -						 areq->cryptlen - ivsize,
> -						 ivsize, 0);
> +		if (ctx.dst_offset == sg_dma_len(ctx.dst_sg)) {
> +			ctx.dst_offset = 0;
> +			ctx.dst_sg = sg_next(ctx.dst_sg);
>   		}
>   	}
> +
> +	dma_unmap_single(mc->dev, ctx.keyiv.addr, ctx.keyiv.len, DMA_TO_DEVICE);
> +	meson_unmap_scatterlist(areq, mc);
> +
>   theend:
> -	kfree_sensitive(bkeyiv);
> -	kfree_sensitive(backup_iv);
> +	kfree_sensitive(op->key);
>   
>   	return err;
>   }
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 22ff2768b5e5..f93e14f5717d 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -199,6 +199,7 @@ static const struct meson_pdata meson_gxl_pdata = {
>   	.descs_reg = 0x0,
>   	.status_reg = 0x4,
>   	.need_clk = true,
> +	.setup_desc_cnt = 3,
>   };
>   
>   static const struct of_device_id meson_crypto_of_match_table[] = {
> diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
> index a0d83c82906d..eb2f8cd72b65 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl.h
> +++ b/drivers/crypto/amlogic/amlogic-gxl.h
> @@ -83,11 +83,13 @@ struct meson_flow {
>    * @reg_descs:	offset to descriptors register
>    * @reg_status:	offset to status register
>    * @need_clk:	clock input is needed
> + * @setup_desc_cnt:	number of setup descriptor to configure.
>    */
>   struct meson_pdata {
>   	u32 descs_reg;
>   	u32 status_reg;
>   	bool need_clk;
> +	u32 setup_desc_cnt;
>   };
>   
>   /*


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
