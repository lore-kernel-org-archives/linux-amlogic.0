Return-Path: <SRS0=NF66=K2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B8DC47082
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 May 2021 07:18:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2265C6108D
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 May 2021 07:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2265C6108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3CA7O+xa+j1RAHFjMJtGjmywmjt6ju+Wp2uSyIkGI6I=; b=ijSGMX0D30bGQq33AlEu1+9XXP
	Z9R8KNnSrwxF8r6y6NhKLRrDoAFLRk80XOofJ7oxYTtMJXd0Myb1Gp1XfZ1zb0zvhe2Ao6lm17Ddd
	irTGONCnPoe0HkvoNcWLd0nSsqsWtGi1BNIi5nK0VgM7/Wl9muRQGp8AiAeWMXbuXtwiJXAOV4zZn
	R6ZGy28nc0sRcUy6LgZCHw87zYodhwwqpvGy6RDvverAoY+yTYax3rjbVE9Ar3SqiAZLlImCFcF5k
	ZXSlYCyl5hE6LtqS+fN+E6VMUp6IhfqsSm5wYN5ZWl7DiTJVypbYgo375bKtJAtLvIMEmmlaMHYdB
	keKcXA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lncBr-00B9xT-1Z; Mon, 31 May 2021 07:18:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lncBn-00B9wQ-SH
 for linux-amlogic@lists.infradead.org; Mon, 31 May 2021 07:18:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so5935812wmg.3
 for <linux-amlogic@lists.infradead.org>; Mon, 31 May 2021 00:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yzOPm44mU6wdSe0rFBtn0wpByYVkRe5hZQ+xGNYSjCk=;
 b=yVc9QFFp4SSuyoFdUxPxOZU59Lr6Z/Dnl7dX+Hl6zqhNW1rOZ82rc86PQjIRbR10zg
 sZqgpf4bOYkCrFKdZyqYsyoP0ZyNSUpZzKpINli4A0Qs+hliobtdbAtvz5zGTivceGN7
 2tRhmlkAuC66EjY3+wohoyMnsAHe6xKtCkf80cKoJ5Z3RrEs1KDo38F+fiQHucBTu9q3
 ZLH8xvZ0wAy0RBoszOxBHkEDHzbM8RC/VJOjGFbL4TVU9IOe/a/ZUKgvmxHh6YaIKk8e
 7G9joCor3U9pKL7y6+uUnT7QifFMz3jZJF0SBSXOiXOsN5RpuNZXG8rllY8DPSTlL0WI
 x1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yzOPm44mU6wdSe0rFBtn0wpByYVkRe5hZQ+xGNYSjCk=;
 b=Rj3zOKhtWBKgbbAgP11sFbIps4un6tWKG6c2fkkIUMkF4PgtmjWjqPDbr+UuEkJ+O2
 dE/NMO1xYERyddlKwtSBxXCN/kLMH9bIHYhQNHLyqw46gtJzBTnfAjiy1ubCAT0nahD6
 SOrK56fVlCMIK8jCzPxbodKUxQa1x+FtYAlCVf3XCxI4/KQSJCQit5J34pFsl9XFFwwO
 23dstE2QjU6GibNAr0nG8RHZQrkXlHUsj44LlTx4ikcYA1HdnGuYbs0MnER3vtsreTSS
 COh2cfroMdfMhsDbO4ThtmsAve9H/O6ujhET1+TMHmTbSRu99CI0ioYLLP5YNIrdu42M
 rZqQ==
X-Gm-Message-State: AOAM531U0UcKc55yOq20ARQNNq08vbw2u7G3AEyzl6cexUZ8lRT8K5Of
 tS6GU2GRjg0p7CSHrakWk8tjGSSBUK77QfkT
X-Google-Smtp-Source: ABdhPJwVmIyNrhSc2AwqfskqYQcQpraO8DqOj3l17pvV3m4Y7YQmhYRV1JFTSfzaxaEUdpDs0MMSPA==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr24997444wmo.180.1622445496932; 
 Mon, 31 May 2021 00:18:16 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6567:aa5c:6dc2:fff8?
 ([2a01:e0a:90c:e290:6567:aa5c:6dc2:fff8])
 by smtp.gmail.com with ESMTPSA id t14sm15809230wra.60.2021.05.31.00.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 00:18:16 -0700 (PDT)
Subject: Re: updated Amlogic repo used for linux-next
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-amlogic@lists.infradead.org
References: <7hmtsgrpkt.fsf@baylibre.com>
 <20210528083821.72dda431@canb.auug.org.au>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <610bbec0-d8c6-4ce2-ffc3-80dd124653d0@baylibre.com>
Date: Mon, 31 May 2021 09:18:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528083821.72dda431@canb.auug.org.au>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_001819_998180_A8BB5F76 
X-CRM114-Status: GOOD (  23.65  )
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

On 28/05/2021 00:38, Stephen Rothwell wrote:
> Hi Kevin,
> 
> On Thu, 27 May 2021 11:36:50 -0700 Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Please update the tree used for Amlogic SoC kernel development
>> (suggested patch below[1].)
>>
>> We've switched to a maintainer group for this tree which is now
>> co-maintained by myself and Neil (cc'd)
>>
>> [1]
>> diff --git a/Next/Trees b/Next/Trees
>> index 2d22ca1d2911..1794b9144f3a 100644
>> --- a/Next/Trees
>> +++ b/Next/Trees
>> @@ -103,7 +103,7 @@ arm64		git	git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux#for-next/co
>>  arm-perf		git	git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git#for-next/perf
>>  arm-soc		git	git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#for-next
>>  actions		git	git://git.kernel.org/pub/scm/linux/kernel/git/mani/linux-actions.git#for-next
>> -amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git#for-next
>> +amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git#for-next
>>  aspeed		git	git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git#for-next
>>  at91		git	git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git#at91-next
>>  drivers-memory	git	https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git#for-next
> 
> I have updated the tree URL and added Neil as a contact.  I still have
> Carlo (cc'd) listed as a contact, is that correct?
> 
> [The following for Neil's benefit]
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 

Noted !

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
