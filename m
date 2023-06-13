Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9429AEB64D0
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:To:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQ4+IAtKy8lTd9cH+QBsKdGzgKz7vSRXU1P82I+hayc=; b=mBxBXKIukZOWo/3XzCkXJCNTvo
	RhniHLdf7RvIwpLzZoF4NgB6Hv1M2PtqLxB10OYeUY1tsu5c2phCY5EW4LzGPoEojKJkIZ5k+HuKT
	FxdXv9qyhtcd7uPi/Hk3j5nwu/rNufBIqZQiTwtiBvkMR4hjrZsojO+XnufAsaiOEgeGwY2MAuasq
	U7rwYaf57H41yehZMTreKPRYUEXGvkmSsqO/felEIq2hAjXdbf9J+OrWJTvzuxTNd5+UgM0lxDsiK
	myQEQD7m0Z3uHDw3O2EAujguw4HudxqqGe6QoBKxFooMmcaWSQXHakmy8gSEKJHczWbexHk51qMut
	OWzWiMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9774-008cfI-2K;
	Tue, 13 Jun 2023 16:43:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q976y-008ceO-02
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jun 2023 16:43:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30fc42fcbc7so1804878f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jun 2023 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686674593; x=1689266593;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:to:content-language:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rjEkXmQa5RegAKMYpw0eo8Wi8xCVRRDLtBMotAcljh4=;
        b=sMLE0sTRuPmnEx84MunR4VEpfXkqvrQOXvdvF+39Wnc7t1W/FR6akKgx/O6tTfXlS8
         mn10BUiHbcq2VELhb+dw4uR1mhlVyybg6vDL1g0yzmI3b1XSX4LFHMsduu9TxY8KInym
         xYuDRXHIrN5kyLQ0w/7JGnUdF+OWLBo0J34Xm81G/THrljqYCdsFWnm1vEnGBUgzbAZS
         wPIR2B6dpN2o6HcnzkIIwa79A4m2jb2JEi5WDHaSngQi4Cfqcc2qlXaHos04emh4CAoB
         nBo4Tr586RFNm4CoYsU7KRf0zY6EUn/xS8Fe4cWZ6wXfbmlD44sEfDz2DU4Yw8fdU+IM
         mnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686674593; x=1689266593;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:to:content-language:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjEkXmQa5RegAKMYpw0eo8Wi8xCVRRDLtBMotAcljh4=;
        b=L83dExI5U5rdQedEozaQXKcjTHhHqHfTOnE+QWFzkhpMohrTU5ouAC4xFQXIlLJlDJ
         VsduNsMX5wadW3pXXvXxQYY/X7emO+tHVrxMBONeavThirPtRs4RDJLrrrR2IkX/ZM4X
         AOA8NUCyLaym54SOEBwCobj1FiM/DNWTgKX1GY5TAQG/kmn8d9bQEIy1EYFgkMUuHNTy
         Mhk7W8KJzXS9DTvaNz/P+1jIqeNOTyT/s2bm6X/NMNLYhigSTvzjQccrvEfMwB+zuzSr
         YElcJhPSN8oHXx5uXI+l9q2orhxWEW4vsvFS+uAu230oLp5TbOA61JwF0GKnu77t425Y
         dn9g==
X-Gm-Message-State: AC+VfDwrQAsNEdZ2yO3cMOzYbcUS9gbk+rwkQ/XaqZqdXWvHdAiyr5UG
	4mW4wa33FyiEumx1Pe6O1xE6Yg==
X-Google-Smtp-Source: ACHHUZ49Vm3HZocRk1jn1ZVCvW2MZlf6W1AKJJptrooPX281PImI1z2sbuNdAH7A+F9ywGKTtm/p/Q==
X-Received: by 2002:adf:dd47:0:b0:309:43cd:484d with SMTP id u7-20020adfdd47000000b0030943cd484dmr7582270wrm.27.1686674593558;
        Tue, 13 Jun 2023 09:43:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48b:b939:c60e:e1ba? ([2a01:e0a:982:cbb0:48b:b939:c60e:e1ba])
        by smtp.gmail.com with ESMTPSA id q18-20020a05600000d200b0030e5da3e295sm15796212wrx.65.2023.06.13.09.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 09:43:13 -0700 (PDT)
