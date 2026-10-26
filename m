Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3756606A31A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 04:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Or4vgVDs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=WZ5RDdM8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SOiEwFFu8oGnRqQUsqjvMg7lk3TdUymwVEBAxb6YCBM=; b=Or4vgVDsIy6iuS8bmFuhN5oDrN
	R9MAzceISZN6mR7hVdGF3Ct/hDvB2BMDVLWuVtRcYx2E7wecNe91/mbeXUlyO8/r6qVCW2+SMTsVL
	O+CNO/ncICqcojw2G78UusKFIVQF5vo9BJw5NBr6u55IHllcJJwRraTDse6YiXsgJIH1QPuTkU/Jv
	mxZRdPbHQhu9bKh0cdofQ65BVvglzNJ4Ev8wQNWlONQuy5EdnZ/7H3/dCQj8OWuXlew9ogMe8Lle0
	ctToQTZhwmlPrWxgqoDpPv4m/0plm2idKUYmTlMF+UidoABs/PAZ8Ko+UX6caAtzwCuLxAqHR+Zf7
	dfsXim1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCez-00000001iPy-14m4;
	Mon, 26 Oct 2026 04:50:13 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCeu-00000001iPK-2fFZ
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 04:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Bl2W2vOTxi9wy2cQELmAmGrvk4vUTUbxwbB9TWDhuWs=; 
	b=WZ5RDdM8X/Iq1Jt4frZTU7DDQjCgJIJwaPjcNtCQJTc8fqvwQY8VKviPrcNqfsmZZ8/ho/9YM54
	vCVFj+QnbEPpNE8ZHNlaskkMTy7uRuKRUDs82QNtTEc7k2ZZ/Lb1h3aGG3VkJ70+kP0XGrNzwa3P3
	tl3vrp8kc8LYAf+Z1ZxzRdiU/rTjTbZX05/HzlC9Q9EPi+m4NsTeq/C6orzkSsAnR5yHl+1BLnEjE
	rAVckr8io5/TLi9o9RB+8CUckyqWLADdWpmSGqpIUCehojfsN/O+X2CPO35LV382B8Ymeieyc5tvS
	5SFkTXaWcigaEhG2RFq5k3mKEt1T0Qvr69CA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xLCeh-00000007XjN-2kM4;
	Mon, 26 Oct 2026 12:49:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 26 Oct 2026 12:49:55 +0800
Date: Mon, 26 Oct 2026 12:49:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ijae Kim <ae878000@gmail.com>,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: Re: [PATCH] crypto: amlogic - Free channel IRQs before disabling the
 clock
Message-ID: <at7b8-V0gl-a3d8T@gondor.apana.org.au>
References: <179203206852.2659709.13834828335447558448.G3@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <179203206852.2659709.13834828335447558448.G3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_215008_681914_B5B19B13 
X-CRM114-Status: GOOD (  17.10  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 10:41:48PM -0400, Myeonghun Pak wrote:
> The channel IRQs are requested before the managed channel array is
> allocated. Automatic cleanup consequently frees that array before
> releasing the IRQs. An interrupt handler that has already read a channel
> completion status can still write chanlist[flow].status and complete the
> channel completion after the array is released. A cipher timeout allows
> such a late handler even after its crypto engine becomes idle.
> 
> Release the IRQs explicitly before disabling the bus clock and before
> devres can release the channel array. Do this after crypto_engine_exit()
> so normal requests retain their interrupt-driven completion while the
> engines drain. Use the same cleanup on probe failures after the clock
> has been enabled, preserving the channel allocator's existing unwind.
> 
> This issue was identified as part of our ongoing research while
> reviewing kernel code.
> 
> Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Compile-tested with GCC, W=1 (arm). No runtime testing.
> 
> This bounds IRQ access to completion state and registers; hardware DMA
> handling after a cipher timeout is unchanged.
> 
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

The patch description does not apply to the current cryptodev tree.
Please review this change:

commit e273759a0e29395a6e35e5f17ce03b2690476b2c
Author: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Date:   Wed Sep 16 23:12:27 2026 +0530

    crypto: amlogic - Use devm APIs for clock management

    The driver currently gets the core clock and manually enables it using
    clk_prepare_enable(). This requires matching calls to
    clk_disable_unprepare() in the error paths and remove function.

    Switch to devm_clk_get_enabled() instead. This lets the kernel handle
    enabling and disabling the clock automatically, which allow us to drop
    the manual cleanup code and keeps the probe function simple.

    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202608310329.QgxCCMs1-lkp@intel.com/
    Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
