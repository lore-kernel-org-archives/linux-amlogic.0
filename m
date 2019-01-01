Return-Path: <SRS0=NIB4=PJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC351C43387
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jan 2019 23:03:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77E562073F
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jan 2019 23:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UUDVuwED";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NETm6BV4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77E562073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wu3aITGi95kaO2aXpp2pTYJCfVk6s8opRsPr7YrUFj4=; b=UUDVuwEDcvoqkD
	vZTUq0LflNpUEBT2gf+zhi5+Zeg7RKhtFHFtog32AjWjiyFDBXUuiR7vIK/vr10jiGnEo60m5mTCf
	YpkO16HV9zXkltvmOCJ1elB8u5NLAwR6fPq0DdZNrlwdTh6dxBYtiEmhySP7xBaJ0ZrdGVSXoRzqL
	KMPl5N1pCRFN69MUyFq8FWoOjL2SZ9WwMuDoHSqyUcijcOWNBndt1sTnhhohRWpZe33weHGbd+YZf
	oK+k0BzLDFMjTMhf98z8i2LdrXzV9cMY6iGZ8RsttbKfL5T5B+yUK3TVFz2ZB4fITVPB/9KoK1dQD
	/2WwORubPJrsnpefXSTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1geT4Y-0007PI-Bh; Tue, 01 Jan 2019 23:03:42 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1geT4V-0007Ol-DV
 for linux-amlogic@lists.infradead.org; Tue, 01 Jan 2019 23:03:41 +0000
Received: by mail-oi1-x244.google.com with SMTP id x23so23954095oix.3
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jan 2019 15:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=0kzLTD9cNa5BVVujkjoT/+UeCjloJKeE3khnZNp61qk=;
 b=NETm6BV4wB9AmAmbGFppDy/uT1FvCxIbyZ824CT7bmlu0YZ8iCWqcpQXvrU0KkJd/8
 5lJP/BdrrM0rehrdxCRhQitB28iOFY5QM/4HMkBmZxUuLbEiV2dLuHDrIMQ1rMf2d7gK
 tjPDxRHsZ/bD88I78qw8Kiq+4oBKBu25G9oUkxLAf8x64w+1+WlN6r+hSvYoOWLUyfCR
 taN/45dgxI1k10EoilWTQlUE5bE+yBApMhddpnQkdkJONxnwTVDZXvR4yB/XyKO3zY84
 dpv88exyiUFowvmefzghIREYbf/cUogxJH/vXj1D0x1pF2G7m5DKNPJZdVLRbztquPMC
 4H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=0kzLTD9cNa5BVVujkjoT/+UeCjloJKeE3khnZNp61qk=;
 b=LKL1zgpZnjsxI8L39DqwSO2oOzmuTWOc6z4a+i52Dgwt09p+69CQo01EAnTEnlU7zg
 nLrWJXSOS2jbdfIU2Js5mNIQM5lV+fL9Jy+DupGJwnhDqZySX0w1DCeSdkcfNj1L8G17
 tcuvagFM5sQxXgAgeqqNGzBXehM9HrprPb9Cnvy7YKDRK3FdSjRTZS/EDYSN5a3EuX8E
 GZ2Wqbzq9PRpSa+7DW4pxo7P1YJjsZC8GmoiLjFQzrvVUQGMV5YqXgUBa9MRgSlBIucv
 hQQW4ont6k/9SzB9f6wq/G99CsCci0/xXZ2BmJYFcp0myZWHEVzLsm/DklxRkV/uUBfj
 c7Bg==
X-Gm-Message-State: AJcUukeTGlv/M/R9D7iSVyvEnGzRnCnR4UZnyQ7BGbfjJUlcxJm8miPL
 FHqq5ebrb5wUSdG92lGr7uWRwQOcbe9au55qJY8=
X-Google-Smtp-Source: AFSGD/V3AEgWpdXOaI8Gofcl1xlp9MbLrXWORVcQWkK44vZvdW2M5kT2X5iK3REyCYnBwGfO/e1GePBni2IbaTNE9kI=
X-Received: by 2002:aca:4ace:: with SMTP id
 x197mr29439784oia.129.1546383816668; 
 Tue, 01 Jan 2019 15:03:36 -0800 (PST)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 2 Jan 2019 00:03:25 +0100
Message-ID: <CAFBinCA5Hx0ibOZBfWBHBT5dZZjDqXyvw02j_gDCkfGBX_8vTA@mail.gmail.com>
Subject: pwm-meson: fix "BUG: scheduling while atomic"
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190101_150339_486748_D03E806C 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: linux-pwm@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

while working on some unrelated drivers I checked the kernel log on my
Meson8b EC-100 and found this BUG:
    BUG: scheduling while atomic: kworker/1:1/104/0x00000002
    Modules linked in:
    Preemption disabled at:
    [<00000000>]   (null)
    CPU: 1 PID: 104 Comm: kworker/1:1 Not tainted
