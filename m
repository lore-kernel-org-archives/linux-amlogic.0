Return-Path: <SRS0=yw6d=O4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BC2C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Oct 2021 13:30:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7478B60F9C
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Oct 2021 13:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7478B60F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hoXo54qEwaM6eVba1Q4w6TBHM0Ip4dyL2S9SnAhKTw0=; b=eUMHusLzXQbU1Q0/6Sgmsapiyt
	FnDvrYSEfgDkTkW3c2sWcd8mCUzh35Hs6YDCP9N85OgXQjkTJriyAJhOZWOzCHm8ug0R2bsvPMErw
	urpNmbnYwz/gFRLiH5FADWS2vgNuXBnjxKSHjXN6utUohnYTGbxYZOoaP3QSb9otqVMSOEZtkD2bP
	GhhYNhChkkQp9g4p/Dqp/m2ElBQs+aNpKCD8BfbCjbEissdYkC96/bRTR7ZFaGR+t9PoIKnYRpdbQ
	v3vcLZiVaavc4gjG1vAgaCQy6FxtfHZISZyGpDVfh8Oaf/XgQM9KbQhBdR49+wbsI0AzW7zAldMlm
	XFJuBCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYpx7-002tMx-GJ; Fri, 08 Oct 2021 13:30:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYpx3-002tKg-FX
 for linux-amlogic@lists.infradead.org; Fri, 08 Oct 2021 13:30:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id i12so17281929wrb.7
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Oct 2021 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eWnofJKTw3p+IAgBaEr8PkiopgGt7liFG5ipUcC8kn0=;
 b=XCP8wRM6WC6kWj4jqeiaBCPCZSYH6Y5FZpO45POxcDTWC6P0OQ3mnNDnxwDmwDGeEk
 qGKo5+NoJBzO6LZZhguLhDRWmr2N9J3pb1LvGC8IafUaNZsYhB4HCvZXedPni4KxuduP
 vz1DtCN4xeSjS72cO5w1dNp5NBc3WporCMrUjYqOP/x/4p1fTH6q7CHJ6sx95To914FQ
 koeINiwhOTAIAh6GfqJN21qeMUdXODvz+FRNW4mgBpwni3ATu5K/0Sbai430GgVhSY94
 YfQG0wqsmgsf4dZnDxec2KSNp8tkabS6NFaX3lf0nYyct4OuCJsH5/oZBFkUygxJP3se
 1E7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eWnofJKTw3p+IAgBaEr8PkiopgGt7liFG5ipUcC8kn0=;
 b=ytF7l39Y6EOt00QKsq+HkRpsN4yu4yNfkCOPQTwZ3g2ERCJnEjQQyxP4i9VLRFWdpq
 Jfa7qy02RkvCNjC0TXUa17oz385A2mAKcvFfXlYe0VF9e7m68Fy66ja59eNf1MHQWiFU
 1zQd7yW5v88OmCHxeFvksF/ODp/r3uLqHRMUp8EbV1dGSbrWCLgqDf89G+ph8JzlsHJo
 SIKaf3FlYa4O2a1FPI3etpStKf2PB5r4LNhMKfOmD+B9J5joa50VwCBJG3029oiBLLuM
 6pnUb6fQGNpIuiUUsJ/ZC+WqK2gP1yVwG2bvii7GiCP64IlWFO7a8uL0Qnayd4WHEhEd
 3U5g==
X-Gm-Message-State: AOAM532fea+XNZQ+73tfD9hOcPIU46G1+liMNB7VrW0W3Ym2obVE7AKo
 BA0suyFrsb5N9yh5zxNKFfUlKA==
X-Google-Smtp-Source: ABdhPJzIjKNZ1rSMhSEcxRkODlks31QNmegAmTud3n4Eu4NCeT3rFGTI37iSKmKut3kHkHoDEmtfvQ==
X-Received: by 2002:a5d:5250:: with SMTP id k16mr4231026wrc.82.1633699814521; 
 Fri, 08 Oct 2021 06:30:14 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:a3ab:352d:6c22:15bc?
 ([2001:861:44c0:66c0:a3ab:352d:6c22:15bc])
 by smtp.gmail.com with ESMTPSA id 143sm12479484wma.37.2021.10.08.06.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 06:30:14 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson-sm1-odroid: add cec nodes
To: Dmitry Shmidt <dimitrysh@google.com>, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211007180130.805401-1-dimitrysh@google.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <34f1111e-a5f0-b04e-f8cf-f015d729d236@baylibre.com>
Date: Fri, 8 Oct 2021 15:30:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007180130.805401-1-dimitrysh@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_063017_629589_E3DC7A38 
X-CRM114-Status: GOOD (  14.40  )
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

Hi,

On 07/10/2021 20:01, Dmitry Shmidt wrote:
> Enable CEC in same way it is done for other meson odroid devices
> 
> Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index fd0ad85c165b..7eed4849233d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -225,6 +225,20 @@ &arb {
>  	status = "okay";
>  };
>  
> +&cec_AO {
> +	pinctrl-0 = <&cec_ao_a_h_pins>;
> +	pinctrl-names = "default";
> +	status = "disabled";
> +	hdmi-phandle = <&hdmi_tx>;
> +};
> +
> +&cecb_AO {
> +	pinctrl-0 = <&cec_ao_b_h_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	hdmi-phandle = <&hdmi_tx>;
> +};
> +
>  &clkc_audio {
>  	status = "okay";
>  };
> 

Thanks,

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
