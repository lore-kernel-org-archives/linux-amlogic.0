Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0369C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 07:17:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FDA32076C
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 07:17:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yllVApm+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DWBvlQic"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FDA32076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xeR2/EEixYgzifoEI4XfthwNJq4D6wHLhYdGBaiBXeM=; b=yllVApm+Vh2x95/38gFrex83k
	V4PkhucoUJ4GKnioclPMo6a+kFtm7chHiQJ9EldqEmLtG3G6keyuH6MRKLvi5qRWW9fECXoOVpZd+
	5FKygKlztjvbGQKgUvhzv/ymcSwk6+zCGQYf5ubkqT6qpLmXEkZv9atr+S6R9YPF4QQKHpo+gOP/o
	ZuxjhN8aakZHFI5pQ0d2RCr88Oyr/XxJuzMgXOe6l/wyveseBV2uPIg8Y8h2gfDtbOwmM9DG92Eli
	kiSFfyiMFeV5wAKg6NMjmMM3B3W+MVlovBoRrVYEd1pEMctI6rOivURinLZyhspm4XZU3DAqOdkBO
	3f4eUyCQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIRgq-0006e9-IC; Wed, 16 Sep 2020 07:17:16 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIRgn-0006cy-Ac
 for linux-amlogic@lists.infradead.org; Wed, 16 Sep 2020 07:17:14 +0000
Received: by mail-wm1-x344.google.com with SMTP id a9so1797704wmm.2
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2020 00:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QRBI10mF4N+0+Kra08TFwTNNSJeLSrUKwPwXHKEl7Js=;
 b=DWBvlQicn2YrBwcRxfxb8i+7y8uKMiTZQESQLrOqMDQ+822l5gc2vXVjFd7BhyuKIQ
 HQ3pA3Teaknz6izx32nSR0C8HE8QPUPpFFo1bRldNbEbE47tnze4Q30xr9l/BfnSvP28
 vuLjQQMmiQqcDejL/R9Lh4kzI5cuDUg7kzVrU9dDo9bi5rASGXAbd/VSzxvlBPd6Y761
 44oy5X5yH0mGyWSEdlIOdVhBmzlE/NPI+XUCIZ2o4jt0pat2x+S9uYJcz/pn09KT0yAF
 1ollNtR00798AlTNFPUWTMUxie/j17mCSIM56rbyfeV8jgnE+XVUvOkTlSo0RYdNppow
 xKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QRBI10mF4N+0+Kra08TFwTNNSJeLSrUKwPwXHKEl7Js=;
 b=Rpdn6T0YYZkDxZ6B4UUx9cRZPE4uccxTNRMvm/CT8cq3R6HFivcDO78DmCXoXRsyDm
 3sQrk4KULw7V5CzbiIoxHqYKdRpJwaMuRUHfV6kP7UMK0OVvteaEJvn7anYU+qkH6+0f
 co4F9NbSB2yamarmuKMCmecONaJStdlfKSSrCYves/qPMgc5G4T51zVz5772UpUcQcZ7
 8CZTWB3TVqPkUTdbaPJmP38Ac3QuXKNTS07Z72gO9jpStW32wSSmRcWW8E2uzeHpEvBi
 jQogA+WN+My74ZNXR9YnddGT60/ZqwT7PKqjsrOtNJuG/WL5Nfv+0w/u3KPZWKWa43I1
 oXLQ==
X-Gm-Message-State: AOAM532Fs1MXFg2U7CWqLGRnepYUwDIrjLapZl+ZrBT1PCFZfq8eRXd4
 Iph/f+vaQXBX5bT5hQghGqjO2A==
X-Google-Smtp-Source: ABdhPJwZ9b9QxHlE5Pd4LWa0J0DyU8OiZQJc/nI4/GGYss1953s52F16/ZDbbvWSiTyKV5uBd4GB5w==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr3029816wmk.157.1600240631896; 
 Wed, 16 Sep 2020 00:17:11 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac?
 ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id v204sm3640070wmg.20.2020.09.16.00.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 00:17:10 -0700 (PDT)
Subject: Re: [PATCH RESEND 2/2] soc: amlogic: meson-ee-pwrc: add support for
 the Meson AXG SoCs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20200904161654.24141-1-narmstrong@baylibre.com>
 <20200904161654.24141-3-narmstrong@baylibre.com>
 <CAFBinCBDKuFkdR_mTyS=cYPAwCzs+TYSh1koR29uTnLmAtugPQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <ee188741-e759-62aa-da41-3859ff2f9cb9@baylibre.com>
Date: Wed, 16 Sep 2020 09:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBDKuFkdR_mTyS=cYPAwCzs+TYSh1koR29uTnLmAtugPQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_031713_401283_05DBD0DA 
X-CRM114-Status: GOOD (  18.97  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 15/09/2020 21:45, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Sep 4, 2020 at 6:17 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The Power Controller in the Amlogic AXG SoCs is similar to the GXL one
>> but with less VPU memory domains to enable and a supplementary Audio
>> memory power domain.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> I have three small comments below - no show-stoppers though:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]
>> +static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
>> +       VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>> +       VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>> +};
>> +
> I would put this above the g12a one

Sure, I'll change for v2

> 
> [...]
>> +static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
>> +       [PWRC_AXG_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, axg_pwrc_mem_vpu,
>> +                                    pwrc_ee_get_power, 5, 2),
>> +       [PWRC_AXG_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
>> +       [PWRC_AXG_AUDIO_ID] = MEM_PD("AUDIO", axg_pwrc_mem_audio),
>> +};
>> +
> same here

Sure, I'll change for v2


> 
> [...]
>>  static struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
>>         .count = ARRAY_SIZE(gxbb_pwrc_domains),
>>         .domains = gxbb_pwrc_domains,
>> @@ -566,6 +588,10 @@ static const struct of_device_id meson_ee_pwrc_match_table[] = {
>>                 .compatible = "amlogic,meson-gxbb-pwrc",
>>                 .data = &meson_ee_gxbb_pwrc_data,
>>         },
>> +       {
>> +               .compatible = "amlogic,meson-axg-pwrc",
>> +               .data = &meson_ee_axg_pwrc_data,
>> +       },
> this one I would put above the GXBB one

Sure, I'll change for v2

Thanks for the review,
Neil
> 
> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
