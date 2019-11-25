Return-Path: <SRS0=QOxW=ZR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB53DC43215
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Nov 2019 12:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD302082F
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Nov 2019 12:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UEMgfwLa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tQl0LTLi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFD302082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Nz3d+88AEzmXnN/39jDoiKp0s4b+ARklwVALp7F/Ozk=; b=UEMgfwLaP6hquifU8cRJtJwfZt
	Pq2uPspzoetAwvSMqJh4bl60lJSiMFYQOBm/oDFusOfB+s3+8amvtVhknBEfOW2FRCr6cZJGzV1gR
	JEt1dV1+MwGDGL91e9y5KH5I3zO1538lmotzekdcDahpy8oeM3KVuiy09u6eSzAs87y0K9x+SK+cM
	u1isbOapT3N01d7KENo8SDTnD5H3tGkXi9vpFjAzmTZjTCRTzyb917xCr1tycDs3AfYAhCHSFfVDu
	GNGr7DccNCl9IpGp6lnXPCWyiQ/o57YWsxCQ6bC0zO2vcyPu/2cAV00WFldVoeT3VS/WBpaUgGUKT
	qIe6r2rQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZDW6-00039G-Bw; Mon, 25 Nov 2019 12:30:58 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZDW3-00038C-4L
 for linux-amlogic@lists.infradead.org; Mon, 25 Nov 2019 12:30:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id y5so15738888wmi.5
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Nov 2019 04:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=uNInIHq/5ROyOJ3aqQnVJSph2LAr19QvURlnsalUvjs=;
 b=tQl0LTLivZPWkV+iB/q6nU+Rkfy+jfwF9XQe3v42g0+WO5ejRLJh/71CsyT0fsrb/w
 FWSsAYT1CI743DHti6tih7QymcYu/Ob+3xVQrdvKDcmZwn5Z4bpzefh2YJ5tfWrxpmlL
 kBqcOc5gQaAJrAhxGEeSQ94QDewI2LPpNUXRtog1IabomUfu/BKHOiz4003vtDAIywV7
 FZjTL9Wj6dIIFOfdyG63maP5qjysz1C14Wdc8oudFemJMhp7Ux8waAsn/qbaEUD+prac
 wboCVWo0nChIlb/2n5Vxb+4SX0q0sKsga+U/DtnFjF9Shj5aTF90kSicQ1H+4w4VtTV1
 U21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=uNInIHq/5ROyOJ3aqQnVJSph2LAr19QvURlnsalUvjs=;
 b=Ff18CtPiN77Fg22cd1Kq3NU4+crIwbh6s449ymbJcY9sqA9Q/zwBMa6D5Hi4SazEos
 3/L+fCEBTxEvFmm9bWmh3WUrx+ujuezkhrz4gvMdjPESu05ZPeNgK9rNkAyZdAa7+KI5
 tYgqdk7admCt2/iiSV47rytyMnaVmgzhG6JfUzYdgrRGW+iLUWNIk+UUp7gjwbduaZdG
 hPmbGUDA8o3MPG2vtG+WkhrwrB8uWKJe+/neKQpuJIHiP0QDdIS4V/hhmiNqs0ThADl8
 /6Q9q5wXGMBwBa4m4KjzvbeFfBVdJUHkw4oyFXIN4MbcYBIElXudvSX7Goinwvn6eUNn
 /H3Q==
X-Gm-Message-State: APjAAAXJRx/3n1yiVBrXb4AvqdkXks6Y5NXGVkWcJlBOufka29c1q4kd
 tEkqptSmXqQQWsQZhF+Gmhj6ig==
X-Google-Smtp-Source: APXvYqxhdhdSwqHiu0FU3Axoh8T+PVZunoW9nGMfGUPUqsOhfA8Dl4UFhVJWblM3MATB2crQVoNEJA==
X-Received: by 2002:a1c:40c1:: with SMTP id
 n184mr29983297wma.116.1574685053091; 
 Mon, 25 Nov 2019 04:30:53 -0800 (PST)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id x2sm8032581wmc.3.2019.11.25.04.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 04:30:52 -0800 (PST)
