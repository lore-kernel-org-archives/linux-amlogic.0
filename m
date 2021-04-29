Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49088C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:10:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CEB061450
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CEB061450
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yZV5mVQW7f4gJTQaKR1HhRuFYCWmp+ZMuAKdHKKd5q4=; b=IY0zhfja0xaIKooFlNExiicJz
	E5xb3ntLgPmm31OST4TI6zX6RYridu7ypnaEfNToo+2X8FkL6uXZTQ3QP3QULAQyWlKzty976FCIU
	Yum8r+zIn+36tMPGmIQICmeU/UK0zJY/2mKkbeDVZRVlkveyB6zba1ulPEZQfgLZXRMuOH7bB3M2k
	RhMOwEYAkbC9prJJqB63aW4f0FKo/X57oqN2GAlfOgbnlVumsi5vemsNc6gfHxnL+6LEX3HP9RO2Y
	vBVSDlm8AFEwaHzJv22S2CgjvuBVFzmFteZIFPA6eliWl88rhDeXR5KUgNtxMSkd49u/tf0klhgX9
	0+3AHdJ5g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2gZ-005PxC-D7; Thu, 29 Apr 2021 09:10:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2gW-005Px0-W8
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 09:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=jjn7ofrdjd1TnkYur2KtlSXqsC+58JHrPfTq02YwB5M=; b=w2Ez39MH54BuAZoaeAhzYV7dia
 bVz9uaUGp6HlhJOIjjel+ygV6jfGayXrl8ZxQGljuHw+P/wieb+xxbC3sHwPqQyXrZpZHoIIBphNG
 dMFtYYNbZo+bwVll9dNCo4Ju1OV3w/k2Sn+UDX9muGBiL5tvDecQVWL9Dt/maNTXGxIZK2+S1h/Of
 3wil1ch+UG9hoRZHgrCkdqZDvao4JwZTc/cZxgQiAJnntwmSqFtk6PQX8AOCStdWrUQoRikwntR/j
 QQ43TEba4z04JvmnkCZOXegRwyx83YYU4gzV0JeSUe71AhihrWH8SIMNI1NtSMZMQhAvLM0EUHdzl
 JCMJuDjw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2gT-000Vs1-Im
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 09:10:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id k14so16132212wrv.5
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 02:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jjn7ofrdjd1TnkYur2KtlSXqsC+58JHrPfTq02YwB5M=;
 b=su4cjFGi5+kn1HkDFEXCytoV9WXF2o51AZFXnN7J60XFatV7b0G480EAPDFoa0ljdx
 GTni/HiMLYx7p2q1HaVPXlCusW4oCh55p7p12ftlg5UYiGVDQT18qAtTvXMZ2GUzgpCD
 mTZOJK0F5SVWygJYXiaqq08TEGzcFpfDtDKsHj3dv8GqxV/wCT0dc6GpxXzSGKR+DvI0
 cXL3KNBzoMgVlOs7VcNqJF7xtBsxT2biXRH0fE10HAl3P0CPiAJuJbOjmAO9cTWJQOFZ
 gK70joRmwtU5UKgtSJ9QHPJ6HVi3rdTU3iL0kFGzt20ocp2nZtTA1GfOAVRcfO9GDcBF
 b+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jjn7ofrdjd1TnkYur2KtlSXqsC+58JHrPfTq02YwB5M=;
 b=ODq7W/7kDwmi9tYFsoub+xT1RjiiQM+s+iaGvb3jnUrEYiNH04KdL0ZCXsiHU9cUuJ
 bIeOXn2NOiCiEseeGovYosQ7fe86JmaHXoKGNEScvaBr8ddxDcB9FUbv7vqVaBiOvSgw
 +aRHLCciiaag7WeE01XHpngbzXoAEt7TyCMJkijKDqGi86dWl51OTjeqVVbm1fTyWb0E
 8wia48yIDwzT0nnXLLyvpMgb5HHQQ8oVQHLMw63z+NjF1vFx1DISKyz56+K+h8GVAiAD
 FNyGbVjxMQGUsEQE84byZaDclm3YlhyZBW/0SbzzSvtsH+h/rJDgrnL/TM337Mj6tQph
 0NxQ==
X-Gm-Message-State: AOAM531OA1FrBzYQvDaXPgbLa2jdsag/6vdwO5gyIQCSlFl7SELe/2rU
 c206+lYmdzDouKKr5AdEsRAQ73cs6dxiGY42
