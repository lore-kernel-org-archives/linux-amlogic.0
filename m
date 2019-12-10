Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51E3C43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 18:13:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF50207FF
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 18:13:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GKx0Frvc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ax41RgSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF50207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKEK62cZFZ5AhGt6nZtjUPYPAeVQjWk8oKD7VdfbMss=; b=GKx0Frvcp5Wx5i
	xGYLxFwI0XAK1551dY7sXuhcXn/LRXlB2LbaUBqG4zE2Y7FQuEdJqQDy9NrsQ8r9xqt3VbgumloSN
	Rhi0RZwdEvHi/IqOHB3lO/Pbqm379mQ1bPzNkawIx4oN2qZrN5pH3JBtDkMZWcBJQBcGyoDX/PGh5
	SHiiLIrqDdh6caI7Xgnpd9J1wTIbkfsMk8wfGt2lCP6NQc2bsT3Fh6N1JNixn8lazbBXlk3CQeZZ2
	ORZQKseDm0OiUZCnpYWRQWxurcr27G4EdZkys/D/jm5wSFCFfDbM0PEvZumlALGy5MTWo0AdeqyVF
	wTpQvIqrAvjaM30vVY3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iek0q-0000FN-TL; Tue, 10 Dec 2019 18:13:32 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iek0f-000052-7E
 for linux-amlogic@lists.infradead.org; Tue, 10 Dec 2019 18:13:23 +0000
Received: by mail-pj1-x1041.google.com with SMTP id j11so6591504pjs.1
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Dec 2019 10:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=4lLGRmsliIpZ0UpKU0IEWW602jVUv7+6lHITbij3O5Y=;
 b=Ax41RgSauchkK4JBfY5KiQhx0ZqAGsHlTIabiht9+ufmYPy0A/k6fzpIOehD7/e1BZ
 rVNN9fQqcCTUysbKXiB+vDRvErr1DyzQPtKiTYcJqj2GHjmATSk3qucVeOLVRCkOhEIu
 K5dAVffJQTTNp4WTUL3ki2V3LvaaviZN1KCbOON0El12ZWTLGoM+UwftSpRs5Plgaxb3
 JVbzGapJbO730NFVsQnawfZ+KVkgcjfTaxggwi194/nxW0zjNi9K7TZVjJ07vcCzE4r5
 L/qmEmEiYuVsMLunBZzzlhPYONXzzXDmajP/VEpXPY6582YOziMrl931APa+/HAqnF5W
 wXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=4lLGRmsliIpZ0UpKU0IEWW602jVUv7+6lHITbij3O5Y=;
 b=ruHR3kr9Ea7TjU78dEAqDeoN7rmSzALTS6geeXy2wzW5Cp0H2+uDIHLTlP6R7ejgE7
 0G3rddC5VnXVGeujjup+JszKxkrTWo5RM1TGecYOlWJHSOfvD7+w3z3PJaA8VZevya5V
 mPyHuWm5gydhW9YfXQeG6PnC/YMFE4k6fRXoW6hANkHYb+DC4mfztSC+DdPqxreQsBr7
 d/3rtkzvCWJ25nZtMrROtsFoI8EzHpFib0Rbvs5+9roiZA4hn9FDXEG5Sp51dHSMZmg2
 Rd31HgauhEbhFrf4lOlnEUk3/yt5uplDrkKXSzKj2ALKV6dGVPNb7eDmsBSw8YvRJkzf
 Bm/Q==
X-Gm-Message-State: APjAAAUZIGDGe8ewMsLYHyv2BqJ8rYxNLadRYT61zzNwYigiEpPUPAMp
 GbWlclZ3vITmCJaqZLHPacOiAg==
X-Google-Smtp-Source: APXvYqxJRm4sHGA5uWrmJ+2D9cTFf8Qb8j2tRTkfuT9957FR3ONic55nbNNuLrP58IxTnaW0jHeS9g==
X-Received: by 2002:a17:902:b611:: with SMTP id
 b17mr22648668pls.210.1576001599750; 
 Tue, 10 Dec 2019 10:13:19 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id u123sm1382107pfb.109.2019.12.10.10.13.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Dec 2019 10:13:18 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC-next 0/1] Odroid C2: Enable DVFS for cpu
In-Reply-To: <CANAwSgQx3LjQe60TGgKyk6B5BD5y1caS2tA+O+GFES7=qCFeKg@mail.gmail.com>
References: <20191101143126.2549-1-linux.amoon@gmail.com>
 <7hfthtrvvv.fsf@baylibre.com>
 <c89791de-0a46-3ce2-b3e2-3640c364cd0f@baylibre.com>
 <CANAwSgQx3LjQe60TGgKyk6B5BD5y1caS2tA+O+GFES7=qCFeKg@mail.gmail.com>
Date: Tue, 10 Dec 2019 10:13:18 -0800
Message-ID: <7hfthsqcap.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_101321_263685_CC5FFBF0 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Anand Moon <linux.amoon@gmail.com> writes:

> Hi Neil / Kevin,
>
> On Tue, 10 Dec 2019 at 14:13, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 09/12/2019 23:12, Kevin Hilman wrote:
>> > Anand Moon <linux.amoon@gmail.com> writes:
>> >
>> >> Some how this patch got lost, so resend this again.
>> >>
>> >> [0] https://patchwork.kernel.org/patch/11136545/
>> >>
>> >> This patch enable DVFS on GXBB Odroid C2.
>> >>
>> >> DVFS has been tested by running the arm64 cpuburn
>> >> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
>> >> PM-QA testing
>> >> [2] https://git.linaro.org/power/pm-qa.git [cpufreq testcase]
>> >>
>> >> Tested on latest U-Boot 2019.07-1 (Aug 01 2019 - 23:58:01 +0000) Arch Linux ARM
>> >
>> > Have you tested with the Harkernel u-boot?
>> >
>> > Last I remember, enabling CPUfreq will cause system hangs with the
>> > Hardkernel u-boot because of improperly enabled frequencies, so I'm not
>> > terribly inclined to merge this patch.
>
> HK u-boot have many issue with loading the kernel, with load address
> *it's really hard to build the kernel for HK u-boot*,
> to get the configuration correctly.
>
> Well I have tested with mainline u-boot with latest ATF .
> I would prefer mainline u-boot for all the Amlogic SBC, since
> they sync with latest driver changes.

Yes, we would all prefer mainline u-boot, but the mainline kernel needs
to support the vendor u-boot that is shipping with the boards.  So
until Hardkernel (and other vendors) switch to mainline u-boot we do not
want to have upstream kernel defaults that will not boot with the vendor
u-boot.

We can always support these features, but they just cannot be enabled
by default.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