Message-ID: <cd80d13c-32c4-3f01-04fd-0424fa07bf6a@linaro.org>
Date: Tue, 13 Jun 2023 18:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: tanure@linux.com, kernelnewbies <kernelnewbies@kernelnewbies.org>,
 linux-amlogic@lists.infradead.org
References: <CAJX_Q+0Ei+6gueLBxnRsaqS8HeFPJC2UU1+k7rxd68Tdq1NyJg@mail.gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
Subject: Re: Better way to upstream a single-board computer?
In-Reply-To: <CAJX_Q+0Ei+6gueLBxnRsaqS8HeFPJC2UU1+k7rxd68Tdq1NyJg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_094316_078758_40E9C074 
X-CRM114-Status: GOOD (  37.65  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Lucas,

On 13/06/2023 12:02, Lucas Tanure wrote:
> Hi,
> 
> I have been trying to port Vim4 to Mainline for the past few weeks.
> Downstream branch:
>    https://github.com/khadas/linux/tree/khadas-vims-5.4.y
> 
> - First approach: The compatible string way
> In that 5.4 branches, clean the device tree to the bare minimum to
> have a serial console, sd-card mount and ethernet, and reduce the
> kernel config to only build the necessary modules.
> With those 2 in hand (minimum dts and config), I could port the
> necessary drivers for which the dts have compatible strings. I did
> manage to boot once a v6.3 kernel with that dts and config.
> But it would hang a few seconds after booting the kernel. And after a
> few days of trying to debug the problem without success, I decided to
> move to another approach.
> 
> - Second approach: The fat patch
> I compared a clean 5.4 branch and khadas 5.4 branch and generated a
> big fat patch with around 2.5 million lines, where when applied to
> clean 5.4, it would boot and work.
> I started to chop the fat patch to remove stuff that did not need to
> get vim4 working with only serial, ethernet and sd-card.
> I managed to reduce to 1.3 million lines the fat patch, but after
> that, things started to hang and crash, so I was unable to move on.
> At this point, I realized that 5.4 khadas was actually an
> Android12-5.4 branch with amlogic and khadas stuff.
> 
> - Thrid approch: The android fat patch
> I am doing the same thing as the second approach but using an
> android12-5.4-lts branch as the start, where the comparison shows me
> only the amlogic and khadas changes made.
> I am still going through this method, but it is promising. Right now,
> I have the fat patch with 0.9 million lines.
> My idea here is that when that fat patch becomes small enough, I can
> apply it to a clean 5.4 (no Android) to work it out more. And when
> that patch becomes something tinny, I could apply it on mainline,
> adjusting for the kernel version jump.
> 
> - Fourth approach: The rebase way (On hold)
> I could compare the android12-5.4-lts git log with the khandas-5.4 log
> and start to cherry-pick patches to a clean 5.4 (no Android), but from
> experience, I think that's going to take forever, and it would be very
> hard to apply patches as they refer to an Android branch, not
> mainline.
> 
> The intermediate goal is to have a patch on top of the mainline that
> boots vim4, no matter how ugly. With that in hand, I can start
> re-structuring and getting ready for upstream.
> 
> Now my question for the community:
> Is there a better way to port a board to the mainline when you only
> have an old kernel that boots?

The way I personally use and most Linux developers use is the iterative
way, start from vanilla upstream linux and add small features after
each others while upstreaming at the same time.

First a basic console boot, then pinctrl, resets, clocks, mmc, ...
and then keep the "multimedia" stuff when you have basic providers
functional (clocks, reset, pinctrl, power domains).

So first, upstream the initial bindings for the SoC & board, and a minimal
DT with only UART & CPU0 without nothing else. (Like is done for S4)

Starting from the vendor kernel is a loss of time because Amlogic
does a lot of incompatible changes from upstream and you will spend
a lot of time reverting their changes to mimim upstream.

Neil

> 
> Thanks
> Lucas Tanure
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