X-Google-Smtp-Source: ABdhPJxxe5ErG/v5x7LmLALpFiu8uZN2sGOtEQkXtdLvfxipLv3O+0/hat2t8+GWnA/F4dBqzzS54A==
X-Received: by 2002:a5d:568f:: with SMTP id f15mr42616599wrv.346.1619687402526; 
 Thu, 29 Apr 2021 02:10:02 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:c304:4b2b:4a79:1da9?
 ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
 by smtp.gmail.com with ESMTPSA id a15sm4582835wrx.9.2021.04.29.02.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 02:10:01 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: vim3: enable hdmi audio loopback
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20210429084253.59692-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3f85bc7a-aebc-cac6-11f9-5e18528c5e7f@baylibre.com>
Date: Thu, 29 Apr 2021 11:10:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429084253.59692-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_021009_658984_C68CB0C2 
X-CRM114-Status: GOOD (  20.46  )
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

On 29/04/2021 10:42, Jerome Brunet wrote:
> Enable audio capture frontends and a tdm decoder.
> This makes it possible to loopback the audio played on the hdmi codec,
> which is the only output interface at the moment.
> 
> Of course, one TODDR device would be enough to do that but since
> the 3 FRDDRs are enabled on the playback side, let's do the same on the
> capture side.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 41 +++++++++++++++++--
>  .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 13 ++++++
>  2 files changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> index 66d67524b031..3cf4ecb6d52e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> @@ -171,11 +171,16 @@ hdmi_connector_in: endpoint {
>  	sound {
>  		compatible = "amlogic,axg-sound-card";
>  		model = "KHADAS-VIM3";
> -		audio-aux-devs = <&tdmout_a>;
> +		audio-aux-devs = <&tdmin_a>, <&tdmout_a>;
>  		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>  				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
>  				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> -				"TDM_A Playback", "TDMOUT_A OUT";
> +				"TDM_A Playback", "TDMOUT_A OUT",
> +				"TDMIN_A IN 0", "TDM_A Capture",
> +				"TDMIN_A IN 3", "TDM_A Loopback",
> +				"TODDR_A IN 0", "TDMIN_A OUT",
> +				"TODDR_B IN 0", "TDMIN_A OUT",
> +				"TODDR_C IN 0", "TDMIN_A OUT";
>  
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
> @@ -198,8 +203,20 @@ dai-link-2 {
>  			sound-dai = <&frddr_c>;
>  		};
>  
> -		/* 8ch hdmi interface */
>  		dai-link-3 {
> +			sound-dai = <&toddr_a>;
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&toddr_b>;
> +		};
> +
> +		dai-link-5 {
> +			sound-dai = <&toddr_c>;
> +		};
> +
> +		/* 8ch hdmi interface */
> +		dai-link-6 {
>  			sound-dai = <&tdmif_a>;
>  			dai-format = "i2s";
>  			dai-tdm-slot-tx-mask-0 = <1 1>;
> @@ -214,7 +231,7 @@ codec {
>  		};
>  
>  		/* hdmi glue */
> -		dai-link-4 {
> +		dai-link-7 {
>  			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
>  
>  			codec {
> @@ -454,10 +471,26 @@ &tdmif_a {
>  	status = "okay";
>  };
>  
> +&tdmin_a {
> +	status = "okay";
> +};
> +
>  &tdmout_a {
>  	status = "okay";
>  };
>  
> +&toddr_a {
> +	status = "okay";
> +};
> +
> +&toddr_b {
> +	status = "okay";
> +};
> +
> +&toddr_c {
> +	status = "okay";
> +};
> +
>  &tohdmitx {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> index 06de0b1ce726..f2c098143594 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> @@ -32,6 +32,19 @@ vddcpu: regulator-vddcpu {
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> +
> +	sound {
> +		model = "G12B-KHADAS-VIM3L";
> +		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
> +				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
> +				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> +				"TDM_A Playback", "TDMOUT_A OUT",
> +				"TDMIN_A IN 0", "TDM_A Capture",
> +				"TDMIN_A IN 13", "TDM_A Loopback",
> +				"TODDR_A IN 0", "TDMIN_A OUT",
> +				"TODDR_B IN 0", "TDMIN_A OUT",
> +				"TODDR_C IN 0", "TDMIN_A OUT";
> +	};
>  };
>  
>  &cpu0 {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
