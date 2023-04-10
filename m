Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FF5C77B61
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDfYtE2mytpV2Pl3eAh8qo/RpAtlDlYl0ruN9Uxs+Do=; b=wl4PeVPZqXvWmf
	VcPUtZjGcQJwRYxhRsQ476+ZsjqVvLyk5o2WdfipN0APvkGa6FseSaLl2q/4ZFK2hkLbohEN2hvDX
	/LEhfszgZfcDD9Zw9N1ECEzGNaW/4oHGpvA5xL7hersJhqVTwmFXWDWViA//feuuXuS7grJ38daGS
	qYH7ZcCImxJAuezsJkRVxe74lCglZar08Y+IrnXogYIvjEVTgWcJpxqYxOHZqp1R7L/8cG/FNNKVa
	okbUw+zKasXBvjMawomS+C7aThbXcmyQSJrEmXNKueoU8qBWWEZchzBkhiIAc4EYF5O7ZhT7465TS
	+3wvn3vnIXmYPSxquiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pluZv-00FZXa-0l;
	Mon, 10 Apr 2023 16:41:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pluZr-00FZWp-08;
	Mon, 10 Apr 2023 16:41:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D148D61CC6;
	Mon, 10 Apr 2023 16:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB39C433D2;
	Mon, 10 Apr 2023 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681144869;
	bh=zz8rVoloOKCPdCyFenJt8RAA9ls+uQJna7oAZHgsD9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQRgGe/HZZXRBjj3tFQYBBklu/9e3YmhJ1Pt1l/aornMes8Hx8Y11OfM6V6V6M6r/
	 drh+NIPlojIbSsPm7Sht1YpA22EF62hchPoGv6PJnmjyrruFwiT4KeSl7cIULX7MxS
	 30PuglPFIEacD4MIthT4vM5mZS2LAdvXdqMEOd4JH1o81eBCr57VWj7tiLGwd0vPA7
	 9YP+gWi90lW19MvExGBfE+I1sBz/rwVlfvHAeGCvlm5UBbUqrmP09OtPgoR2NW8ITi
	 Ij3TDHVUbSdPCI8r0XxZ5DpuuckwxglXmol4JBUdrxW48cVL1KYEpnZIfSY0BFZ9nY
	 RUIC98mkikC4Q==
Date: Mon, 10 Apr 2023 19:40:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
	stefan@agner.ch
Subject: Re: [PATCH v2 1/1] of: fdt: Scan /memreserve/ last
Message-ID: <ZDQ8FpOtO7UINuFn@kernel.org>
References: <20230410120017.41664-1-tanure@linux.com>
 <20230410120017.41664-2-tanure@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230410120017.41664-2-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_094111_134043_4A5679D3 
X-CRM114-Status: GOOD (  21.33  )
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

On Mon, Apr 10, 2023 at 08:00:17AM -0400, Lucas Tanure wrote:
> Change the order of scanning /memreserve/ and /reserved-memory node.
> /reserved-memory node should go first, as it has a more updated
> description of the memory regions and it can apply flags, like nomap.
> Also, /memreserve/ should avoid reserving regions described in
> /reserved-memory node.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  drivers/of/fdt.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index d1a68b6d03b3..26e608d8025d 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -635,16 +635,21 @@ void __init early_init_fdt_scan_reserved_mem(void)
>  	if (!initial_boot_params)
>  		return;
>  
> +	fdt_scan_reserved_mem();
> +	fdt_reserve_elfcorehdr();
> +
>  	/* Process header /memreserve/ fields */
>  	for (n = 0; ; n++) {
>  		fdt_get_mem_rsv(initial_boot_params, n, &base, &size);
>  		if (!size)
>  			break;
> +		if (memblock_overlaps_region(&memblock.memory, base, size) &&
> +		    memblock_is_region_reserved(base, size))
> +			break;

I don't think this is really needed, it's ok to reserve the same ranges
multiple times.
Both checks are not cheap, so it'll be better to just reserve everything
both from performance and simplicity points of view.

> +
>  		memblock_reserve(base, size);
>  	}
>  
> -	fdt_scan_reserved_mem();
> -	fdt_reserve_elfcorehdr();
>  	fdt_init_reserved_mem();
>  }
>  
> -- 
> 2.40.0
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
