Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789FCC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Dec 2022 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQ1mbcRaHQHZ/7vN9bPmzeBB9beeqd1R6RhWwTSiJR4=; b=1TzwgaaWE1N/uSHxNMYYNmkp0a
	yJ/nRcIrxg4OPIpZXaidU/De8uC2QCuXKh1dlfZMmTArZceifZivC6QoxZ6dusbi3WF31mNz5bedd
	nNmQTKqZCDX44DBr90DdziMro48BaSbshSA24u8tTjjKKHxkbr0NzAv7++EF0oBZXdRdTMigxfpr2
	Lf8NZVN6onNAlq7kGT8aNp0JYzPZ021e1/pwISzsgfXZiedAerV1IE00/ryl9FgYLNTUNhIybeo/w
	pvAmH7k9WGzIJ0xuBUMMrBA7E3Y7YSTS1e2lsezJTHMdfcNFzhc9C8Lh+emCoekraliUrjAuk7Xl+
	5DElRX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GMh-00E90J-8h; Mon, 19 Dec 2022 13:39:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GMc-00E8rA-Hd
	for linux-amlogic@lists.infradead.org; Mon, 19 Dec 2022 13:39:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id ja17so6410937wmb.3
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Dec 2022 05:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1eJTlOqCtrihk3Gg21V8dQYsdgDl4F1H5eYjhzPujE0=;
        b=Y9z1WBza5r8pWfzE69ImVTNVurRd5EpiAbtCPsQ6/9Aq2O7B6zeihUsmgGyYotEExw
         +rtg0r1cPNdwWhimrV1yNa0ux0uZwxGIG/3YRdtkW06wymC4a90klvh0cOD3Q0i/lS9D
         eQrWs6P21d4u9942As4n0ZHo5gVS5Jpp71xmAEqDTQzcfZpV2Ox44JwdCehgQEqtwGcL
         TT3Jj8Z9dX6tjpl1AsYiA+j4oFsq4as/83L+eXJpculiE9sPj0+yAKmi4OnPtUhNbayE
         YuRmHij0QN+QgawTWlo66S19/FJ29079Y/7nFOqUhPNrwBZhNVKIx1IWQHBLizp8a4ch
         qeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eJTlOqCtrihk3Gg21V8dQYsdgDl4F1H5eYjhzPujE0=;
        b=Myr/Fz3IxcLOwKdJTRgHgXehJIpt+a7p9MfjNV4cfuA2BCMbD8Zvr7YZh0DHy6hNcU
         9rM3vEaACNIAs7UzD9GigwLXWoYtvEQiYoiabTdrSxYXqngIc4j6RL2dRXsiFBUz5z5e
         qwLIC2KZBoQ/5YfVSJOITAbxOgO3Q7nK95/9MgpkGtRysIRhrmnlazBhs05ozsgmJQYB
         dieKQmyZPjYh49lzXKo0OVFWfFnYCGeaXCQpAJXlnv29pwHRoOCu9ubvfSD+J9h4mX32
         3H/F5CSo5NPN2hIPeKGuw32qoU0T6c+JC6ekqvXFUTeQGslReFPkmQq6WfnD3P0iFVXQ
         S/YA==
X-Gm-Message-State: ANoB5pnRJDzDvxM4kSRioXhSG/qrzlbqlujMwi6kmfqUbZjuv8RtQnkl
	KXNLztp1VFUfp9wOQxKOkm+/6A==
X-Google-Smtp-Source: AA0mqf4a6fqcvrgJrGfU4fb1b0iuWJiHP1eO5lcDmkcFZt/wjj8YvE5SrpFx8GQb9AfR9AlP5t/MnA==
X-Received: by 2002:a05:600c:4891:b0:3d1:fbf9:3bd4 with SMTP id j17-20020a05600c489100b003d1fbf93bd4mr31975057wmp.10.1671457166878;
        Mon, 19 Dec 2022 05:39:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:976a:eb00:7b11:28de? ([2a01:e0a:982:cbb0:976a:eb00:7b11:28de])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c1d8d00b003d01b84e9b2sm12598022wms.27.2022.12.19.05.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 05:39:26 -0800 (PST)
Message-ID: <cf327e3e-13d9-6637-5189-70c65ccbcdb5@linaro.org>
Date: Mon, 19 Dec 2022 14:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: Reduce the FIFO lines held when AFBC is not
 used
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Carlo Caione <ccaione@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20221216-afbc_s905x-v1-0-033bebf780d9@baylibre.com>
 <CAFBinCAfF-=776E3k=NnhaG+rMCp3b=WbjkN=RKGG8vM3Cn-3Q@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCAfF-=776E3k=NnhaG+rMCp3b=WbjkN=RKGG8vM3Cn-3Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_053930_701409_7FBD2EFF 
X-CRM114-Status: GOOD (  12.65  )
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

On 19/12/2022 12:00, Martin Blumenstingl wrote:
> Hi Carlo,
> 
> On Mon, Dec 19, 2022 at 9:43 AM Carlo Caione <ccaione@baylibre.com> wrote:
>>
>> Having a bigger number of FIFO lines held after vsync is only useful to
>> SoCs using AFBC to give time to the AFBC decoder to be reset, configured
>> and enabled again.
>>
>> For SoCs not using AFBC this, on the contrary, is causing on some
>> displays issues and a few pixels vertical offset in the displayed image.
> On the 32-bit SoCs (for which VPU support is not upstream yet) it has
> caused screen tearing instead of shifting the image.
> 
>> Conditionally increase the number of lines held after vsync only for
>> SoCs using AFBC, leaving the default value for all the others.
> That was also my approach (for a not-yet-upstream patch).
> Since it's affecting already supported SoCs I suggest adding
> "Fixed-by: 24e0d4058eff ..." (maybe Neil can do so when he agrees and
> is applying the patch).
> 
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Yep I'll add the Fixes tag when applying

Thank Carlo !

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
