Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42914C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 May 2022 07:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TH8U2x414dNVX1M87qkmT0a8+3cG9wlWXd91FdnWlRY=; b=yTqBwHL47wanhYmY5q3sSHf7CU
	O1TyHJx+EAGR9LM7kSOf0YODTLMnbD7Sg7/LNPFuPC7IQTQpxhNcb64l1/mff25RSLK8zdeqafm8F
	EpcaIyUDN31t60F85uktnKwxzitCWCI/hlUt1Vo3QWAd9MywNpsobLP3g/NRu261ecQMaGomRzfGT
	ca/K2sWT4YJPM9ojKrtXeb0vzmWa+EfoJm+vHzpbiwKJcalxKTFtFVv4OqmDV/l02jbCkvOcuPkPC
	DKGp99KPsBEYGbNqqwYdUz6wK9DkfaDfBCOdDpdKqsiiUZt0jrgfWjqz+k8OH9S+N7hkHk/chY8/M
	VN6RoMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqVBv-006TKL-Sk; Mon, 16 May 2022 07:30:55 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqVBr-006THh-Cm
 for linux-amlogic@lists.infradead.org; Mon, 16 May 2022 07:30:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id t6so19237157wra.4
 for <linux-amlogic@lists.infradead.org>; Mon, 16 May 2022 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Px3glTKWCg7kWr7a6eIMSWbe103rTdBZnQqWdRuYhzQ=;
 b=enYYGtKXYrG8XM0Q4Ozy/Oq9NF87RWaveE+jIzzaSKDTYNCv40zIkFwQeFHVqBYY1i
 LTD/3183oqVdUrsIzMOADPpdNutm/4tW6FSNDjI+fM2Im6duXI7ktudN3m6lJUX+8gRL
 4QGiJONVbUTPewdwIiPxYy3Lf4imgZuzRPBVyNeF6V2Gv2h5eroVkUitgx1KxEazCDNu
 CGbLLgzu/wAM/eJ8rXhfmlTWm7UNnoPfY8wB6QrVswbWElS8DNMgXMtHo/zNBk1Pn43+
 +V2tYNcag/GQXUEimGs2L7i0G8F9S1X39TXRoj4kSLY/1hQ5//hnU5Q+bdnKZquH7bQM
 mMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Px3glTKWCg7kWr7a6eIMSWbe103rTdBZnQqWdRuYhzQ=;
 b=pa27nArFOVOhnBBvbethp4nwcON4yu1MlzyC9y2X9v47LObn6EUwz4FSIm6lmmqF8N
 lznpqdDTIrLnANfxFbjI68e5dRBlkEvk/Bq43gAkNinitFVaVx4kTu63PJB+IRfE521B
 Y/epVwtE40U8gytKTbTPG7U23ndgDHAs+QYlC8PvyGFq+J0lBPBzLfox81CN7xcXU57G
 VMUY5JcNcHxkTiPpLhje0bKakCk27HeduwBnk4BVu6wnvK91a6BxO5FEnq347ryzRuKj
 gSRmY5ryfCyZxMG17ajbqA8NJ1sg8WFfIvWrWDrSNDuQKRWDW2oDlliZbrG12yPd4bvq
 5N1A==
X-Gm-Message-State: AOAM5316QtgFyxTjhW2fhwE6GBhJaBGE7sdujaknAk0RkT/S+PWT5P8q
 MyoMMJt60xZhio96WozCo23OmWtLZfGPEEjr
X-Google-Smtp-Source: ABdhPJwiEul78OPGqV1PIewvAly77vk1RnaLf9OUAVrYxBjE7DNq+bumRXXOmdeeSJGJESUKnhvI0g==
X-Received: by 2002:a5d:42d0:0:b0:20d:2dd:22f7 with SMTP id
 t16-20020a5d42d0000000b0020d02dd22f7mr5945581wrr.136.1652686247683; 
 Mon, 16 May 2022 00:30:47 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a9c0:1a19:4204:1dc9?
 ([2001:861:44c0:66c0:a9c0:1a19:4204:1dc9])
 by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b003942a244f49sm13810029wms.34.2022.05.16.00.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 00:30:46 -0700 (PDT)
Message-ID: <8a4251bd-14cc-6105-d3ea-4eed33da2e38@baylibre.com>
Date: Mon, 16 May 2022 09:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: OdroidN2/N2+ HDMI Green Line
Content-Language: en-US
To: Jefferson Gonzalez <jgmdev@gmail.com>, linux-amlogic@lists.infradead.org
References: <ff473c04-ffac-fdbc-597b-e0bce7e3d6fd@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <ff473c04-ffac-fdbc-597b-e0bce7e3d6fd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_003051_700232_4EB80993 
X-CRM114-Status: GOOD (  14.26  )
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

On 15/05/2022 18:50, Jefferson Gonzalez wrote:
> Hi,
> 
> Writing to report an old issue about a green line on the left side of the
> screen with some files hoping that it helps troubleshoot the cause. The issue
> happens when connecting the HDMI cable directly to the hdmi input port of the
> display, when using an HDMI to VGA converter and connecting it to the display
> VGA input port the issue doesn't happen.
> 
> In this message I attach the output of "cat /sys/kernel/debug/dri/*/state" for
> both hdmi and vga, also both edid files when connected to hdmi and vga. The
> files were retrieved using kernel 5.18rc4 and happens on mainline uboot,
> the tow-boot distribution or upstream uboot.

Please check & test the following fix:
https://lore.kernel.org/r/20220516072245.10745-1-christianshewitt@gmail.com

Thanks,
Neil

> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
