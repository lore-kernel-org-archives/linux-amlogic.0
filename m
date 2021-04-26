Return-Path: <SRS0=Dvvs=JX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B7CC433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 18:08:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F75613BC
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 18:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91F75613BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NRtUFsq2K6yaI13xq9QdpcmXnQ/ccO+VZiiy1r2EEbM=; b=ZSGobJNBk8ZZnrTG2C5BzJf3N
	CJht5o3p6aQZxia4PhuMamTO1axIKAt9v9MC8zeeC76er5frE6feXZBgd/spCqD8WvwLbBHmgtndD
	V/mDbMB5wKbHH6kR7QF50Inh91VD92a9M9YJ4vTqSiwS/PX7wF+lGicAlKzWMuLIVYzMC5muDIHHO
	yd2PZ9gJXBfCkNP7myl8PEmm3cvjHbqQqRNLf31GEV7UMGytZ7MasDIotYaNfZEehw/+5g+Ky1wCO
	KmDNdrKuhWHISWcfMaBGk5BzCW+HbLuHwvsnL+fj7fERdAn40fBru4lplRzqSd/wiNmKmPCTM6ouJ
	/O1848BLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb5ey-008FdH-Tl; Mon, 26 Apr 2021 18:08:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb5ev-008FcB-2h
 for linux-amlogic@lists.infradead.org; Mon, 26 Apr 2021 18:08:39 +0000
Received: by mail-wr1-x42f.google.com with SMTP id k14so6919929wrv.5
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Apr 2021 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z/Kwipu1y6TOCAmGCH4eBv1sqy5s6UK9+gQOmGBdFDo=;
 b=tFAA8OM1OMnP4mVo1BUP3TdeKSXg/EB0WafYRtzUUiTKjsWUSQ3QroqS/dybgZJz5x
 0uistVBTmvOSdV/sjTYDOP5Va1MmX7/WqO0JJj+tBOPk5GLQHczf9D8P5whtygJ67rTY
 Xn1LpQA4AeN6syvVSQIdFiCAapyOmzrQqelxryNExRsNAUxIlqXMJwYj+ns6o5CwHKK2
 ylC+cLMlFFWQrWOfS5pjYnUnB/NhnEYOL62/OL4tMLc0yPxaXghMMP4NPRf4+0vQdGOq
 o/LMILSLqmJbvcyuMj+8GgtaWJZ/8VgNqAKdegca6JMGKy9kxT/rfUr+s3QipNmawIWl
 iCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=z/Kwipu1y6TOCAmGCH4eBv1sqy5s6UK9+gQOmGBdFDo=;
 b=VhEBfjc0ZHyZgfq5MtdlNHcsjDQ67/HwuV/sEE6d8nr8N27/3UV2pQxs7zrsEzlC3L
 QMN9Of+sFJkeiY0wgPhIU6oQ7P8sqp3IXuI3hKeAfBCALxbQt6Mfrko/NmS85yd2KTZ/
 XFFMImEMIPswFkRrYYEqBFR8IOTews9m/qUqWO8DURgBDJXRtdTeuOsIFNXCe+qiKFJQ
 9rzB/NtbUpP7gZvMNfjFdSTzwzH0sYd90Zga7JQlwIh2/cPUaBCEZt15O/pCkrho6/X+
 QRfpU5f8lvSquYimnJL/quLiCs+VXQEX+QFZNuUgM9NKwb225mPBZTjKMNhHF5Nt6n3o
 2kfw==
X-Gm-Message-State: AOAM531snnE0RALcoZVaSwROVpvDzvgs4IAsY8qgZY1yCbFu//cfQri+
 46rg4s8PavVGp5rejjCGWjnb8pjhltrYjIyd
X-Google-Smtp-Source: ABdhPJzgk2IzpTkyCjHJ4GcBEEoXLGQijoX+9t+CrvlLufNwU/zLqVZ2i9U0e2ub5m3mdqW1C5Dt0g==
X-Received: by 2002:a5d:590a:: with SMTP id v10mr24510931wrd.306.1619460395637; 
 Mon, 26 Apr 2021 11:06:35 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b76e:7362:77c0:ddc3?
 ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
 by smtp.gmail.com with ESMTPSA id a9sm276663wmj.1.2021.04.26.11.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 11:06:33 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] dt-bindings: serial: amlogic,meson-uart: add
 fifo-size property
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 gregkh@linuxfoundation.org
References: <20210325152410.1795557-1-narmstrong@baylibre.com>
 <20210325152410.1795557-2-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <39c92a23-e009-6bc2-a20b-9b0ab3e01c75@baylibre.com>
Date: Mon, 26 Apr 2021 20:06:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325152410.1795557-2-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_190837_508966_F59F669D 
X-CRM114-Status: GOOD (  16.99  )
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

Hi Rob,

On 25/03/2021 16:24, Neil Armstrong wrote:
> On most of the Amlogic SoCs, the first UART controller in the "Everything-Else"
> power domain has 128bytes of RX & TX FIFO, so add an optional property to describe
> a different FIFO size from the other ports (64bytes).
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> index 75ebc9952a99..8ece7f420c19 100644
> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> @@ -55,6 +55,12 @@ properties:
>        - const: pclk
>        - const: baud
>  
> +
> +  fifo-size:
> +    description: The fifo size supported by the UART channel.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [64, 128]
> +
>  required:
>    - compatible
>    - reg
> 


Is it ok with the generic fifo-size property ?

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
