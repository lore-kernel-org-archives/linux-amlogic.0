Return-Path: <SRS0=o/5p=RE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC01C43381
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 16:43:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC9C02084D
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 16:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFiGSjH/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pG21FsL3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC9C02084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndj6GMo9R6UTGsGKlPfw3U4AhRxZBL37TOzr+m3PVoM=; b=RFiGSjH/p8pIFG
	sgtEUq+OyqpfUlsVJdPRunBHAYBqp4ZNQqsk45l3gqNIVIia1FaSQ5Vdd/81BXrxLIAiv8pgZ/nMW
	F5eoPB4UL1c5AJ9wmedXohjvxG4aZAIsMtle6WTrqc1I8NM7nLHHr6OildclgG/SQZD0V3pHrlQp3
	oDOLTUg2z1NRohMDl9aQTM/WCXz7sfxtxF3vysVmMQ0cKYyom+Xbh+4yTiMIR3EYtDfJ2mGFkAI1Y
	uGOL/nVMXCzQdhu3lyf6Ilwt8Df2wlmBPOO3YxuQUXTXh+uo6cXnM5F1ssNVwUh148XxjE3qCgkqN
	jde2NmO28oI9v9RawMxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzlG5-0003cq-OJ; Fri, 01 Mar 2019 16:43:37 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzlFp-0003En-5w
 for linux-amlogic@lists.infradead.org; Fri, 01 Mar 2019 16:43:26 +0000
Received: by mail-wm1-x342.google.com with SMTP id z84so12852883wmg.4
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Mar 2019 08:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wI5ZbLYXGwQ4PxTHH1sQXfHjabbpeQAJk4FXKsJi/6k=;
 b=pG21FsL3Ic7MB5OUeYZIktAQBbtaPDkSHwDkpWWmbDkgsQsHnNvVuPZowoJBOPOx09
 Ex6GLsYdjgIgtUe99JfptkEIL3PHZHq8AwHnAA9cIvGJhRvtO/yOufT3hlEG3web/TB3
 JieKs+hZxeTu3D3APm4wtcx/Vs6jh1AT8kXTbo3zQkZi+SDb4ms4D2bE09rqnGR737wu
 m/BE46P1F9VYSCyQetu83N/6PMMNXmtTP3LiYmTB10fXHelE//S6b9bAZdHsUXcckD6j
 mrEKvSjBgrKIS169kE1sLmS2z8YbbrmmYt+MQ1MhPrDp2NYiNf+qD1Gic0n1E4Tgn3zv
 IWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wI5ZbLYXGwQ4PxTHH1sQXfHjabbpeQAJk4FXKsJi/6k=;
 b=U5lLTXON8h7JFNkqrukJkyRwb3MRL2OMUpO05lq0KiDR2KaxVTjunuXnw0TsdYAGuX
 yEppArkN17htf9EUQiQHsr+AsGdJhKG8DwsCls9P1gfXcJxM6FX+yUSxypFEfCaVROUB
 JSSxgupSAzaQ6QKmat1yxkDJEWtevi9id5DSx9Y2tErC003WgV0taNzn7F77GQ0waUpY
 Q/HBCnUWkRzW0R4u0WouRdnnSA3eweZDJIOOrtMvqz5DnvM5Pfvyyk/YgSueXOejrC/9
 fB59ScaXQcc7h8M3pNEi3qWtFG+kCau3IRGr81+fIc5SZYG0RES71xY04LB1SjZSEiQe
 3+yg==
X-Gm-Message-State: APjAAAWBRjRgVoxnEnMcBU8wQVm8mI3tcAi1/+gOZ22HVXm5G+goGSgu
 CmllEsxRPFY3MPb4Rq3pNsScUQ==
