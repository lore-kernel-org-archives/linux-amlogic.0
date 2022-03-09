Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1D4C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Mar 2022 19:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Enpw6sK7YvYT52LTdARJYU/Yt+W/P+GAwSlLYrdk7dU=; b=p7RyT91qLtIYpB
	LsLn229t5ByIAPvx2UHc5DhmBxUBw0KFoYaSMJKbRPwQw2AAl/hoX0F5YxSAIqlWBRsQJjY2laNbU
	ugKQ+kV+ybupC3X0EGIODmA3JEVNnO7js9IzUFV6yNIYYLmoZz6Oilk+lOrF4lBGIsEuxXCbBvBRo
	gYjjNjM4WFNHYnDiW9N4e34AjfxzrnOkDuQ4Ueb9Zby2e5WzSNqUrLEIjRCdoIQFjxjSFB4RPPmvO
	3eimsX588KZd2nFXGK/j/STvjibLf4kwR/qJfmQ1cZ4eVbYuI90bw4Gu/wIUVUzu+LrlKpVkSuSQT
	Wr9MphqHDOB/INnlj5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS2HG-00AKS3-3E; Wed, 09 Mar 2022 19:47:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS2H3-00AKNu-Mr; Wed, 09 Mar 2022 19:47:07 +0000
Received: by mail-ed1-x52a.google.com with SMTP id c25so2114939edj.13;
 Wed, 09 Mar 2022 11:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eJLW/eZDU7cgCCuYkQHvfMFPuHtxGiM/4asfC8lKWQs=;
 b=moRl3VqrzFzYV/i/A6DfyrbnNw3xVbz0aSV6xzlKloEZVGE/kTXNZbAiONcGlevVM0
 HMVZxvgJakmTfy+IeE5v5fQnfDLhlqMihDMsWxsOlP9wa9/okDrI4NhNgMBfIdulaYG1
 sopoaEGfxm9p1AJEZMBpw276dwkArx5tk8xThEw9fGij/vd0sBSGGeJMNbn9baQFL4m1
 JxecuUts+hEWaWlZ8XIGBpfZhNH/gdIvUXJWH7QRMDzXaCpqFxgYt82LtNbOhNX3Iztq
 94nlmGik7veLnxIj79b4mMTVnpCOdhpUAz+XhH9Tiaus+gqXnt6tR5IxNgz3eKieHe6Z
 JTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eJLW/eZDU7cgCCuYkQHvfMFPuHtxGiM/4asfC8lKWQs=;
 b=d6sg5S9bGCWKfyfUSgj0MXyrEvaucgsRE5Wwo0PxlBGlWvd3NbTwknI3Ve9Ag3KZgt
 Gc2x7ZP8Vob4496YH1zeH/UjK2zAVyMyMmrS336uuFlMUGn8BFFXrKemQbPTbi8HUrHE
 GlziCrwINDf4HsfkbsrheUWCCo5UJ/iN/6EmuQkZI6gbphyKKACzpOC/a1IYmLIWvDSs
 f+ycgKaczfo34rVdw5IxSPLtq+A2O8MzGB05PC7jvPEtRKDwAHhMz5bnEksF3GyjUuN3
 3Fcrzw32L2WQySqpG/3WTVBkrYHo59lx/z8sa2CbzB0MBJJjTKPEZFRJne+vYQtfDqBQ
 Ikhg==
X-Gm-Message-State: AOAM530HouL/XflbNNyzIQLhBmSvMTWZ9FKqSyL46irgmmvPU/yYnNOw
 j7xsU2SWk7+1VRoPUt/F6R0=
X-Google-Smtp-Source: ABdhPJzE+teccexKViOHUw3lh1KruK2n2PlRayWqntrATahOiP/TNsQt2o0l/S7jWH2WCxcY/ibJdQ==
X-Received: by 2002:a50:fc12:0:b0:415:cf24:f6c2 with SMTP id
 i18-20020a50fc12000000b00415cf24f6c2mr1059117edr.3.1646855222064; 
 Wed, 09 Mar 2022 11:47:02 -0800 (PST)
