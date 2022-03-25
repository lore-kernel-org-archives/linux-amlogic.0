Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567DCC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 17:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9x54S5FBW9Gm2JK8/OriiMPJVj1lfZ6VunSaFYX7bMg=; b=r0wamalmiz4OTS
	FU5nKW4/bNH49eHH7UmwGKJFYPqZapzFHupUEJkA0X0Fc9vZMstt6hmenMpLpBioAHtfHLjsao/bJ
	hFMpdssLtplePR7jDKPdKDLtsTms/ulV+W39/lGOwY2hYQSSQFszHIBs5U2pc4y0dHtoQYz/Mj80W
	JyoHPZYsx9fK4Hy2JJ41UZxJUP51RTW59mFE90QsAKnp0SR1DifBLkHs6x8CcVWGYyzMrrrAHHyew
	GvDVAq3NqkpJca4rG/B4zcumyRke1xHWvlL4euYV+9U0APqGfvtzb4IFW4dAtcEPGHx2LdHdikrV5
	WmJYGaJBufo7Tiu+cC/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnt6-002rkk-K9; Fri, 25 Mar 2022 17:38:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXno8-002pmk-Ca
 for linux-amlogic@lists.infradead.org; Fri, 25 Mar 2022 17:33:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id a1so11797071wrh.10
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Mar 2022 10:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SrJbbfaddWfhMen20qeE+m66y7c5UtFQj6CzeAj6OjI=;
 b=pAIGj8V93uiAJjTlmDfKIrNSPI5B0Swb21IxwxtA2OT1fWA9xoWtkiYuFGd2YtrLzY
 EjVkBD6B6OmrGKVrwniwjA1oOEDGBS2ZdjYabLeHtK2EfbWaVmShnewTbHkTHXrSSYL+
 zsslkO+p6tDLQHUkKUSIEvBJmfH8l56kmYFnCYL+37Ra2wHkcGueG3Y1B2ViljRc+EuM
 LrWrAcCel0AEqINM6IG63ovAPuQyRjmPzK5ZvYVhbdJ8sD2TPyL0OQZO3Ub+DCq6kmvZ
 RY6L2ECQHMrKu293svlvJKkVFag++e46e2Y2UXlaiZ+38x9wz6VkDlGmuYNZuRiOv7Jz
 +kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SrJbbfaddWfhMen20qeE+m66y7c5UtFQj6CzeAj6OjI=;
 b=xXhN1FI1SAMNT7exbn3qauY2klrhIodCdzmdXBpa+4MlTZ2688FG+LK2YSFlocAyVe
 6e01ArMvbGil3qE0hgBMV85bT3YJheD/JRkeMuEJUapkWm2TRB1dz4gIEEcXOrmxSy/m
 T4fFMYqWl+4rAxuOyymdsesB5BpgXJ79a4F2uUIQhbdRr2PyhOudxJe1PNXYvPczAyiD
 g/o9BLrAu3m70SfCG1LgPX18ECOiejtVsEVVG4lDilXGia1YSyFDOpfg3RUjCejUbVMI
 EQPYEhMX682bgONYt2zUWP8Z0QtUFkx9FnK7AWe9TgJcaYvnzapj36JLHLMCtsPGQB9h
 /lXA==
X-Gm-Message-State: AOAM53257rJaCblWbw97aXRtYQpgirkVhQ6oX/Ig5bMsqXhy0DnqBswX
 AM4HMMyYwhZSMsjBQP7UOaxTHg==
X-Google-Smtp-Source: ABdhPJwUgBLSDvNV1NlBzs98fMN9ijZv4koUdOJmoiCaJvLygneQGawLQNsV+XEZue+1J6bM2ic1iw==
X-Received: by 2002:a05:6000:1a8d:b0:204:39fa:d21c with SMTP id
 f13-20020a0560001a8d00b0020439fad21cmr9858181wry.9.1648229580850; 
 Fri, 25 Mar 2022 10:33:00 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d3b0:47bd:8485:31cd?
 ([2001:861:44c0:66c0:d3b0:47bd:8485:31cd])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c26cb00b0037ff53511f2sm8544986wmv.31.2022.03.25.10.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 10:33:00 -0700 (PDT)
Message-ID: <e32a02a0-1f09-3038-81cb-54c632329dfa@baylibre.com>
Date: Fri, 25 Mar 2022 18:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] arm64: meson: add dts bluetooth node for JetHub H1
Content-Language: en-US
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Vyacheslav Bocharov <devel@lexina.in>
References: <20220325165501.81551-1-adeep@lexina.in>
 <20220325165501.81551-2-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220325165501.81551-2-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_103304_449000_938EC68D 
X-CRM114-Status: GOOD (  13.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 25/03/2022 17:54, Vyacheslav Bocharov wrote:
> From: Vyacheslav Bocharov <devel@lexina.in>
> 
> Add bluetooth node for RTL8822CS uart to JetHub H1 dts file.
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>   .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts  | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> index 6eafb908695f..a5ee7ed17efa 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> @@ -213,6 +213,11 @@ &uart_A {
>   	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
>   	pinctrl-names = "default";
>   	uart-has-rtscts;

Please add a blank here to match other DT files.

> +	bluetooth {
> +		compatible = "realtek,rtl8822cs-bt";
> +		enable-gpios  = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		host-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
> +       };
>   };
>   
>   &uart_C {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
