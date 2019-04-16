Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7714DC10F13
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 19:00:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ADAE20663
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 19:00:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TgJwzfh4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Mc8Agh+D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ADAE20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzep3pjgEFURhm8vhsH4TI+lKUf2vpF/TEdc9gpqC1k=; b=TgJwzfh455dMyN
	gT+dkdu1WfZgWbBl6aVyhC5ZeLPUIWEtFhesChZF2q0rvgSN8WaUBBTHH+VCAiPQwstEoV7413v9l
	PjoWB1t5VQ593L8Ea3PFkystDqU4qFVWXyWRXZLTePSsQHWHPb/91EZj8s1xwweG4UqXcojxxikAn
	Tyiu1JTE1xM1oR76jU0lzcoRIZe1AnyiEribb7/H1+LacArIi5w+OWm7Wp5L74bw1t6Ose1X+taP5
	Co5dQP2hsDLldlQSErwLbsCN5d+hTtYGxmnQoxb/dApx4jPiZwewr/4FRXsE7N2qODvAmvW9QcKIW
	Bk1JgOUkUphJfHJUfalw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGTK6-00035s-T9; Tue, 16 Apr 2019 19:00:50 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGTK4-00034u-2i
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 19:00:49 +0000
Received: by mail-pg1-x542.google.com with SMTP id k3so10781962pga.6
 for <linux-amlogic@lists.infradead.org>; Tue, 16 Apr 2019 12:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=0JQV48hIzZ/FzBbugyzkr1KYXifoUeGs64dn0ua1AFY=;
 b=Mc8Agh+Dm9E+fghpZBYHDgk6Myzm+xHK0tOOVqkcGEEjEYe4Np574RwN6hWCIQGFB6
 5fMKN46SCAUcgDSyRvRMBhYw4v4QQNI8U0zLjn+vJ/xfF+KFPAHtKMuFn6KuCy2dEYYr
 P0C9/uHz1iq1X0y4P0Cl67tFNL/KmT5ItfwVojBnpS72E5uts6Qz/E54Rm6bpAzY05Gg
 YW5xxEmYUSiW2+lS+rGgH9OgZxA8wq9bnBtGLGYyYQmS0d0+174olX2LwdKCCaLq2dCF
 AzHYJM01pYmeqJJcmntHdXoGq7AHEc9fc3rRNlmhT4rE6cCsnWNY+1wqsOb2vlsLppbR
 tn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=0JQV48hIzZ/FzBbugyzkr1KYXifoUeGs64dn0ua1AFY=;
 b=sAeF6SbV1io+68xbUeMHsahS5MmlwHe0eaqDA39KqTdS7kwvlHF2JwkTKdESv/coBH
 IDotvTwUFkR6/sMWgEBVhxVEUwj1OMUXW1pqahuRaW7hBPTvCHXkX3Ttzzj+kxQRt8pP
 3+rZhdwdZG4OFN52yCDWUu8EtbFMaa/EDZNJRyZ6tdQ2FSZVFaNg5CTN/p0N2w20Pg8c
 0uNM20Z4DggaHh2rAxw17k02+lx6trU0BtAxuPFMViBDb9diuxJL6MTWu/xBAyJzcvSO
 OTldrtJnQnCu13VfGSz8waGPpN02jTLEnHrNyFrnplTZKHsSlq/u500X3NMI3iMHPsha
 ft9Q==
X-Gm-Message-State: APjAAAUd5TfX5d4c1NCEJB2lvyd/5PcjNwg0mHuGCFhXl+PibHWj7/Lb
 mZCtflbWTu9nfd7VQlpOwZTZHQ==
X-Google-Smtp-Source: APXvYqyMIZV/2yavc4XgCJu06lF8stLgFI1H3u1IzwkYXPNXJnSgnx0sv0MG3fc3+pTilBRPu1P1fw==
X-Received: by 2002:a63:4616:: with SMTP id t22mr78875699pga.217.1555441247191; 
 Tue, 16 Apr 2019 12:00:47 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c45e:7ed8:c242:3563])
 by smtp.googlemail.com with ESMTPSA id
 q74sm97636432pfc.111.2019.04.16.12.00.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Apr 2019 12:00:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: meson8b: odroid-c1: prepare support for the
 RTC
In-Reply-To: <20190413163423.15149-4-martin.blumenstingl@googlemail.com>
References: <20190413163423.15149-1-martin.blumenstingl@googlemail.com>
 <20190413163423.15149-4-martin.blumenstingl@googlemail.com>
Date: Tue, 16 Apr 2019 12:00:45 -0700
Message-ID: <7hwojtojvm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_120048_123444_B15BB7A7 
X-CRM114-Status: GOOD (  11.29  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 jianxin.pan@amlogic.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ccaione@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The Odroid-C1 has the 32.768 kHz oscillator (X3 in the schematics) which
> is required for the RTC. A battery can be connected separately (to the
> BT1 header) - then the "rtc" node can be enabled manually. By default
> the RTC is disabled because the boards typically come without the RTC
> battery.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index 0157646e3a89..f3ad9397f670 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -124,6 +124,14 @@
>  		io-channels = <&saradc 8>;
>  	};
>  
> +	rtc32k_xtal: rtc32k-xtal-clk {
> +		/* X3 in the schematics */

Always nice to see the names from the schematics.

Thanks!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
