Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D831FC10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:26:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7DA02083E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CZorWNQi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WBBikcoZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7DA02083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duUJnsMf8OT61qSLWq2fVi3jOnlHAlwtU0ii2ypCNuc=; b=CZorWNQide7XWG
	G+fFQyaAr6KBv/00S4U5aSQrmKmm4g4Dl7P8mwLUYvIMDhkvC5RDos3K/JiYfWXNu9LIhZdvacrF6
	v5WTRO6QXqt8W5kVPT2fN0oV2130TJfRId3kZOauthXZG1PPa5dkOUdu6If0lhiUhQRkTRxBIFW4R
	JJdH+NC6/whZTxqB5cyTk5TPLzwIMW7h6v6ajEE6bvbTlS+lp6ZHxOXuN2rsTFumxtLQMlelm+Yvw
	XVzcMlz/hvkbd/XSSBNN4XzE0f/4t3ca/vD0zrLuSRqVgm19I4tkmnjM5wHZ0WS/Hmm8wQrPqzTLc
	lD1yN7AbGFe7GfyfjNDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hErVf-0000K1-6B; Fri, 12 Apr 2019 08:26:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hErVc-0000Iz-0i
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 08:26:05 +0000
Received: by mail-wr1-x444.google.com with SMTP id p10so10811207wrq.1
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UOW41HO6lrsR+5mvtCNU1KtBZgKhCRxtYa63HbUZJOU=;
 b=WBBikcoZHOSXicIGtDHTwg2RtoqwmlvNRR8voCOgFOeKSjFXhUaAYc0hlVR30kAOE2
 PA0zGiHNtsyhL1McDLJgBWv+ARyItcgfrYFPgn77HX5iUWuYzkZn/WYTxqTA+ZlUwU1h
 qUNhk1PCBt7qepZvER6Tli1XgueXEIHwnYE2P0kml+STzjWIazH82s+fGYUCkC5BKl60
 0B9eeuKca2rgQSwZm0dYrMSEjonFSA8fj1xofijZ4+Ydnd9ZGfnmuYGZ886BfFMLl10F
 51YfyeZSYQx22O0g3I3HGD7nsuVEFsf172MWdN/u1omoEbs5hl6xb2w/nFhx+c96PO2e
 UQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UOW41HO6lrsR+5mvtCNU1KtBZgKhCRxtYa63HbUZJOU=;
 b=hXkegJDO7S8KishKX0JzU24CVwrSvbvcORJgZcDbuQBnHzJQJhgRwY7PMvhEtI0ddB
 vI/J7efuN5b/E9IWKW6NC2w2BnpK5aW4cZtMuzYYpTh1/HkmwqQeFJgd6xQVO6peJN59
 oDL+kAjFaagRNjhgaNWQq9HmsdGurF15tlquqK5h0+vW3kk0fQJFTPRiL/GW3aM/H0O0
 o7dbNhY/Oorf+uoLqAwbdZaz/dvNZF2b45kmgBoVwZqGh8Xbq9tuQTzHmFl208dwBcmK
 AopCmwEJlcq+X5erLCxyc9F7mJBcS5WmjJtPW3cXqb88v+Y4dzOZa+ApubNNxrroQ5y3
 nOcw==
X-Gm-Message-State: APjAAAW8sNUqekO/KPDYHDMz2XE9fpop/UHB7Fbeqfcc8a1CpPwy5zKf
 8cBT5wtV1nnidkDnKlj+qvdZeA==
X-Google-Smtp-Source: APXvYqxXnP+B81+W5eB+L4owjsY8VobAmLyuh5RAdQ9I0t2cV8IAAjIvYGOKGN9XPftPTh3+tAepTQ==
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr17178944wrx.76.1555057558348; 
 Fri, 12 Apr 2019 01:25:58 -0700 (PDT)
Received: from [10.1.4.98] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e7sm9375295wme.37.2019.04.12.01.25.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 01:25:57 -0700 (PDT)
Subject: Re: [PATCH 2/2] clk: meson-g12a: Add Temperature Sensor clock
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190411084537.30299-1-glaroque@baylibre.com>
 <20190411084537.30299-3-glaroque@baylibre.com>
 <CAFBinCBVmPa5hi83B1ZTe-guassHxKQFrN5QOyMJc9s95LJ1cg@mail.gmail.com>
From: guillaume La Roque <glaroque@baylibre.com>
Message-ID: <fc4e0fbd-2643-2f37-9cdb-2ec162826e76@baylibre.com>
Date: Fri, 12 Apr 2019 10:25:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBVmPa5hi83B1ZTe-guassHxKQFrN5QOyMJc9s95LJ1cg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_012604_247655_070A788C 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

hi martin,


On 4/11/19 11:38 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> On Thu, Apr 11, 2019 at 10:46 AM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> Add TS clock used by two temperature sensor
> thank you for working on this!
>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  drivers/clk/meson/g12a.c | 31 +++++++++++++++++++++++++++++++
>>  drivers/clk/meson/g12a.h |  3 ++-
>>  2 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 3a3134976534..e6d2af6ee8ea 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -2335,6 +2335,33 @@ static struct clk_regmap g12a_mali = {
>>         },
>>  };
>>
>> +static struct clk_regmap g12a_ts_div = {
>> +       .data = &(struct clk_regmap_div_data){
>> +               .offset = HHI_TS_CLK_CNTL,
>> +               .shift = 0,
>> +               .width = 7,
> buildroot_openlinux_kernel_4.9_fbdev_20180706 uses ".width = 8".
> That matches with the public S922X datasheet from hardkernel which
> states that HHI_TS_CLK_CNTL[7:0] is "ts_clk clk_div"

sorry for this error i'll fix it

>
> Martin

Thanks

guillqume


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
