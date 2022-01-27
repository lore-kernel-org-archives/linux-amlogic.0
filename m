Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AE9C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 13:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aVZVJ+GDeig7PHdsHqAxT8s9i+wGmFtX7sLBhvJPgK4=; b=SUDYWpidOcrVNsFwNoHatSM6nQ
	Xw9GqXwlu9dgmceS6cv98tmsggEjcopK1caCR4MHuisL67HKl0+tP8oNNVIYX5Us95zcyAuey5J68
	ymfvK0414noAXr6juHlHML+04OK+C7Hu+8/BEd9ft6vZ3nV4Lj4cR/i5d1knt/e7h3BTa7ta14uYf
	IndX6yZvL99V9h+pw3i92uPIeHDrxi7W3Fza1tQ4gUHrPwudC4DrkcW31N+Iyb30RmfHcVrMP+3Ue
	8rowhCjSlukc1ENC82HBnP03FEyA1IHFqUdHnGyZfc4myjxl8dZIifL3asXrM9zwpcGTgoDioHVBD
	uQ+q0LGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD4Wn-00Fph7-6a; Thu, 27 Jan 2022 13:09:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD4Wi-00Fpfm-Rb
 for linux-amlogic@lists.infradead.org; Thu, 27 Jan 2022 13:09:27 +0000
Received: by mail-wr1-x42a.google.com with SMTP id c23so4683438wrb.5
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jan 2022 05:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uRCdmsKzTtl/e8jDz5OfS+Xhq/kglPjbOlF4IMlfCvE=;
 b=F/Cv0ihQ8enZVtaffNDyQkCLbbfxIKPGo84+NcxnfYFZlELtVAAyQeqDiPL3FxzhAf
 W6NJlwW3RGIz3C1ah/QKdrX5Pdb4tHS3cKLGEV9zouPkeHs25urzeZ89iOsJUfAtBsBi
 cTqSnSnCvYbNjq7osF+gPD/gymJaL8nsUcp12SNIEs0FPPiPfLpkOR77ZWgY95EKDLOV
 76vsMzX7d5EfxDbZ9cNn0ZMBV4w1wtNV3SOhTAkaswB2SgCgf7XLQNcpFKOZ8iZJ3yqz
 /GlF/FGCnxnXS8TCyV4P3kkqeeZYfV7m1tkwl7HimN/foJXhrurcyE3AOPmiKPDd71yi
 8xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=uRCdmsKzTtl/e8jDz5OfS+Xhq/kglPjbOlF4IMlfCvE=;
 b=f/QNE9RAQZoX9oupS64lIck0CztjqGT+ZAzwC3tURIjMuea3XpGoCOW0MHO4bBVAzI
 nmh3IpcilUEXv5zPgY8nlmUdUE6PzjUg6wes0ySeZE6uRq8u2ipSwOdFVTzh9C0GQAQW
 k1oOf/U04HGFdKIYlA/KBFTm+jNfjoLuLH2y0OhZlDk9tLQx5gHaRfcCWqrz1A+F6Pd7
 W18+np895rZ65DTUfyl+LqSBRiOb9SF43r62uZ/rPbNcxQK3rtrsBBnDxVDSb3fCkNkX
 m4hZlKHmoAwUx2kLnq/jSRhnpZVsIn/7Yp6yFeUvNkCHU6b22sOqfy/0wXJazuGGvUHh
 clNg==
X-Gm-Message-State: AOAM533KepMEGZ2T8tNsENt230Cs4tZtYR8+FR32xBpVcc8J+aalOwdb
 q5aZyQ3bh09uADWHWEHKBMC0Vw==
X-Google-Smtp-Source: ABdhPJykBbM1Vmvz0dqsh3rjV0fxuoQCWwMnI6NcOHp2g9cGLymHkzF9aY+PMP6t71s+84Nmjveg+Q==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr3092587wrr.141.1643288961978; 
 Thu, 27 Jan 2022 05:09:21 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff?
 ([2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff])
 by smtp.gmail.com with ESMTPSA id x5sm1857345wmh.27.2022.01.27.05.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 05:09:21 -0800 (PST)
Subject: Re: [PATCH v2] arm64: dts: meson-sm1-odroid: use correct enable-gpio
 pin for tf-io regulator
To: Lutz Koschorreck <theleks@ko-hh.de>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220127130537.GA187347@odroid-VirtualBox>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <af32f4e8-5ee2-9d16-3880-f681d1c3de6d@baylibre.com>
Date: Thu, 27 Jan 2022 14:09:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220127130537.GA187347@odroid-VirtualBox>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_050924_905103_F5054886 
X-CRM114-Status: GOOD (  17.92  )
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

On 27/01/2022 14:05, Lutz Koschorreck wrote:
> The interrupt pin of the external ethernet phy is used, instead of the
> enable-gpio pin of the tf-io regulator. The GPIOE_2 pin is located in
> the gpio_ao bank.
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
> 
> only gpio bank

Spurious lines, will remove while applying

> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index 0bd1e98a0eef..ed7cd5f53046 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -48,7 +48,7 @@ tf_io: gpio-regulator-tf_io {
>  		regulator-max-microvolt = <3300000>;
>  		vin-supply = <&vcc_5v>;
>  
> -		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
> +		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  		regulator-always-on;
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
