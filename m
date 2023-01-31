Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7970CC636CC
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Jan 2023 12:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VXGMDhzQeA0alf0mHA/gnvMdTY+9UASKLmyUwBsayU=; b=ocnpr4QNTv5kcU
	0B91SdJAx8iEPQzoRBHfVJdm6W+7WIaayhWryccJj9to8llez0ztG9niFGjNhKx3kRgRXu/ZJC6Ms
	MJw4Em8eJbg8mvR77SIRGtVx0qbWv//PhhJZyL3qtGy58nahoPS0LT4H+z9amXLfobJViEgbYuZnX
	sq2dsdVDcIKO4MLYwAXClp93bK7Q8UseU93tyTrog/+Q2v7dfynLrXOkLPL5OF2jSonUffxmI3JTC
	92cNcZuOGDDCFWuvXJWDH2YsBJ0TJPur5atqI8csDSwUZmgmNuak6Hx4tgbkHKPuphsFxoPJE/Yxy
	U3arkWHSr5RRMgKp2cfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMpRa-007pSt-0w; Tue, 31 Jan 2023 12:08:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMpRO-007pQW-17; Tue, 31 Jan 2023 12:08:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so12292011wmb.2;
        Tue, 31 Jan 2023 04:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXDBZJ6DQUY8q0H3Hr2CjoKCJTKegFU0gvkcrKVlUm8=;
        b=Um/QK2syyNaHd7z4OL6702+EXwRz/T348pEAcYiLDPND5wbYyUCRQWtALLMmvDsQBU
         p3K+wshyt/lzFH/IT7nZfMUB4pQFvB3HErxjx9k80jlaggnW2rbN9edy+SMgKXhqIGs4
         TVM2YZOLas0Oc0aQds8izYzC3kLT2qEM9Qk7jUte2gysk2ypf/qteviErx6YR90BOShr
         g4a+IQEJ+PsETuML4+u2aMK+NZo8jEygaB4rsMihUHMem0887YOgx0YtuJJKt8OrozpT
         tl9uXjXSJ6zSxup91ZPJhXZ6m2ATUrvgc4gDFWk+CWBO5mCIXf/gzlce8aw2FU1Ov74S
         cZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXDBZJ6DQUY8q0H3Hr2CjoKCJTKegFU0gvkcrKVlUm8=;
        b=GWykZsYVK5+yeILlx08ChVRtMdJLmdM84V4ocrgOwdPZlOJX0KU8e3EYzYzd0yofx5
         XBDueDtO5oyGpqUQ9fI7jLwT/VmgJ5lPnSkP3tsd3xWezZxIn4mBoPekPWPahbEKw0jm
         ZTTGRvi5oNj9DHqQGp4qAEVqOstIn6TDx58GDG/DZi6LdDMcO6tpXJPPs7Hcg0s05/Js
         2xcTat0t6qy/Hxzwkkv4doZ9u1E8Hyns/gWLFwZKlbC1RKMdiFlW+txl/XkQaf0+D3zm
         60UBIMaBclugX+0Jz1ZpHBetQEOqX918esWx1EPhgdj564lSlFMwJIuw69FZYFjbYT0K
         jjTQ==
X-Gm-Message-State: AFqh2kpdD2N8uf4oQMGfzJSoR0YWEF5Ut7X9AkiKqEGaDpSfaHVakZoZ
	Nr0EjRaI4IsAuZPfzOlzpj0=
X-Google-Smtp-Source: AMrXdXsaZQUdGmic2BZ6FMNOzUuZgIOqj5Q3IsiAqEobxr97IKLkl5nS3Yi9qN7VSdO2D+GCSMjslA==
X-Received: by 2002:a05:600c:1da6:b0:3da:107e:a1e6 with SMTP id p38-20020a05600c1da600b003da107ea1e6mr53003349wms.17.1675166924182;
        Tue, 31 Jan 2023 04:08:44 -0800 (PST)
