Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C681BC88E75
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2026 08:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5DpCZYOVP9zU8ogmFhYPxCIelLhodmoToArk8ZKkpQ=; b=0sLI0fCiJCDyb/
	k4v2HVZbSlSpjXg0VyK+8flmDEsed+TUXXYPsTXyo8CM1RLSTM9zOBIlgtxg7VQhnynJwTQdxMn57
	EWmlpDOz3dXasFYyxPy8vf+oaZXMtTbYX9llP8zcXnPgWtZurnIXR0oRn5AztjPU4EQKmJWVgIypQ
	DsSh+XKB1TeNi31HFRLySuNZhbc1Jmr6VNfe3cKSYw/hP21M5wI3d8qedIPUTLMKOiEP6tRKb0beY
	QPbszxwrRldtpLlRqnwEUMsyx6mywPLctfLXrE/Oq1bJM/xlh8f0L6jhGZ6leWVthIGsIEMwzyj1C
	3pUhPewANBKRrr4azHzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UKe-0000000DrjE-1Stu;
	Fri, 18 Sep 2026 08:52:32 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UKa-0000000DriQ-3Syq
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Sep 2026 08:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=jZLW6WJFVhU+LLcc0daYjVscse94JVPYOxGjDJR0vBY=; 
	b=rXjMkOHsvMByvr71y5p+y0r71KilPSIYOu8eNXw4WC11O8yYs1nKEia7AM4+cPvShrLMqUt47Q0
	sJa7OEkh787LVVtCyhijiuxdIwOQeh8O0hVjbVKxIXQ2dm69mDKnkR+ARJBt1342sfRUfT9ZO59iT
	24+C/ghYXwyoFhtEhtgYrX1CqN89hUlOxKK4yznXp4/2eGCh1qO/9vNZcm0AufNs8x+c8dq4c2Au+
	7bTxnzb5LskhfBBGYPcZ1fq9XHORGFwA1EAZEaJBK1LRYQ0yoGeM7Vdy4rnGR0IvzZxnYyxUtpv1E
	eJfVXsCJg8gmkGo69Oexa/aZDUYaV2R9pTNg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x7UKD-0000000FKg2-0EvH;
	Fri, 18 Sep 2026 16:52:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Sep 2026 18:52:05 +1000
Date: Fri, 18 Sep 2026 18:52:05 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: clabbe@baylibre.com, davem@davemloft.net, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: amlogic: Fix IRQ handler return value and
 fallthrough logic
Message-ID: <aqz7tT10SEMCrwV4@gondor.apana.org.au>
References: <20260908160120.4805-1-raizudeen.kerneldev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908160120.4805-1-raizudeen.kerneldev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_015228_886572_D370A277 
X-CRM114-Status: GOOD (  11.84  )
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

On Tue, Sep 08, 2026 at 09:31:20PM +0530, Mohamad Raizudeen wrote:
> In irqreturn_t_meson_irq_handler(), when an interrupt matches a flow
> but the status register is empty, the driver prints an error but
> doesn't return. It falls through the loop and incorrectly prints an
> `unknown irq` message.
> 
> Fix this by returning IRQ_HANDLED immediately after the error print.
> 
> Additionally, the handler returns IRQ_HANDLED for genuinely unknown
> interrupts. This masks false interrupts and prevents the kernel from
> detecting interrupts. Return IRQ_NONE instead for unhandled
> interrupts.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48fe583fe5417 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Please check

https://sashiko.dev/#/patchset/20260908160120.4805-1-raizudeen.kerneldev%40gmail.com

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
