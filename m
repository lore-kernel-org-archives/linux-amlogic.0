Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A66C2D0BF
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 10:17:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 107112053B
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 10:17:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LnnMMbWs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fcSvCZuD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 107112053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l2Lav+ab089Bxy3QsafGo8duVJg4ruryd6St07voBaY=; b=LnnMMbWs3rhrpx4YKLcD+csdze
	85qknx+LJIEsXx1bL0FLcSRF0PnzhsSMyQuKGyPK67SWLv9Sz4VRevfTyEfzjkjYEC4BM0ANOrG4e
	t2LaHtZ0REvnmokoKdKCW3MOylU8Wzyl2nmI+JXUj5Wdf64MOGnYASQ+CmRF7Bb+odkokZflBSkqG
	OhVAKbE3Q6y2RKdlpK+0up1JJURsTZMaAT0b1C9Iv/F1HltTFNJqMh3ITUDdUBVVI7j5R4EMkecHu
	dqXipI65d5AWMtmBcmUxMFVrg4Pw+DXXOD0iWsi20EyiPM2fUDTPuTPvOg7R7i0zgGMDBAh3GXMB2
	i9j1kEpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieca4-00005f-Cb; Tue, 10 Dec 2019 10:17:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieca0-0008Vj-O8
 for linux-amlogic@lists.infradead.org; Tue, 10 Dec 2019 10:17:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id p9so2486857wmc.2
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Dec 2019 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=xmLlcTghzPFIQ8mfUoSKx274MOGK7c0q1BOLA3zin5c=;
 b=fcSvCZuDu/jCInvDVS5idg2zFC+JxUezgWsEzS5YwYFM1JFAhzC92Nm24kZZOmk094
 RfkjjBX4Tl7pVGKiTXkb6ZXjC8C5cdJ/xvvMdZu5xSlYUlCaPYcv4skpDFMDdUy6wKkE
 j81+cogTRKJl+jY4iIEWkAoeVhuzbSa1Sg3rYZ2J/NAC82qC8k4qMSaQ9SRIMQ1Xs9VM
 XIeopc2OHN73WVTc7bcO1iL6c8KxgROgkxyPTdf8WVQ+OZrbg/S39bH4Efd6uV/iI781
 OYm3bzPYAf5N4zJXWgkloQEMKq6WKNRc1Jp54ueSiHCXeH4J9ka0xLNn64pC13mRi3qz
 2oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=xmLlcTghzPFIQ8mfUoSKx274MOGK7c0q1BOLA3zin5c=;
 b=B8KGetqyRnTn7xE/5aKtMF6ZLG5u7wlCmGOWwo7pI6pIPXTKHsOuKmVCkAJm0bmGsG
 zueHwCWxniTmT90kv+SqFZFvZnB1CLbvptQbWRX/qOYDYCDR5BchzN8EjsgUxzOTqZvd
 otNI5gXZguWeTf9el9IO405jD0Y4LV/idAg436LBvXPyZjpovBbat5tZkA45EnUts/w0
 ShTxTuIn4sdLR2x3hMZO61wyRLKI7AQat5n3Bxyw9ioC9VfH2i5ENVvr1j+kDlciPoJi
 SipWQ3CmlYtSvXU7s9pLfo+pLIt1Fhpg6/xSeTVAZgciSuPuN99xDVBp2fz0UKSvFqmb
 Jyqw==
X-Gm-Message-State: APjAAAX4MHFB3gHzNlI4Ku31GEpH00jo3QSVN5YYgtgFiCV5wSYi7KQH
 0adLroCjuxUqA5ZtzTDVa2qlZw==
X-Google-Smtp-Source: APXvYqwVnyN4tOCPyX/fALkBBhtIPe2HLM6zr6GYhucBkFtEKMV/e/35eKhQlSa5MVPgf6uQKl+RIQ==
X-Received: by 2002:a05:600c:507:: with SMTP id
 i7mr4398123wmc.135.1575973037693; 
 Tue, 10 Dec 2019 02:17:17 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm2697067wrw.76.2019.12.10.02.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 02:17:17 -0800 (PST)
References: <20191202111253.94872-1-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-a1: add I2C nodes
In-reply-to: <20191202111253.94872-1-jian.hu@amlogic.com>
Date: Tue, 10 Dec 2019 11:17:16 +0100
Message-ID: <1j8snkh4cz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_021720_799597_58C0D938 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 02 Dec 2019 at 12:12, Jian Hu <jian.hu@amlogic.com> wrote:

> There are four I2C controllers in A1 series,
> Share the same comptible with AXG.The I2C nodes
> depend on pinmux and clock controller.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index eab2ecd36aa8..d0a73d953f5e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -16,6 +16,13 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +	};
> +

I wonder if assigning i2c bus alias in the SoC dtsi is such a good idea.

Such aliases are usually assigned as needed by each board design:
meson-a1-ad401.dts in your case.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