Received: from ?IPV6:2a01:c22:7793:600:9d6a:7788:3389:da6c?
 (dynamic-2a01-0c22-7793-0600-9d6a-7788-3389-da6c.c22.pool.telefonica.de.
 [2a01:c22:7793:600:9d6a:7788:3389:da6c])
 by smtp.googlemail.com with ESMTPSA id
 i14-20020a50cfce000000b00415b0730921sm1277649edk.42.2022.03.09.11.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 11:47:01 -0800 (PST)
Message-ID: <4568c9bf-50d3-1fe5-795c-1d98136dba93@gmail.com>
Date: Wed, 9 Mar 2022 20:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] ASoC: meson: aiu: fix duplicate debugfs directory error
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
 <1jcziwnf10.fsf@starbuckisacylon.baylibre.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <1jcziwnf10.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_114705_796325_57E8DAD4 
X-CRM114-Status: GOOD (  31.32  )
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

On 09.03.2022 00:42, Jerome Brunet wrote:
> 
> On Tue 08 Mar 2022 at 20:00, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> 
>> On a S905W-based system I get the following error:
>> debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!
>>
>> Turned out that multiple components having the same name triggers this
>> error in soc_init_component_debugfs().
> 
> Because the component name is directly derived from the dev name
> 
>> With the patch the error is
>> gone and that's the debugfs entries.
>>
>> /sys/kernel/debug/asoc/P230-Q200/aiu_acodec:c1105400.audio-controller
>> /sys/kernel/debug/asoc/P230-Q200/aiu_hdmi:c1105400.audio-controller
>> /sys/kernel/debug/asoc/P230-Q200/aiu_cpu:c1105400.audio-controller
>>
>> Because debugfs is affected only, this may not be something for stable.
> 
> It is not entirely true that only debugfs is affected, though it is the
> only thing really complaining.
> 
> I had a similar tweak around debugfs entry when I first submitted the
> AIU. There was a discussion around that:
> 
> https://patchwork.kernel.org/project/linux-amlogic/patch/20200213155159.3235792-6-jbrunet@baylibre.com/
> 
> I proposed a solution which got merged but ended up breaking other cards
> because there was some assumptions around what the component name
> is: basically the dev_name since there was originally 1:1 mapping
> So it had to be reverted.
> 
> Full details here:
> https://patchwork.kernel.org/project/alsa-devel/patch/20200214134704.342501-1-jbrunet@baylibre.com/
> 
> Unfortunately I did not had the time to continue working on it since them
> 
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  sound/soc/meson/aiu.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
>> index d299a70db..c1a2aea5f 100644
>> --- a/sound/soc/meson/aiu.c
>> +++ b/sound/soc/meson/aiu.c
>> @@ -68,6 +68,20 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
>>  
>>  	*dai_name = dai->driver->name;
> 
> While I don't really mind one way or the other about the prefix itself,
> aiu_of_xlate_dai_name() is not the place to tweak it.
> 
> This should be done before adding the component, not when parsing the DAI
> with DT.
> 
> If this is really a problem and Mark is Ok with, what you want to do is
> revert commit 024714223323 ("ASoC: meson: aiu: simplify component addition")
>>  
Thanks a lot for the links and for pointing me in the right direction.
The revert you mentioned would need a little bit of trivial tweaking
due to changes of the underlying code.
However based on what I read so far in the linked discussions I have
another idea to make the solution more generic. I'll submit the
patches and then we can decide how to go on.

>> +	switch (component_id) {
>> +	case AIU_CPU:
>> +		component->debugfs_prefix = "aiu_cpu";
>> +		break;
>> +	case AIU_HDMI:
>> +		component->debugfs_prefix = "aiu_hdmi";
>> +		break;
>> +	case AIU_ACODEC:
>> +		component->debugfs_prefix = "aiu_acodec";
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>>  	return 0;
>>  }
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
