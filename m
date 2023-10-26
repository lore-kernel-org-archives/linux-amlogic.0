Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAD2C25B48
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Oct 2023 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xa5ZvZjKcciwg33pi8ontnDcl4iycK8Io/nemBPW85M=; b=xFGXQA6/NL2cah
	PHIaBkT2RW6fKKt929kH/HiqY+gFOVViuugCr2C4p5xchmaDJyRa/Nm1sfBx7PBjxVm4wu4EMGTw8
	mTFClLBjr5OkMtxYQ+zUx70yN4CrG9G6jpAUCkWWv/H2sZJZ87MwNG54e94Rx2YzsimsVhofJ0p7N
	87CLCGw6DDL+hkcV50KTTrpzuQAtnh5MSXtVR5wSeE0rgYXDnupGpActWrgYhknk3rt+2UPu6LY5M
	VBie6O1ZWufWwSiQO9V4UH7BRRGadUcD2rSRV5DnZm2+2pJ9KOyQbKTFZc7VH6rjd3Kk3l5xxbea8
	Nli+5Of7QX/8pXY0ANDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwIu-00E2UP-2Q;
	Thu, 26 Oct 2023 09:05:24 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwIr-00E2T0-0Q
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Oct 2023 09:05:23 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507962561adso945177e87.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Oct 2023 02:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698311114; x=1698915914; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=2oJ1jlhG9oorUzXX4oCyrJv+zqn7eGeLFSxbQPDqXZA=;
        b=nhzux6E8QFED6tlt3/FtupeEYKpVNdCrXxgkF1hjiFr4eU9bCWDgp8ioUD/f2yDk0A
         qCEnKmLiNfem36CQB/dUr49E5dlQ9lF/pETvf1fSnftVtN9ySjV1r5gJJFLHNdnai1WA
         nSKd0PIPlLonf6kcHZ0JY38cnv4KxrZ8RHL7Lnz8HfL273iZgb8dezd7Wh5ECAPD4aQy
         ncgTFGZGQjkGiGbnYY2exJ8UQFWoD/0+Y++sQm1B3V3wtHKjAef21H+nlxnHsxW+gApX
         UIV9iXV7yj6SgmTyouXS8YKpps87ItmZCw3JXaJHQIQrP+a6hoFAeLHAiQlC4Hp4PToi
         bGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698311114; x=1698915914;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oJ1jlhG9oorUzXX4oCyrJv+zqn7eGeLFSxbQPDqXZA=;
        b=Nwmc6EZX/y4/jP7vxuA8fcCkjiLaKydiB1OSOEDJbCM2A18ldimq8BIy+nGzyUEgTS
         bxvdKsFvZfEi2PXqiHfKRem0+w635ey1hhSR9VUxrdaTDHdNt0xKtC/TTB3R1EEyflEe
         ieCLSg0S6vzBQiAMUPURd5iqrm5r2JzmL6KpAu9P+ZkPKm+frrlY3qwp7RpSp/3WnwvR
         sVNcb2LxxUY3BwcXg9bYvD8tSft6Z3+6sJeT8wo45C1n1pSdFEG7UN00Bx48Ha1uOkgz
         oAHlfi7ncubTvAFqvh8OcziOaRLG8r/0VU4dklhXBUGXqmOociCWhLDcDMnQsiKSGQQ7
         sTyQ==
X-Gm-Message-State: AOJu0YziZC5ZwITqwao4QbZZ0Nf2+k9wjnaJ97M7b6h8efCF4IzccT97
	j7tJ5rrT5TwDxZ9+KLvvEejPJQ==
X-Google-Smtp-Source: AGHT+IEcCo3MOL+v7ls4UAXtPy1Nexq4e+KJmgrR62ctOhHdOSO3Z3oUqSIP3cFHn7yVMZtyqgo36Q==
X-Received: by 2002:ac2:538b:0:b0:507:ae8b:a573 with SMTP id g11-20020ac2538b000000b00507ae8ba573mr12792622lfh.51.1698311113795;
        Thu, 26 Oct 2023 02:05:13 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d5c0:32f3:899b:123c])
        by smtp.gmail.com with ESMTPSA id az32-20020a05600c602000b004053e9276easm2005317wmb.32.2023.10.26.02.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 02:05:13 -0700 (PDT)
References: <20231026073156.2868310-1-rong.chen@amlogic.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Rong.Chen" <rong.chen@amlogic.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mmc: meson-gx: Remove setting of CMD_CFG_ERROR
Date: Thu, 26 Oct 2023 11:01:53 +0200
In-reply-to: <20231026073156.2868310-1-rong.chen@amlogic.com>
Message-ID: <1j34xx4uuv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_020521_166675_00CC6A07 
X-CRM114-Status: GOOD (  15.59  )
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


On Thu 26 Oct 2023 at 15:31, "Rong.Chen" <rong.chen@amlogic.com> wrote:

> From: Rong Chen <rong.chen@amlogic.com>
>
> For the t7 and older SoC families, the CMD_CFG_ERROR has no effect.
> Starting from SoC family C3, setting this bit without SG LINK data
> address will cause the controller to generate an IRQ and stop working.
>
> To fix it, don't set the bit CMD_CFG_ERROR anymore.
>
> Fixes: 18f92bc02f17 ("mmc: meson-gx: make sure the descriptor is stopped on errors")
> Signed-off-by: Rong Chen <rong.chen@amlogic.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 9837dab096e6..c7c067b9415a 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -801,7 +801,6 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  
>  	cmd_cfg |= FIELD_PREP(CMD_CFG_CMD_INDEX_MASK, cmd->opcode);
>  	cmd_cfg |= CMD_CFG_OWNER;  /* owned by CPU */
> -	cmd_cfg |= CMD_CFG_ERROR; /* stop in case of error */
>  
>  	meson_mmc_set_response_bits(cmd, &cmd_cfg);

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
