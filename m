Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451A8C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jun 2022 11:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0r+R4FiThGX3CFSCwvFayZv6dyrhjbvQdEwmVQHguI=; b=jsy3LDL+Al3SD5
	vrbv0UXyXh5YwvxiJw83sMqG99dTkTZdafEtQrUP+BDa3eO5sM/lwrqE0732DgZR56wgV7zJ0dzQX
	soItQ4GoCqoOw43EnldBqqNg7cTPzjubHm4tJpd8r9jReCdpydIpf06GaKMQ23+fRt5KQ7I/gsWZf
	P2lkhqu/qIRhOMavfImou+2TXrVnamgbGvzVqcywy4/Vu+/iP0i38XPEVquostopC9S/uQG7m5l/r
	zne4Ujv+PLoNP/QP135Z38DC2J9sDAnabiXc0Agjt8zUPBDfOvogSnx0DeS2XHgsivzQxZt2QPTzl
	OlTkbyE0G/qJxZ/3SnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjP7-0032wJ-Hw; Thu, 02 Jun 2022 11:54:17 +0000
Received: from www381.your-server.de ([78.46.137.84])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjOz-0032r1-Am; Thu, 02 Jun 2022 11:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	 s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QxS95NZvfvenpMssN8GdGggpAUbQye4uoJjCm8L++y0=; b=dA7RvGXsT0Ahu/E4UyD7BzQNNn
	Z9GHJfzVFA3E0KIVV/k4h68SP1MLZxlnI18ySyPCfyGO+h++PeShZ0kRnDZZz2m3fpixb5Vr7CetG
	nh/AfXTG+9nu7k1ml9j1IzJhUqvJsJghUNYHO8j2f3jQYsYDN+I94nWwr6YhKIH9Nvld3d4gWfSTH
	16Ryt+yhdHOe/qE0ZdcAa2/ODessv/8IUjrwDzThJec2QYIpEHtfBxJiTzXIR+WGMTWv7CrKJin7U
	npJokGkns8SvkcwRQ/qVvuqj2ELa4gQDG/Zutzva4DvygBs0Xr7D+T91IqbL0CyoA935jxs0wN8QR
	zvbG/a/w==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3)
	(envelope-from <lars@metafoo.de>)
	id 1nwjOk-00033v-Fo; Thu, 02 Jun 2022 13:53:54 +0200
Received: from [2001:a61:2a7f:a201:9e5c:8eff:fe01:8578]
	by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lars@metafoo.de>)
	id 1nwjOk-000Udv-3t; Thu, 02 Jun 2022 13:53:54 +0200
Message-ID: <ad3af033-97f1-3aad-d082-c6ed56185b59@metafoo.de>
Date: Thu, 2 Jun 2022 13:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/3] iio: adc: meson_saradc: Use temporary variable for
 struct device
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
References: <20220602114241.12601-1-andriy.shevchenko@linux.intel.com>
 <20220602114241.12601-3-andriy.shevchenko@linux.intel.com>
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <20220602114241.12601-3-andriy.shevchenko@linux.intel.com>
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.6/26560/Thu Jun  2 10:06:31 2022)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_045409_411051_3F35716A 
X-CRM114-Status: UNSURE (   8.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 6/2/22 13:42, Andy Shevchenko wrote:
return -ENOMEM;
>   
> @@ -690,7 +687,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
>   	priv->clk_gate.bit_idx = __ffs(MESON_SAR_ADC_REG3_CLK_EN);
>   	priv->clk_gate.hw.init = &init;
>   
> -	priv->adc_clk = devm_clk_register(&indio_dev->dev, &priv->clk_gate.hw);
> +	priv->adc_clk = devm_clk_register(idev, &priv->clk_gate.hw);

You are not changing anything here. But we shouldn't be devm'ing on the 
IIO device. It will get freed eventually, but only when the last 
reference to the iio device has been dropped, which might be long after 
the platform device has been removed. devm'ing should happen on the 
platform_device's device. Might be worth fixing.

>   	if (WARN_ON(IS_ERR(priv->adc_clk)))
>   		return PTR_ERR(priv->adc_clk);
>   
> @@ -706,8 +703,7 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
>   	size_t read_len;
>   	


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
