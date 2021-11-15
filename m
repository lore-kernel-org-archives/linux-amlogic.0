Return-Path: <SRS0=1Oxc=QC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B97C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 09:53:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 444D3615E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 444D3615E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=p++afbJ5gw4kdFDdCcBrBhWILr3Pc5FroZXSfCR2q8Y=; b=y/nWDTs58M1YJd/Y2WpWVFQv9w
	FXFjA08UKQdhG8rNqCsAjW/PSt2kFQDri6QkhSWUyc0B7OzNfIgaEnkeNR9TGu5o+s3IbDValGfjf
	Urz1+/57ECSynqNQRivH5IwmTB7VtTl5bD5nE6uuUHPUX+9je/g3PR9Pr1NXgSDobay44++AatapP
	1OLVAZ9nCniyJcn3aJ4Ml8Gl+bOLRGsGXle2rwPxCjo04+5Oc80jqKyzmSi8RVRmGxMr8/ykpgR3Y
	GnseAuz9gVHkdwDLGBgSNraWxWUvDVe8yzQLpGOOOwaIbRgzeToc9qmlPGXiSrqSr3mB9JubDvN2s
	HwGoX4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYfe-00F1Wo-SG; Mon, 15 Nov 2021 09:53:02 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYEH-00EuZ3-Mv
 for linux-amlogic@lists.infradead.org; Mon, 15 Nov 2021 09:24:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id d5so29292285wrc.1
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Nov 2021 01:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7YV6XXg8h8hJhDgn/7ARhXJWKWuxziOFXex2XBPVdnA=;
 b=D/CAVXjzTScTjviy18Ml468lD008OZsgJwfASTRCSEfDh/y8GWN5v9BMFSNzBwuaF9
 EooA9ydGblJ8rK30zdQ/b3Mo+MTGZ3B62X1j4CTIpqBjWFWuhTo+6DgoFJ1+7IjSc2VP
 o6qGFlHEtTo85Wilj/JXwMUj1sLRonSzkQ0fhteR9fBd9Bu9W1aXJzpwC9BDGi61HbYn
 BE+0ZCQMlVkeINO54sPy7tkWnRlvPZIR/z0h0pJ77KgK0kqmIbzZy8l/uRQEcsLDK02Y
 0/K8GnWcAT6zSxv1+3BLlpbQllPqaLtSK0WzhnYn2/XVKFrTs0f5ekwNP6eYOjz+tc1h
 ILXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7YV6XXg8h8hJhDgn/7ARhXJWKWuxziOFXex2XBPVdnA=;
 b=kbjtPGLNiHqpPg8fBx0l1lJAfRnyROPLUwlaQIgHeMi/2vX3E7ODg+wkajjTdGAtGJ
 mTxr5UE4bzs8RmIpcATyQM3F+ZTOQ17bwJnWsmmPt8vq71vSsI7Qyb3/RytFFGVtsGtr
 LOcR1he2DAsVcUF6mNw6NFoSNYQf2gOqNVicPYvnqQZYOVhQSGluoknDHMPNZA4Q/KcZ
 R/BF2b4zJJbv64Dj8Rc2SZ7aKOb6l55fWT4P2zEo0GXABgehwQ/lUqfR99kgAPurI42m
 qE6KQZLTRA8AFpKWWruteu0JD9Y4M/UPvChRRr3saMxOJ9XBIsBDprHBLJjNv6rpOItp
 s2JA==
X-Gm-Message-State: AOAM530qDZTEhnF4iS9ZmNqof5YEF3EVaVJwA3ivKsCaxUGkookQAH0s
 RTmAVj1AmA6EK88v8f6Hxz4U7XnD4dNIZWa3
X-Google-Smtp-Source: ABdhPJx3QrHD/y228kMTNLG7embXZAa6H6Op9TithBAqUOw10x78H3OU9ZhjpbcZy9j8usfkkpSmWQ==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr43771146wrs.272.1636968284000; 
 Mon, 15 Nov 2021 01:24:44 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:f56f:2409:301:93ad?
 ([2001:861:44c0:66c0:f56f:2409:301:93ad])
 by smtp.gmail.com with ESMTPSA id p12sm13871922wro.33.2021.11.15.01.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 01:24:43 -0800 (PST)
Subject: Re: [PATCH 1/3] arm64: dts: meson-gxbb-wetek: fix HDMI in early boot
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211012052522.30873-1-christianshewitt@gmail.com>
 <20211012052522.30873-2-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <d9f6ec32-63eb-b19c-867f-1cd9b54bb0e3@baylibre.com>
Date: Mon, 15 Nov 2021 10:24:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012052522.30873-2-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012445_779801_AFF61E66 
X-CRM114-Status: GOOD (  17.42  )
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

On 12/10/2021 07:25, Christian Hewitt wrote:
> Mark the VDDIO_AO18 regulator always-on and set hdmi-supply for the hdmi_tx
> node to ensure HDMI is powered in the early stages of boot.
> 
> Fixes: fb72c03e0e32 ("ARM64: dts: meson-gxbb-wetek: add a wetek specific dtsi to cleanup hub and play2")
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
> index a350fee1264d..8e2af986ceba 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
> @@ -64,6 +64,7 @@
>  		regulator-name = "VDDIO_AO18";
>  		regulator-min-microvolt = <1800000>;
>  		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
>  	};
>  
>  	vcc_3v3: regulator-vcc_3v3 {
> @@ -161,6 +162,7 @@
>  	status = "okay";
>  	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
>  	pinctrl-names = "default";
> +	hdmi-supply = <&vddio_ao18>;
>  };
>  
>  &hdmi_tx_tmds_port {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
