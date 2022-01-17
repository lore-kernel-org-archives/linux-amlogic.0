Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E64C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 09:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7gcq1AnOQpURUjUSyk/b9BF6/RemrMVAmS7Cc+d8a84=; b=Y9vd2gnM4+Fb/nURlS7k1lItfS
	klocB7koajxZMcc7nWwnE5f6sklLZ0zJSffZMEeNoiDq2rSMbUj424gQ3wnchIHTscZ6UeKaykOR6
	xwtTfGvqs/PHe62i2/oj8JkEOY2dcOyrSo95XGG+N/Ra121Hyzio59z3szygiffcFMbMEoF14wOgb
	V4HXmToYKONmvwcePH1TEet4MnLamt8I9Pyf5SyhjDQfh9uS+o6h74aAWyMi/G8YarcxJUumYoaww
	IOLzlpP6XzUKneK/lleObzSP7SWh5dP8rOGNObfs5SvRz55ePSWymZvsqW8D7qJ6Fu554AP8bb6N3
	DgpSh/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9OeU-00EL20-Fc; Mon, 17 Jan 2022 09:50:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Odp-00EKj4-US
 for linux-amlogic@lists.infradead.org; Mon, 17 Jan 2022 09:49:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so22920430wmo.5
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Jan 2022 01:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vg9TQPfiwbzin51QOtdaT0yqFESMK7CEa0TiWv9naqQ=;
 b=d4zwYR0mg1HNL3eDMrDhGWAmrf+whJSONyPNxNFozfoSK+yh8VDwuaMhmV6cKtxGVj
 9zuNDNmHGxJJ9pQ9tresNEg3axwDF1wJUf8f/W2gAcF4HftJKcXPd4gcWdfraOD/CLXT
 D8TXdPwaX8bc3NehAtHStdQZxh0n2AsAcAYv/FzA5aE+Q8nuXfUhXd7K8+m3zbaCzShk
 IbyCoXL8PcWNFHsxPL945AApzUJUpg/U9Aau8jiR+Oa81Fnq8ViWbcP6ouHKUAUUqgGx
 kD2VVFv+FDgq8ytTb6blBx/doDbBo7Inw0BgM2TLqRUdvmnVDp5pX/ujYHxnNyVmst1G
 v3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Vg9TQPfiwbzin51QOtdaT0yqFESMK7CEa0TiWv9naqQ=;
 b=R7k63GwJBk8GjvG6vR80OOeouLQrfsD2ZS8HWlMbrOnV6HWeLRHFZhvQVVhMdgWlRG
 QN26tRGhDuCAoLGNLO+oMCPT3kzGmiho18d+9vyYpJwW0RYF75gztnzhf49eGOrG74a1
 +lOkAG/UuB+NSBQhsZxqZeGxbnRrzahpeBPtra4yIx5h5Z4/YkkzWPXVqr5j3vKtcN+N
 Nc2qbqeNqIEF0PbTzwhHWEUIB8dv1FWGsWjpU0pamfYZhmKPX70U0YKDADPN9i9vYqAF
 QmMXrZsHy9InQR4+tLAEqHQGmp80GtWaQS/XP/VcKK+g/Og5r1hSPeMdfeYzxAIn1EBQ
 nr+g==
X-Gm-Message-State: AOAM5316oSzU4/zLtQO35WDMYlcFudbcIwuHa/bVTGRFoNE3guJYqe7j
 ybCZp+7wqvmCuXpZr6NDePQRpnOaT4U13w==
X-Google-Smtp-Source: ABdhPJyh1eh2BLJBzybhLeS09xCjVxSfDHho2HHQ50Xo+VKxFruVkfSCg0deONBUrva77Q2BwgC7Zg==
X-Received: by 2002:a5d:64c1:: with SMTP id f1mr3716254wri.87.1642412972276;
 Mon, 17 Jan 2022 01:49:32 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c004:9fe1:fbda:2d0c?
 ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id 1sm11396338wry.46.2022.01.17.01.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 01:49:31 -0800 (PST)
Subject: Re: [PATCH 1/2] arm64: dts: meson-axg: add missing reset-names
 property
To: Jerome Brunet <jbrunet@baylibre.com>,
 Alexander Stein <alexander.stein@mailbox.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <20220115093557.30498-1-alexander.stein@mailbox.org>
 <1jilulav4u.fsf@starbuckisacylon.baylibre.com> <4732096.GXAFRqVoOG@kongar>
 <1jfspnpoxh.fsf@starbuckisacylon.baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0a51873b-429f-5905-5bf2-9406f578223b@baylibre.com>
Date: Mon, 17 Jan 2022 10:49:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1jfspnpoxh.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_014934_040605_8246757E 
X-CRM114-Status: GOOD (  20.63  )
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

On 16/01/2022 18:30, Jerome Brunet wrote:
> 
> On Sun 16 Jan 2022 at 10:49, Alexander Stein <alexander.stein@mailbox.org> wrote:
> 
>> Am Samstag, 15. Januar 2022, 16:04:10 CET schrieb Jerome Brunet:
>>>
>>> On Sat 15 Jan 2022 at 10:35, Alexander Stein <alexander.stein@mailbox.org> 
>> wrote:
>>>
>>>> Bindings amlogic,axg-fifo.txt mandates that reset-names is a required
>>>> property. Add it.
>>>
>>> Binginds *mandates* ?? the bindings you are adding mandates that, not the
>>> previous doc, nor the driver.
>>
>> Well, under required properties 'reset-names' is listed as well as 'arb' is 
>> required, only 'rst' is optional.
> 
> I think there is a misunderstanding then.
> The arb reset is required, the "reset-names" is not - as long as there
> is single reset.

To be fair, it's not explicit in the .txt bindings at all:

-- reset-names: should contain the following:
-  * "arb" : memory ARB line (required)
-  * "rst" : dedicated device reset line (optional)

Anyway, this should be solved, it's pretty common to have reset-names mandatory even
for a single reset if a second one is optional.

> 
>> So when creating the .yaml accordingly this leads to warnings this patch is 
>> about to fix.
>>
>>> Modifying drivers and DT to accomodate made-up bindings requirement is
>>> disturbing.
>>>
>>> The bindings should not require that because the driver does not, as it
>>> stands. The driver requires the arb reset to be provided, not the name.
>>> Please fix the bindings.
>>
>> Nothing is made up. When creating the .yaml file I took the .txt documentation 
>> for granted. How should I know the bindings documentation is apparently wrong?
>>
>> When using your older bindings conversion [1] I'm fine with dropping this one.
>>
>> Best regards,
>> Alexander
>>
>> [1] https://patchwork.kernel.org/project/linux-amlogic/list/?
>> series=246453&state=%2A&archive=both
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