X-Google-Smtp-Source: APXvYqz4i7P+HmKIpAKYlk443EicNKD93sVYUMCpEYD861QK8MKdzPI5lZhulCToH4RfPgGAb3awxw==
X-Received: by 2002:a7b:c34c:: with SMTP id l12mr3734176wmj.126.1551458599332; 
 Fri, 01 Mar 2019 08:43:19 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p68sm6655538wme.45.2019.03.01.08.43.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Mar 2019 08:43:18 -0800 (PST)
Subject: Re: [PATCH 1/2] clk: meson-g12a: add cpu clock bindings
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190301102140.7181-1-narmstrong@baylibre.com>
 <20190301102140.7181-2-narmstrong@baylibre.com>
 <CAFBinCCtmykL-ccWd9cporEOmxeUKC-RgrP3wfuSuYoAEjrGWA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d841b285-7994-fd7a-215b-13314bd0b298@baylibre.com>
Date: Fri, 1 Mar 2019 17:43:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCCtmykL-ccWd9cporEOmxeUKC-RgrP3wfuSuYoAEjrGWA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_084321_719026_D168BC23 
X-CRM114-Status: GOOD (  18.51  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On 01/03/2019 16:26, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Mar 1, 2019 at 11:22 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Add Amlogic G12A Family CPU clocks bindings, only export CPU_CLK since
>> it should be the only ID used.
> is this also true for the CPU post-dividers (APB, ATB, AXI, CPU CLK TRACE)?

Do we need these to be exported ?

> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/clk/meson/g12a.h              | 24 +++++++++++++++++++++++-
>>  include/dt-bindings/clock/g12a-clkc.h |  1 +
>>  2 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
>> index f399dfe1401c..4854750df902 100644
>> --- a/drivers/clk/meson/g12a.h
>> +++ b/drivers/clk/meson/g12a.h
>> @@ -166,8 +166,30 @@
>>  #define CLKID_MALI_0_DIV                       170
>>  #define CLKID_MALI_1_DIV                       173
>>  #define CLKID_MPLL_5OM_DIV                     176
>> +#define CLKID_PCIE_PLL_DCO                     178
>> +#define CLKID_PCIE_PLL_DCO_DIV2                        179
>> +#define CLKID_PCIE_PLL_OD                      180
> how are these PCIe clock related to the CPU clocks?

Oops, bad merge...

> 
>> +#define CLKID_SYS_PLL_DIV16_EN                 181
>> +#define CLKID_SYS_PLL_DIV16                    182
>> +#define CLKID_CPU_CLK_DYN0_SEL                 183
>> +#define CLKID_CPU_CLK_DYN0_DIV                 184
>> +#define CLKID_CPU_CLK_DYN0                     185
>> +#define CLKID_CPU_CLK_DYN1_SEL                 186
>> +#define CLKID_CPU_CLK_DYN1_DIV                 187
>> +#define CLKID_CPU_CLK_DYN1                     188
>> +#define CLKID_CPU_CLK_DYN                      189
>> +#define CLKID_CPU_CLK_DIV16_EN                 191
>> +#define CLKID_CPU_CLK_DIV16                    192
>> +#define CLKID_CPU_CLK_APB_DIV                  193
>> +#define CLKID_CPU_CLK_APB                      194
>> +#define CLKID_CPU_CLK_ATB_DIV                  195
>> +#define CLKID_CPU_CLK_ATB                      196
>> +#define CLKID_CPU_CLK_AXI_DIV                  197
>> +#define CLKID_CPU_CLK_AXI                      198
>> +#define CLKID_CPU_CLK_TRACE_DIV                        299
>> +#define CLKID_CPU_CLK_TRACE                    200
>>
>> -#define NR_CLKS                                        178
>> +#define NR_CLKS                                        201
> shouldn't all changes to this file (drivers/clk/meson/g12a.h) be part
> of the patch which adds the actual clocks so the dt-bindings patch is
> independent of the clock driver patches?
> in this case the subject should also be updated to "dt-bindings:
> clock: g12a: ..."

I don't have any opinion, Jerome ?

> 
> 
> Regards
> Martin
> 

Thanks !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
