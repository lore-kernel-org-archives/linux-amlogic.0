Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F6BC4708E
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Jan 2023 20:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRNM2UYyVvcNTiJw79umc8PRcfh7wMMv2gVF9uPVz48=; b=NwAErAOdlbFx9pljowUYD5EbqH
	6tx4WDsBn4FkT4Zlg5QHxW93NwYzUjeTtFWL+0nUUQTvmNesxjN3oX5UN/kDxgDzNeCLuwoiF2Cwv
	teKX9kJ9cy16ueDeA8YYVBMEeMvoGr93/P5qPJLSRCQN2OS3rlDej8WC3knwPoIn06Mg0w1fWItOw
	vGpA/wFIW9up6pFbsHL1pnWHfWuz4BEzPgABGWPf7KcqQxoUO3bTmyl3dPfOgFt/bIRuhQE/oKOAg
	kJ/7Jsv+Olscw3lfGoZ9GbgAWgJuEN3gR3PyZUvyfvlLt4ICnjTTBUMDsouyVLxehSD5dUMLc4SeR
	ifEpvh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDX8V-00EjFL-8R; Thu, 05 Jan 2023 20:46:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUPS-00DBfM-7y
	for linux-amlogic@lists.infradead.org; Thu, 05 Jan 2023 17:52:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id ay40so28622510wmb.2
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Jan 2023 09:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ugr2yYVEUhL+xkEGPRO9/xBDZ9Vd+/x5fCQ9KXy3m2E=;
        b=vjrKb8gr1GNWhaEsR8vtdCuj+l4nmILb2jFYIjfNwldA22cPEziHxmn9t5kqBis9Mb
         6sRcvJTfcFTB5kI5IPjIakUDt5PEMbiu6ISxELHK78NkhOKwAksmHQsv2kedVQypR51X
         tUIP7bTyV5JKj0R9WEKCdnZ/86IR34jOZgjo9FMrfrLxsaHoBHhWVuCMlbmgLgRyBo/r
         f8eKbbBnq9MuEIlVHwyqGWK8R63+rLJvewGCfbHKNZ4HI4ecYZlD6DgWyrzJunKTMP5L
         fLUuPVFhw+v2hoM2Sqe2pk7K8P/epZAXQzHmEaLfH0T9+FsZ5f/7LIdwt9kT/69dQ1Gx
         YsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ugr2yYVEUhL+xkEGPRO9/xBDZ9Vd+/x5fCQ9KXy3m2E=;
        b=5Oj8D+guu++Rm4btM6MgaC9yf2WZBPDEBfSl/lXrNQDm0TvidZue39G8mg+kif4pBo
         2KsAIBsNasqE+FxK9bDWCbhVZy7HRwCOFxZC0tMjlC+jzLWWtypGs7B67WlidOywqAZZ
         N+Ka3tbk+opVb0U0v5E5xAkTRoFS16EKdiaK1ZF5g9sQsP+l2V9BuSamRFnHKulRncX1
         6fWc73RG8/cmOgOiNKXkBvQXpNbW7fLFv2IqOiEL1zVA5ZvMLnWjH3sP0b6fG9Afp8JR
         neafwcdBvpJkgFeHhih/LOIo3tguwCDTem4BSP7VyA38C0/rkE5NK5HlxBZbeAn56+6Y
         y54A==
X-Gm-Message-State: AFqh2ko3u2NX2/1js68Ck3fVPDixUUDPmkCw33E5MMANm1mYYwe3yLRG
	PLhhYH5yxDUm3v/FS5v+z59AAoyPd6OaofEY
X-Google-Smtp-Source: AMrXdXtefjBL135tyA/Oehot/lGv32IcBWL8OeOsnwIqPYi/ZQIFrgw0b7A0dsB9gPi1lYRzQrejng==
X-Received: by 2002:a05:600c:1c81:b0:3d1:e907:17cb with SMTP id k1-20020a05600c1c8100b003d1e90717cbmr37039812wms.1.1672941121805;
        Thu, 05 Jan 2023 09:52:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1e12:c16d:1898:607c? ([2a01:e0a:982:cbb0:1e12:c16d:1898:607c])
        by smtp.gmail.com with ESMTPSA id n14-20020a05600c3b8e00b003b49bd61b19sm3595941wms.15.2023.01.05.09.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:52:01 -0800 (PST)
Message-ID: <dfeff261-53cf-54b5-b3dd-dc0ce0d1e6a0@linaro.org>
Date: Thu, 5 Jan 2023 18:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] Revert "arm64: dts: meson-sm1-odroid-hc4: disable
 unused USB PHY0"
Content-Language: en-US
To: Pierre-Olivier Mercier <nemunaire@nemunai.re>,
 martin.blumenstingl@googlemail.com
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230104140608.28432-1-nemunaire@nemunai.re>
 <20230105120206.28964-1-nemunaire@nemunai.re>
Organization: Linaro Developer Services
In-Reply-To: <20230105120206.28964-1-nemunaire@nemunai.re>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_095210_330766_38D73F90 
X-CRM114-Status: GOOD (  13.25  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 05/01/2023 13:02, Pierre-Olivier Mercier wrote:
> This reverts commit 703e84d6615a4a95fb504c8f2e4c9426b86f3930.
> 
> USB device enumeration was not working on Odroid HC4 as both USB2 PHYs
> need to be enabled. This is inherited from the GLX USB design [1].
> 
> [1]: https://lore.kernel.org/all/20170814224542.18257-1-martin.blumenstingl@googlemail.com/T/
> 
> Signed-off-by: Pierre-Olivier Mercier <nemunaire@nemunai.re>
> ---
> v2:
>   - Fix commit log
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index e3486f60645a..a1f0c38ccadd 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -131,10 +131,6 @@ flash@0 {
>   };
>   
>   &usb {
> -	phys = <&usb2_phy1>;
> -	phy-names = "usb2-phy1";
> -};
> -
> -&usb2_phy0 {
> -	status = "disabled";
> +	phys = <&usb2_phy0>, <&usb2_phy1>;
> +	phy-names = "usb2-phy0", "usb2-phy1";
>   };

OK weird, this email doesn't appear on any mailing-lists archive, neither our replies !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
