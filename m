Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A01DC0650F
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 07:45:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1423020843
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 07:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sZEsxd9/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="H0k1Twpw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1423020843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zpk0K3K8Xig9/TKn6TF8VYUJG59zAIEEOmWL4nCs0To=; b=sZEsxd9/BpXM/i
	DfoxyjSj9i5yZB6bs173yAO4ATtrAaMSWvlnRQNMxKtNxWEiaxcShDPxqGuEk6U9n8Xj7vKqk3nWA
	rYOZvlUWrQmRKDSBqjBDtaDuXO0BBayDmU9kc2T45PB+nn6BWuSHZoDQLqsuwJUDpnlMkE1Awlox9
	u1deI9231Ls4rymZZobk6gIX0qR1km+Kp8ywZhXxKLUSgTbnnEnuk9K2Gwa3a/Q+Zm0zMYSsmth91
	XT/5c3yY04IU/ISZ5p+PMkHotje54A7ur5QODgo2QQ1NTjXpbrR2wo7ZcFErkDd4XnURet3DzYprM
	j+s2KExgrxbV6Gm1XSvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxnyI-0004SV-Cr; Wed, 14 Aug 2019 07:45:26 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxnyF-0004Qw-1f
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 07:45:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id f72so3672158wmf.5
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 00:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bxpp3V/zt2ELpvEUNj4s+6M0+FDwutb/IJb8XSijvLE=;
 b=H0k1Twpw0k9Cx23gc9UCUD7ZcOVWHYq2rl25V/FfqjHcGpaPAmEgYscZeeYI+Jj8LU
 mbfGZQC/2ECseBt0mYVFZGOk7u8+2DLMMoffVTbUukElrwQNhaCqjCvMxMmi4x3YB6Cx
 H4JNQLhDdSPVT2G0WLoxt8tECTw6ZJC2qwI7Wt+oxPaWsojuEoNihlCDIR3PuPWnPAWW
 lZ3t88RgjUuc+10+v6EFvRPhTU0ts1ALHUoyGVqNpe+AogHT9hMJEPeOpdUDnZqOlC8J
 JR59SlrmXvXhX96dwBlv4UuxR7sN8VuUrcl3wY/OAhM3KL+Nb5SZ/6ZJ8HOyPlyxHaxI
 7oCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bxpp3V/zt2ELpvEUNj4s+6M0+FDwutb/IJb8XSijvLE=;
 b=FmRNFPtpbP/aVBDJ7A4QIUOTABOOMTjh+WKUBPLZnd2yaMGuEG3fAubwfQqMOhnHO5
 6whkjTpRteyTdYwq8oV5VcaWWFC8gbs3hc3aKgCyPxFsoSRiJCVis4Cm5J9lluae4trA
 FpHSqOqhbDTAkZ+vcdlQNcH57B15dgLlQVuu0ZjmCajkm12F9BrAd4UF82+QgYNKcYwS
 MI/m2Sit3bVSSuEZRtTSC0dhgYF/hmXK62ySVnERMtOygndmcwZARWokyI+lpgVKrVJf
 xiLYF6kAXe+7ksRs/cGdxGIFLrJhEnddzDllZTOcfOCnHtcjJH1/hfPmwHSiEYlfBvAX
 I91A==
X-Gm-Message-State: APjAAAU313SDnvPFja/jiqnbVOWUA7xAEVCBYUkc1cHgwRMWNIvvUaxB
 Kqp+LHM3hWbu9t+z7KzEr/p5d8l0YHuPvQ==
X-Google-Smtp-Source: APXvYqyxmeEZJjTmPnOAPt9NVxsCf9PqtlIKZM2HQXSBC0/iOcvOT6GGFHvuvfJRpSW0b7tPgLIqSg==
X-Received: by 2002:a1c:64c5:: with SMTP id y188mr7137331wmb.154.1565768720472; 
 Wed, 14 Aug 2019 00:45:20 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a64sm4215883wmf.1.2019.08.14.00.45.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 00:45:19 -0700 (PDT)
Subject: Re: [PATCH/RFT] soc: amlogic: meson-gx-pwrc-vpu: switch to clk_bulk
To: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190809230904.28747-1-khilman@baylibre.com>
 <7hlfvwy97e.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <3daa6b78-e634-3a82-e3a3-7fae312d406d@baylibre.com>
Date: Wed, 14 Aug 2019 09:45:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7hlfvwy97e.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_004523_173954_C60D90DD 
X-CRM114-Status: GOOD (  21.05  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 14/08/2019 00:47, Kevin Hilman wrote:
> Hi Neil,
> 
> Kevin Hilman <khilman@baylibre.com> writes:
> 
>> Instead of expecting a specific number of clocks with specific clock
>> names, switch to using the bulk clock API.
>>
>> This is a first step towards generalizing this driver to work with
>> other domains.
>>
>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>> Boot tested on meson-g12a-sei510 and verified that framebuffer console
>> comes up and still works.
>>
>>  drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 41 ++++++-------------------
>>  1 file changed, 10 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
>> index 511b6856225d..5f6519f43a31 100644
>> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
>> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
>> @@ -34,8 +34,8 @@ struct meson_gx_pwrc_vpu {
>>  	struct regmap *regmap_ao;
>>  	struct regmap *regmap_hhi;
>>  	struct reset_control *rstc;
>> -	struct clk *vpu_clk;
>> -	struct clk *vapb_clk;
>> +	struct clk_bulk_data *clks;
>> +	int num_clks;
>>  };
>>  
>>  static inline
>> @@ -76,8 +76,7 @@ static int meson_gx_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
>>  
>>  	msleep(20);
>>  
>> -	clk_disable_unprepare(pd->vpu_clk);
>> -	clk_disable_unprepare(pd->vapb_clk);
>> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> 
> Note the original turn-off order here is VPU then VAPB...
> 
>>  	return 0;
>>  }
>> @@ -119,25 +118,14 @@ static int meson_g12a_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
>>  
>>  	msleep(20);
>>  
>> -	clk_disable_unprepare(pd->vpu_clk);
>> -	clk_disable_unprepare(pd->vapb_clk);
>> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> 
> ... and the origianl turn-on ordr is also VPU then VAPB.
> 
> Using the clock bulk API, the new turn-on order will be the order they
> clocks appear in DT.  The turn-off order will be the reverse of that.
> 
> That seems right to me, but it is a change in behavior from the current
> code.
> 
> Did you set the enable and disable ordering the same for any specific
> reason?  Any reason to thing reversing the disable order is going to
> cause any issues?

No the order is not an issue here, the 2 clocks feeds 2 different parts of the VPU,
one is the APB register bridge (vapb) and the other feeds the vpu video pipeline,
so the order is not an issue.

Neil

> 
> Thanks,
> 
> Kevin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
