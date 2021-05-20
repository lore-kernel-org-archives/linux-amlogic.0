Return-Path: <SRS0=eZXa=KP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7882FC433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 13:55:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBEC60FF3
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 13:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCBEC60FF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEq+2IKw6kYZQcGGPgbvYtFrNy2q/3eBLEYAPhNRWaY=; b=X8QX3xTbkClGD/BZiVAYf0N92m
	uKtz8/Pj0Q2qEODUSd3J5eWjX9aeWwJvdZozeRW9idsBV4n92nsPGIQyGdro54bbDFPHO5FFL/3Vf
	S8XqnZUDlMZvNmeGCXJEOZt9Gz/5YtWB6zjoOVxRm/dWdfqh6JXelK9eeFLzw8JKgS6PKybEy/nhp
	bne1PjKDxzsUkTXRw4+1j8muHcAiH2KlZneFPFrho/SQbyqRVk9qMnxMww2C9OZYYPcIvy6FyBouy
	/yopyeMZhP5lABN/MuixmN1acwf3uysWz2NRJvmwjpErjeVF8lqR/C9o6ezqg+sKwhVMpaOM7Utj8
	24Q8Y9zw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljj9P-001J6e-Jk; Thu, 20 May 2021 13:55:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljj9N-001J5K-5H
 for linux-amlogic@desiato.infradead.org; Thu, 20 May 2021 13:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=iWzw33PkspV7y4yyaFnbDMAVw/W4YT9sq/Y05RvYpbo=; b=mTKHnfB/oswwU/pCBoyfQoi9O0
 6IFFCjxX85LsVoe/r9Pp9MHNPV2GMvcMPRuUSvUkJIkUa8+D/u2LG66EgOEe7o7sjs+JNtQTMa105
 CfJ6IgreGfdC2RNyoO1Rhke4bExsjYy/1u48b/xxIYffIB3vQvWL9dTKXAvFGgxM7LZJmV2JK9TpQ
 wG0u0L4vu+VFx4BbQm4hJPjS8ae/42CY5T1y1GfHmvDug1GRryL2ZYhG84HA7dbA+1gBruJ/B7Yoi
 tFtMAGhaoMdnqdhQIhJwbEXxs9Nbg3RNFtlTOnQLdtrhefsHKt+UAY7efd546kAhTYApL01plggTh
 bIDysNWQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljj9I-00GOSC-Bz
 for linux-amlogic@lists.infradead.org; Thu, 20 May 2021 13:55:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id h4so17738294wrt.12
 for <linux-amlogic@lists.infradead.org>; Thu, 20 May 2021 06:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iWzw33PkspV7y4yyaFnbDMAVw/W4YT9sq/Y05RvYpbo=;
 b=X9mlvAcF46/y2PCKyoQeXtctw2ARdhTu1su5ycYVMJp5rGCp45ujrZLreinTsXGGKq
 e9V2clmjfdgj3CVEclGVLCgx2iVJp+JRrIEoUfHPfU4/jRkzg59tlXgjNDLZ7pezTlHa
 nANuEju0hmFvkNwEul4yTfjvZJoxBE3j7xHfB6h/Aj5dAeuHKKe2Avye1hR7rynWNXv/
 q2L2FzZHlv/ZsTRKUMuHhwhrAf/KTgKzgDNKDwOHxS/sd/vrPIqo3AOSu/NfPm+ML3XR
 6Gh1DZaoTzpLOLrbom3YaHirJLTrkSYunLhznDaCeDpVD7BzzPwj59TtdOTn4qRGBquE
 NuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iWzw33PkspV7y4yyaFnbDMAVw/W4YT9sq/Y05RvYpbo=;
 b=lvIRk6VPX4flj0gbvh/O+uV2xne+kT3HQjZqz6Tyy/dgaDr9Vzp7d05zZb7qjJklYg
 PlS2p2T7Gjh0v6TDFSRuDyIIf12PN811cRoD0h4YC4Z1tgt1lo8GKXhIuq0p6egv294B
 FsrnVmaTKV8Ka/37fDjK8L9qb9NIzMNRg2Lx1pu2Z8kw+X0j6acrrdlm6TBYF06KSDfB
 GEf2AV/JBDKmDNOA6swb2kC5ZoIaAL+VEuRgnXyucaG0W1YEr0ttmPglrll1lJUN97Rr
 AMTl7FJxV8R0O2Ta1kh3EtuUzdnOsSuio84Rfh08UMsPRuw3lpzP5pA0RoknNSoCz7F5
 +KJA==
X-Gm-Message-State: AOAM5318BnDrEMtvhxxy0kHnvDFw2jswkB3fuBDen7u0SRlC/v9KTQ4B
 KCprglZxWpzPItix5DGTLE27yPxE5mW0JI7i
X-Google-Smtp-Source: ABdhPJw2HGwGgozEkBz9pJr9jphqMHa+rt/tIRCmlyL5OLiPES8jbFSqi9biISOa/iKtTrQrMUJB3Q==
X-Received: by 2002:adf:db42:: with SMTP id f2mr4467026wrj.5.1621518937629;
 Thu, 20 May 2021 06:55:37 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:d88a:b479:b222:83bb?
 ([2a01:e0a:90c:e290:d88a:b479:b222:83bb])
 by smtp.gmail.com with ESMTPSA id v20sm2910528wmj.15.2021.05.20.06.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 06:55:36 -0700 (PDT)
Subject: Re: [PATCH 0/3] tty: serial: meson: add amlogic,uart-fifosize property
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jirislaby@kernel.org
References: <20210518075833.3736038-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9c6ce679-1721-be40-c1b2-6ae90503d2cb@baylibre.com>
Date: Thu, 20 May 2021 15:55:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518075833.3736038-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_065540_488520_915A0643 
X-CRM114-Status: GOOD (  16.52  )
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

Hi Greg,

On 18/05/2021 09:58, Neil Armstrong wrote:
> On most of the Amlogic SoCs, the first UART controller in the "Everything-Else"
> power domain has 128bytes of RX & TX FIFO, so add an optional property to describe
> a different FIFO size from the other ports (64bytes).
> 
> This adds a property in the bindings, reads the property from the driver and updates
> the DT with the new property.
> 
> Changes since v2:
> - removed spurious blank line from bindings
> 
> Changes since v1:
> - switched to a more generic "fifo-size"
> 
> Neil Armstrong (3):
>   dt-bindings: serial: amlogic,meson-uart: add fifo-size property
>   tty: serial: meson: retrieve port FIFO size from DT
>   arm64: dts: meson: set 128bytes FIFO size on uart A
> 
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 +++++
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi                   | 1 +
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi            | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi                    | 1 +
>  drivers/tty/serial/meson_uart.c                              | 5 ++++-
>  5 files changed, 12 insertions(+), 1 deletion(-)
> 

Could you apply patches 1 & 2 ?

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
