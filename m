Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C97C433E1
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 13:24:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE7F208E4
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 13:24:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VVfXLaLH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIzcJauX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE7F208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nOpePbPjvKNLmbAmUfvN62oi+3YM0NEu5BWxAagGJMc=; b=VVfXLaLHq8JI3RNyoLhhm1MXN
	cr7x9igKdUC4oC/kN/1YbMKV76OI3JfazEHjGcI55lol4Y8UvLFt0lhb7YJe2Djb1VBum9IlY40Q3
	h5FwEi5YYHFaRTsAVcfFZr6TQbN9dhk6/T1WX06jG+U5BS2tlFHUAS26MKcT2gw4IoCUdL14DI2dk
	n8Gs0iEtRqLN8y3409lpRkbWyrAFmWmj7lkfI2uR0OaAXiDZcoTCx7G0gpCaSKEGxEXwT0dzSLNdp
	w2fgNDZp+ikhZ14Nbc4AUaw/eJlRI7QFrZp/8MTKylBXvmFng1DbKctzVHB7jxYiSsEB3wJ9WbDmN
	OeTmgbLYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAvPz-00062v-0w; Wed, 26 Aug 2020 13:24:47 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAvPv-000624-RL
 for linux-amlogic@lists.infradead.org; Wed, 26 Aug 2020 13:24:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id t14so1761690wmi.3
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Aug 2020 06:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KzstNuDLEgCqMhPzfbUI0ChLkjuGrPj7EWJxjD5ej3s=;
 b=aIzcJauXxLxWhF6r1s3rboD6nalp/PGjCJWEq3AMaA6EFkGQ/hBCeAf7lArmkCHsla
 G/I26tLIyMHEvT69xDMo6l92lRjaN9chguVZvrI4gfv/nCRo2WgHJxO31tUb43kkVlQ/
 i6+mNrYTcQ069BsfTIOl6YQKfyKZguXzLugN6PZuBYzGpBsBzLHBZcjO0HAWLJzf0wdt
 oUrvJntuevR9sboZRbbAzeNaRhDfzD/k1HOBENl7Wf1k8rz2LpAMVN7cefFSsHkbanBk
 PbPXEm3+ZDkDaOiQWXhO01FkXrrS6ExN5ib5rnDKFOxqj0OQCU0cMkWXozH9vC5GQX7q
 Z1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KzstNuDLEgCqMhPzfbUI0ChLkjuGrPj7EWJxjD5ej3s=;
 b=hedietc4h3MCy+SUZsgXSEXHBVXDHMnuDTbiGGCHtv2+z3t9plF7zzTszIe1EtPrTP
 HaFU4WXCuslgIwCI/FpiVMR7GllIp9/p6JNxQ3J8EzjsujK0OeHuVfyIEgOZDqkJHrzg
 QHgy7vh/ioyyV6KkdFmuH58RESZskq+ZJ0QFy8JrLmGdCo8BOQ2NqM1vsow8P2bShKeC
 hZli9gFtvQZNQtFQjurXd9H9RLDbS5++f4s//H3HlQz3vxIEZ/fiFf+tKosMxC609CX2
 KR/SOZibHxLm6VeSKRN3lmQamAn8Mxwfa1OIE7Rr7e/6ZoQhn8fHOnOWGd2ZnDxKRhIK
 b8Kg==
X-Gm-Message-State: AOAM533ca2GCvyw9SW4+lJccUNKDg2XhWZ53m7rWZvxaXaaMijWUCUyg
 2jSilMo/ZTZBRawmspHYL+370AcbDm8=
X-Google-Smtp-Source: ABdhPJyaX1z0Ru8id7CJwP3LuX70u1FzjSHOqSYSDUIUnMrnkdOi3aOZzdDP1qLogeXE5CR9jRBKZg==
X-Received: by 2002:a7b:ca4e:: with SMTP id m14mr6032901wml.17.1598448283018; 
 Wed, 26 Aug 2020 06:24:43 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id l1sm6642625wrb.12.2020.08.26.06.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 06:24:42 -0700 (PDT)
Date: Wed, 26 Aug 2020 15:24:40 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Denis Efremov <efremov@linux.com>
Subject: Re: [PATCH] crypto: amlogic - use kfree_sensitive()
Message-ID: <20200826132440.GA13819@Red>
References: <20200826131657.398090-1-efremov@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826131657.398090-1-efremov@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_092443_916016_4633044E 
X-CRM114-Status: GOOD (  17.61  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 26, 2020 at 04:16:57PM +0300, Denis Efremov wrote:
> Use kfree_sensitive() instead of open-coding it.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index d93210726697..f3dca456d9f8 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -341,8 +341,7 @@ void meson_cipher_exit(struct crypto_tfm *tfm)
>  	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
>  
>  	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> +		kfree_sensitive(op->key);
>  	}
>  	crypto_free_skcipher(op->fallback_tfm);
>  }
> @@ -368,8 +367,7 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  		return -EINVAL;
>  	}
>  	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> +		kfree_sensitive(op->key);
>  	}
>  	op->keylen = keylen;
>  	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
> -- 

So the {} are no longer necessary.
Same for the "if (op->key)" test since kfree handle NULL.

Thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
