Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C65C54EBE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro0Na05+Q/gTMe5G/62q5KRmxJtP7NVg8AR8C5HswYU=; b=b3+lXdVqjRt8go71FgjiBJuLFE
	O6Ji/bbnus7uw42DI2WDYjueuBAjJh2lGRjqP2n4bQRyoNLsrtMVuLf+yPqU2zZTE4w4yEyYXt1KL
	O9rqAnHh0APJxXXtXwRePXhcex5uC4BtTrKrjJqd9utL3oZyLqN5v1hPeJFdt+6FmmglMNWetPP/o
	v6hgtJ7rPq+wXl4HFh5AyYEJcb0duZIKdlWmht489LBY/qrfEMKOB5h+Tg5qCmK44h+kfCF2gzhWf
	wQrxnQklbYPL8ev/lidGkU4avjHmw1jv5PGmQK/s/OE0fYjKfH1mQT0Q39WKZ7yXPAcc064v4G2iM
	wbfBstnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEy9-0013nm-QN; Fri, 13 Jan 2023 07:59:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGExw-0013gK-8j
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 07:59:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id h16so20257248wrz.12
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Jan 2023 23:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S/oMLkBOnD290qbrE6pzN9G/Hhm9cWR2pFL/k2bFlN8=;
        b=LiMtBVTrWqQDdf0LWuh6CnvRnV5rbASBr8yl4nNUo+2ISVCCUlH0jrgK5H529f5een
         HD7wulyHV/lKpHzXxx7elFDvSW5910gaRwIJs/dIvcGZ5cEVpS83fa2Q9xRp2MVuJFpM
         209RqqAdVpX5RPgCdR59hnPyAMo9f1g4uIoz2Uqv9HmBAWCo/i79agsi5LDEMEHPK+td
         Ii5X9eufXMZs+R4g3Y4SVoxMsAIDHa1dKvnRV3lNlCneS/HsZXRz3zq4ImXH7vTtz5qw
         vl9H9Msuxp3Z9E13DuPn0TqJIsT1iJBmuFHghGkczznAjbRAulNqzvlZW8CXXLWgdOck
         La4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/oMLkBOnD290qbrE6pzN9G/Hhm9cWR2pFL/k2bFlN8=;
        b=WiFalKKmrGxi4rG3Am3iWq3qDGQrMWNPT9UqOkxJ0LzhkqqB5Sfu2BOkKsMNSj6cp9
         +tHOjhLpuoQpwLGN1e2qAx1OiICcU7HoFDeVfzYJydGK4MrxU6QGG3+fsWVdlzKB3r+4
         q3F+EaT8gcYNf2eJs6E9ruZqYij2iAX4gpd5so8wGhtHzvtpN5JbUhUmW+fNphYa9HlG
         hC3QrvjTCCX+gehbEG7f75mQtO6g9BWVEfnq5Hjyr5J1CeLR5Vaa8uLzKUAcy8lf1g6T
         zMo+Go3D40sEvI5oAK4NNHOOGAIwyeUoBcbnFx5l/vDAygCio8Wn+jNANCvN+nFSNOFv
         IAVg==
X-Gm-Message-State: AFqh2krHOvojCSTqMGtRsqc0UT7YTA0H1eQWT3aRDD2l6UASVoLn9JU/
	D4smBuu3U91VNpx5Cyau5DLrMQ==
X-Google-Smtp-Source: AMrXdXvycYOuWc5AoUDUUKwrnceG8E6IB6hct+3EmAZQNyya2ff4ZzsmK045sFSZtKoRMFiFxs9M9g==
X-Received: by 2002:adf:eb4f:0:b0:242:659c:dc7 with SMTP id u15-20020adfeb4f000000b00242659c0dc7mr48215131wrn.61.1673596746159;
        Thu, 12 Jan 2023 23:59:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb? ([2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d678b000000b0029e1aa67fd2sm465978wru.115.2023.01.12.23.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 23:59:05 -0800 (PST)
Message-ID: <039f5898-03b6-84a4-28d7-b8434ad85a42@linaro.org>
Date: Fri, 13 Jan 2023 08:59:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 3/6] arm64: dts: meson-axg: jethub-j1xx: Fix MAC
 address node names
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
 <20230111211350.1461860-4-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230111211350.1461860-4-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_235908_332770_6469BC86 
X-CRM114-Status: GOOD (  13.84  )
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

On 11/01/2023 22:13, Martin Blumenstingl wrote:
> Node names should use hyphens instead of underscores to not cause
> warnings.
> 
> Fixes: 59ec069d5055 ("arm64: dts: meson-axg: add support for JetHub D1p (j110)")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> changes from v1 -> v2:
> - new patch
> 
>   .../boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi     | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
> index 5836b0030931..22fd43b5fd73 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
> @@ -168,15 +168,15 @@ sn: sn@32 {
>   		reg = <0x32 0x20>;
>   	};
>   
> -	eth_mac: eth_mac@0 {
> +	eth_mac: eth-mac@0 {
>   		reg = <0x0 0x6>;
>   	};
>   
> -	bt_mac: bt_mac@6 {
> +	bt_mac: bt-mac@6 {
>   		reg = <0x6 0x6>;
>   	};
>   
> -	wifi_mac: wifi_mac@c {
> +	wifi_mac: wifi-mac@c {
>   		reg = <0xc 0x6>;
>   	};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
