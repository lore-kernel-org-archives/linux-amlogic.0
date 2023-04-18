Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF529C6FD18
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Apr 2023 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIU1Ok6qFSumT+wmncvSatYEIyvY/BKmjBCHYvpcacE=; b=WT5lWlyx9VYz29BxcdYcGeoP1e
	IpYFWVITCBruoEjDMbs2ZZrBRZspv471Q/ilIP0xC0J4LKDhTSh2NGYW1KViKcl3igCgh9ThNoof+
	1NYVVTrzTaR/mR1TVv3phZGiFrsq7PJRHAfXJDt0heMDwZbUW0V92OpTtsesnn7bpbi1/wSSFKVPO
	fSY4/9RZI5GYs3rVEw1WrNb21Pjua39i8VjbX+XaMGag6Fk34Gqw4rXINClp3ARIk4l1I8aj2lvwq
	Fx86JYaEcwvoqg6JoCnKxlP1wDsasUrkK+U831PeE2gXFcoeIplYovAe+TwPYqL77AAubeoIXUkBa
	59kZ2Lxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pojjF-001zgO-36;
	Tue, 18 Apr 2023 11:42:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pojjB-001zdq-2F
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Apr 2023 11:42:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f178da21b2so6142165e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Apr 2023 04:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681818147; x=1684410147;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VJhrrZF5F7exwMqfs2F/DYr7C0jvoevmcUqXzH/feoc=;
        b=jzOxsEqTJ/vE+PNHw+7MNs45SrWRcRdILs3o1jpljWGpevnUNsNzBP/Hne7QfimK1N
         5DY3mrppe8X+jaKRQ/IbtfjvpPf0q1020JOjEX1gd+PJibeizTsiuvO1XMk66ZORWC5j
         lktslAieZyrktZZaXs1VOo2OOCgxt87ehbK80gCy9qUt7TMKk/oMtNdCpNzsBRcHtUHv
         pdIYAJyMglfkqtZfx3wGsJZhLPh/cD+9cMXyQcewLh2XXi8p4vxi1ohxB/1/S2ROicgZ
         L0tbdVXl1JS4tDWSNKnrMrEgWR+inwerTf5sMqNXCyLiSgJyyWx9sNlODMPpzC76QPwC
         a4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681818147; x=1684410147;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJhrrZF5F7exwMqfs2F/DYr7C0jvoevmcUqXzH/feoc=;
        b=OMxsnqSQYVg4qruhpKksgIPrCyHZR5Qaz10YF2TpkmMeA14fhmcuMY18ZlboYCEEd5
         f8PeSM9b15b1IuSASN88Rx/ZszqJ7j7/MqNPP9CrcZ5Xe50llCieL1dVRZ/PYDjTlcMd
         BOc3Vmt2eE9zBhSCkDUU6OBV8y1cnNRBHDw5BkM1mt+gY1HkgT3y6M/DVnTrWGHsA5SX
         jvYniIUNiM9zoZ99DqYNyJhJ3qM3m28cpVQpASHzjMb2zq15yYRtRqdzjx6XU5u05Ou8
         e0JWoiA99kYuFadlrHkahjxb9l2fawzxNSsdD+LLnowGEbwaAr5doJR9hAyciPOJbjnY
         gsYw==
X-Gm-Message-State: AAQBX9dEmREK3ZdmeaqyFVyHEtbuq5AjZ4/1b9KrT3W4ra2oHGEnOY58
	Uq0Nw98IdUWog3XYXU1mOlyzoQ==
X-Google-Smtp-Source: AKy350aDCnbeQs57GbmYsqxCTQZFjV3+gfLDfWNsHSqoL5o8sOpUjfnH5UipDVxMtKi6RxmnWS+aFA==
X-Received: by 2002:a5d:698e:0:b0:2d2:f3e3:115d with SMTP id g14-20020a5d698e000000b002d2f3e3115dmr1702788wru.59.1681818146993;
        Tue, 18 Apr 2023 04:42:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7a02:f867:7c56:79a0? ([2a01:e0a:982:cbb0:7a02:f867:7c56:79a0])
        by smtp.gmail.com with ESMTPSA id h12-20020adffa8c000000b002d322b9a7f5sm12934813wrr.88.2023.04.18.04.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 04:42:26 -0700 (PDT)
Message-ID: <e4540877-5874-92a0-f15f-bdefc8dc5f8b@linaro.org>
Date: Tue, 18 Apr 2023 13:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/5] usb: dwc2: support dwc2 IP for Amlogic A1 SoC
 family
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 mturquette@baylibre.com, vkoul@kernel.org, kishon@kernel.org,
 hminas@synopsys.com, Thinh.Nguyen@synopsys.com
Cc: yue.wang@amlogic.com, hanjie.lin@amlogic.com, kernel@sberdevices.ru,
 rockosov@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org
References: <20230418111612.19479-1-ddrokosov@sberdevices.ru>
 <20230418111612.19479-3-ddrokosov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230418111612.19479-3-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_044229_758400_F74700C2 
X-CRM114-Status: GOOD (  14.72  )
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

On 18/04/2023 13:16, Dmitry Rokosov wrote:
> The Amlogic A1 uses dwc2 Synopsys IP as its USB peripheral (gadget)
> endpoint, with different DWC2 parameters when compared to previous
> Amlogic SoCs.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   drivers/usb/dwc2/params.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 9ed9fd956940..098fbfc774ab 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -161,6 +161,25 @@ static void dwc2_set_amlogic_g12a_params(struct dwc2_hsotg *hsotg)
>   	p->hird_threshold_en = false;
>   }
>   
> +static void dwc2_set_amlogic_a1_params(struct dwc2_hsotg *hsotg)
> +{
> +	struct dwc2_core_params *p = &hsotg->params;
> +
> +	p->otg_caps.hnp_support = false;
> +	p->otg_caps.srp_support = false;
> +	p->speed = DWC2_SPEED_PARAM_HIGH;
> +	p->host_rx_fifo_size = 192;
> +	p->host_nperio_tx_fifo_size = 128;
> +	p->host_perio_tx_fifo_size = 128;
> +	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
> +	p->phy_utmi_width = 8;
> +	p->ahbcfg = GAHBCFG_HBSTLEN_INCR8 << GAHBCFG_HBSTLEN_SHIFT;
> +	p->lpm = false;
> +	p->lpm_clock_gating = false;
> +	p->besl = false;
> +	p->hird_threshold_en = false;
> +}
> +
>   static void dwc2_set_amcc_params(struct dwc2_hsotg *hsotg)
>   {
>   	struct dwc2_core_params *p = &hsotg->params;
> @@ -258,6 +277,8 @@ const struct of_device_id dwc2_of_match_table[] = {
>   	  .data = dwc2_set_amlogic_params },
>   	{ .compatible = "amlogic,meson-g12a-usb",
>   	  .data = dwc2_set_amlogic_g12a_params },
> +	{ .compatible = "amlogic,meson-a1-usb",
> +	  .data = dwc2_set_amlogic_a1_params },
>   	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
>   	{ .compatible = "apm,apm82181-dwc-otg", .data = dwc2_set_amcc_params },
>   	{ .compatible = "st,stm32f4x9-fsotg",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
