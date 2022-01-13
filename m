Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E85C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G+HBP6NzAhutPx60o6gCYwopBcyEwc2qsOa+zznoa1o=; b=QMwCKPnpHUXfw8NKxTZtSpYM5n
	ZXQQVvGTWA8VYRSq1jrkUCRU8fSNl9x4BzjmM2Rke7PN1zYhKzqSqJRek0g0f6bc0rMXfgAbmBVsQ
	IWqrDyjqt8ywlD92dgqH1T0aF7yC+rz4JENv+o3GQAPs+PXObT9MusgrlRGkWGpGCzS3hn3XoHtNh
	JCyDaxOCdWJBIEKE0SvnMiuyQ6B6gJkpIkhvbTbeI4n134wzRam/JoaxYs5S7ST121ei4R2rt8sAq
	a6yt06jme4nlG5rXfvHRgNVp44GCUeO2Y0Ko5xv3mU+26xhU8U/55/MndWTuYB74XRurYy5+1ru34
	7Zmh1kmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7xWV-005VOh-PF; Thu, 13 Jan 2022 10:40:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7xWI-005VM8-Ow
 for linux-amlogic@lists.infradead.org; Thu, 13 Jan 2022 10:39:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id d19so9374758wrb.0
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jan 2022 02:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D6v29IF5ynl4LtatwkL+aWAs6JBK13MEYBvlVFMZquU=;
 b=5E/rRDm8VAePAEyXX2CiCjdULP1GlaSRlCL6rP1OFm9NtTcT/ZfHPSri7GAsFYooGM
 e2qNDpxVfENa2JMngQsDUOjXgZ3o5XLR0qX0fgev0eMWSDe0Suu4v5WNdQE4UDR0mXXa
 kkKHuxoejXna0MEXcK4iXXEpfcEqg9UG7JdiILDdWWIZ8ceKfXzhOmHLN3imRfvKC8VD
 SnACzgmeN3L1Z+W4gevDeBd0yj4MAmFBfDu+qM/w3B5Xjs1hskbyi+RkG7h/JE69UMIU
 9TUgJD73bM3CaCNrP1KwcjKvQwl39rjNWnQVm8osulfvAcS4cazQgb75PcZOrpgSAKoj
 B+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=D6v29IF5ynl4LtatwkL+aWAs6JBK13MEYBvlVFMZquU=;
 b=g7yHyVhOV3znN3WCqCNGiQuK9rIZtT1p29BdZYC0w+MTmIDpvvbrh6BiZH7FBXZNBb
 JgGS156TF4699l1yUhVpR+DYPAl7sSSvDuQ3wpEDPKd7UtUpCDrykFpd4CyPzDEC+viT
 B4jKBK6Zne/PdBUAT/kewA7BiNQBs5ZYasBHpIRHwUG9bX628oIgzCLcqZZgd1QXhySx
 6h+UL1ZLBRrJ8xhf/IGisx8DQdk+rxBdrIrPj2k3kiTkvWxS5NeyIoQskD0mZk7b/UwU
 QUaCCV1RHugByfFq+Jty89r6kaJBb3WKsFPFiokY5GmmgUkL9fTxnepQEhbS0uoqVixr
 cV9g==
X-Gm-Message-State: AOAM530bU/rlH/vqAJ4ooOPfvXkclgcst7nw0WFtW6Jg0fMqqzfMEQ0Q
 cOypY++Hjwz8/x+CZ7vKCeosVw==
X-Google-Smtp-Source: ABdhPJz6q0lW1Um0SBfgQk6QTnCEXbTZmY8UEIgCUZe0rFIhVUDt/FUZhC1I/awTcNLmGS51ZbyFQw==
X-Received: by 2002:a05:6000:1d91:: with SMTP id
 bk17mr3370944wrb.684.1642070388799; 
 Thu, 13 Jan 2022 02:39:48 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bece:ab45:7469:4195?
 ([2001:861:44c0:66c0:bece:ab45:7469:4195])
 by smtp.gmail.com with ESMTPSA id y4sm2667120wrd.50.2022.01.13.02.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 02:39:48 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: amlogic: meson-s4-aq222: fix waring for
 leading 0s
To: Anders Roxell <anders.roxell@linaro.org>, robh+dt@kernel.org,
 khilman@baylibre.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220113102746.598763-1-anders.roxell@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e0a8be1b-025f-a599-0298-3521066860b0@baylibre.com>
Date: Thu, 13 Jan 2022 11:39:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113102746.598763-1-anders.roxell@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_023950_903722_BF857B74 
X-CRM114-Status: GOOD (  17.83  )
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


On 13/01/2022 11:27, Anders Roxell wrote:
> When building allmodconfig the following waring shows up:
> 
> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts:21.18-24.4: Warning (unit_address_format): /memory@00000000: unit name should not have leading 0s
> 
> Fixing the waring by dropping all the '0' except one.
> 
> Fixes: 1c1475389af0 ("arm64: dts: add support for S4 based Amlogic AQ222")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index a942d7e06d6e..8ffbcb2b1ac5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -18,7 +18,7 @@ aliases {
>  		serial0 = &uart_B;
>  	};
>  
> -	memory@00000000 {
> +	memory@0 {
>  		device_type = "memory";
>  		reg = <0x0 0x0 0x0 0x40000000>;
>  	};
> 


Thanks, I also noticed and fixed in the commit directly, it should be fixed on next -next

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