References: <1571382865-41978-1-git-send-email-jian.hu@amlogic.com>
 <1571382865-41978-4-git-send-email-jian.hu@amlogic.com>
 <1jsgnmba1a.fsf@starbuckisacylon.baylibre.com>
 <49b33e94-910b-3fd9-4da1-050742d07e93@amlogic.com>
 <1jblts3v7e.fsf@starbuckisacylon.baylibre.com>
 <f02b6fb2-5b98-0930-6d47-a3e65840fb82@amlogic.com>
 <1jh839f2ue.fsf@starbuckisacylon.baylibre.com>
 <20d04452-fc63-9e9e-220f-146b493a860f@amlogic.com>
 <1695e9b0-1730-eef6-491d-fe90ac897ee9@amlogic.com>
 <1jtv6yftmm.fsf@starbuckisacylon.baylibre.com>
 <9e652ed1-384e-f630-f2a4-0aa4486df577@amlogic.com>
 <1j7e3oqn36.fsf@starbuckisacylon.baylibre.com>
 <9ec317e8-136e-1ab4-4e9b-21210e7f3e05@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 3/3] clk: meson: a1: add support for Amlogic A1 clock
 driver
In-reply-to: <9ec317e8-136e-1ab4-4e9b-21210e7f3e05@amlogic.com>
Date: Mon, 25 Nov 2019 13:30:50 +0100
Message-ID: <1j5zj8qgsl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_043055_216845_FE480DCF 
X-CRM114-Status: GOOD (  21.11  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Chandle Zou <chandle.zou@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 25 Nov 2019 at 13:01, Jian Hu <jian.hu@amlogic.com> wrote:

> On 2019/11/25 18:14, Jerome Brunet wrote:
>>
>> On Thu 21 Nov 2019 at 04:21, Jian Hu <jian.hu@amlogic.com> wrote:
>>
>>> Hi, Jerome
>>>
>>> On 2019/11/20 23:35, Jerome Brunet wrote:
>>>>
>>>> On Wed 20 Nov 2019 at 10:28, Jian Hu <jian.hu@amlogic.com> wrote:
>>>>
>>>>> Hi, jerome
>>>>>
>>>>> Is there any problem about fixed_pll_dco's parent_data?
>>>>>
>>>>> Now both name and fw_name are described in parent_data.
>>>>
>>>> Yes, there is a problem.  This approach is incorrect, as I've tried to
>>>> explain a couple times already. Let me try to re-summarize why this
>>>> approach is incorrect.
>>>>
>>>> Both fw_name and name should be provided when it is possible that
>>>> the DT does not describe the input clock. IOW, it is only for controllers
>>>> which relied on the global name so far and are now starting to describe
>>>> the clock input in DT
>>>>
>>>> This is not your case.
>>>> Your controller is new and DT will have the correct
>>>> info
>>>>
>>>> You are trying work around an ordering issue by providing both fw_name
>>>> and name. This is not correct and I'll continue to nack it.
>>>>
>>>> If the orphan clock is not reparented as you would expect, I suggest you
>>>> try to look a bit further at how the reparenting of orphans is done in
>>>> CCF and why it does not match your expectation.
>>>>
>>> I have debugged the handle for orphan clock in CCF, Maybe you are missing
>>> the last email.
>>
>> Nope, got it the first time
>>
>>> Even though the clock index exit, it will get failed for the orphan clock's
>>> parent clock due to it has not beed added to the provider.
>>
>> If the provider is not registered yet, of course any query to it won't
>> work. This why I have suggested to this debug *further* :
>>
>> * Is the orphan reparenting done when a new provider is registered ?
>> * If not, should it be done ? is this your problem ?
>>

Apparently, I was not clear enough so I'll rephrase

> Yes, the orphan reparenting is done when the new provider is
> registered.

No it is not done yet. Please check the code.

The reparenting of orphan is done only on clock registration, not on
provider registeration. Now that clocks can be specified by DT, this
probably needs to added.

That is your problem.

Please fix the underlying issue, then you can post your series again.

>
> Reparenting the orphan will be done when each clock is registered by
> devm_clk_hw_register. And at this time the provider has not been
> registered. After all clocks are registered by devm_clk_hw_register, the
> provider will be registered by devm_of_clk_add_hw_provider.
>
> Reparenting the orphan will fail when fw_name is added alone, the couse is
> that devm_clk_hw_register is always running ahead of
> devm_of_clk_add_hw_provider.

Please stop bringing the topic of "fw_name" and "name" field together, I
told you 3 times why this is wrong. It is not going to change.

>
> That is why it will failed to get parent for the orphan clock.

It fails because the provider is not registered when you try to reparent
the orphan.

It shows that you should try again once the provider is registered.

>
>
>
>>
>> .
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
