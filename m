Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A86AC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Dec 2021 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SaCyUoc72b+zM7l4E87jV5sMyu6BU/aZXjtBlzQ6CgY=; b=oHC7wB9QeBpTYx
	ydhpOI/nUHMY/UfRi+1HBl3xZCTjv4JZ1RZCigOOOBDQv8jrdjIYSAGcsloRq9Sr8kq6K6japkUly
	qwsowLYG54eYUuwgjxS9n4eW3mCS9eAdvAVvR79001z+UKox4miAP4gaxdwOKdjsZoFMfMtkZ3DmX
	FObzEZzy5fq+MQMrjIyyqten42wEe8nrA/HTRht8/byBjtvbDEmJucpOGWYyU0TPNussDiH6eNHFA
	NhssinMyA1H58Yz3MjwNPjhBxhWwo90tg2zQ2Ee9wufYYyLnnAzNCS7yWfFh1eVkBBLdLVOTpPs/S
	YPxmzp15Hcid/hqVH1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx5Qa-00DYcE-RO; Tue, 14 Dec 2021 10:53:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx5QQ-00DYYt-1s
 for linux-amlogic@lists.infradead.org; Tue, 14 Dec 2021 10:52:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id k9so13869838wrd.2
 for <linux-amlogic@lists.infradead.org>; Tue, 14 Dec 2021 02:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=ZIscKsaxtzGTbeorWv4mmEwvhpmlWT3E/xEibnzYI8Q=;
 b=yOVOT69h9s6ALOhUNKCEfEQYRuRH/JNXGTKs/2N3MhwYIKp7Y5MVqZgk/h1Y0dFvO4
 VR8AnA43uEsGB5As0lYdvLYW5JkNeDx2OQ9vbCjV5Xr0ZZXK9QIBCf5bqlGmLmhqWJd6
 ZNxMII0CUz4hwqj6fRePpADaM2LCoFxkgA8wteWZrg0XFI1f/oMNxgUQ68IiArgmrfyt
 W5xOT4sYBuimjpndkLsEKOTfVAJUKCYCQRvdMTFpu59F4fSAAxjrE4PPOdNvolwfceTL
 PPHvcrVZhB5YBvRXSNPxd4W/8wylm8/tJEn0v5uoZc73GbTwvz0HJofFexjqhsB/NjP9
 qqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=ZIscKsaxtzGTbeorWv4mmEwvhpmlWT3E/xEibnzYI8Q=;
 b=Jx7heMHSfk0yoRWhQlYQjfl5hNz37NeiGrUwF/DV4PsBNruT9aRH1h4zOqoDj6PMaK
 smBNQMPOvSwhEBPMSkQCjsgHCX6JEso6gOH0L2SF5zb3Pq3gufubi1zQwDjgbt2khATW
 92cLnqJwuqgqErBntQsjMH6zNlBAWhmICaBM3jvIT9YiFVCQEPNK+VEkmmUA6eC/qona
 7LvLnfUAAX+RtB5+9mleDQToel/XqpK9/JvKbVJsUVLdkZ5Q8cD/1m2V71xMPzef808C
 X7zlSRjD+bqSZ2dMKtjhcSeRx8b0Wcs2SlcrvgLV7toq4Y4ytA08vJjNbzvnI2dOa7e0
 lrHQ==
X-Gm-Message-State: AOAM5337YtyOy6Kgim25SeQER6g6Yal9fmgufIwF+cqyB564iFxiEYc7
 1sCYLn51qHL2zhb6fguTUJybvQ==
X-Google-Smtp-Source: ABdhPJxAxtk2H0lLrev9jRe7UD3UrSDTNg9lwT9o4fGPpoW8PsIaI1mhUWW23K806u/uTmRUrWcVrw==
X-Received: by 2002:a5d:4ecd:: with SMTP id s13mr4906724wrv.400.1639479168439; 
 Tue, 14 Dec 2021 02:52:48 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d9sm13220946wre.52.2021.12.14.02.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 02:52:47 -0800 (PST)
