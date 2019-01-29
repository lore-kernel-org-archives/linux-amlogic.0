Return-Path: <SRS0=Lc8Q=QF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226D8C169C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 10:24:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E73E321473
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 10:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fl5il3jT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NMSowhbE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E73E321473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mxt5EYzt2LjFsnR+C0MqpMIheVYI1rPOVe24gQAMSxs=; b=Fl5il3jTIx78L4
	j9LPu5cWeVmn9eIDL4tXPlBLdVdryx7qxPnkv6MFMev/e6pb1X2ki+Moob2yXglWt74fpBATC7/Vb
	YNqr3xnFPiGkoPGEO/v6VF2Zy5NQJBuFuwc7KDIupocbJ/IT/bB8Q+8emGPWgebHBU2uluZG4ow1/
	Dr2M5mYaZKgjfjug4d+6Be+QXy4HaUEuhuYgZYT8rGBYPHYoc4uPFQtLw9ApkSozTXVqkTrY2ZrAJ
	Zxurs6JTmubW8hQLb+hJMhI0qvWB+C//wJW58JrJX2j4qlzqHtZxI0q1GZZpfdsSeCebTtRBlMFEP
	YNa7sqTqJqlwPgyf5gFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goQZG-0000YP-IL; Tue, 29 Jan 2019 10:24:34 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goQZ4-0000MG-Ql
 for linux-amlogic@lists.infradead.org; Tue, 29 Jan 2019 10:24:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id l9so21328766wrt.13
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Jan 2019 02:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XIWwWKt6+oCOO6cq2DZHb0F9eETVOES12psz3Sr+1T8=;
 b=NMSowhbEAadq0sol8vCSD6RPOw6gzLfVzMboboIzUBYoBTZEkL0uv73xb2H7pHY+9i
 FmXZ9lTnYyTw4DNIdyJ0TRNqGTVteuB2uxG++EfKMEPhTHJZnkUpkVDa7xUOV8KURJ3s
 Y+Kzp9mRZHkB+C3hXPhpWCPjXGQlAr/nta2QcIT5gCb7CAE7xOHmsJsKDTH+j4ZzX4ep
 //p1w8nerEUkGGfkni2Cqz/AZgac+EKRulTvQih8iL2LrR7qX3Ul4cuTOAqsU99JPrHy
 g8okrIHedoFg8w4ztgiVVWOps9Qa4XiJgTYKbY8Hk+GLTk220ADZDKoV8pRLmncyQbwR
 9Tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XIWwWKt6+oCOO6cq2DZHb0F9eETVOES12psz3Sr+1T8=;
 b=de19OSEcQGYGYjbxiXnDEdDExwtNQ8h+gQ+UUivPC00sg3Kx7aKJwOliNAkqM+pPyQ
 exMQN6FiKbd3beWLH0bcBHkgILqWt3gTYrjfx0+wdshXPd9j/75WO/w77e0kx20P+Jq6
 HCQgiUpjypVon4VrR1CYbEuL4lFk+fRleIKu0w/poNDO7Axp3DSZOEDVf3qaXFBvNBNr
 Mf7ggYI7T70YLcVli522478PB7T9w77189s0oEAHYYXrOJyE9zKSk3ZkDMfyiDspSAA4
 ZWGcG4m6Zwf/50wVCpbcE12ctY4buY+kfxqvueDHKE32tcnPrjGNhD5Mnb7tbwfFt4Ne
 /WAQ==
X-Gm-Message-State: AJcUukeZ5uT4oCarIqBok/DcWlm16O/ajJ6rp4VSOAOpYUJw1mRnQq+H
 kGy+JnWsxlGev/9WJiaDT+CKFw==
X-Google-Smtp-Source: ALg8bN6YajtzxgYWfRDSV2s0O4N8XF9CMQ3zgRKk1+I8NpKTZ+iAvmK5GNgDrfA9guKccz3fDOGXfg==
X-Received: by 2002:adf:dfd1:: with SMTP id q17mr26692099wrn.27.1548757459920; 
 Tue, 29 Jan 2019 02:24:19 -0800 (PST)
Received: from localhost (aputeaux-684-1-12-29.w90-86.abo.wanadoo.fr.
 [90.86.215.29])
 by smtp.googlemail.com with ESMTPSA id 129sm3442270wmd.18.2019.01.29.02.24.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Jan 2019 02:24:19 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [GIT PULL] Amlogic fixes for v5.0-rc, round 2
In-Reply-To: <CANAwSgQzXg0MW4bH=NpbxmZ6a0bf7rr0F4_gP+bDUMurJsA9bQ@mail.gmail.com>
References: <7hh8dsqyv8.fsf@baylibre.com>
 <CANAwSgQzXg0MW4bH=NpbxmZ6a0bf7rr0F4_gP+bDUMurJsA9bQ@mail.gmail.com>
Date: Tue, 29 Jan 2019 11:24:18 +0100
Message-ID: <7hk1inpxrh.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_022422_868475_B15EE89E 
X-CRM114-Status: GOOD (  10.72  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Anand Moon <linux.amoon@gmail.com> writes:

> Hi Kevin,
>
> On Tue, 29 Jan 2019 at 02:33, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Olof, Arnd,
>>
>> Below is round 2 of Amlogic fixes for v5.0-rc, based on top of the first
>> round.
>>
>> Kevin
>>
>>
>> The following changes since commit 19a220dd1e8a1b1d8e5e2f8f4a25313c4b02d527:
>>
>>   arm64: defconfig: enable modules for amlogic s400 sound card (2019-01-08 15:27:50 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes-2
>>
>> for you to fetch changes up to c90c44d8aaf5895320da1621b0a502ed5528e437:
>>
>>   ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset warning (2019-01-17 14:40:45 -0800)
>>
>> ----------------------------------------------------------------
>> Amlogic fixes for v5.0-rc, round 2
>> - several fixups for the GPIO cd-inverted change
>> - IRQ trigger fixes for MAC IRQ
>> - USB PHY reset/power fixes
>>
>> ----------------------------------------------------------------
>> Anand Moon (2):
>>       ARM64: dts: meson-gxbb-odroidc2: Fix usb phy regulator power failed warning
>>       ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset warning
>>
>
> Sorry I would like to resend my patch again, just waiting for feedback
> on below patch.
>
> [0] https://www.spinics.net/lists/arm-kernel/msg701859.html
>
> I will resend send these patches.,
> so please drop above patches for now.
> Sorry for the trouble.

I already dropped your odroid-c1 (32-bit) patches as you requested, but
these are for odroid-c2 (64-bit). You want me to drop those also?

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
