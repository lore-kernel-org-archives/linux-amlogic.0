Return-Path: <SRS0=PIQu=XZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861C6C32792
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 15:32:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547E720815
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 15:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FoVZoKyL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DspFEq75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 547E720815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEBC/iwdHMRdk8kNZzC/Fb3/FMVJ3/k6tSvi2erw030=; b=FoVZoKyLb6P+OX
	FUamXtEzia6go1SAAFb2VO+h1WpNjZV5aw/iMDv4kQgb/KTPI2qsuOAO0lSXgH5bUKf/7EtKzoUgy
	mQr14WiXSJlnQkHjYR+RMeL5ubkyccl6yLY7rNVOO4KuIjkCb5zgh4y4mungQarbS2obu4JHplIMy
	kQguluEZ2z1KaKs2PUcdm+3arm8lfgcxdmb7nUKcU4Y8NnYxPN0X8S6dx2rJh5UXR3W+1lBFnuloy
	6IBGBF6NE+KvVsTwSjGg2yb/Z+Ak953Lmq3vdg1IwoihrESyofGdSAeMuTrYUIjPPl3zLv4yGzKhW
	3MNLu+JqLEv058xbG8cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iExeh-0006gn-1i; Mon, 30 Sep 2019 15:32:07 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iExee-0006fw-3b
 for linux-amlogic@lists.infradead.org; Mon, 30 Sep 2019 15:32:05 +0000
Received: by mail-pg1-x542.google.com with SMTP id s1so7588724pgv.8
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2019 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=b9OIKjSpfkGrTr/Y+X6VF1Witd9jN67vbQVGdxPPoBs=;
 b=DspFEq75s07cCzNf7CqP6PTbMlsS4I1/Y5EMMidfiBKMKPEOVkzHyfB86z4hXh5CYv
 Sb13RT2+eu/w7qNYHeavj7j9zZjYB4aDH3fEkvuCes729VTlJBHJ1UjaI8ztmdgmBRm0
 Logvd/uy6w9zJVAxYWfvbsQjCx/vF255+NMRMeA64Lsl98tV2UihbhqADqSgR+A+Wlcu
 UlMetQe7vajfPbtYGmgC1Hf8KI1Lflf6YkdwaEoUoj9yi9278RdZoZOXz55gMP3h+h2i
 44VWq9QDXxgm6JQhORBO8WzpXqktlFGS7/AfmaeTTTtbPS+8pVDytfqNGGiZ6sYMaHNg
 3CHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=b9OIKjSpfkGrTr/Y+X6VF1Witd9jN67vbQVGdxPPoBs=;
 b=EqgawNtm0WKFz0RXLzOZK+c+KiaJJIgrobfRxTystGNKtqN7XWU4006t6Q7ecvIO3X
 Aim/By6uUDOSWacTl2Xp3RkrpvOfHiRoGE4BpPibePx2JQYXbrae2hrC+lUJDAnkrBh7
 GtIVE6SlMh9W3Taw8zaBAeUgFdR0FvtXdbZ8u4ZkzIS6Wyd7Llhfp1eLBQBW7Cvqi8C4
 Z7RdHuJ6c+Uhiz75kZGzFySyGcwnSgE+7fusXzXdWDaKofnUe5bRxu6EJl628u7CkGcx
 jHI9gknFshBjyDS0fQ84gFo08DGB7PSpxCRifYa1+CM6myWXn0Jhlaaj2aycxwYdMcnn
 lRRw==
X-Gm-Message-State: APjAAAVR2Plx0ik9D46JcqaLd8qvLNqi7TQnJmbXIQUbSFighqVRUyuB
 FTlLQ9V7FWd2WT51AGNmMgtLl9RGsOk=
X-Google-Smtp-Source: APXvYqydQjTboQcTPVReW9T7Hi/m3KQq6ErGddNRlsfOxd4kT5ADyRwF+TwSTZBJlbg8hvOPivEyBA==
X-Received: by 2002:a63:cb07:: with SMTP id p7mr24892312pgg.232.1569857522901; 
 Mon, 30 Sep 2019 08:32:02 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y7sm11869079pfn.142.2019.09.30.08.32.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Sep 2019 08:32:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/2] soc: amlogic: ee-pwrc: ensure driver state maches
 HW state
In-Reply-To: <1jd0fi19dn.fsf@starbuckisacylon.baylibre.com>
References: <20190925213528.21515-1-khilman@kernel.org>
 <20190925213528.21515-3-khilman@kernel.org>
 <8936e777-8996-5c7b-ea9d-8e17c8d6c4b1@baylibre.com>
 <7hwodulvu6.fsf@baylibre.com>
 <21eafa69-fe26-2df1-d187-cddfe5b37951@baylibre.com>
 <1jd0fi19dn.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 30 Sep 2019 08:32:01 -0700
Message-ID: <7hv9t9g5qm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_083204_150723_9979990E 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Fri 27 Sep 2019 at 08:37, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
>> On 26/09/2019 21:08, Kevin Hilman wrote:
>>> Neil Armstrong <narmstrong@baylibre.com> writes:
>>> 
>>>> On 25/09/2019 23:35, Kevin Hilman wrote:
>>>>> From: Kevin Hilman <khilman@baylibre.com>
>>>>>
>>>>> During init, ensure that the driver on/off state as well as clock and
>>>>> reset state matches the hardware state.  Do this by always calling the
>>>>> drivers 'on' function, and then callling the 'off' function if the
>>>>> HW state was initially detected as off.
>>> 
>>> [...]
>>> 
>>>> I don't see what you are trying to solve except simplifying the code.
>>> 
>>> Simplifying the code is a worthwhile goal on its own, but that's not the
>>> only thing I'm tring to accomplish.
>>
>> I still find it ugly to power_on a domain to power it off right afterwards.
>> The issue is with the CCF enable handling which is not in sync with the
>> HW, if you boot with an already enabled clock, it won't be marked enabled
>> in CCF, and it's clearly bad when you want to have a fine-tuned gate state
>> handling.
>>
>
> CCF should disable unused clock so, in theory, you should not have to
> call enable() then disable() to get things in sync.

But CCF won't disabled unused clocks until late(ish) in the boot
process, which is also when the unused PM domains will be disabled, so I
think there's still a potential for race between the late "disable
unused" features of clocks and pm-domains.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
