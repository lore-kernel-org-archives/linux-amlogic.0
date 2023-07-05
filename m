Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AD6EB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m118UJJpZIqKDVRxqNZST8cDsIYSggQ59HUO6Ax8xLU=; b=OHkOPXnoqaQ03t
	nhIqww6WM4+ILFdwVqzfzkRNVt743ZtMyVtuGJRxCFM5t8bZQM8wpt4mX2jE15sNLH6nD5AdIr3Gn
	P25FIs8Grgrd6/uT2TRisNPcNMC8r7xg3YAyLmhnEiN66rSLmz+bMxyl8yj0ZBWkqW8xYBi9XbQl+
	YUjdBx7GP6kttZJQK4BCCCLAaM8IloXwWImkByVX7NIaED12z+Npbt40eOqTeFGkxJdIaFVtDCU/E
	hGB8X7CYC+V276C+qf+w+YdX62aE9tYJ4v9hFnEJ2LUIB9ZcrfpFGTbnh7AdrTX4F9axvnQ0gLrcO
	4dOJurTK3eExhZ66U2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzZl-00FTBv-0f;
	Wed, 05 Jul 2023 10:17:33 +0000
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzZj-00FT9d-0c
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jul 2023 10:17:32 +0000
Received: from localhost (88-113-24-87.elisa-laajakaista.fi [88.113.24.87])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 20f0bf1a-1b1d-11ee-a9de-005056bdf889;
	Wed, 05 Jul 2023 13:17:22 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Wed, 5 Jul 2023 13:17:21 +0300
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@sberdevices.ru
Subject: Re: [PATCH v1 1/2] spi: amlogic-spifc-a1: implement adjust_op_size()
Message-ID: <ZKVDMV95gZN4oQjx@surfacebook>
References: <20230703094518.53755-1-mmkurbanov@sberdevices.ru>
 <20230703094518.53755-2-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703094518.53755-2-mmkurbanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_031731_424523_DA0C4049 
X-CRM114-Status: UNSURE (   9.92  )
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

Mon, Jul 03, 2023 at 12:45:17PM +0300, Martin Kurbanov kirjoitti:
> This enhancement eliminates the need for a loop in the
> amlogic_spifc_a1_exec_op() function and allows the SPI core to
> dynamically divide transactions into appropriately sized chunks.

...

> +	if (!data_size) {

Why not positive check?

> +		ret = amlogic_spifc_a1_request(spifc, false);
> +	} else {
> +		u32 mode = ilog2(op->data.buswidth);
>  
>  		writel(0, spifc->base + SPIFC_A1_USER_DBUF_ADDR_REG);
>  
>  		if (op->data.dir == SPI_MEM_DATA_IN)
> -			ret = amlogic_spifc_a1_read(spifc,
> -						    op->data.buf.in + off,
> -						    block_size, dmode);
> +			ret = amlogic_spifc_a1_read(spifc, op->data.buf.in,
> +						    data_size, mode);
>  		else
> -			ret = amlogic_spifc_a1_write(spifc,
> -						     op->data.buf.out + off,
> -						     block_size, dmode);
> -
> -		nbytes -= block_size;
> -		off += block_size;
> -	} while (nbytes != 0 && !ret);
> +			ret = amlogic_spifc_a1_write(spifc, op->data.buf.out,
> +						     data_size, mode);
> +	}

...

> +static int amlogic_spifc_a1_adjust_op_size(struct spi_mem *mem,
> +					   struct spi_mem_op *op)
> +{
> +	op->data.nbytes = min_t(u32, op->data.nbytes, SPIFC_A1_BUFFER_SIZE);

I would rather use min() for strict type checking.
In this case it will require to have U/u suffix in the SPIFC_A1_BUFFER_SIZE
definition.

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
