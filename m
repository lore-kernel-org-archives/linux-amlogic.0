Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6738CC31E44
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 23:29:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F8F21721
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 23:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZRk/Jdbn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="heQKtZwm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F8F21721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdoJXcAGM+kk7Mmx5FhglwF4B9qZEZuz4RslhlIYv10=; b=ZRk/JdbnhaiQqd
	oI6B7SwLpDyo1ymXml2CDcVAtydnBwAbl1RZL+2QEXxi5LFPTbn/BV6/wBdnxKC8coMxjzTFuJ9k2
	Tp1gNvhcXo9zotF4Cf/eyfbKkx3cglAeeugWx2UCUgcQPpRVUYw2UsQHJRT14bY/aiq3SAQHadUAh
	EeLC+0TF296/CtG+rA/HQbd2/iFNsDBHmeU9iarMajGs7ZRECFGNjWbtwTzqs4cwjejvBhgDzLRtN
	G3STm9VwlLxcLNy69CMqSH0QLcyq3DBNkifyx6Txe5hqC6NLn8uZhDKNTFKjqHKIVVpsxO3urgQ6w
	ZK6v8d8tp1FtDOVgQe2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haqCG-0000bI-1o; Tue, 11 Jun 2019 23:28:56 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haqCD-0000ae-E9
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 23:28:54 +0000
Received: by mail-pf1-x444.google.com with SMTP id s11so8377451pfm.12
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 16:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=+oMmkCfixuI/MqPYHub3W35V/q9CnrMMpoLjwoXjlsg=;
 b=heQKtZwm9AYpXp4xFj2WNqLeBV6TSqS+fbbwm3nUiGF0ueyGWMc5iH8uau3G+73CkY
 KJiIn0dJUCjTA1gUeYJv6Tao99oW/4d+ObEIOA+7kczKgDDaIccrv2xK51zkyjOKwlk4
 lyCeKfNvBqg9DctrZzfhfbAjN5WUeZtJjp3OmqUqf0CRhqHjFBFwmnJTp+GeRkc/inhZ
 3Mcm6Wp7bO17hqFK0m7LBS6GgOHYymrU01Sqbp7JriYcorZ/fp8vWhYcvPkz27Dut+lZ
 Dzm06Gd4m6aYSWzrZudV8U3FR0/iZUzyewsMF4yifXMvHHx9ym+jtX0ZdZsk8Cqk13as
 MVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=+oMmkCfixuI/MqPYHub3W35V/q9CnrMMpoLjwoXjlsg=;
 b=B62v1nSeikk1HvdaoA5SA1mQtqaqKV81XW8uF0NimHXdT97bIxGjhSWFNblNvj81nF
 6TgJJVY1nMn32XLCmR4FhGaMS3ICv4tf4YbLMYmkgg/4btdf/008wa+ZmdYVFl7MeZCh
 TQ+zudbP0Slp1JZfVhjFghHwZ0l9KHgeB2ZQtY19o1LqLwRczNPXOhDk0rFZQc2zXLd7
 YZxGjv1FgDwHt1VgjaDhoZjR5M3nw2azcMAOHmCknANgzd2rxxsO7mwnE9k1oJxhDpvN
 Bh5hzlrYyeU56dFWi5y4NzSemDFEJVNEL6y04miOi9Uqw3HfP8fQz3hDT7YuYE42Nt8w
 eHFg==
X-Gm-Message-State: APjAAAWqVz0/TDy10MGfuOZExAnftZpUXEsCTt1N+NVO12gV+piAlreJ
 QlPZodjA4sj2ZBLrkKyqRc9AkQ==
X-Google-Smtp-Source: APXvYqyypyOI2ab62NriV/Ikw2ubSujEH42W7AEpYKg52+a33UKb21IRMffBKdbn2eKlFyi34SuhAg==
X-Received: by 2002:a62:58c4:: with SMTP id
 m187mr25340442pfb.147.1560295732812; 
 Tue, 11 Jun 2019 16:28:52 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id f11sm217738pjg.1.2019.06.11.16.28.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Jun 2019 16:28:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: defconfig: enable Lima driver
In-Reply-To: <d3275b3d-7b1a-369c-11c5-e62553a383cf@baylibre.com>
References: <20190606085645.31642-1-narmstrong@baylibre.com>
 <d3275b3d-7b1a-369c-11c5-e62553a383cf@baylibre.com>
Date: Tue, 11 Jun 2019 16:28:51 -0700
Message-ID: <7hy3273dn0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_162853_480260_693CD3F0 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, arm@kernel.org, olof@lixom.net,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 06/06/2019 10:56, Neil Armstrong wrote:
>> A bunch of arm64 boards can now use the Lima driver, let's enable it
>> in defconfig, it will be useful to have it enabled for KernelCI
>> boot and runtime testing.
>> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index d588ceb9aa3c..7e9d684332be 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -505,6 +505,7 @@ CONFIG_DRM_HISI_HIBMC=m
>>  CONFIG_DRM_HISI_KIRIN=m
>>  CONFIG_DRM_MESON=m
>>  CONFIG_DRM_PL111=m
>> +CONFIG_DRM_LIMA=m
>>  CONFIG_DRM_PANFROST=m
>>  CONFIG_FB=y
>>  CONFIG_FB_MODE_HELPERS=y
>> 
>
> Hi Kevin,
>
> Could you apply this changeset on the linux-amlogic tree ?
>

No, this should go through arm-soc (already cc'd)

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
