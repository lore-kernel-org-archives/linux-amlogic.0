Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473A7C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMbfRs1MErFQw2UoPQXMZOyzM6m+48mILtPpIAnCiMY=; b=EAKAo8JYx8tjRj
	rL5lT/7BO73ySTZ6PcGZsN05+r5L+wVZRQb39UwgT6TBTmzxlmMBMOheRTp3tqCpGtokTIl+E2owZ
	dLjb4YVbADq4Ke8JcGRvvGwUH6h28HlcJnYvPJ2c+URafeqQcaWpsc7lQgGNqWLLEaZ22t/BZmXhk
	jv7stBM8tp0eM0r4fR5TPE/OoSueoTrDDW8Vbos8bdrBv3IDGmN1X6Ba6BUcWtk2NgbfnfcPyr1vZ
	85u3NHMvX0QBGctRNlcmYmATn59M5TYWczjVKD3fyVun49Xb0W8hiCUIj1X/2s+WiDQqXrbRjnnlq
	svbmjzhDzcDxL18a7JXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD69u-00G96x-U6; Thu, 27 Jan 2022 14:53:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD69h-00G938-9l; Thu, 27 Jan 2022 14:53:46 +0000
Received: by mail-pj1-x1034.google.com with SMTP id q63so3195214pja.1;
 Thu, 27 Jan 2022 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+UlMpr+x/00nAZmm+usrq4TzMquXi1OLfmluG293i0c=;
 b=q5j6Tn6rmBCkDC8N+sqAa8+jOiF5qIusZbX/nfXnYut83R2UZQQgLKHIHzfuYYaBH8
 pa4n8robOaT87VJr1nt8265/IvV1M1bm+TU1qNt3ku4b3ivRqyXIh/TgRAynAytpTSUA
 fN6EJsoIuvAUs+T7I4SfT/JH6wt8++vembIX7nVslnpoGb/CaDdPIKoymZ5ccoSPWZ1g
 kZEwSPeRmw2ow1iX3z+3zSO6BwlGT5/xG4YK66H4mopcJA31oIlnAcJqLnjOVNx58dba
 ee1oYHVnBgw++IPc5irH1hMyVPt3SWzfIAZUWsn9PFHBJ9AkmznSTXOkhRUmrLWr7iQw
 X2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+UlMpr+x/00nAZmm+usrq4TzMquXi1OLfmluG293i0c=;
 b=Fu3dNWbyrGWTPeyk6rywufhEg3Z/V2ESCB+b094Y0A/4t8RI8rQhP4lDiPy2tHc3MK
 BWBlQdXtN/enVXNsf/aGwcjvaFh5d2T8n5gVJPRJGtX9VWUVzJbQJe25wArIx03vWpCK
 FDpR8BtQ3COzGQMesYTAdLkKUgLzOtRoz+nLN7AQXOt6O/htHx4nUtDVEtlPzcEsSFm9
 zsOJ+hYvWLJ4b6QRXuL8Ya1J+QovEChfhdh045weG2DjURWVHIMNec0HgTAmhCiSFANo
 /w0ZsnXuTmIIRjeO8DlTKaJJ1RK1RABz9GbKm7bK/SOIj3Kdm4/NvGANXukCiyFd3nJI
 NQbQ==
X-Gm-Message-State: AOAM5307fYfrRA3ZTRft+6Uv0LH/+Zv0pRhkDsDv60Xcw0VIpESMQ1j1
 EMeodL3mJJCHkL4WOJIkwz7U9W/h9EEruQ==
X-Google-Smtp-Source: ABdhPJzrC3NO4OBGtr5IwrF6ZXhjL7MqS+ZnIiSHtgMfbwYivamVnYOWYKOOwsJmX1LZoEsvQ8UgEw==
X-Received: by 2002:a17:90b:3447:: with SMTP id
 lj7mr4544092pjb.39.1643295224502; 
 Thu, 27 Jan 2022 06:53:44 -0800 (PST)
Received: from paju ([116.124.119.85])
 by smtp.gmail.com with ESMTPSA id y42sm5225308pfw.157.2022.01.27.06.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:53:44 -0800 (PST)
Date: Thu, 27 Jan 2022 23:53:38 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-sm1: fix wrong GPIO domain for GPIOE_2
Message-ID: <20220127145338.GB2417963@paju>
References: <YfKPSvnFKOaLr74+@anyang>
 <dcb67b4e-6a46-86a6-b21f-99263cc9ff05@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcb67b4e-6a46-86a6-b21f-99263cc9ff05@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_065345_372205_1F7F851D 
X-CRM114-Status: GOOD (  20.78  )
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

On Thu, Jan 27, 2022 at 02:00:11PM +0100, Neil Armstrong wrote:
> Hi,
> 
> On 27/01/2022 13:25, Dongjin Kim wrote:
> > GPIOE_2 is in AO domain and "<&gpio GPIOE_2 ...>" changes the state of
> > GPIOZ_14 connected to INTR of 'RTL8211F' on ODROID-HC and TF_PWR_EN of
> > 'FC8731' on BPI-M5
> > 
> > Fixes: 1f80a5cf74a6 ("arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator")
> > Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")
> > 
> > Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
> >  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi     | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> > index 212c6aa5a3b8..5751c48620ed 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> > @@ -123,7 +123,7 @@ vddio_c: regulator-vddio_c {
> >  		regulator-min-microvolt = <1800000>;
> >  		regulator-max-microvolt = <3300000>;
> >  
> > -		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
> > +		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
> >  		enable-active-high;
> >  		regulator-always-on;
> >  
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> > index bf29afac645f..d4349b355e4a 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> > @@ -52,7 +52,7 @@ tf_io: gpio-regulator-tf_io {
> >  		regulator-max-microvolt = <3300000>;
> >  		vin-supply = <&vcc_5v>;
> >  
> > -		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
> > +		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
> >  		enable-active-high;
> >  		regulator-always-on;
> >  
> > 
> Thanks for the fixes,
> can you send 2 patches fixing each files instead ?
> 
> Thanks,
> Neil

Sure.
By the way, I would drop a fix for 'meson-sm1-odroid.dtsi' since I found a
patch just now.
https://patchwork.kernel.org/project/linux-amlogic/patch/20220127130537.GA187347@odroid-VirtualBox/

Thanks,
Dongjin.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
