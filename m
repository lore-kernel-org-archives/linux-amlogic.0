Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E378DC38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 15:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l98mTIPxFlTj+SbMf0EiY+FhZu/B/MJJz1iManqzc/Q=; b=A0ZTzXlI/zP2St
	bM8BhqHEIom6/zhQzGnK1FZ8Fp3s5yD8ueKQ3uSBnARqvHrOYUb+DPpX+mRMYGgewZAxRPaSzHVl2
	647YKRO2J7klxvlUgip+ntpL0nc5G+W8uZ+F+3YasKaohkyVQ+KXFbeF9DSQTqi/+q+cL7SY69TCU
	Y1LMIevOlTUg+tzHMt00+18IpA+jV9DBBeSmZYHUGyuuv/IdyMm7LTUuHZhl2t07GZX3ENOweU/kP
	TKa/hS9K3Gct5fRP7lI8NlvEGPHpmGDpJquXUBUPI4MGjXs5HCGQXzwEnu4o+1EaL9OLkOC8SWQkU
	BVWZBaWYKG82Xtp9oK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKL3h-004TyV-Vg; Tue, 24 Jan 2023 15:18:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKL3c-004TwM-Tu
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 15:18:00 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d14so10530506wrr.9
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 07:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2VSIRQ0sM1vpHuf8rla2J/YgrIDXTW4aHVMtNxKuzs=;
        b=E0vtUfGK8Xgmn95qAj3P+4mKS2op5T6PfCq/IoA3n3HfdQ143BRpsqzwpCdU1JDSoR
         XdkZfIWTqv7xfBwmxEmitd7mqjwpIc3/onc81/cvxT8LyUYQkAq4pd1bq3Hoikqzw7t+
         ZdzRdS3gBlWoTpM5jVLcydnUdC4DcYfpLrYD9zehs/8ZDjbq4ABgjs0NrtRCbg97z9aq
         gY0UHZdcwvYYIpGgszUQVqNUDCD6wp0VGQxk81C/4RMEiTiynDbQ3yYd05FEWDASMrsM
         CnntpL95bt90ccpOBbj8xwehvPTRoaTaA48VtgIzU8eisp1XvloCZJdB5uwP+D7xLXO0
         fUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2VSIRQ0sM1vpHuf8rla2J/YgrIDXTW4aHVMtNxKuzs=;
        b=gWt0nR4AXEOIsj8kVqdQGBcBHisJu12xQfwQ70HqTNLfbgQShitqkXg4ryG/tAVVxZ
         Xf8nFhad0d4Lgbgx5GUDCkPey4SZSr+YMI81eRraDqyAS82qRut29D3k5zpgXo6TbBXs
         iy0MIFFs7UlCqLhBNZT46jsBgcaKlTHU8ClN71PRKgJfeptQ0p/g6kBF1ApFjLGTgMEW
         jMiT60uJd0quAhwn+F2O1h/lh5S6RvZ4tYZJTN8IGlLtXtvbdN+zjEKoo7CMRyPO5q0f
         +E8FIHEVNNwaHqXKZDtI+vTelLNZrXOA8/ynX1KMmoGL88/uU5HwSabtjExt/0J0XIN4
         +gcw==
X-Gm-Message-State: AFqh2kogsF6Cb1Pl3jeEFhkwe/UEnWVgHIKXS/6Ey1EaEPl8/68d7lkD
	xPsYIEuff8HZKl8UYnorNtyhim1R0x7TgxDf
X-Google-Smtp-Source: AMrXdXsf+Cciqhme9ccOuJdxb626GrgOW7aBLMFfulcKCQgwB+siVPDLksLuWgH9yLYS2T/mc64t4g==
X-Received: by 2002:adf:c7cb:0:b0:2bc:48b3:f6de with SMTP id y11-20020adfc7cb000000b002bc48b3f6demr29408935wrg.0.1674573470736;
        Tue, 24 Jan 2023 07:17:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r1-20020a0560001b8100b002bfae16ee2fsm2024181wru.111.2023.01.24.07.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 07:17:50 -0800 (PST)
Message-ID: <f14428c8-d059-2bd0-49f0-5b05cb5bc7f8@linaro.org>
Date: Tue, 24 Jan 2023 16:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH linux-next v4 4/4] dt-bindings: usb: Fix device tree
 binding for VL817 hub controller
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230124144054.13556-1-linux.amoon@gmail.com>
 <20230124144054.13556-5-linux.amoon@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124144054.13556-5-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_071756_993583_2EDB802B 
X-CRM114-Status: GOOD (  15.38  )
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

On 24/01/2023 15:40, Anand Moon wrote:
> Cleanup by removing unneeded quotes from refs and
> add maxItems to reset-gpios and fix the required list.
> 
> Fixes: 31360c28dfdd ("dt-bindings: usb: Add binding for Via lab VL817 hub controller")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I think it's the first time I see this patch. Where did I review it?

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Subject: drop second/last, redundant "device tree binding for". The
"dt-bindings" prefix is already stating that these are bindings.


> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  .../devicetree/bindings/usb/vialab,vl817.yaml  | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> index 5f9771e22058..23a13e1d5c7a 100644
> --- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> +++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
