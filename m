Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FD0C982FA
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4btA7ePnLTHzL3Q1ubpkJ0sflJjXR48FesZs1qjBVs=; b=mXUrvHQLl8gl/v
	pfHv9LgeiIEdwWoQdCAxzzLHcG2LwP1L/g2gUCIujIM2+74ZFSAKm48lH3PeaXjGoICMZkU8rQK9D
	9TNh7DKjPt043BAWUx28VU/wY0GOJh5BnA/V9ZBanfJZmOuYJTXk/1o3MqvhpMsijremYJL9B7PQ3
	huez8GfVE6ozED16dr9wzet1h5W/OD8z6p8ADJ9c/ISNCDgyWBqXOqid8ut8PpL9FaTric2KrmjJc
	UBczaVNoJaGTEEossdfjpAW8TwNAAMJiqwXm5hp8eUk+WQ2oM9j0gAcNwDYXE8arO4Xd+iJPNypgo
	LonYHrEYwQ+/IgvY/WUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ihd-00000007bjW-0uaz;
	Wed, 23 Sep 2026 08:51:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ihb-00000007biR-2thj
	for linux-amlogic@bombadil.infradead.org;
	Wed, 23 Sep 2026 08:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tZJAnZPXTSm7jOQD+71qvk/FhQ2GHWrOBjTeZD59zj0=; b=PK1B94wtZJl2AB4hG7VLrijZf9
	odmcHJVXHignanNQTt4W3ekHzKCg39L+ZvGIaEUAzLZUvZCm5MP4NTLO0GMJTauqhdO/JcfI4BJvy
	nyaB2wp/KHT8B1MHAjmfEreyEA8MARV/ZiD5SyLibqnyga2VLRPba16UlKrh04ow+Y4gD69BntlnI
	+Q0umpB74TM9BEm1ZWGnJ892ajeiW9feG6TVR7wRRlfmczqPEZlAdzki7EcAZiNSkFAr/UMxo9yy6
	4fAeSQqxLx795pV029opDnz1HQ9zbBe92nuynes0nFLvCquSd7F7UiZqZvD9r8z6xpZ2fMxZM8gUD
	fp/FURWQ==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9IhV-0000000EXyv-0yUL
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 08:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=tZJAnZPXTSm7jOQD+71qvk/FhQ2GHWrOBjTeZD59zj0=; 
	b=jxSZQ79mboIhc5KsS5kh99j44cUqrgDrCz5wmnpbVitirrg8ncw589szpy6SWxKTsLZeFacHy1O
	KvTbe4skwKuTNjXmoPBY2Z5cY0pGRswM8A4Nn4JToZ63Y4iuuTOis+9YVk0lb8ZR0pjEMGYI1QPJs
	miMVGK9w/dIZNfEAZRHjbYtYh8Vgm65cHB6loV47bDRKnpK8it5MkiEi0990bR1x/xIklh15ACKlR
	7Zrgbqfeg1QWcnTHfqcXEYBp2onQ9NTngCdGVISMpk227TADiM2Sd97x4C4VxdVBmOK0d03VGT3qo
	ZY+4FfMx1unXb8wrWxdjuQ//ZSRcgx/izjJg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x9IhL-0000000GyEG-1kdQ;
	Wed, 23 Sep 2026 16:51:28 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Sep 2026 18:51:27 +1000
Date: Wed, 23 Sep 2026 18:51:27 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: davem@davemloft.net, clabbe@baylibre.com, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] crypto: amlogic: Fix IRQ handler return value and
 fallthrough logic
Message-ID: <arOTD-JgF-kQRLfP@gondor.apana.org.au>
References: <20260918115950.9121-1-raizudeen.kerneldev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918115950.9121-1-raizudeen.kerneldev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_095140_801083_36EE3DC1 
X-CRM114-Status: GOOD (  15.79  )
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

On Fri, Sep 18, 2026 at 05:29:50PM +0530, Mohamad Raizudeen wrote:
> In meson_irq_handler(), when an interrupt matches a flow but the status
> register is empty, the driver prints an error but doesn't return. It
> falls through the loop and incorrectly prints an `unknown irq` message.
> 
> Fix this by returning immediately. For empty status registers, return
> IRQ_NONE instead of IRQ_HANDLED to avoid masking spurious interrupts and
> allow the kernel to detect interrupt storms. Also use
> dev_err_ratelimited() to prevent console lockups during an interrupt
> storm.
> 
> Additionally, the handler returned IRQ_HANDLED for genuinely unknown
> interrupts. Return IRQ_NONE instead for unhandled interrupts.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48fe583fe5417 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
> I have addressed the IRQ specific issues in this v3. The other
> pre-exisiting issues mentioned by Sashiko are already addressed in my
> separate patch.
> 
> Changes in v3:
> - Revert accidental clock management changes that were squashed into v2.
> 
> Changes in v2:
> - Return IRQ_NONE instead of IRQ_HANDLED when status register is empty
>   to avoid masking spurious interrupts.
> - Use dev_err_ratelimited() to prevent console lockups.
> 
> Link to v2: https://lore.kernel.org/all/20260918110504.7207-1-raizudeen.kerneldev@gmail.com/T/
> 
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
