Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56B9C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Mar 2022 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAS6+yCmKOPI4Kdj3s3ecNhhW7tcnYCgEzbbDvF0xsY=; b=PiVdLOrTANINFK
	mHq4LEf3rxvhf5z+iW61uW4+apBeQq2crQ97FByu0oZW9NmQ6wMnbi+R3zNDExL5UuMEGK77gYIRZ
	e83qcqI1uoDcs1pnBAFgwQDOnwRY0Bas0s5vxH2Aq2222dhO/FqfBlGhv13DXUwF3H4VB33HixzlM
	qh1k8dPHFuJvEYrp/mHUMIkxOcdNLCQFMQtLIl4qwegV8QhB6gpuIYsUDDiKzBFEt4pwk2oQJs6eE
	mJ5ZWUSwYJqPZ0bn9yp82tnAy4EsiPN7Lo+wfCQGcm97kth2OdgvzdZ69jmNBm2qtg9+yiHona3gI
	fyxtoBx457A1k5ZLnl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYVUS-005iXM-JT; Sun, 27 Mar 2022 16:11:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYVUF-005iV1-S9
 for linux-amlogic@lists.infradead.org; Sun, 27 Mar 2022 16:11:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so7144755wmp.5
 for <linux-amlogic@lists.infradead.org>; Sun, 27 Mar 2022 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=6GFJ7ancB1plEhfgVzWZYVl+G7Gv/ojaNkdikZ/2jZg=;
 b=orqlMfSrIwbyWYkxZvplXPR/LEXQlsFsphWNY42yJ+k9AqwBhabrHAiJkEGgEJQ4c5
 tVuDgtkcZUw1pUawPj2wupbIlL/noe5AYE2CHM7E0rKnye5waqjP/HxuCyT9FwuCnpK2
 xsMGqznycLaxDy5IQwMEQWsmr+IyiRLbLY0HGQDcchsthrw8OOApWaGgBVIrBl4JiXAj
 2/vaEs0dJJXrLC+rjpwDoOFI8FYSXTIWoUMrh6rMex8x0zFj05tukxn4PUD+cmQSsaMr
 JozTSLpuTmfQepoKzpTN39+u5OADe14u/40UVQWLBl4P62b8cwQ7VuhzncUvLB52PfFk
 c7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=6GFJ7ancB1plEhfgVzWZYVl+G7Gv/ojaNkdikZ/2jZg=;
 b=PQX45zYSFEoxYhkaGKhxS5alygNZchWXOgqK2P7eVL5WIDOWEuphW45Y4afmTmi9XD
 ME9R3E5GLX2KHuIEeBPD++08NX024TXq2MfyMqURPxEYKrVR0De0Vu5dpchRj8fz66Ku
 0zuaPsf/PX4KAo9nTrnp1ByMAQGsjt14B5aChdQhdVkGvoZL2yLHVR00eDtMBWaXTdbn
 X55p+k1Jcb5jUUxsZ80TLoK1miKJizUqIT9sEZFMm6p6jy7kYsj2SwejQbNKUOhJNNke
 7BEs2ZnggEUc1ZzUNmZH3UV9KS0O5B2+dqtnyLqDYhwApmyxLhzi4T6/qPluLVxGVIBf
 jeeg==
X-Gm-Message-State: AOAM531OsUxDqFNRwSrs1tfycIjbpAxVutqHKZK0fZiHgmqn7G15Zn32
 JdBb+tGY12ajnSkr5dD71L6vEQ==
X-Google-Smtp-Source: ABdhPJxkS2ERSmOVuz2DI45w4YukiucqyQOcslY68QODGIq7pyctREMo4NgaLnq/arb34R/RiBevjA==
X-Received: by 2002:a05:600c:5029:b0:38c:9768:b4c with SMTP id
 n41-20020a05600c502900b0038c97680b4cmr19962707wmr.123.1648397486308; 
 Sun, 27 Mar 2022 09:11:26 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a1cf708000000b0034d7b5f2da0sm9633355wmh.33.2022.03.27.09.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 09:11:25 -0700 (PDT)
References: <1jk0cf6480.fsf@starbuckisacylon.baylibre.com>
 <20220327130801.15631-1-xiam0nd.tong@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, khilman@baylibre.com,
 lgirdwood@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
 perex@perex.cz, stable@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH] soc: meson: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 18:05:26 +0200
In-reply-to: <20220327130801.15631-1-xiam0nd.tong@gmail.com>
Message-ID: <1j35j374us.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_091127_946857_B513C040 
X-CRM114-Status: GOOD (  19.09  )
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


On Sun 27 Mar 2022 at 21:08, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:

> On Sun, 27 Mar 2022 13:03:14 +0200, Jerome Brunet <jbrunet@baylibre.com> wrote:
>> On Sun 27 Mar 2022 at 16:18, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>> 
>> > The bug is here:
>> > 	*dai_name = dai->driver->name;
>> >
>> > For for_each_component_dais(), just like list_for_each_entry,
>> > the list iterator 'runtime' will point to a bogus position
>> > containing HEAD if the list is empty or no element is found.
>> > This case must be checked before any use of the iterator,
>> > otherwise it will lead to a invalid memory access.
>> >
>> > To fix the bug, just move the assignment into loop and return
>> > 0 when element is found, otherwise return -EINVAL;
>> 
>> Except we already checked that the id is valid and know an element will
>> be be found once we enter the loop. No bug here and this patch does not
>> seem necessary to me.
>
> Yea, you should be right, it is not a bug here. id already be checked before
> enter the loop:
>
> if (id < 0 || id >= component->num_dai)
>                 return -EINVAL;
>
> but if component->num_dai is not correct due to miscaculation or others reason
> and the door is reopened, this patch can avoid a invalid memory
> access.

This is a speculation which just does not hold ATM. What this patch does
is adding dead code cause the last "return -EINVAL;" will never be
reached.

This no fix nor improvement.

> Anyway,
> it is a good choice to use the list iterator only inside the loop, as linus
> suggested[1]. and we are on the way to change all these use-after-iter cases.
>
> [1]https://lore.kernel.org/lkml/20220217184829.1991035-1-jakobkoschel@gmail.com/

You can make improvements as long as the code is kept clean an
maintainable. Dead code is not OK.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
