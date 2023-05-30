Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF0BC7EE2E
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 07:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haB5MGh4ePsl+kZbTOVduIDDhtvmgon20Bdei/z/75E=; b=DuluGHngO/XEIXIX++XeU1euIP
	1zBd4UIpWrjxMJaSoMphhv0XBrJV+UjnjSGJWK+4Edf1cVJF/mWCIuPFHjO+rFxPWtemTSXJkEekm
	uDWdb+tZ4O0BsdzcRrcTVVHGjlFxWKWCjqMZFngUBl3LUlNCM3MRuMih87xH7FENWxFnsYu5C4gpO
	TinW6C7uszz+7BKy9kZIfthGRbTI7UlSQaEpM3BT6ZgiJkLwEaBiKU+Wv3Mh/OIX4EiFOGsYFkNsl
	xPWomPAJ84LzzQVPdu3eSQSLQbXvGELhBp8EWA40QtaEvsJthnoPDaKJamd5GK5Do92xE1A8cvYOL
	2FldRdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uBi-00Coyn-28;
	Tue, 30 May 2023 07:54:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uBg-00CoxJ-0d
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:54:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f60dfc6028so42923455e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685433274; x=1688025274;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DA/3B+SHE0fkJ+Wo2f4qsn3tPIj95QnCk0y9raYNCPM=;
        b=wfEH7XNHddNx44QhCziP8DE7gd+9Y6RvtnBPy/Y0eNZ3ULJ0JXblXivpHAFE6oGHqW
         1ua2pYBpR49XCs9IzhubDQU4zAL0cUZkMJJXRznGNeB4UrYvbUOYbSCZR2xNz9lNuxCM
         9TIAp9FZ9jAYv5K/hMSR3MTiCEgHO/RWZor1Y8pIbUo+BIwG51nhgeiPjN98/ROvEyqP
         TvRMmjrUtgTSChCzqHIrCw76xcRPEW+1h5Mh8fitChqjyZwdV8m7B7dIUtZ91Q7d9Q7C
         IlgnAS/sGg14ZeSds9F2evciVcGVHk4L5r05jOfPEZPwLplrYtZLGJnFxVa3bk6VREXb
         3XMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685433274; x=1688025274;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DA/3B+SHE0fkJ+Wo2f4qsn3tPIj95QnCk0y9raYNCPM=;
        b=Or2t8ErkP8h6BxbY/mhBcY2bbqsrftBEqDN6Dbnq7twggZLB9KhvUqgde8ekN0I01f
         kF4TnHAsN+ZtvEQSIOcOJtxFCnvBjF2u+IeaRdli53g1Ej7IvxTZY+K1zj5gtZctjELb
         RChZuZVOE7xWfDDDVPITU1DxY4doQB3RgQkwSysgdDgVO2Q/JARzpqEffzI92AKshN2t
         hR9txeyUfZUdRE/2rw/g1X06XZB1Xw/nis05EKUw6eoKnspEbQ5MAZHHAPNaK0wlSf9h
         bmDZUOA441s1SHq5bYp1g33M20V0F/DQV7F3xRyI5MY1f77yMZXeejfSYWPJzj0jRMpI
         FEVQ==
X-Gm-Message-State: AC+VfDzs0HQwioMGCzmEYsF0R76Std66dXXzFrmWfzo6M0JAzCkSiLxQ
	DmopnO+sfZKTLVaZICS6PGyOKg==
X-Google-Smtp-Source: ACHHUZ4XGChBG7YEV6Ww/s5OZEtTPMpvOUU9y6Nm7ba81NxW/r+ynfuDkeRw++SxZBu9uEu4909twg==
X-Received: by 2002:a05:600c:b44:b0:3f2:48dc:5e02 with SMTP id k4-20020a05600c0b4400b003f248dc5e02mr814437wmr.27.1685433273970;
        Tue, 30 May 2023 00:54:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87? ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
        by smtp.gmail.com with ESMTPSA id u3-20020a7bc043000000b003f17848673fsm16450709wmc.27.2023.05.30.00.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:54:33 -0700 (PDT)
Message-ID: <2fbf32db-c013-829e-317b-f17e170ac472@linaro.org>
Date: Tue, 30 May 2023 09:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] media: rc: meson-ir: support MMIO regmaps to
 access registers
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230517115635.31565-1-zelong.dong@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230517115635.31565-1-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_005436_240722_20B857A2 
X-CRM114-Status: GOOD (  11.29  )
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

Hi,

On 17/05/2023 13:56, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> This patchset add MMIO regmaps to access register in Meson IR driver.
> For defining clearly, sort/rename IR Controller register macros.
> 
> Changes since v1:
> - move the cleanup/rename to a separate patch.
> - use devm_platform_ioremap_resource() instead of platform_get_resource()
>    and devm_ioremap_resource().
> 
> ---
> v1: https://lore.kernel.org/r/20230511034333.26800-1-zelong.dong@amlogic.com
> 
> Zelong Dong (3):
>    media: rc: meson-ir: sort Meson IR Controller register macros
>    media: rc: meson-ir: rename Meson IR Controller register macros
>    media: rc: meson-ir: support MMIO regmaps to access registers
> 
>   drivers/media/rc/meson-ir.c | 125 ++++++++++++++++++------------------
>   1 file changed, 64 insertions(+), 61 deletions(-)
> 

Patch 2 & 3 doesn't apply cleanly on v6.4-rc1, please rebase on the latest -rc1 kernel.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