Received: from ?IPV6:2a01:c23:b8ba:6a00:a5c0:1088:ecf4:92db? (dynamic-2a01-0c23-b8ba-6a00-a5c0-1088-ecf4-92db.c23.pool.telefonica.de. [2a01:c23:b8ba:6a00:a5c0:1088:ecf4:92db])
        by smtp.googlemail.com with ESMTPSA id d11-20020a05600c3acb00b003db30be4a54sm18918566wms.38.2023.01.31.04.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 04:08:43 -0800 (PST)
Message-ID: <74963e76-e417-c044-bd1b-7c6d53fc6994@gmail.com>
Date: Tue, 31 Jan 2023 13:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
To: Jerome Brunet <jbrunet@baylibre.com>, cphealy@gmail.com, andrew@lunn.ch,
 linux@armlinux.org.uk, davem@davemloft.net, neil.armstrong@linaro.org,
 khilman@baylibre.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, jeremy.wang@amlogic.com
Cc: Chris Healy <healych@amazon.com>
References: <20230130231402.471493-1-cphealy@gmail.com>
 <1jbkmf2ewn.fsf@starbuckisacylon.baylibre.com>
 <671d564e-db1c-ed61-3538-97dd1916714d@gmail.com>
 <1j7cx32c4y.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <1j7cx32c4y.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_040846_103424_CBC5B28D 
X-CRM114-Status: GOOD (  18.06  )
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

On 31.01.2023 11:59, Jerome Brunet wrote:
> 
> On Tue 31 Jan 2023 at 11:38, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> 
>> On 31.01.2023 11:05, Jerome Brunet wrote:
>>>
>>> On Mon 30 Jan 2023 at 15:14, Chris Healy <cphealy@gmail.com> wrote:
>>>
>>>> From: Chris Healy <healych@amazon.com>
>>>>
>>>> The Meson G12A Internal PHY does not support standard IEEE MMD extended
>>>> register access, therefore add generic dummy stubs to fail the read and
>>>> write MMD calls. This is necessary to prevent the core PHY code from
>>>> erroneously believing that EEE is supported by this PHY even though this
>>>> PHY does not support EEE, as MMD register access returns all FFFFs.
>>>
>>> This is definitely something that should be done, Thx !
>>>
>>>>
>>>> Fixes: 5c3407abb338 ("net: phy: meson-gxl: add g12a support")
>>>
>>> This commit does not seems appropriate, especially since only the GXL ops
>>> are changed, not the g12a variant.
>>>
>> The diff is a little bit misleading. The patch affects the G12A PHY.
>>
>>> This brings a 2nd point, any reason for not changing the g12 variant ?
>>> I'm fairly confident it does support EEE either.
>>>
>> Supposedly it's a typo and you mean "doesn't". Neither Chris nor me
> 
> Indeed ;)
> 
>> have GXL HW and we didn't want to submit a patch just based on speculation.
>>
> 
> Ah - Ok.
> I've tested something similar recently while working on the PHY.
> I confirm that both GXL and G12a should stub those calls.
> 
> ... maybe in separate patches to help stable backports.
> 
> Do you want to handle this or should I ?
> 
I can take it, will add your Suggested-by.

>>>> Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>> Signed-off-by: Chris Healy <healych@amazon.com>
>>>>
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> 
>>>> ---
>>>>
>>>> Changes in v3:
>>>> * Add reviewed-by
>>>> Change in v2:
>>>> * Add fixes tag
>>>>
>>>>  drivers/net/phy/meson-gxl.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
>>>> index c49062ad72c6..5e41658b1e2f 100644
>>>> --- a/drivers/net/phy/meson-gxl.c
>>>> +++ b/drivers/net/phy/meson-gxl.c
>>>> @@ -271,6 +271,8 @@ static struct phy_driver meson_gxl_phy[] = {
>>>>  		.handle_interrupt = meson_gxl_handle_interrupt,
>>>>  		.suspend        = genphy_suspend,
>>>>  		.resume         = genphy_resume,
>>>> +		.read_mmd	= genphy_read_mmd_unsupported,
>>>> +		.write_mmd	= genphy_write_mmd_unsupported,
>>>>  	},
>>>>  };
>>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
