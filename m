Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7080FC25B75
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pQwhXlIUs0WdOc8cqi83M19CrjgmGHEvSXO2tzxY40=; b=nlTHfCmD7/SstO
	wRYWylz7gAkF4WprheePam6TCmfogy+aiGOFm9YvNVXivbRwFXuaNdQbs5+RzqGkLrpPxvB10ZIwe
	wnQyzl8CATZqs74lfs5wOwQRx1h6MPp9qwYmjSzBQtkV/asBybzQMh2qbBsyF7+orO4gCYVV2sLZf
	cQiEDd2mZ7U9kkW7w8CXwWT0BcaXtGoZ6FXlpuWc8wyS8sqP89/JI/cCpyK4A8GZMuRysaJKyVdBc
	GFUIHjo5rFAefUFsYl+Nf9LS3EyoQbJGFIKnk3E0GrWocmK7eL6RdkrjM9trNTmHag94EjvJJTjcQ
	B7uG0eKJPwcV29Lqu9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7EVl-00000001cqC-4BUt;
	Wed, 15 May 2024 13:17:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7EVi-00000001cnt-34IJ
	for linux-amlogic@lists.infradead.org;
	Wed, 15 May 2024 13:17:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-34db6a299b8so5096168f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 15 May 2024 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715779053; x=1716383853; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Wkq99nuMEm3sK6ZhmvF3R71byoY0ssDC9KdU6I8CK5A=;
        b=WfbgRmUmuujG6XmuOtgUqOgNoIoT1WqO6bAhYHp+FfA9oFdJq6L8EmYdqfo3oLeCgN
         WTrDkXC150pFgiU5xQjq7EK+b8EkxC1kYcsYNIMy82Aa3wSbrmw9ix3wHcPV5TniuvWb
         9/FTZwZuSA2UwMzLreHzeJikGPdvuQO7LJJU4u601yjKHyxksCen80UsIes2dKem/4J1
         b0FzUhFOfY4HzWb3c8GcPjpoScn0s1FzmI9q2jXnFOMZ2JYs1UQ2A1jq8Fv8/oXGrG3V
         /dHlt64v+eQSUgl9AJSAMmtAi/sGqRDK1ELcvqpVG5F6UcP2ix9g8UZqYhPRASojQ8EQ
         7w6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715779053; x=1716383853;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wkq99nuMEm3sK6ZhmvF3R71byoY0ssDC9KdU6I8CK5A=;
        b=uA54fGd8BmcI4kSJRhifZ+i2Hkb/MPF8Ns2Q0mLmEk7jbeWpBuKB+o5zx4ZAYBZFUs
         MYDJKXinT5L7vHoVAqrvyDFOWeqFSVsg3YOYMpCDEmi4EXu5FdUrMxx1NLn2M7N2RPY6
         wwYnm5n/CQFqJVjN/hjypYAU6pakFjdi2bZhV4TdFAfWI8nwd+jAnfYdtY8La88hV5H5
         HaY8Lxnwaby0ZEt93TtLvPkKuOI2kVCtQG1p3lbHwow+ZwnHHff7cMRX7OOiPnR1WcQm
         QAc4k93Mq8bQp1yvpwvWq+dxtuzBcsbkFcRewVnB8R2MbpwZHN/LHbp8D7bIIZ/lZkpR
         0AvA==
X-Forwarded-Encrypted: i=1; AJvYcCWe31VOVEjyIPIOmBQYaxPeNNv0tKLuP979StnitAyrqANQsN0SumNyDJEUM7tsZgWnzoZURFdkujelseNw+H5+rCW2nDgcDvMXAFpb4Cg5kls=
X-Gm-Message-State: AOJu0YxeHnpwehqXoVADWyNTuFmM+ymVomXrH1X+DU6e3f8y91FBVLwn
	TFZt5cQpytihIq0rplGDJSCSgANpYuC1/1F2mttp55JUylbtcDt/ILfmGfsneyA=
X-Google-Smtp-Source: AGHT+IE4YYUxY5plTBCwY46ojRAymJdS+bbjFNA9B11hQIBGI59XYOMg6b3oSsFO4BCii/+Aekb4iA==
X-Received: by 2002:adf:fe8c:0:b0:351:c7c7:985f with SMTP id ffacd0b85a97d-351c7c79963mr3745116f8f.53.1715779052826;
        Wed, 15 May 2024 06:17:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2893:1a8f:5988:776a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbefdsm16424209f8f.94.2024.05.15.06.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:17:32 -0700 (PDT)
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-3-ddrokosov@salutedevices.com>
 <20240511-secret-barcode-e25c722ddf1d@spud>
 <20240513091735.l3uewwzfrdd6qwbl@CAB-WSD-L081021>
 <20240513-epic-magnifier-8dd83db81c4c@spud>
 <20240513183012.652mwhivasqihiqc@CAB-WSD-L081021>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Conor Dooley <conor@kernel.org>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: meson: a1: pll: introduce
 new syspll bindings
Date: Wed, 15 May 2024 15:15:35 +0200
In-reply-to: <20240513183012.652mwhivasqihiqc@CAB-WSD-L081021>
Message-ID: <1jh6ezxlhw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_061734_828048_6FB99B18 
X-CRM114-Status: GOOD (  23.07  )
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


On Mon 13 May 2024 at 21:30, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> On Mon, May 13, 2024 at 04:48:33PM +0100, Conor Dooley wrote:
>> On Mon, May 13, 2024 at 12:18:02PM +0300, Dmitry Rokosov wrote:
>> > Hello Conor,
>> > 
>> > Thank you for quick review!
>> > 
>> > On Sat, May 11, 2024 at 02:08:03PM +0100, Conor Dooley wrote:
>> > > On Fri, May 10, 2024 at 12:08:54PM +0300, Dmitry Rokosov wrote:
>> > > > The 'syspll' PLL is a general-purpose PLL designed specifically for the
>> > > > CPU clock. It is capable of producing output frequencies within the
>> > > > range of 768MHz to 1536MHz.
>> > > > 
>> > > > The clock source sys_pll_div16, being one of the GEN clock parents,
>> > > > plays a crucial role and cannot be tagged as "optional". Unfortunately,
>> > > > it was not implemented earlier due to the cpu clock ctrl driver's
>> > > > pending status on the TODO list.
>> > > 
>> > > It's fine to not mark it optional in the binding, but it should be
>> > > optional in the driver as otherwise backwards compatibility will be
>> > > broken. Given this is an integral clock driver, sounds like it would
>> > > quite likely break booting on these devices if the driver doesn't treat
>> > > syspll_in as optional.
>> > > A lesson perhaps in describing the hardware entirely, even if the
>> > > drivers don't make use of all the information yet?
>> > 
>> > Yes, it's definitely the right lesson for me. However, without syspll or
>> > syspll_in, we cannot utilize CPU power management at all.
>> 
>> That's the status-quo, right? The incorrect dts would continue to not
>> support CPU power management and the new one with the correct description
>> would?
>
> Hmmm, correct. Okay, I see, I will support sys_pll as optional
> connection :)

Again, the way controller is written, all inputs are actually optional.
The controller does not error out if an input is missing, it behave as
if the input is disconnected

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