4.20.0-10293-gfa81effbf874-dirty #3904
    Hardware name: Amlogic Meson platform
    Workqueue: events dbs_work_handler
    [<c0311c0c>] (unwind_backtrace) from [<c030cb88>] (show_stack+0x10/0x14)
    [<c030cb88>] (show_stack) from [<c0c77674>] (dump_stack+0x7c/0x90)
    [<c0c77674>] (dump_stack) from [<c034a348>] (__schedule_bug+0xb0/0xd0)
    [<c034a348>] (__schedule_bug) from [<c0c8ffb0>] (__schedule+0x4e0/0x7b4)
    [<c0c8ffb0>] (__schedule) from [<c0c902cc>] (schedule+0x48/0xa0)
    [<c0c902cc>] (schedule) from [<c0c90840>]
(schedule_preempt_disabled+0x14/0x20)
    [<c0c90840>] (schedule_preempt_disabled) from [<c0c91688>]
(__mutex_lock.constprop.5+0x220/0x5fc)
    [<c0c91688>] (__mutex_lock.constprop.5) from [<c0718398>]
(clk_prepare_lock+0x50/0xf8)
    [<c0718398>] (clk_prepare_lock) from [<c071a8c0>]
(clk_core_get_rate+0xc/0x60)
    [<c071a8c0>] (clk_core_get_rate) from [<c06d7a28>]
(meson_pwm_apply+0xe8/0x404)
    [<c06d7a28>] (meson_pwm_apply) from [<c06d6c94>]
(pwm_apply_state+0x6c/0x1b4)
    [<c06d6c94>] (pwm_apply_state) from [<c07435bc>]
(pwm_regulator_set_voltage+0x124/0x190)
    [<c07435bc>] (pwm_regulator_set_voltage) from [<c0734790>]
(_regulator_do_set_voltage+0x134/0x5a4)
    [<c0734790>] (_regulator_do_set_voltage) from [<c073502c>]
(regulator_balance_voltage+0x224/0x6b8)
    [<c073502c>] (regulator_balance_voltage) from [<c0734d90>]
(regulator_set_voltage_unlocked+0xbc/0x134)
    [<c0734d90>] (regulator_set_voltage_unlocked) from [<c0735504>]
(regulator_set_voltage+0x44/0x74)
    [<c0735504>] (regulator_set_voltage) from [<c0a1c618>]
(_set_opp_voltage.part.3+0x2c/0x94)
    [<c0a1c618>] (_set_opp_voltage.part.3) from [<c0a1cef4>]
(dev_pm_opp_set_rate+0x3bc/0x458)
    [<c0a1cef4>] (dev_pm_opp_set_rate) from [<c0a25fb4>] (set_target+0x2c/0x54)
    [<c0a25fb4>] (set_target) from [<c0a2147c>]
(__cpufreq_driver_target+0x194/0x520)
    [<c0a2147c>] (__cpufreq_driver_target) from [<c0a24868>]
(od_dbs_update+0xb4/0x160)
    [<c0a24868>] (od_dbs_update) from [<c0a253a8>] (dbs_work_handler+0x2c/0x54)
    [<c0a253a8>] (dbs_work_handler) from [<c033c63c>]
(process_one_work+0x204/0x568)
    [<c033c63c>] (process_one_work) from [<c033d4bc>] (worker_thread+0x44/0x580)
    [<c033d4bc>] (worker_thread) from [<c03422d8>] (kthread+0x14c/0x154)
    [<c03422d8>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)

The setup on EC-100 is:
- CPU frequency scaling will be enabled with v4.21
- the CPU voltage regulator (called VCCK) is a pwm-regulator

I have not seen this error in the past, even though I've been working on
CPU frequency scaling for a while. So it seems to be a rare issue in real-life.
However, it can happen again because clk_get_rate is using a mutex
(thus it's not supposed to be called from atomic context - but we're
still calling it with the spin lock held).

I tried to fix this myself but while doing so a few questions came up:
- PWM core does not hold any lock when applying the PWM settings
(unlike at "request" time where pwm_request_from_chip is holding the
"pwm_lock")
- first I tried to move the spin locks to meson_pwm_enable() and
meson_pwm_disable(), but then we're still modifying the data in struct
meson_pwm_channel without any locking
- should we use a mutex instead of a spinlock?
- should we get rid of the pre_div, lo, hi and state caching in struct
meson_pwm_channel so we don't have to modify it when applying new PWM
settings?

Please let me know what you (or anyone else - feedback is welcome) think.
I can also work on a patch - as soon as we discussed how to fix it -
if you don't have time for it.


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
