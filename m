Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D492C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9j1UO5+pLSvn+C01yHlB6JDikmktN1m5sG4FjK9MXtU=; b=OQeJAQp31NYezl3dUxi5yrl1Tx
	DNkzxgggo4QPvs1Uhk9gvno0FO6DZJ5nzyq3VQ1YkGFWcOC2QkUWvckIuY8uA1yrXCQp6p2G1jc8g
	AsTxgCPJscF1wEkbov4rSUngQTMlqBymIZp9SIfBs5bnmernmCTyGWfVVtAMWAS7rTvvRNiX/MCDu
	7gm46Imcrk2KRauzqb4YAM0wnc/lOlvXmvZgVUXCQ+bK5S1Sr93/4zGOjxZsTYC77GJp6zseDszcW
	Q6XS+/4c9oB/1i3r4f4Zd6jp018Uu2THXdu3OF8lwIK4kr5znCyCxsslrxVLd2Ec5YxAiPhUl2R6R
	7jFbLQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11nd-00EhNC-Jr; Fri, 02 Dec 2022 08:53:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11nS-00EhIS-Op
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 08:53:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 125-20020a1c0283000000b003d076ee89d6so3306936wmc.0
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 00:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QxYMAsGyR71I9W5SUgkWB+llmDVJb8G0ACBqsOItD8w=;
        b=VWWxBi/mto+dbgJ+YJ7AJhtfhqMmQVeNQL9WGGDcTlx+jwxapK3HeUhhq7B3+P9MIH
         4KAQaQ1imzwCLnTirIDeQE/0DdAfCP9zK04WuufUJLgPb7GdmxrWdUn1ZWyWlbmMN686
         nN1vUTPTRicwxC5Fw5+o+PK2nfNtX5IYgaWQMiFL6mJsMrqJ5FA6Vwfn/CayGreDm71D
         8RqkEba2tBVAcx6JY/WWnoPuZ+SGts6CoBuLiH1giBZb/PbFI9TUeIb8m2+SJGzZUlck
         gwKGVu4/Kj+uK78efWmT+uVcZJRlAr6v5FJ8ZOyTTV+YjJ7Tuv3ZAmTEPVnuSdVOZ0m3
         T91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxYMAsGyR71I9W5SUgkWB+llmDVJb8G0ACBqsOItD8w=;
        b=3+lGGNAP+5MSExqXj4NWNOOzJy6Y1LnZlaz+LSZ0KZkkNlYfpGTn58A3nD3qMyNXKn
         Q/pmESoAPjspw1bkD2bJfqt8kqhsLTJGFyAW+vlb5wvaSZpUsvzpXV4eV73RAVpwJ/p0
         OX9IVdpzcKsinXZZOJVEwH8kkOPS2QtTsS8YCMjT2heC0x7Yfuoh2iksAi/zwU8B0BJf
         0gHtcH6NWZJK+544kkwLnX4AqqMiyQ9UrWGT4Qau4sc8Rb71i+ShEGp0lPAjYsqjuDvk
         pxjQn6TwZwtzioUCzu9ZDasL9fVeOpoxPKyeZdZOvNSIWAI2R51zJYMPbrxt8Arnj9D3
         71JA==
X-Gm-Message-State: ANoB5pnxN5/1hLEF+l1lusiELa0/eFkpQDxQf+F8b8YS/fnbzyRdJhjF
	KnyWP1gbjvVU5AoIiASk4qnsqA==
X-Google-Smtp-Source: AA0mqf76iCLnpL4DNa1AXxs+nKSmcg+KY3QSSiwfiuYE8GJ1CwfTAQCHoz170ug0rrN6daek6w1AmA==
X-Received: by 2002:a05:600c:4f01:b0:3cf:8952:2fd2 with SMTP id l1-20020a05600c4f0100b003cf89522fd2mr42157915wmq.9.1669971203363;
        Fri, 02 Dec 2022 00:53:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c6e:eb0:b551:55ee? ([2a01:e0a:982:cbb0:c6e:eb0:b551:55ee])
        by smtp.gmail.com with ESMTPSA id h12-20020a05600c314c00b003cfa81e2eb4sm8969203wmo.38.2022.12.02.00.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:53:22 -0800 (PST)
Message-ID: <f1eeffde-3940-4daa-0307-68ebc0485228@linaro.org>
Date: Fri, 2 Dec 2022 09:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/7] soc: amlogic: meson-pwrc: Add NNA power domain for
 A311D
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
 <20221201103026.53234-4-tomeu.vizoso@collabora.com>
 <CAFBinCB1pZm0AaJq4_dsVksdp7RP+aTiXK04wFeLQ9vChbkYCQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCB1pZm0AaJq4_dsVksdp7RP+aTiXK04wFeLQ9vChbkYCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_005326_918028_B27547EC 
X-CRM114-Status: GOOD (  13.75  )
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

On 01/12/2022 23:43, Martin Blumenstingl wrote:
> On Thu, Dec 1, 2022 at 11:30 AM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>>
>> Based on power initialization sequence in downstream driver.
>>
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]
>> +static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
>> +       { G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
>> +       { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(23, 0) },
> I noticed the discussion in v1 of this series where Neil noted that
> you should change GENMASK(31, 0) to GENMASK(23, 0) (for
> G12A_HHI_NANOQ_MEM_PD_REG1).
> This is all a bit confusing because the S905D3 datasheet mentions that
> the HHI_NANOQ_MEM_PD_REG1 register uses the full 32 bits.
> I'm still fine with the way it is right now because the datasheets are
> not always perfect.

Yes they're different in G12B & SM1
Neil

> 
> 
> Best regards,
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
