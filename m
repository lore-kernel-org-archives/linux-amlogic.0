Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8E4C624DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2026 02:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLoMK1zEPLba2e4qbAoNR5ODo8UULHi9vA9w+7juzWY=; b=AAPtuXjPA8snCz
	Zfm6MWtKnGSHBUfHEuFU0u+N5pTZ/xiCIsYoSev1djPX6XR/FWJEDcEAaZDO7oMS04B1CvpNzF0s7
	zxzqj07xdJblHlFWiBQQaAc2QeiFXIn/Q6T97+Il5du9TgjZUdoQq3BJ876/zUVf2+jpLiuk+A+ex
	BfEOnaMHoKLCU6k4k1m++0MDgU+avAtVD8XtKBmeaZErvX2xzrGwwbTHoS0SOLH9UjsUHn5kT6F9K
	0/EfdM1eEizd0c9wtpcp02nRwJLezj1rURBvIceMh5cqXR3nZFt+aTxLa1rEExpxsLGggYRb/6Ck+
	WoQnBKZxptP8BvrFd/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2K0D-00000000tXC-0Mx1;
	Fri, 04 Sep 2026 02:50:05 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2K0B-00000000tWp-01Qy
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Sep 2026 02:50:04 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-398e9698a70so469769a91.0
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 19:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788490201; x=1789095001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PG96oKZZP2N6Xo9cvn741u/vr6DaKEDABY2UEKMrlX4=;
        b=HgdRBFOc/1fZJBnqzm8dgpo9aJWSrd2UUpf5NEi7XF25ZYJF7mMT64ZaCNHV1FdSH1
         9RqW4qrCjOm6g5Zryfu2rAJcdEBh6wwK49kabVz5B5Vkw2QVOcI3zOEnNFpDxvf26mqZ
         Xu4DcCla8TlsXjbF0EpgDdye7BrLN+0opJbWg9afGMMloI50Wu09RCqqLXCTDaO4N4TP
         s4f31nHe/sI1Vtvyw1ZSreYEh6spbVi3CjDeZm2b+70eYzU50upXN2tSTZmeARF90bcF
         pWjEU/K2GBPpBlhES1b3ONWhqSh8709qc81ChknRhctd6XFJOohxivqLVqJXxX3DyV5A
         kCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788490201; x=1789095001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PG96oKZZP2N6Xo9cvn741u/vr6DaKEDABY2UEKMrlX4=;
        b=D2wSU53XbQ7WDJe3K4aUZStrXBKhflI6SHzUTR4eF5HAJM8GEmd4BXh2DpQgYHkgsu
         W27+RHML+8X0HqUMT1vLQU1/gWynsyH/rlvZUXcfmUGdG3zG31+G919HAKMUPx6R6ibv
         RoY2/jabnJ7zPYcFD0GaCtXy+OIPJv13QnUe+aHHZGB+pQExYpHQ4YYoFAbryr7JOsfn
         RKMAB3jltcaXs8ofGSlIhcks6gzT3HKOqGzVdXSewENjDbPXSDWZToQFAA+xJK7aRH6m
         4c9qQRFFSv/Ag7xuoW3C4MsTCsIu9yvRxLimS1i8ysxd0U/xTujv3KHx+CYSdKmxTSLr
         UItA==
X-Forwarded-Encrypted: i=1; AKwUvBwFGOcT5oA1XzWkbLcwCPZmFYmfoCKclUGGykglRWH9PcEuin4nV9VZQA/qvInqF47KC5HiAXbmH5jW0yw9@lists.infradead.org
X-Gm-Message-State: AFuF++kVbeIjw4mgBXZ721n4vVPRmx3e7zA0jlJIwdi/fRrnvZE780xV
	EgA+oWZ3dIrWAlnLsSklA5xZ90V7nUd3wDPetvDYmEFe/X0Sgr37GRNj
X-Gm-Gg: AYBFou0uMtRkUgKvFawpYvfGKaX9lQdeRmSULiORmiv0Mj4ft5Tl8M8HEIMibyy3mgl
	jCByCfSXg6a7K09SFhkqjSxS4+JIscEIUn1oOX2vg3JyGj4OhYqYX3zMCZSVv5Fb1dUPrsn+Uef
	jeWV4ValCEBSOQ5WKOb90N3jM+WQEH8gIa8GuRf9R6igYl3R9gBkCP6ozAWW56K4B1RSWFIsaZ9
	R76h1JN/KhEdmHOFe4GhIpvApD95ZjtBOIhC2/dYU3CFXgodyS7d/cyz2lCNhP60us3MfyLEw8s
	dEhekbIdH9ju6S0GTWGc73aNAL8FcNfV20Uv2WWVQgsKqvGj3fvWVHYWRcCnLl5Y6ZbhQFwopDb
	r/zDCXJOF+4egVaBaHFHZRM1NsjIE31x7SFiZps1ELLEE2Ca9HRd2KQx99O3gCBRaSKYyBrBPma
	zOqaaGyRVKeGF85LZxr/sP3/gxSobW/5U3FqQmZlGbBIAnQxO7kCb2Qjxjzgq7wVrQVIkekOvoZ
	Ze6VHnxvrLl2o88iE4=
X-Received: by 2002:a17:90b:4c86:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39b25f78ab8mr4417800a91.0.1788490201512;
        Thu, 03 Sep 2026 19:50:01 -0700 (PDT)
Received: from kernel ([103.219.206.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm3762634eec.16.2026.09.03.19.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:50:01 -0700 (PDT)
Date: Fri, 4 Sep 2026 08:19:53 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net
Cc: skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: amlogic: Fix IRQ handler return value and
 fallthrough logic
Message-ID: <apox0f2D6bYOYOnj@kernel>
References: <20260821151243.8125-1-raizudeen.kerneldev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821151243.8125-1-raizudeen.kerneldev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_195003_052136_E6F7CACE 
X-CRM114-Status: GOOD (  20.70  )
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

On Fri, Aug 21, 2026 at 08:42:43PM +0530, Mohamad Raizudeen wrote:
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
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 6cb33949915f..302b398405e2 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -38,11 +38,12 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
>  				return IRQ_HANDLED;
>  			}
>  			dev_err(mc->dev, "%s %d Got irq for flow %d but ctrl is empty\n", __func__, irq, flow);
> +			return IRQ_HANDLED; 
>  		}
>  	}
>  
>  	dev_err(mc->dev, "%s %d from unknown irq\n", __func__, irq);
> -	return IRQ_HANDLED;
> +	return IRQ_NONE;
>  }
>  
>  static struct meson_alg_template mc_algs[] = {
> -- 
> 2.53.0
>
Hi,

Just following up on this patch. Please let me know if you have any
feedback or if further changes are needed.

Thanks,
Mohamad Raizudeen

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
