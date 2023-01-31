Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329C0C38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Jan 2023 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7B91o/m1ktTcKSco0LzEQAoef2DIee3FK3pw42l0rQ=; b=H2QJVX+VtuuuR8
	ZjSKEgxdoBBSOg7T4hVQl0rNtXiS0i4p2Nlen5huHHuMmK34+pOnh2YumoJbvuJSHaZuURCQjPdUB
	aSIB3PsNOHQoR0J3bKE5R3aZgZE8U0Ohd8JCHDO4DcJY4HV7uMvmPJffK+Pb0gYsnek2+f6fd8aqg
	hd3K/jzM58VySK13OuiXYYEIIZJsqbWZJiQH8smTje2znrhduVZBc549/lIiP8MKs5MqLN/ZIWThE
	iUdMGPJyNe66Grl2CbedbLeNOMjc/G01DEh/V9Hh7VJeVXSS9MHaFoI5ZwCKKUw4dVuwQ5hErZ8ap
	ZoJX0fK0kqU1DBkC4f3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMoWw-007fgQ-5j; Tue, 31 Jan 2023 11:10:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMoWl-007fcy-Dc
	for linux-amlogic@lists.infradead.org; Tue, 31 Jan 2023 11:10:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so10305327wms.2
        for <linux-amlogic@lists.infradead.org>; Tue, 31 Jan 2023 03:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=MA8S/y1Gs1MEQ7N3aRN+Al5XCapmAfGlB4c1wqU7XjM=;
        b=FH1Unjui52IkGTPhUHp5BhDuROTGf59RbUbqmNWz0chvb22Xg8klEm/bOXb9jpHk4Z
         3pkGXLCer5EoKOLjwFN0tfkh4eD+XS1GSbhejlA/rM2HlUlqIge3HcdECKalAdKq6EqS
         aSwpCw93y/OK0ZSnSUjDzLFWg+cTI2YcGXx56J+g3z1wyYdzMaPUu2SONAe+WuR6rjxa
         DICsf2xUoC++LOoDjZwX4OsdocheSi0vFp3HJWBtt3XufCQLz2DKNPQzM5dKT0YthFQ+
         zbaX8HjN1jWP+tJXYb0b3LrNpptrMcrPyoUNtRYOiKC5f5ZZ524Kmlj1Tjt1ViWu0+Iv
         hOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA8S/y1Gs1MEQ7N3aRN+Al5XCapmAfGlB4c1wqU7XjM=;
        b=g3B5Xh9D/qI2TOGQMytEsnE2kP6JczMQsAK1LWzR0KBje8idDjfBEPv0VaiWEz6gY7
         mFxA1TJK/VUA5p9tOWxoriz7bRV8r0+gYAZCww0KwQKlctbx5VeR9zfGQf2rUyRilVum
         6MNWNDUJDeHcFNhTyWi/FoFINDxbswvAaz0ydYiExCjkyBB4gQA+ncvsThel/dIkn0J4
         gHFKgbet3wm3XYcZqgJxkG05Xv5fx0fD3OkgkGb37hdLnqQylFTMmninc4VcSSxcsApU
         C0TsyvzVgVGgu6kFQ/aVqBkWpgjNKg9tS29TKv9hpd4FNuWtICupC+JQZLWv8w23MBEQ
         sR7A==
X-Gm-Message-State: AO0yUKXrwwed9Ku9QeyAb6BGIVTjaPfnAXgzjo26W0K0oTa5ha+pNOzX
	/ftmEyv21JjpTMS8y1532pgPvg==
X-Google-Smtp-Source: AK7set/pFaDuIxJKAHREd2WyfYMwlWeiG3tW5Bw04KC3h7MBM3BvQaR9xw+dGlgqTh3NU841lYLFdw==
X-Received: by 2002:a05:600c:1e0d:b0:3dc:3f1b:6757 with SMTP id ay13-20020a05600c1e0d00b003dc3f1b6757mr14844157wmb.15.1675163408692;
        Tue, 31 Jan 2023 03:10:08 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c310a00b003dc4480df80sm11959003wmo.34.2023.01.31.03.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 03:10:07 -0800 (PST)
References: <20230130231402.471493-1-cphealy@gmail.com>
 <1jbkmf2ewn.fsf@starbuckisacylon.baylibre.com>
 <671d564e-db1c-ed61-3538-97dd1916714d@gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, cphealy@gmail.com,
 andrew@lunn.ch, linux@armlinux.org.uk, davem@davemloft.net,
 neil.armstrong@linaro.org, khilman@baylibre.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, jeremy.wang@amlogic.com
Cc: Chris Healy <healych@amazon.com>
Subject: Re: [PATCH v3] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
Date: Tue, 31 Jan 2023 11:59:40 +0100
In-reply-to: <671d564e-db1c-ed61-3538-97dd1916714d@gmail.com>
Message-ID: <1j7cx32c4y.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_031015_483851_F8CF3411 
X-CRM114-Status: GOOD (  15.78  )
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


On Tue 31 Jan 2023 at 11:38, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> On 31.01.2023 11:05, Jerome Brunet wrote:
>> 
>> On Mon 30 Jan 2023 at 15:14, Chris Healy <cphealy@gmail.com> wrote:
>> 
>>> From: Chris Healy <healych@amazon.com>
>>>
>>> The Meson G12A Internal PHY does not support standard IEEE MMD extended
>>> register access, therefore add generic dummy stubs to fail the read and
>>> write MMD calls. This is necessary to prevent the core PHY code from
>>> erroneously believing that EEE is supported by this PHY even though this
>>> PHY does not support EEE, as MMD register access returns all FFFFs.
>> 
>> This is definitely something that should be done, Thx !
>> 
>>>
>>> Fixes: 5c3407abb338 ("net: phy: meson-gxl: add g12a support")
>> 
>> This commit does not seems appropriate, especially since only the GXL ops
>> are changed, not the g12a variant.
>> 
> The diff is a little bit misleading. The patch affects the G12A PHY.
>
>> This brings a 2nd point, any reason for not changing the g12 variant ?
>> I'm fairly confident it does support EEE either.
>> 
> Supposedly it's a typo and you mean "doesn't". Neither Chris nor me

Indeed ;)

> have GXL HW and we didn't want to submit a patch just based on speculation.
>

Ah - Ok.
I've tested something similar recently while working on the PHY.
I confirm that both GXL and G12a should stub those calls.

... maybe in separate patches to help stable backports.

Do you want to handle this or should I ?

>>> Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> Signed-off-by: Chris Healy <healych@amazon.com>
>>>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>>> ---
>>>
>>> Changes in v3:
>>> * Add reviewed-by
>>> Change in v2:
>>> * Add fixes tag
>>>
>>>  drivers/net/phy/meson-gxl.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
>>> index c49062ad72c6..5e41658b1e2f 100644
>>> --- a/drivers/net/phy/meson-gxl.c
>>> +++ b/drivers/net/phy/meson-gxl.c
>>> @@ -271,6 +271,8 @@ static struct phy_driver meson_gxl_phy[] = {
>>>  		.handle_interrupt = meson_gxl_handle_interrupt,
>>>  		.suspend        = genphy_suspend,
>>>  		.resume         = genphy_resume,
>>> +		.read_mmd	= genphy_read_mmd_unsupported,
>>> +		.write_mmd	= genphy_write_mmd_unsupported,
>>>  	},
>>>  };
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
