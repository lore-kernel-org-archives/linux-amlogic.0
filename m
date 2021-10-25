Return-Path: <SRS0=wai9=PN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330C9C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Oct 2021 08:20:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02DA060EE9
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Oct 2021 08:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02DA060EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qEiaF/WH9LCIeHhU/aojcthFst2DrrMlIzlqy/8wIrk=; b=cElXHaPgMYUUMKyWaUXZu0xVfn
	MphR07gCnAQXsQa7TSlYbVaIfAPmH+0o+bHie5YDRQPNuifS7Dk4m1CNX7dC6lJEBdaU+x5Ap64BD
	0+EqcnZbna+p3Ja/1zQgCzjSWHlwpPIhZfdwYwtdYToNa+z/Id8ukAHzXhoIOOTDXagNIAkHmNjNp
	ukj2afm+4e6WB2M+KwJzOTRQ704vmMLCXGDSM/Vef9P1CadkALQ1g+eVea0b5mEFn7objyfoNOdcB
	55rgZuofICLhX3ytTSnagKsgje0pINNiH8K9RymYu0ylXk5TvbAkG1WB7IK5ZEPmd9Nl7S7wQDqz4
	fvtGt5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mevDP-00FlsJ-Jo; Mon, 25 Oct 2021 08:20:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mevDM-00FlqR-KD
 for linux-amlogic@lists.infradead.org; Mon, 25 Oct 2021 08:20:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d3so7120626wrh.8
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Oct 2021 01:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DpzfhI/j3zqaTQcOhewRwr4Gp6d4cS64SYZM6pOH8CE=;
 b=ONjYluoLo8bgvprrfkaaljtGInB2/3TGrQIjiORR0Ta9e0T0iNGwVMEEmz5MrMqQMV
 nELP5s+TKRU5/fmCEnaz9QGH51aOzQ6KOQ2t4J+1mQTjXFNzKXzYGSogrzZN8DPjGuln
 0IIKxQjbnFer+7R4Jd8VLAB7MGdkPVQOKyTyNSpfHNW2TLRtdcqWjL2DqXM13+mYlMQ3
 J371uWhQ2pfVS5TDSc/KT12H+wpB72aEvFD6MBWarIijGcEWQ2lSauwPmc4pXUaFBhEb
 dLD5CC+YrmHysW1VdnXKgJb46XU0f5zY5gU4tX8UH+Ym6l42iTffA/mohVK8/pigbrEM
 DV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DpzfhI/j3zqaTQcOhewRwr4Gp6d4cS64SYZM6pOH8CE=;
 b=HxL9khk7Qwo81b3q7Mc7S+dGlWh7vhgMJt1KLnFDx4t1EjiwH18CY3MuiHi1ZLEetz
 2yEyZ9l8tHu/kxon3CVOrBwUNfjFh9PqsXJVmPc3camqquX2jZBsYlog+cmuwg1EGGDC
 XFsakfbC+1VmQFp9zwO1qmyaTfkBJPa3EOEBzbb9TyY4npmTy2upG5e+z4TUrzI2psIR
 aQ0hNhYit2uxVFs8Hl0T3kSNs/8CRIOVzRjdd0ZiVMXpfvm5qaG4f4RryjMEFYl7YSms
 upJBE+MqGqBoaYqePIbE8OcSzKFGJTDuxNFyIPUtSmY63+cVlQGmXiGp4IIH41TgCBud
 5QQA==
X-Gm-Message-State: AOAM530/ocXc3GUIlb2QlwvJf/+qEkpsuW4UNvPXUegysyZ3lYdAj+Ph
 c56gkEmBaBqp2Xn7N8qkVz6ejQ==
X-Google-Smtp-Source: ABdhPJy6ftEbBTrigJ+pyDmAGsisen0l6yyYf/oHEiFpvHOcv3+KBPYN1jfEvPPMUkyeRE8ilsxuOw==
X-Received: by 2002:adf:bd8a:: with SMTP id l10mr21692841wrh.159.1635150014595; 
 Mon, 25 Oct 2021 01:20:14 -0700 (PDT)
Received: from [172.20.10.7] ([37.166.214.228])
 by smtp.gmail.com with ESMTPSA id o40sm9906207wms.10.2021.10.25.01.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 01:20:14 -0700 (PDT)
Subject: Re: [PATCH 4/4] arm64: dts: amlogic: Fix SPI NOR flash node name for
 ODROID N2/N2+
To: Alexander Stein <alexander.stein@mailbox.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
 <20211023214856.30097-4-alexander.stein@mailbox.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3937f51e-6750-1462-efe5-f5bdbfee8a4d@baylibre.com>
Date: Mon, 25 Oct 2021 10:20:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214856.30097-4-alexander.stein@mailbox.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_012016_709420_1249EB83 
X-CRM114-Status: GOOD (  16.34  )
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

On 23/10/2021 23:48, Alexander Stein wrote:
> Fix the schema warning: "spi-flash@0: $nodename:0: 'spi-flash@0' does
>  not match '^flash(@.*)?$'" from jedec,spi-nor.yaml
> 
> Fixes: a084eaf3096c ("arm64: dts: meson-g12b-odroid-n2: add SPIFC controller node")
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 6e9ff5076b38..9c05c83453f5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -611,7 +611,7 @@ &spifc {
>  	pinctrl-0 = <&nor_pins>;
>  	pinctrl-names = "default";
>  
> -	mx25u64: spi-flash@0 {
> +	mx25u64: flash@0 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		compatible = "mxicy,mx25u6435f", "jedec,spi-nor";
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
