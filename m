Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0539C47080
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:19:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01BB613C1
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C01BB613C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=504yHouFosYPKbDv3sF5nH+tZM2USNsfs2wCF4zLlEg=; b=jmYaWQOLQZgQz5Gw2B994Hsjg/
	QP0B4Luv4vGOR3127DjRLuW1ESgWPVkG0Py3KGEhHYxhHd16xZdetem4JIcgf8imkyG3GKOQZhDEQ
	xEfwkIx0sWwU62ZhB33yN0lnJSLq69A3slmN64AiHFlI0z+5I4OE/4flebEpvya0Lix9A5BW2Wtzn
	TcD2U1lfNTZfSCG7phLo6Tr0lWPcAyewBHVtkcL3zfutf8rbbb2w/JfU42WUcYV/uhCYXiit5yvV9
	1gfNvLieaLALXct2QvFykfGh2aYkvT3uSqx+/Gcegyfjjb9jppKhroYMXixQOa4ZUROkh4jELYc1h
	4Xka6mUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnzcN-00FH9T-RQ; Tue, 01 Jun 2021 08:19:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnzcL-00FH7H-Hc
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 08:19:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id q5so2640674wrm.1
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 01:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dCY3TzRoh9nANH6NUFnZ+bgrMTwHFWGB4bxuYLdcEi0=;
 b=hpmVHSc+GS+3Smy3KAFdCL1tSwBHc+Z5zL9Xd7V3Z5FKB/7Q/yZ2qBxOIDeRIeu8YS
 tItTdJwdYuT+q/Tg/qxg5kVD1Dwq1GTObuJ0V0xGmgQp7/R61SaEiYNohToH7HVUzV4L
 b8O2FECngfliqgOm3IMUQzjXwNKUuaGZ9wRzSmjFsw87q4JfszLEyChM/LrDRn/xlkuo
 r2aKfEC8zeG06qpJ0SV9aEbUclzChchbZmf9kep3Hcz7bsKDswdqEWyyLjFf/IXiKZpq
 0Bp8R8XsyOKL5NDt4saV3VIl0cb2qsCQq+AEEwkt+doCCEHDpHBdcOm5b3n8W45y5JuP
 LuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dCY3TzRoh9nANH6NUFnZ+bgrMTwHFWGB4bxuYLdcEi0=;
 b=c9fACg0PLVgzH3soFvCPp52adX79E2AoB0miZVGm/1aWFh876qSQjYWP/3svdtq3+K
 KVL+fyfjLucwHUlzksgBA0821M67wwQ37H+pEJmXnXId6Q8TEISnX3LBX9nfi3n00tzN
 em/C8BnkbLU1kB70c0B2wmZDc8UJU+i0mEqbqZBZXJxOq3pA/ByXhLUaejIN5sEb0xq5
 5DtjlxxTJiYzUDJpPzFWGsZ6EJd1LbNHKHAZpDI1iUq4WhJFSVYWc7NWaXJW4ufWqHSj
 hnUZkY3Gjs1iEo+7yTj1d3tOY3RyJ1qj2DwRBQEJsD+UDhrI20cBSFuwZFCE14yNbdbF
 sCBw==
X-Gm-Message-State: AOAM530yJlFJamQKBZxpayKtMCGvzU45nDX45uucV5NqZvCSrg5Y4AFe
 XRUgEI8JNefYIod+pev/45gRhA==
X-Google-Smtp-Source: ABdhPJy/iTEHKcQQJB6e/T9ga7nZga9VTebhJvfYTt3s/UXnMr5Ydw4w9llwJIs+yzEu+ltP9tZerg==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr14524037wrs.418.1622535555178; 
 Tue, 01 Jun 2021 01:19:15 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:a3a:d001:6a80:207a?
 ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id b62sm8630486wmh.47.2021.06.01.01.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 01:19:14 -0700 (PDT)
Subject: Re: #linux-amlogic IRC channel: move to Libera.Chat or OFTC?
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 khilman@baylibre.com, carlo@caione.org,
 Beniamino Galvani <b.galvani@gmail.com>
References: <CAFBinCBuFzJVXFdDqpy9HgWt4AMMk_jeOWvQ-mYke2z274FXPQ@mail.gmail.com>
 <97572f8e-b5c8-4bc4-8348-a3c284bd9aa9@baylibre.com>
 <10e38e44-1634-e92c-8aa0-b515f9c149b3@baylibre.com>
 <CAFBinCA+nk3ARBST=OPquVantdKv2gJumi9QG8CpO6jBSBD4wA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <34e6fa6d-ffca-996a-d621-65432eb1afca@baylibre.com>
Date: Tue, 1 Jun 2021 10:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCA+nk3ARBST=OPquVantdKv2gJumi9QG8CpO6jBSBD4wA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_011917_613398_8759BC5E 
X-CRM114-Status: GOOD (  14.12  )
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

On 31/05/2021 21:18, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Mon, May 31, 2021 at 9:20 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>>>> Personally I vote for option #1 or #2.
>>>> I have no strong preference on which network to choose.
>>>
>>> Neither but it seems the most users have migrated to the Libera.Chat channel, so I'll be
>>> in favor to switch to libera.
>>>
>>> Let us a few days to decide again and do the switch early next week.
>>
>> I'm still in favor to switch to Libera.Chat,
> 7 users found the channel on OFTC
> 28 users found the channel on Libera.Chat
> 
> so in my opinion the community has decided
> That's why I am also for using #linux-amlogic on Libera.Chat as our
> main IRC channel

Ack, making this offical now.

Thanks,
Neil

> 
> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
