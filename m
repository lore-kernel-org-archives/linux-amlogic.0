Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662A9EB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOZLoh6F/kO5CR8Aa4AOvCa74do2u8mQJ/+42XwatYA=; b=e9AXBNT5aIi+0t
	PH93HFolrVM/aPXdqGbCwmdlwUu9m/+ekQE9KO8EYpXWcWPcN63ZFU+hBmhQAIvDV79KtC6asRo5I
	g2w9TgzntpQr0tsoBLgnD+3k7I0RWoW/CVJBAEYG7110YenSdTeoFlVQm6xwmYfh322YC8dKio1JK
	K1XrqgogK01fY/anWV/XX1DWH84fjYxedf3ZCUsABmYsE6iB3SahqDJ6tzUD1b46Yc3IYrKtTrH+D
	arp4vc7qz9z+D37SWLA4kmBVcz1fPje+4inTfabQwv94FkA8bzgIQNW4N/MKMaEcNL9I8p3n9cG4/
	mv4CgEEtHzwOaguVwG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzb9-00FTsH-1O;
	Wed, 05 Jul 2023 10:18:59 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzb7-00FTq1-1q
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jul 2023 10:18:58 +0000
Received: from localhost (88-113-24-87.elisa-laajakaista.fi [88.113.24.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 57fcbf88-1b1d-11ee-b3cf-005056bd6ce9;
	Wed, 05 Jul 2023 13:18:54 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Wed, 5 Jul 2023 13:18:53 +0300
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@sberdevices.ru
Subject: Re: [PATCH v1 2/2] spi: amlogic-spifc-a1: add support for
 max_speed_hz
Message-ID: <ZKVDjTCFAcJxO_Ci@surfacebook>
References: <20230703094518.53755-1-mmkurbanov@sberdevices.ru>
 <20230703094518.53755-3-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703094518.53755-3-mmkurbanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_031857_785587_D92DDA2F 
X-CRM114-Status: UNSURE (   9.89  )
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

Mon, Jul 03, 2023 at 12:45:18PM +0300, Martin Kurbanov kirjoitti:
> This patch sets the clock rate (spi_transfer->max_speed_hz) from the
> amlogic_spifc_a1_exec_op().

...

> +static int amlogic_spifc_a1_set_freq(struct amlogic_spifc_a1 *spifc, u32 freq)
> +{
> +	int ret;
> +
> +	if (freq == spifc->curr_speed_hz)
> +		return 0;
> +
> +	ret = clk_set_rate(spifc->clk, freq);
> +	if (!ret)
> +		spifc->curr_speed_hz = freq;
> +
> +	return ret;

The form 

	ret = clk_set_rate(spifc->clk, freq);
	if (ret)
		return ret;

	spifc->curr_speed_hz = freq;
	return 0;

less error prone in case some code is squeezed in between.

> +}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
