Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58664C3F2D1
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 17:01:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE16217F4
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 17:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hKShloS4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G//D/RNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DE16217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrQrhcRiV7Ynd9LTpBmMieEyUAgm25hULhzL29QDg48=; b=hKShloS4/4P3Pd
	NA2go740Po1+cAH5ELV0BzFnUQPsS4pfGQ5QWB40lbl/mJKbgkAyixGRAwNZQ/zczea4qMaMjLpfd
	kJlGKEErc4wsPba9BuXVLC5k0rFG53yKUfH+r5EL5B+rOx0N7erWgXZ51bZ/g5j5dax7bE6zTZyNG
	V8rohYADUVcxtnWqdy7XCyRlyfpXPi12tbBgNz33NjoXydprcZzKVdE83PM7QNIZVqyHKCF7rEucA
	7cnF/hMGKJ9J8onLusnseLTYZrZkEZuPRqvL6QMdpPseL7qmJYwg9XTrIJTl4GQPruOzFlGSaBBrm
	ubduJIwa5NIil15fMYJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8oRb-0001sI-5N; Mon, 02 Mar 2020 17:01:27 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8oRX-0001rZ-O1
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 17:01:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id z11so610839wro.9
 for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2020 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JxxZMXsVW1OlUAj2yQJ6ZF+K072kLAsn2WXP+512A/M=;
 b=G//D/RNJf7ItaCMkYYyhrVVoLHbmg+VdXhMwiw86M2PluaUELtampqk8xrbWLKMLqe
 wDF6bck4vxs+t2ye9djT5PqWyAngPJSwNSuWytRndAweD5E9TdzAcOMNjOpOyQNtZZZg
 r7vL6QxW0b3sBA7umhlOFOrPG88rJermRECnzifaNjrCU0zarr6CZ6TLwVTnV4KbC7Dz
 KKCLPYE2Dbc/TUsbpqgaCjNK+2s1i2B07rTF8WBiOaoSBJ93SrGx7UA6IdL5G6Z1Qdsj
 uktYR5gQeIpnWGXqf4kRgvEeN+l3bmxU2AD9cznl/S5X2ZM5XmTsbVcBGYTB9Wc/54/p
 +mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JxxZMXsVW1OlUAj2yQJ6ZF+K072kLAsn2WXP+512A/M=;
 b=mcSVnC47LEKXfzi04Z+MiPiy/YQIPlIqibt4WJaPQZymKgbZnqOBz4P7alhy6aknPF
 uO7QpfusfByleC+D6RdFgAWpo4Qc6ZiYYIyfFTM2ijBjBQov80F1wmQxGIZmKtDZ88Gi
 P4yz4T8a3X8iAtxUvPRAtRIXwI/pOvT+BWk7YTp7ZYp1jxbXMdBiDJCsc9TWnK+AT9XQ
 o6Y+0Pbdg+iUjA80tnDet5V5J3HKAx+/xGJL1OAxnyowqINZWr40BsQMQSauSiJUcz4h
 89qq5KtojmB7VI3fT6ieb7P4CLv8CbovcK2qL40waZRcQOo9IaPQuLjLlqZebAGc7ekD
 iAPQ==
X-Gm-Message-State: ANhLgQ3hnsnLwpMZHoWbR624fDf2houk7nHbMGNcjeWrCjejwNam1Q+v
 1hDHNNPDojNgJhBEjfe83gPcFQ==
X-Google-Smtp-Source: ADFU+vvbCDhbjKnBTJ0P9gUMwbINUDb4htWjCWs1X4yIjcZsa/sq2I2rF81VVO4nPsuCrCG5FapnZA==
X-Received: by 2002:adf:df8f:: with SMTP id z15mr533884wrl.184.1583168481691; 
 Mon, 02 Mar 2020 09:01:21 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p10sm23628037wrx.81.2020.03.02.09.01.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 09:01:21 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCHv2 2/2] clk: meson: g12a: set cpub_clk flags to
 CLK_IS_CRITICAL
In-Reply-To: <20200302125310.742-3-linux.amoon@gmail.com>
References: <20200302125310.742-1-linux.amoon@gmail.com>
 <20200302125310.742-3-linux.amoon@gmail.com>
Date: Mon, 02 Mar 2020 18:01:20 +0100
Message-ID: <7hlfoir8rj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_090123_777975_8C8A4E7F 
X-CRM114-Status: GOOD (  21.49  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Anand Moon <linux.amoon@gmail.com> writes:

> On Odroid n2, cpub_clk is not geting enable, which lead the stalling
> at booting of the device,

First, how is the CPU_B clk related to the SD card issue described in
the cover letter?  I think this patch is attempting to fix something
unrelated to the SD card.  Please separate from this series (or describe
in detail how it's related to the SD card booting.)

Also, we're missing lots of details here to be able to help.  Are you
using the u-boot from hardkernel?  your own?  something else?  What's
the version?

Can you share logs (including u-boot logs) showing how your kernel is
booting and full kernel boot log (including the stalls.)

> updating flags to CLK_IS_CRITICAL which help enable all the parent for
> cpub_clk.

With current mainline, I've tested DVFS using CPUfreq on both clusters
on odroid-n2, and both clusters are booting, so I don't understand the
need for this patch.  

It's not related to your problem (I don't think) but for the regulators
used by each cluster, the PWM driver is needed, and there's a bug/race
in the probing of the PWM regulators used for CPU_B.  If you make the
PWM regulators, built-in this problem goes away for CPUfreq.

Just for kicks, can you build your kernel with CONFIG_PWM_MESON=y
(currently defaults to =n) and see if you have any better results with
booting.

And FYI, any use of CLK_IS_CRITICAL will be very highly scrutinized.
You will need detailed justification for adding this flag since it most
often is just masking some other bug.

Kevin

> Fixes: ffae8475b90c (clk: meson: g12a: add notifiers to handle cpu clock change);
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Previous changes
> 	fix the commit $subject and $message as previously I was
>         wrong on the my findings.
>         Added the Fixed tags to the commit.
>
> Following Neil's suggestion, I have prepared this patch.
> https://patchwork.kernel.org/patch/11177441/#22964889
> ---
>  drivers/clk/meson/g12a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d2760a021301..7237d08b4112 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -681,7 +681,7 @@ static struct clk_regmap g12b_cpub_clk = {
>  			&g12a_sys_pll.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  	},
>  };
>  
> -- 
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
