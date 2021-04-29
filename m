Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032EEC433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:11:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FA8B60FE8
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FA8B60FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q7YefV+4euoaCAnj+pvHw0J/61IM+qmNsbw09qGRqOU=; b=BKH2FLQhHrrHAbwaQoCDXz02t
	JKClxNhHb/Yzzl9QAPQHOpDejyIie3qDMi3xVwOsR7NXAFe4MC+h0dlp7fCc5GWqqhVP9Ugc4qzId
	tGGXs2tE/oDzD7Ckj0Li332KmwfauUy6rORl4y2WXnjhWZoZtkMWvFfJDFrXOjtUcDud2cdIKz3ia
	U3zVH3ziat2v5C7et5+psVFx8eiN20S8a/0osifs6i2LD7BHOz5gvkGOra3zQ6hcHXPygse5PfLuX
	j8s5UZ9lNfl2e4faWHgudY0ncEYlowMu7oYKkUqWQAfmuEvOPH7IuNZTCDoGa70LUxXE0I/28nRbb
	JRJss7eaQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2hq-005Q2j-Qs; Thu, 29 Apr 2021 09:11:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2hp-005Q2c-7B
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 09:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=O+eVdTRCfCuqwWZ1A1ERDlsGqazfT8HhsrE+QM1WXMw=; b=TBQg3RVK3329TkS2w0DlvVPnCR
 IvPwjewEbbuHTAqtwtFfVPPONxgU4evmUwlZYvJ6P8gmyE15353AuIUpz6f7jjnH5RHl34dKx9uYW
 VNP2OoqqIsGmX5LQP9e0Ebxm92uh1oLAGC/vAj72/FZWqTOP59go13rubpVcaTBGcinZTIPwm/ZLk
 HhGpjJ1OTSDJ+auJGT0rU2XHDgPwb3bJYzptMTxjMxBy9/vWCbigArhcrc0ren+1vV3Ub55OeqriY
 kL5YQxAo0qtLRkaqmruFIjWWNbELO10keqPo/UacK9i3X1AAVxMDrlrUx3W53hzB4c8bWgSp/BFP/
 VVC0dVlw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2hm-000VwF-QC
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 09:11:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id n2so12897866wrm.0
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O+eVdTRCfCuqwWZ1A1ERDlsGqazfT8HhsrE+QM1WXMw=;
 b=SGRNGmZcelKkQMPndTgMCpvKt7Mi7S5M9k1PuMo5te3UagHs3j4vJZ6rBOW4JwoGu6
 eooXqCs8/8EXgVawS9B9jYxc8wZ7w/nppUC8CRqdEt+SBLJSOn1ab3K1FCzkK9WTUdnd
 NpImVrCvJ0w7IXtzNEZ3Ar+SUxQQEelE6PGSIDmhiVb9p3a/f8l5AmVJhfOeL+BKmujF
 iEfmQ3qNAeooDZl5OudcQH5CNBx90ysnin3c6acscLYCJ2H3MWjHEihxdbl9Z9E/iMw+
 I8tdmW5LycplqOxsOkKlJhhgxOP43G5h9rbVS9gvyhy+n7g1RX67gtiJJvnBGZ7YHaCP
 xRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=O+eVdTRCfCuqwWZ1A1ERDlsGqazfT8HhsrE+QM1WXMw=;
 b=uAu0mpX8x34FbnWeuq2+rgXUkkEqdNq12SyDEIdzEZQghDhQ0Ff+6iHSUurLbYPPv7
 gfefBEBUkDAKlG4QKAzco2VNObsSTTMFGo/AnWN+wn/b/PgxtiExIEoE49ifNriaQQo4
 2Bt6yg0WTr8nyk/vm2q94Okks/4QXRNXS7OMINSJM6rfd6yhgvdv2EALujGMgn8KULq3
 cFDhSDoOIDQVnMt8xBiTcc7KHWGEWgA7HNTywtE03q5wGAtEjVVkt/Ni60RIEsLczZkV
 EbbbAaC1ntQomd+qgHshOGk6yJayLufsNdnRmaKGHIOsoTAaaXc266oHQ4gjE0vz6Wzv
 JEUg==
X-Gm-Message-State: AOAM530uYNfvR7HnsNDdkmKDLHW21yisHrB8EN6MIiNiWZr4Y8hB4OUW
 S7dxClLvAT6JN2E7HMMsCrlREQ==
X-Google-Smtp-Source: ABdhPJzPFcT3Hp+/PTaRjf3DjVp/UmR1/VZWw9gfXFGmCskwcG4X6iE03lY3aAvI/2Zzqj1SN2HTcA==
X-Received: by 2002:a5d:525c:: with SMTP id k28mr25681566wrc.158.1619687488930; 
 Thu, 29 Apr 2021 02:11:28 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:c304:4b2b:4a79:1da9?
 ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
 by smtp.gmail.com with ESMTPSA id y14sm3678487wrs.64.2021.04.29.02.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 02:11:28 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: vim2: enable highspeed on wifi sdio
To: Art Nikpal <email2tema@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20210429085413.60368-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b5b797bb-852c-22ce-2b40-7f6dc0b37083@baylibre.com>
Date: Thu, 29 Apr 2021 11:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429085413.60368-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_021130_888720_2C2861FD 
X-CRM114-Status: GOOD (  15.71  )
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

Hi Art,

So you think you can test this patch to see if it breaks SDIO ?

Neil

On 29/04/2021 10:54, Jerome Brunet wrote:
> Enable highspeed mode for vim2 sdio. In theory, the vim2 SDIO bus is
> capable of handling SDR50 mode but this needs to thoroughly tested.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> index 18a4b7a6c5df..217f9d6d470e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> @@ -307,6 +307,7 @@ &sd_emmc_a {
>  	#size-cells = <0>;
>  
>  	bus-width = <4>;
> +	cap-sd-highspeed;
>  	max-frequency = <60000000>;
>  
>  	non-removable;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
