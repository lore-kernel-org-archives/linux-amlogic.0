Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DBBCA0EFB
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ria/plcsS9dCtxkKJUgrL/2TaCEZ8WbEtmzPu113UqM=; b=rLaTnV3R3+cbaD
	hUe38kFhhSkYADLFhGtz7ULtJXdTT4gxY4Yg8M+9xD0v0xPGZ9HR5RwkeJhMReq1cPxIO9vC1uJNb
	wmINgd429lwng+KQHwIdbPiHMjbNA3SyFGM8wf9HYFiGhkD6HbMWtiNb3sXyBCSUYEr01iNZStLZs
	KFQ6qy7KNxPIWTGE7oRg/dvZz0n8GgU96tRVfBpVyxIu58S+wujszL5GOVIjgdLGndqWgy8LqSivl
	CP7ZpSCf/YEd+dIaAOesXt2SKqydI2aRKcdzch/u8vJJkSoeXaoSCMtPl4rvRsA9Ug5jIomaQp2jE
	uip/py8Y4BSq+ZFoHlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjz0i-00000005rAo-0vNI;
	Fri, 30 Aug 2024 10:37:44 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyzu-00000005r0x-10Ye;
	Fri, 30 Aug 2024 10:36:56 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sjyqx-008Uog-1U;
	Fri, 30 Aug 2024 18:36:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 30 Aug 2024 18:36:24 +0800
Date: Fri, 30 Aug 2024 18:36:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Yue Haibing <yuehaibing@huawei.com>
Cc: davem@davemloft.net, clabbe@baylibre.com, linus.walleij@linaro.org,
	atenart@kernel.org, arno@natisbad.org, bbrezillon@kernel.org,
	thomas.lendacky@amd.com, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next 0/6] Cleanup unused function declarations
Message-ID: <ZtGgqISfvQNdt0fN@gondor.apana.org.au>
References: <20240820082525.259337-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820082525.259337-1-yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_033654_300179_D9574959 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 20, 2024 at 04:25:19PM +0800, Yue Haibing wrote:
> Cleanup unused declarations for crypto driver subsystem.
> 
> Yue Haibing (6):
>   crypto: safexcel - Remove unused declaration
>     safexcel_ring_first_rptr()
>   crypto: sl3516 - Remove unused declaration sl3516_ce_enqueue()
>   crypto: octeontx - Remove unused declaration otx_cpt_callback()
>   crypto: ccp - Remove unused declaration sp_get_master()
>   crypto: amlogic - Remove unused declaration meson_enqueue()
>   crypto: crypto4xx - Remove unused declaration crypto4xx_free_ctx()
> 
>  drivers/crypto/amcc/crypto4xx_core.h             | 1 -
>  drivers/crypto/amlogic/amlogic-gxl.h             | 2 --
>  drivers/crypto/ccp/sp-dev.h                      | 1 -
>  drivers/crypto/gemini/sl3516-ce.h                | 2 --
>  drivers/crypto/inside-secure/safexcel.h          | 1 -
>  drivers/crypto/marvell/octeontx/otx_cptvf_algs.h | 1 -
>  6 files changed, 8 deletions(-)
> 
> -- 
> 2.34.1

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
