Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E877FC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 00:45:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A202A64D5D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 00:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A202A64D5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZuN89dxVW+FkfKn/oRHgFqCwpFzlkY98bCE5VaVx18s=; b=hW6JhNQdb7WolpZhjv/cDLHvj
	Pjb2+NUOCsigvPWasRLS8BKiMInKlyTLFfX1FH0VbnWdvGgTv5gJ1fxyNzLdi4+P3eMgMQoBJfKrx
	ckQahhyXcCeH0GaCDdjBXHWQIN34uklK9a1aqS0/xMIudmM8lyFpKGrZ+MSCBpdhgIXFXCNmLUZrG
	dUG5HmJQ0cobStyuCHM4Z66PaHjOkyUkDjwQ1jOdBtlVSx95+x4+4Fm6MoDF1ETfHNunZfGFsE/oT
	hU6FOKTMO/WEgzugSAQmhPrc+xFWQd7/6OikH6O9TOXIAtAlECLAE++Nw7PnP5l8y1KEo4ofQQVOe
	EuRRTK5tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6jp6-0007zZ-R8; Tue, 02 Feb 2021 00:45:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6jp1-0007yE-QB
 for linux-amlogic@lists.infradead.org; Tue, 02 Feb 2021 00:45:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id 7so18614192wrz.0
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Feb 2021 16:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=R+DY3ptemdPsgpSAemZqrrEiiEasrjy6FBc1qDbbWrQ=;
 b=ri3TxrY3TBgB5Os1sHmq9qfzzay/vdaPhoxzTjM++5ZA523vrpHMBJrtpD5enoS90v
 CGSfiEkmRgAfhDB4PgVGuENBVoRkwcp4qTrIv1p/4g5e5IW+k0j4NI23/onnkSW7Ua0u
 0sftY/scP6W4XDUs9YzbybR9eD/fS8yCvg1kO7a/T3MJYBiNWSgDYxNdZnuvBFuILfc4
 hvsZd2F10BTIKe+hW6hDLXO2d99UsNAFEjOg+fZnvpgsIYqe8bKW4+x11HOCubGHpIXg
 1aiDfYNrwm7y58ObjSv1gZ7D+GSknx39XPYEHXtgWM8eerR8AATNS1IbF7U1ohefdJXt
 HyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=R+DY3ptemdPsgpSAemZqrrEiiEasrjy6FBc1qDbbWrQ=;
 b=TYoqKikXTOAa67rQpmtYWMAKnYbgH6jq03p6UDeWC3Y4UcqNt8CoPcYVb+CX8wiom0
 Tfmh5ovJkdZJi98mL1V0gofcM2kWJkAILoG3mV/G0AQwJhrYuq3saZvbis5iINbrDWyi
 RI081ljXzEzmuejfuWkn0XPEibsbjKqpVc77ZP9+YXiKXUzgVofaxD6As7UmWchUjWyI
 LD9SxKYyOrwZh9Nag5U947fz0/8Nsi2ok4exTl8Wl0Ndu/F6sGH/S1U4DqHJkKDY2j7w
 eMcbcvPWIFHUTz+yUu1PXa4jBMiXWHE+m2Kx4ihOvCF/IqFTqouHyjzXIskjR/5QfPas
 qnOw==
X-Gm-Message-State: AOAM530cWOkN57j2DBQn/RRvs8syJOJygDSlMg4Of/tXms8O9qt90rTk
 ugPoLZgMCTHlfJbhUVNCE3WcAg==
X-Google-Smtp-Source: ABdhPJwxNXQTy/QE3Lo/F9xQFQNUvYrAvLBunGofChogGrJTK4i3z2o53P/m+m42LWzy7JdbSThXzg==
X-Received: by 2002:a5d:60c2:: with SMTP id x2mr21605432wrt.248.1612226733431; 
 Mon, 01 Feb 2021 16:45:33 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id s23sm849562wmc.35.2021.02.01.16.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 16:45:32 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Subject: Re: [PATCH] arm64: dts: meson-gx: remove wrong reserved BL31 memory
In-Reply-To: <20210130054022.2020338-1-art@khadas.com>
References: <20210130054022.2020338-1-art@khadas.com>
Date: Mon, 01 Feb 2021 16:45:30 -0800
Message-ID: <7hy2g7guvp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_194536_239502_D29038E8 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Artem Lapkin <email2tema@gmail.com> writes:

> Kernel boot fail on Khadas VIM1 VIM2 (meson GX) boards
> SOLUTION: just remove wrong mem reservation for 0x10000000 0x200000

You don't explain why it's wrong.

This region was added becasue there there are definitely GX devices which
have secure memory in this area, and this patch will break those devices.

>  ## Booting kernel from Legacy Image at 08080000 ...
>    Image Name:   kernel
>    Image Type:   AArch64 Linux Kernel Image (lzma compressed)
>    Data Size:    4657736 Bytes = 4.4 MiB
>    Load Address: 0f080000
>    Entry Point:  0f080000
>    Verifying Checksum ... OK
>  ## Flattened Device Tree blob at 08008000
>    Booting using the fdt blob at 0x8008000
>    Uncompressing Kernel Image
>  ERROR: reserving fdt memory region failed (addr=10000000 size=200000)
>    Loading Device Tree to 000000007bf23000, end 000000007bf2d3ce ... OK

I suspect if you change the load addresses used by u-boot to avoid this
region, you'll be able to boot just fine.

Kevin

>  Starting kernel ...
>
>  bl31 reboot reason: 0xd
>  bl31 reboot reason: 0x0
>  system cmd  1.
>
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 726b91d3a..71083b89d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -32,12 +32,6 @@ hwrom_reserved: hwrom@0 {
>  			no-map;
>  		};
>  
> -		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
> -		secmon_reserved: secmon@10000000 {
> -			reg = <0x0 0x10000000 0x0 0x200000>;
> -			no-map;
> -		};
> -
>  		/* Alternate 3 MiB reserved for ARM Trusted Firmware (BL31) */
>  		secmon_reserved_alt: secmon@5000000 {
>  			reg = <0x0 0x05000000 0x0 0x300000>;
> -- 
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
