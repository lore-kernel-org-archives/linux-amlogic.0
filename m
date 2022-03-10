Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07600C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Mar 2022 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5u3RYofP2MqMUrkFkIxqJxj2UVCOfNrD50QM8Awk+iA=; b=0jU5o5W/YChh5r
	4PVNSMUdNx14KJkXF0CUGJ29R4wLOGZLYq/3Xcv1VEqhSmrYtge2UuSAX2+dIvQ5Mnxj7RV/fd0NJ
	PM8LN4bOzRTrmt/xLn/n9SaWa+RbXRGthb72h4dGQqKmnw5s66efN7goSVPyeGzmzf0Zm4dW9IOSX
	35gAUKzm+MIT5FccWN2ll4Qx/vBJTiWxXHVmPkdo1JMpmo6txiiYjb7rzz1EuVkwHVtITO5nz/Cs2
	G839QmWwO9JAIwxvpjrSwdMhKjyGmVb/tyF9ek/67046Qb2vbQQ5+rZwiiOTy4bJgG6KfNanNuKL1
	MgIbAZjwSqMrhgdEhu9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSJBp-00CydQ-W9; Thu, 10 Mar 2022 13:50:50 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSJBm-00Cycf-GS; Thu, 10 Mar 2022 13:50:47 +0000
Received: by mail-oi1-x22a.google.com with SMTP id b188so5913535oia.13;
 Thu, 10 Mar 2022 05:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sfFUIzklnWnVL4/NLqVCgmdPgAbKIY19ONnLn3h0ra4=;
 b=cvAuw81cbKvlDF4KrPUJNj0o7UpR3CYaey30BpZGkkkxLpj3fQLvslW18WvlIPjJPP
 BO6HDVgQ7DU8Qh3SmSYEBKHk04oxGGQ0Py41UzBe9R6bKngQB/TeLwNBhn80NtFI9QXa
 FTUvzX60HV41ym3my5zZFyCQeHpWSynkbvJEq8wN1+XhbBBKxZoL2OVBjtEheyfmWgOs
 cZcfiGpBXb1yz76a6OE610G/Y/8cqzQKY9xUavjsUeK68eCS5yknWBElya4f4XyyRArl
 Sb3gjMwaWTfkrs+oJe2V3qhC4BRza5ARsgaDtwwQaANa88ZTH7NS9nTw03IpxGCBrjqo
 C4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sfFUIzklnWnVL4/NLqVCgmdPgAbKIY19ONnLn3h0ra4=;
 b=DqeXT1lfbEZSq2ORW7PFA83zIX+QlwM92ni6TA27Orp2sbv1ilK47L0XGJJzGBiC1V
 BHHgNjBIqULiEpIgX2uiKsTmT+9xl0v7ogLn/H9MCqB8rjGfGBeU0sOKBczJMCakQ/co
 bxUjdIQ7aVzESbgNp6lmq2Nn7x1fXrSSP5b3IXow2V5xMr0oj65QFZmiXHJC5zmEKgjq
 Zb7cq9hv0WqgYcPcAqLK7VqFNTz/WGkM9IDDCw65KkqwlGjeTYnNoQe+rHjaHqhxG0O/
 usXC3DY4DDQi1k5r4MmKmd5w19w5+sjkzkZ5s1RfbV4vi19qwbXcBImGDoQ6zphGWyvA
 iiyw==
X-Gm-Message-State: AOAM533yuFnp8+4o7xGmkqKMTEmQEsGtcSULk3mk+YwNpA/yLr+E7Xt+
 4XnRo882g8N83pSPSByaB/0=
X-Google-Smtp-Source: ABdhPJyzI2TV0h+xCRwqoK4+L08FfZrkS81PP/kX0mU1cY8SDEm8SUclFA58XIZpUE36ixoogBP7HA==
X-Received: by 2002:a05:6808:1208:b0:2d9:e030:c4b6 with SMTP id
 a8-20020a056808120800b002d9e030c4b6mr3359409oil.43.1646920244632; 
 Thu, 10 Mar 2022 05:50:44 -0800 (PST)
Received: from geday ([2804:7f2:8006:9c16:7142:ae6b:7594:53e3])
 by smtp.gmail.com with ESMTPSA id
 bb33-20020a056820162100b00320ecc89402sm2342295oob.36.2022.03.10.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 05:50:44 -0800 (PST)
Date: Thu, 10 Mar 2022 10:50:52 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alsa-devel@alsa-project.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ASoC: meson: aiu: fix duplicate debugfs directory error
Message-ID: <YioCPFDqnrOew+6q@geday>
References: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_055046_581124_C40E322D 
X-CRM114-Status: GOOD (  18.77  )
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

On Tue, Mar 08, 2022 at 08:00:14PM +0100, Heiner Kallweit wrote:
> On a S905W-based system I get the following error:
> debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!
> 
> Turned out that multiple components having the same name triggers this
> error in soc_init_component_debugfs(). With the patch the error is
> gone and that's the debugfs entries.

Hi Heiner,

Thanks for the patches!

This one has been bugging me for quite some time, I'm glad you took time
to fix it.

I'm sure Martin and the BayLibre folks will soon review both of your patches,
just wanted to thank you.

> 
> /sys/kernel/debug/asoc/P230-Q200/aiu_acodec:c1105400.audio-controller
> /sys/kernel/debug/asoc/P230-Q200/aiu_hdmi:c1105400.audio-controller
> /sys/kernel/debug/asoc/P230-Q200/aiu_cpu:c1105400.audio-controller
> 
> Because debugfs is affected only, this may not be something for stable.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  sound/soc/meson/aiu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index d299a70db..c1a2aea5f 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -68,6 +68,20 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
>  
>  	*dai_name = dai->driver->name;
>  
> +	switch (component_id) {
> +	case AIU_CPU:
> +		component->debugfs_prefix = "aiu_cpu";
> +		break;
> +	case AIU_HDMI:
> +		component->debugfs_prefix = "aiu_hdmi";
> +		break;
> +	case AIU_ACODEC:
> +		component->debugfs_prefix = "aiu_acodec";
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.35.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
