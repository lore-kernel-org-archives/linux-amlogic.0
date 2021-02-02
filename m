Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF41C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 02:25:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0869D64EE5
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 02:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0869D64EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xlu6JXEVo2oFk1nrLoiBFJ/QL8ReHjFbNE5yM8JBgPs=; b=Nb5ku5Brsu9BjmKr4NqgEHc7Y
	ChuDlmAi31Ekn66hZ6eoi+StnOYuDtkhvp6aZzYrzcQs1GpgPzBv2jNZbjIfwHRnjbTngs96eRONp
	Stbl7gmYFOAvmPMaALC8EeWGBJKqxw/QHYfnKvCTLVLWSNbcl0eizbTha461KJ5hX9eIIVA6Jcu1F
	ymyuW2Mdbsdl3qzQEaq5HHwy+brrIKUxcKGVF0ucyM7cwAMt67dmjPVmChfKSKpaW7JJ4xs2R1isR
	YRYplk2YkrPekGhBQlxxx2MXLelbLmLNS0ToPu74c5DLcEP1E7fxQBwYBzfaytg+5R/XNE0vDDlld
	JqE7JKphg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6lNx-00067A-PL; Tue, 02 Feb 2021 02:25:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6lNt-00066D-Qs; Tue, 02 Feb 2021 02:25:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 190so1029868wmz.0;
 Mon, 01 Feb 2021 18:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DR5yCvFMeWyg5lOQpZzKiO9ls9286n+whAuS0V/qOws=;
 b=N54kLpmRW/o0Fx65J53agalyEoePAFJedinVSSjnVhjrWXWzOrpeN7nNLXlG4VywCS
 FDyjypLmxXVo9rP5G38azUjHObGzlEkBwwyTVRe/u9SsIzoUqik/erCwjLd2IDRsecTs
 UGHSqvXZximjKgl7eJ2lxqqoApoT5KZzBx3qw969slmX2XoAGOqpaKuZzDVx5ekrOf6D
 FJhMq8JE7YCuPzm/YG9htmOxeSpGEkvlPUA8dwiLnZ2vYrbUTRZvMxnPPuqlXhanu1Ld
 xCZaq1eseyizv9+8TK1ceO1XJCO75/R1o+kNwrypByL8m1y9vTP/rqDPwBeLsOyNL0HL
 xjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DR5yCvFMeWyg5lOQpZzKiO9ls9286n+whAuS0V/qOws=;
 b=neesqVOdcsUEPy7ZyasbPg41I/vCpt5FfPGz4UoQ7SkBzCRpcSMcVrrHmAqw/vYC2O
 w74kOdvEwKGqw7pGjkJsQHvvuQuPKFGuPHYKuceHlgANGH/6A9rIiIYycew1pu2GyS/O
 hA1gumXslaXxgdniHfNuhYTVLvMHEB3L/93ZJxoCdW0bA5pD+fPoEcDpa5RfhZXgq/v/
 qTsLH9bYOeJMDlhxALPLYTF7ivnuQEeOQQCe+2r4sDhk0f6d7HAkT4LMkEnwIAyQQL8J
 bJy+UoCeyj5wuhGdvqxIQL8ta9VAlWNkgrgoqi4kWBZTnlBgaDqKUiayvtKWcDuUgF3R
 3A6Q==
X-Gm-Message-State: AOAM533O/XPJqIEceV09+csE5Q/riywqzqPMw+P9+spPpDlbyNKRZyJW
 Sgf7n7uMyDtBd/INB8vcLBc=
X-Google-Smtp-Source: ABdhPJz32kMfJiyD3thxl1MMQl3s+ioMDDtAS4T5kA9kPajX9emg1cy9yjTQHmgLVK7JuamG9wBOYQ==
X-Received: by 2002:a1c:620a:: with SMTP id w10mr1360206wmb.167.1612232740495; 
 Mon, 01 Feb 2021 18:25:40 -0800 (PST)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id a16sm28531311wrr.89.2021.02.01.18.25.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 18:25:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: [PATCH v2 0/5] arm64: dts: meson: add support for ODROID-HC4
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <7h5z3bi9lz.fsf@baylibre.com>
Date: Tue, 2 Feb 2021 06:25:37 +0400
Message-Id: <CF8AA6AA-1BC0-41A6-B0EE-A4D326487011@gmail.com>
References: <20210131055358.21293-1-christianshewitt@gmail.com>
 <7h5z3bi9lz.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.17)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_212541_915951_05C71FD2 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


> On 2 Feb 2021, at 4:42 am, Kevin Hilman <khilman@baylibre.com> wrote:
> 
> Hi Christian,
> 
> Christian Hewitt <christianshewitt@gmail.com> writes:
> 
>> This series fixes minor sort-order issues in the Amlogic bindings yaml and
>> dtb Makefile, then converts the existing ODROID-C2 dts into dtsi so we can
>> support its new sister product the ODROID-HC4.
>> 
>> I've also given the devices different audio card names. This is partly
>> cosmetic, but also because HC4 is HDMI-only while C4 can be used with
>> other i2c audio devices via an expansion connector so users may want to
>> use different alsa configs.
>> 
>> Patches to support the spifc chip are still being upstreamed [0] so this
>> will be addressed in a follow up. A WIP patch for the dts change can be
>> found in my amlogic-5.11.y dev branch [1].
>> 
>> For reference, here's dmesg from LibreELEC on 5.11-rc5 [2].
>> 
>> Changes since v1:
>> - fix ODRIOD typo in patch 3
>> - fix SPI-NOT size in patch 5
>> - add Neil's Acks/Reviews
> 
> Could you please rebase this on top of my v5.12/dt64 branch[1]?  This
> has conflicts with some stuff already queued up there.
> 
> Thanks,
> 
> Kevin
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/log/?h=v5.12/dt64

Oops. v3 sent based on that branch. Thanks.

Christian
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
