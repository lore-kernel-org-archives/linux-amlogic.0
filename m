Return-Path: <SRS0=n1R+=FT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3EBC4361B
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Dec 2020 11:07:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4985C2224C
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Dec 2020 11:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4985C2224C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eG2WBhlkIo5h6GE+xK7noxpeIatQttcpjkYCqJlo6sA=; b=NFbU0J+NjS8rrZURHlxWs60Ev
	bqzq4KekPrn0nlIwSa83yzajwCGQ9jPmOiAJuu/0Z9VpqNrAF5/r6iyHLkMpbyu/hMfv8smQS38ZF
	VfGy6AqGep4tgcNOoNgijSgNBzemSclha6K6Aa8EBrgcKjrjjJFNJ9tDTYOyclD6NYDlDBoaCAPub
	uK238Akx/8mrEyOAHCLBfQJ5hLW1t0a8jRlwpMsnpOQLrF4K5wZgvfqEMcqiMrky2th6MxA3z6jcS
	WMLYo56Xo6SbupxPqNNFVqTsV/P0I2HqbpnJOU4Q+4o4tD9LH6qMcmIIYrxfCupRyapjE4CeWqIO3
	v/N3TIszg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp8Ad-0004K4-6K; Tue, 15 Dec 2020 11:07:07 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp8AZ-0004Iy-PY
 for linux-amlogic@lists.infradead.org; Tue, 15 Dec 2020 11:07:05 +0000
Received: by mail-ed1-x544.google.com with SMTP id p22so20507154edu.11
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Dec 2020 03:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=E/kGG23CuugXLZck5NSeBoHhv9wXgJjs6PBWPuEf4ek=;
 b=tjS84lj7A5dCdMOd8b8N0ew0ViF4pB9i7y1hJAIdGKDSDwcEOLN9Rx/EoNyCvU0VjS
 g1be2Ok5bTpnYvoKoQRGE7lqJHZ82XfjxQWCWGG0b1x8XpmrIEuTWOCclbrwM6SZwl11
 lFectPeRZ6/WENXtmTzG8eCEVmQv4s9JkIbg35sB1OkUbq2E+Waf4fjElvQL8bmwH8hu
 qcE/Mx1sVq1eki1/3NHb8ZjczkXl8rjaFfzxFTHcvQuj/uTPBtpzUo6vMi7WlaEf/0eE
 eEPeEKx4tKO4XbZbE+sA0OXxpzNdrUwNGRhQv2YnEms+5TTPXPxBC/0Hn+Yucujt6cyF
 7rZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=E/kGG23CuugXLZck5NSeBoHhv9wXgJjs6PBWPuEf4ek=;
 b=Ng7z61qlKNzVomgOIEKOik7YGH1ylxhQXuwn3RMDsIunXargdFfUVgPOYPxgBj9ffP
 xpOU7vVIUEyGPwBQaTIWU2gHPpXOrWyD5zdxkqE5/ru15+vatDujqIueMnptf291eoGW
 z5G13fW8PENV/L8WuNedC9HdIK6yNqK0pWSzZkhQcr7PVODtmviX5M+IBfo7nGV3nEVg
 MVpLxhlVJw909NFKmslcSQ1mZRod1C/KTud6DtSAXq2+Oa1fJXp8VLUI4iq0iXAH1zR9
 AaxuuxJ4zwTu7vLCMSkGjjFsdvVUW/NHOyeATUfJcgfXOUshkoDxzAtLBO+US+TamFTR
 pEVg==
X-Gm-Message-State: AOAM532ZyeG9tUKN2YOEgQWF7FWF72dg8ZLDo6fdp2MQDfGEgN7o7RDD
 uarkJR+ydQaHRYPIM1HMAuiZFQ==
X-Google-Smtp-Source: ABdhPJxodm7zMu059raAbyVPwN1yyu3J57f2oGupv5Nhnn7WQ0KXyvDt6Oa5wkgRHMZmWbh0hhjMHw==
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr28854817edk.377.1608030419495; 
 Tue, 15 Dec 2020 03:06:59 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id h16sm1096134eji.110.2020.12.15.03.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:06:58 -0800 (PST)
References: <20201207095346.26297-1-jbrunet@baylibre.com>
 <20201207095346.26297-3-jbrunet@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: vim3: enable hdmi audio loopback
In-reply-to: <20201207095346.26297-3-jbrunet@baylibre.com>
Message-ID: <1jr1nr1g6m.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 15 Dec 2020 12:06:57 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_060703_944580_FB02B8BB 
X-CRM114-Status: GOOD (  17.35  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 07 Dec 2020 at 10:53, Jerome Brunet <jbrunet@baylibre.com> wrote:

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
>  1 file changed, 37 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> index 12465c4becc7..4cf2c193d168 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> @@ -166,11 +166,16 @@ hdmi_connector_in: endpoint {
>  	sound {
>  		compatible = "amlogic,axg-sound-card";
>  		model = "G12B-KHADAS-VIM3";
> -		audio-aux-devs = <&tdmout_a>;
> +		audio-aux-devs = <&tdmin_a>, <&tdmout_a>;
>  		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>  				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
>  				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> -				"TDM_A Playback", "TDMOUT_A OUT";
> +				"TDM_A Playback", "TDMOUT_A OUT",
> +				"TDMIN_A IN 1", "TDM_A Capture",

Oops this is wrong

> +				"TDMIN_A IN 3", "TDM_A Loopback",

And this correct for the vim3 but not the vim3l ...
Please don't take this patch. Patch 1 can still be applied though.

> +				"TODDR_A IN 0", "TDMIN_A OUT",
> +				"TODDR_B IN 0", "TDMIN_A OUT",
> +				"TODDR_C IN 0", "TDMIN_A OUT";
>  
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
> @@ -193,8 +198,20 @@ dai-link-2 {
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
> @@ -209,7 +226,7 @@ codec {
>  		};
>  
>  		/* hdmi glue */
> -		dai-link-4 {
> +		dai-link-7 {
>  			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
>  
>  			codec {
> @@ -449,10 +466,26 @@ &tdmif_a {
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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