References: <20211214022100.14841-1-qianggui.song@amlogic.com>
 <20211214022100.14841-4-qianggui.song@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Qianggui Song <qianggui.song@amlogic.com>, Linus Walleij
 <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
Date: Tue, 14 Dec 2021 11:00:26 +0100
In-reply-to: <20211214022100.14841-4-qianggui.song@amlogic.com>
Message-ID: <1j35mv31c1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_025250_236608_9D2DE6C0 
X-CRM114-Status: GOOD (  15.76  )
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


On Tue 14 Dec 2021 at 10:21, Qianggui Song <qianggui.song@amlogic.com> wrote:

> Add new pinctrl driver for Amlogic's Meson-S4 SoC which share the
> same register laytout as the previous Meson-A1.
>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---

[...]

> +
> +/* Bank D func1 */
> +static const unsigned int uart_b_tx_d_pins[]		= { GPIOD_0 };
> +static const unsigned int uart_b_rx_d_pins[]		= { GPIOD_1 };
> +static const unsigned int uart_b_cts_d_pins[]		= { GPIOD_2 };
> +static const unsigned int uart_b_rts_d_pins[]		= { GPIOD_3 };

Your S805x2 documenation says the 4 pins above are HDMI related for func 1

> +static const unsigned int remote_out_pins[]		= { GPIOD_4 };
> +static const unsigned int remote_in_pins[]		= { GPIOD_5 };

SPDIF for those 2

> +static const unsigned int jtag_1_clk_pins[]		= { GPIOD_6 };
> +static const unsigned int jtag_1_tms_pins[]		= { GPIOD_7 };
> +static const unsigned int jtag_1_tdi_pins[]		= { GPIOD_8 };
> +static const unsigned int jtag_1_tdo_pins[]		= { GPIOD_9 };

I2C for those 4

It goes on like this for the rest of GPIO Bank D and I did not check the
other banks

Could you please clarify
* Does the S4 applies to S805X2, S905Y4, Both ?
* Is the S805X2 Datasheet Revision 0.4 accurate ?

> +static const unsigned int clk12_24_pins[]		= { GPIOD_10 };
> +static const unsigned int pwm_g_hiz_pins[]		= { GPIOD_11 };
> +

[...]

> +
> +static const char * const tdm_groups[] = {
> +	"tdm_d2_c", "tdm_d3_c", "tdm_fs1_c", "tdm_d4_c", "tdm_d5_c",
> +	"tdm_fs1_d", "tdm_d4_d", "tdm_d3_d", "tdm_d2_d", "tdm_sclk1_d",
> +	"tdm_sclk1_h", "tdm_fs1_h", "tdm_d2_h", "tdm_d3_h", "tdm_d4_h",
> +	"tdm_d1", "tdm_d0", "tdm_fs0", "tdm_sclk0", "tdm_fs2", "tdm_sclk2",
> +	"tdm_d4_z", "tdm_d5_z", "tdm_d6", "tdm_d7"
> +};

On previous chip, there were pin assigned to tdm A, B or C.
On this generation, it seems you have added a second level on pinmuxing
to re-route the audio pins to different controllers

In such case, I don't think they belong in the same group.
Depending on settins, D2 and D3 could be unrelated

I think each audio pin should have its own group (one group for D3, one
D4, etc ...)

> +
> +static const char * const mclk_groups[] = {
> +	"mclk_1_c", "mclk_1_d", "mclk_1_h", "mclk_2"
> +
> +};

mclk_1 and mclk_2 should be in separate groups

> +
> +static const char * const remote_out_groups[] = {
> +	"remote_out"
> +};
> +
> +static const char * const remote_in_groups[] = {
> +	"remote_in"
> +};
> +
> +static const char * const clk12_24_groups[] = {
> +	"clk12_24"
> +};
> +
> +static const char * const clk_32k_in_groups[] = {
> +	"clk_32k_in"
> +};
> +
> +static const char * const pwm_a_hiz_groups[] = {
> +	"pwm_a_hiz"
> +};
> +

I'm curious to know what the pwm hiz function is ?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
