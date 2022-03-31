Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2BAC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Mar 2022 05:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1sqJi95PUPSg7+RGtT6XIzrn8y5XKzHmSWoYZGGGJ4=; b=Fz658mubzxF6eh
	GPkX39ttjmH1f6PDPrVAcZWUUliMKimeVWlIvh/QU173cXPzOMv7Kl64qEGWsaBMkAj6KSVMBb+4l
	6uH4qg06sRGg6qQtBWTOp0mveBvdd/KHNMSd8lejtdyehVDRjiupNWx7u93ZrDTGI1Q9e7196MlKY
	7/sAh0fuY4BvBr5Hx6dE84Q+rrJkVgnMJIFT1+PqxKJuOGSTflj7IhU9v0dWNdN6jDzbQ5DZqLjIQ
	UTCarA6X7C08l1aeE5UGqa8atdAAOfAIHqNEiXDceGB8Vq2JpbmEJtLEusxCy2y1u6oI2UAgceLrE
	SGeIj+q4DgV554d0ff1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZnnZ-000mzS-Qg; Thu, 31 Mar 2022 05:56:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZnn5-000mmb-TY; Thu, 31 Mar 2022 05:56:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id r13so32083002wrr.9;
 Wed, 30 Mar 2022 22:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=/rBQoemRldR9qn2dcrk1Y9OIhDSxbESeKWQK6ukDSco=;
 b=Qg5ukbq6DCzmhALR3y5ZD6eIT6ct6AT4HfhBuFVNxoi5zcXzgMQU67Z0N0quYj+d/b
 ArOnQ3Pe25badQSkr51lmCb21ctNoDPd2EM6YbvM6VyFWhACZ7v7oxjFKdY5KiTnKt7N
 ksUrT5gl59FZi8teVpLu2LBubOD/tdDXvv4ARkxPX5qHJhqj7QqcMTIpwbP8ujuK6Utq
 lLIfpmvXe1/DKWjAbb8PQ6UrV2GERv0mtmVUDDUUbSk3d9gq+1zwz0tpZnG0Nc7cwA9T
 es2dZd7F8dJJTr5650ReOVIkpZn+tmrit9RLM1ruK37CcDZqYIsL/7NcOV9J3eaT4OiF
 ymHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=/rBQoemRldR9qn2dcrk1Y9OIhDSxbESeKWQK6ukDSco=;
 b=N9JxkYQRyEB4TuFdppTABU1F9AW2q/v/Zx8DAfddIvKo764cEaCWYrvyFVJ2GNgmo5
 q2mXx2a/OXM1bYvDocP71hb2RiCaJTi1lD0FweSavK9YnhR1wrugFneNbgRzhT5I/SWY
 csfkokawayDtsraVCmJc6c2qZ5HpU/1aAw3cCLVzokv76W8ZF5rcHac7cgJWgxJZDV+A
 +xXNALVWJvACUJON/5LArZlovB52oXtHeli9DziumOkmwHIca2a26anDdORMIb6b9OLB
 9rjEbEnTJfHg0ErDkWIpcMFKHHnHPDOO4XUy6yXSQOEuSln2/oBB13RLp6fNdGkCqtuk
 HDpw==
X-Gm-Message-State: AOAM531yjfXWenCEI3jT4YF8XPnmiREan6WVtt4pg52MXzSThouhFqXm
 p6v4CG0HJsEN5IP1qKAgZDa/5VvQoMI=
X-Google-Smtp-Source: ABdhPJxgFSCX5IP/sZSCuEa0he4OSwPmqc6KupLwxvW9h6xvYBU+qf3FZIhm/bm6cS+hGVK010tWnA==
X-Received: by 2002:a5d:6e54:0:b0:204:635:42ba with SMTP id
 j20-20020a5d6e54000000b00204063542bamr2698956wrz.214.1648706173629; 
 Wed, 30 Mar 2022 22:56:13 -0700 (PDT)
Received: from ?IPV6:2a01:c22:773f:f600:109e:75b6:b898:ba52?
 (dynamic-2a01-0c22-773f-f600-109e-75b6-b898-ba52.c22.pool.telefonica.de.
 [2a01:c22:773f:f600:109e:75b6:b898:ba52])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a5d6d0c000000b001a65e479d20sm23221637wrq.83.2022.03.30.22.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 22:56:13 -0700 (PDT)
Message-ID: <8a63cf25-3662-032e-b088-6a343b86462f@gmail.com>
Date: Thu, 31 Mar 2022 07:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/2] ASoC: meson: aiu: fix duplicate debugfs directory
 error
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
In-Reply-To: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_225615_989044_F70170D6 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09.03.2022 21:20, Heiner Kallweit wrote:
> On a S905W-based system I get the following error:
> debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!
> 
> Turned out that multiple components having the same name triggers this
> error in soc_init_component_debugfs(). The proposed solution allows
> other drivers to adopt the same approach with minimal effort.
> With the patch the error is gone and that's the debugfs entries.
> 
> /sys/kernel/debug/asoc/P230-Q200/acodec:c1105400.audio-controller
> /sys/kernel/debug/asoc/P230-Q200/hdmi:c1105400.audio-controller
> /sys/kernel/debug/asoc/P230-Q200/cpu:c1105400.audio-controller
> 
> v2:
> - Reworked approach based on [0]
> 
> [0] https://www.spinics.net/lists/arm-kernel/msg960881.html
> 
> Heiner Kallweit (2):
>   ASoC: soc-core: add debugfs_prefix member to snd_soc_component_driver
>   ASoC: meson: aiu: fix duplicate debugfs directory error
> 
>  include/sound/soc-component.h     | 4 ++++
>  sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
>  sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
>  sound/soc/meson/aiu.c             | 3 +++
>  sound/soc/soc-core.c              | 5 +++++
>  5 files changed, 18 insertions(+)
> 

Any feedback here?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
