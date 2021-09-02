Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E51C432BE
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 09:28:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D14D610A4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 09:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D14D610A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=brfAuNGWgJlJ+2oXSF4VkzzBxOoEJzhZ2TK1r4JPBcY=; b=wrGfrMcW5d7Hg9Mt1SmBVJPvGK
	t2AkUI7U6UMY72E/+sHxaxBwFvtpN2PK8EnYZz2MKJKCxR+0jYAUb8XTXgaFf6R0wPvm46u/gVbok
	Csvp1IqinVY4TVkOlTyIObn0Pc+MXM8FtJIEccdNykRpY2HtyJ3c8YVr8l2YXi8sNJjV1cQK/sSFQ
	qhuYojsxDJR/SCmsCShWdAdFn7PqA7YLUFVcUZnsdFZBtk48QsW9j3WRow+JcKuATEOz2MguHyirE
	PetUL/Lc+FJHsryyh+VIFd+Fs8bj7YUMGhvxK7OeBfUKAN18AMrrJPjQM2SMMlvjDUPsEH/xm3x4I
	5EzLbjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLj1V-0096sN-5Z; Thu, 02 Sep 2021 09:28:41 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLj1R-0096h6-Fy
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 09:28:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id t15so1823007wrg.7
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 02:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7iuvIPC9bhl1LolffJ5qHRSpgVqBB1R5gXFvaIS5FRg=;
 b=WQNKLYacQ4cIyYIVZRSotKDLK1414LXzQHMb0w1wiRxd74Wq6UETgkv4F7VOEsWNK7
 aipp40iW3G9TrZBO0Xo5TkgoELEXT+JE2ammE8cf6KbFpCWb3MGkR9S6zeLSRy33AKAe
 SjvVu5V6l3dRzn0GrzoNEXFWAPWcVLabg8yaYF/yIyMWb5Fi0DEWW3xOZVBS0yrA5ZD9
 hh1zPCEIg3HpciJM6VUk0eNvNH9W7FhrOLIbLrioyIHdLU4CIjKd2zsdtD/tHdmUkupV
 qGO1aeIwk7Fkhu17qca0dl5rjHotoSClnu8IuLVhPJyqa95BCPBYWA+DvsWDjxiIEjGU
 7G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7iuvIPC9bhl1LolffJ5qHRSpgVqBB1R5gXFvaIS5FRg=;
 b=MRjQzWcOEcFx2oa8K1A4DZrZi4YxTtcUIeAQgRDd8LqiYdJF6sDffombw7dS3WBD3h
 NIcDUDIs+PZ2jhZ2o/31HwfKKA56vmxWKGknrWdjDF2hgsLHFZmn42vH0yZH/pw+ya2j
 QEGdna5DVfgRUxk0TMmAs77VIv6xViWoCutqfFxiqX0AYvPUQjHcpZyGv4ZUJ/9/boCB
 LSBQijOBK27OBOMHlMmjw7tvzfuRVGtiq8UhGWgPPVLkBQIYc1j4yY6akofb9Y3jOtqX
 psforQHNIw3FabxwZgmM8z1T5kUm8M12PZXdYACJKd8xD01bWME/e9gmemq6m7ByRjzY
 LFJQ==
X-Gm-Message-State: AOAM533Oti7EjXuVGS/wdyZWJ/vhHqZjYE6NBCydgGkfKAcQgrW86QhK
 VFBfdJyn3PiZfIYQltSd09QO5Q==
X-Google-Smtp-Source: ABdhPJyFFvmQ0LXhQUxzUVktEFAfLypsGuwgbx7ulszxx6AHS1Hg+73IilpVUv5hUAQau5RwPPNtlQ==
X-Received: by 2002:adf:cd0f:: with SMTP id w15mr2562154wrm.346.1630574914954; 
 Thu, 02 Sep 2021 02:28:34 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:98:6312:3c8:6531?
 ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id h11sm1557349wrx.9.2021.09.02.02.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 02:28:34 -0700 (PDT)
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as
 a module
To: Marc Zyngier <maz@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Lee Jones <lee.jones@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Android Kernel Team <kernel-team@android.com>
References: <87r1hwwier.wl-maz@kernel.org> <7h7diwgjup.fsf@baylibre.com>
 <87im0m277h.wl-maz@kernel.org>
 <CAGETcx9OukoWM_qprMse9aXdzCE=GFUgFEkfhhNjg44YYsOQLw@mail.gmail.com>
 <87sfzpwq4f.wl-maz@kernel.org>
 <CAGETcx95kHrv8wA-O+-JtfH7H9biJEGJtijuPVN0V5dUKUAB3A@mail.gmail.com>
 <CAGETcx8bpWQEnkpJ0YW9GqX8WE0ewT45zqkbWWdZ0ktJBhG4yQ@mail.gmail.com>
 <YQuZ2cKVE+3Os25Z@google.com> <YRpeVLf18Z+1R7WE@google.com>
 <CAGETcx-gSJD0Ra=U_55k3Anps11N_3Ev9gEQV6NaXOvqwP0J3g@mail.gmail.com>
 <YRtkE62O+4EiyzF9@google.com>
 <CAGETcx-FS_88nQuF=xN4iJJ-nGnaeTnO-iiGpZuNELqE42FtoA@mail.gmail.com>
 <87o89vroec.wl-maz@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <44e56b25-acbb-ce3c-3f99-53a809309250@baylibre.com>
Date: Thu, 2 Sep 2021 11:28:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87o89vroec.wl-maz@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_022837_597596_7EF40965 
X-CRM114-Status: GOOD (  20.80  )
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

Hi,

On 18/08/2021 13:19, Marc Zyngier wrote:
> On Tue, 17 Aug 2021 19:12:34 +0100,
> Saravana Kannan <saravanak@google.com> wrote:
>>
>> On Tue, Aug 17, 2021 at 12:24 AM Lee Jones <lee.jones@linaro.org> wrote:
>>>
>>> On Mon, 16 Aug 2021, Saravana Kannan wrote:
>>>>>>> I sent out the proper fix as a series:
>>>>>>> https://lore.kernel.org/lkml/20210804214333.927985-1-saravanak@google.com/T/#t
>>>>>>>
>>>>>>> Marc, can you give it a shot please?
>>>>>>>
>>>>>>> -Saravana
>>>>>>
>>>>>> Superstar!  Thanks for taking the time to rectify this for all of us.
>>>>>
>>>>> Just to clarify:
>>>>>
>>>>>   Are we waiting on a subsequent patch submission at this point?
>>>>
>>>> Not that I'm aware of. Andrew added a "Reviewed-by" to all 3 of my
>>>> proper fix patches. I didn't think I needed to send any newer patches.
>>>> Is there some reason you that I needed to?
>>>
>>> Actually, I meant *this* patch.
>>
>> I think it'll be nice if Neil addresses the stuff Marc mentioned
>> (ideally) using the macros I suggested. Not sure if Marc is waiting on
>> that though. Marc also probably wants my mdio-mux series to merge
>> first before he takes this patch. So that it doesn't break networking
>> in his device.
> 
> Yup. Two things need to happen here:
> 
> - the MDIO fixes must be merged (I think they are queued, from what I
>   can see)
> 
> - the irqchip patch must be fixed so that the driver cannot be
>   unloaded (Saravana did explain what needs to be done).

I'll post a re-spin of this serie with the suggested fixes.

Neil

> 
> Once these two condition are met, I'll happily take this patch.
> 
> 	M.
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
