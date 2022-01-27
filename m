Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0906C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GL3QxVTgzpazf6HjV49PZ0Xf0aUtBH00sOerlOF2jwk=; b=AE25DKLN1U2Q01aswJB7WFSk+c
	IqAkquUlG8hVf7hDPuAzeCQL/QwF+Bp1FbRtDygB3hTdwafhoX83w1hxo6D9SrEMuz770eT/qUKtw
	NQaLzT0PViin+t7wumB21pyD/QPzURZLT9on50yt2aAkkCGCsGP3XOFG8+EY/xzGNdfdG6Bh06vB/
	n/KZ7jd5CDaKO0QsYsGEUkr+zd/PpZeP+DEE7u+UqPpq/W6Grkb+02qqO/vNQqwW2Om/v5pP71Cjq
	bpR2DkNpSnOB0vVMxXZwumBz1K26H2Agzn0Z1tzEZg6v/7u5JTMVq1pPB2w+obdQOY3mDrTWijytB
	pmpGE5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD1oJ-00F6RO-39; Thu, 27 Jan 2022 10:15:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD1oF-00F6Ou-7g
 for linux-amlogic@lists.infradead.org; Thu, 27 Jan 2022 10:15:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id f17so3835279wrx.1
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jan 2022 02:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8x6kPB0xVxvNejSKMZ4lJYgA9YR5Lh9WkR/5tdJIkCM=;
 b=XZHGxUK6B9Khgh5lHZ0qT6x4NI+VjhHIWKeoUY2ORPZtc9Or2eUdDfW/4x356Trv73
 NPX2VyrICKJuD9frvOQNByTBq4dRuw6HGrHRhrQ5HBAZOKKDl2RyqSXSBsNqI9PZOxAa
 K1uS6HrW3U3sR6hxINfGPeIZ/NSLmHwVFdA+/fGmdkbHaqaxOc6jYlTgOW3ailtkIsC9
 g/QbMj8DnoBfKKAqsjLFZHlB4esTvWbU79CSvDf4l8fNj7RYMQvpP/Spl9HVyKXMmP+V
 RFjSxtV+UVdcsCIvccrW39UwICeZ4cfUcuU8FQH1U88J88cFyR0WVXM2VNyaJUlNHUZP
 dnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8x6kPB0xVxvNejSKMZ4lJYgA9YR5Lh9WkR/5tdJIkCM=;
 b=Jppy2Oh07YtrFL8bVVpe+KAmgpLpSUK82It9VapZiyjCphJ7gQMafpl11gvEYQxz/2
 LYzETUQSb7BcM08wF53nKMMV144RJnxgYHKHrs+iK9Npfz2o4ll5f/jG4O9CBg5Ov8Gz
 hgciAjtuKO+1Bj2yCr7Y4NML2Cpt6G4eppc+bOOoo4QIydYiTvnmoaBVyyz/rNQf474d
 GJPugn8tJyicwCqTV9+CpN5BgMO7ryLtCYo1T8SetYWsR+rc07+zqm05fEEL8tlo70I4
 rZxDme6+NFjwlnFhRV+CUsE/3UlM42DPBOqzwkg2tKGLMzukahzP5YJ50+/RLK+zSgRD
 p0hg==
X-Gm-Message-State: AOAM532gQYU97Ndz34c7IO6083BVIEhw8ZdCD8z4/ft7eKaQNu3/l6ST
 FEyG+/mUQhXeY4hZMRs6bv/dXg==
X-Google-Smtp-Source: ABdhPJynl6tia3B2Ag73l8mApp8aa4NGQ/NkhFAo6L6qBbWEicXINtupPkEG7I+fIR2znCUpa5tpyA==
X-Received: by 2002:a5d:408e:: with SMTP id o14mr2374145wrp.83.1643278515238; 
 Thu, 27 Jan 2022 02:15:15 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff?
 ([2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff])
 by smtp.gmail.com with ESMTPSA id 16sm1539461wmj.12.2022.01.27.02.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 02:15:14 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: meson-sm1-odroid: use correct enable-gpio pin
 for tf-io regulator
To: Lutz Koschorreck <theleks@ko-hh.de>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220126234325.GA7363@odroid-VirtualBox>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <651adde5-4887-4701-5183-6a35a443574c@baylibre.com>
Date: Thu, 27 Jan 2022 11:15:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220126234325.GA7363@odroid-VirtualBox>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_021519_353364_B781EEDF 
X-CRM114-Status: GOOD (  20.25  )
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

Hi,

On 27/01/2022 00:43, Lutz Koschorreck wrote:
> The interrupt pin of the external ethernet phy is used, instead of the
> enable-gpio pin of the tf-io regulator. The GPIOE_2 pin is located in
> the gpio_ao bank.
> Using open drain prevents reboot issues.
> 
> This causes phy interrupt problems at system startup.
> [   76.645190] irq 36: nobody cared (try booting with the "irqpoll" option)
> [   76.649617] CPU: 0 PID: 1416 Comm: irq/36-0.0:00 Not tainted 5.16.0 #2
> [   76.649629] Hardware name: Hardkernel ODROID-HC4 (DT)
> [   76.649635] Call trace:
> [   76.649638]  dump_backtrace+0x0/0x1c8
> [   76.649658]  show_stack+0x14/0x60
> [   76.649667]  dump_stack_lvl+0x64/0x7c
> [   76.649676]  dump_stack+0x14/0x2c
> [   76.649683]  __report_bad_irq+0x38/0xe8
> [   76.649695]  note_interrupt+0x220/0x3a0
> [   76.649704]  handle_irq_event_percpu+0x58/0x88
> [   76.649713]  handle_irq_event+0x44/0xd8
> [   76.649721]  handle_fasteoi_irq+0xa8/0x130
> [   76.649730]  generic_handle_domain_irq+0x38/0x58
> [   76.649738]  gic_handle_irq+0x9c/0xb8
> [   76.649747]  call_on_irq_stack+0x28/0x38
> [   76.649755]  do_interrupt_handler+0x7c/0x80
> [   76.649763]  el1_interrupt+0x34/0x80
> [   76.649772]  el1h_64_irq_handler+0x14/0x20
> [   76.649781]  el1h_64_irq+0x74/0x78
> [   76.649788]  irq_finalize_oneshot.part.56+0x68/0xf8
> [   76.649796]  irq_thread_fn+0x5c/0x98
> [   76.649804]  irq_thread+0x13c/0x260
> [   76.649812]  kthread+0x144/0x178
> [   76.649822]  ret_from_fork+0x10/0x20
> [   76.649830] handlers:
> [   76.653170] [<0000000025a6cd31>] irq_default_primary_handler threaded [<0000000093580eb7>] phy_interrupt
> [   76.661256] Disabling IRQ #36
> 
> Fixes: 1f80a5cf74a6 ("arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator")
> 
> Signed-off-by: Lutz Koschorreck <theleks@ko-hh.de>
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index 0bd1e98a0eef..ddb1b345397f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -48,7 +48,7 @@ tf_io: gpio-regulator-tf_io {
>  		regulator-max-microvolt = <3300000>;
>  		vin-supply = <&vcc_5v>;
>  
> -		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
> +		enable-gpio = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;

Wow, indeed it's not the right GPIO chip... my bad.

>  		enable-active-high;
>  		regulator-always-on;
>  

Concerning the GPIO_OPEN_DRAIN, it's right since the line has a pull-up, does it really fix reboot issues ?

Anyway, can you split the changes ? First for gpio_ao, second for GPIO_OPEN_DRAIN ?

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
