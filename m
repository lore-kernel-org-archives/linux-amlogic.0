Return-Path: <SRS0=PnGF=DE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062C4C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2020 02:55:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77B4238E6
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2020 02:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tny0NLIh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsgegHhV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77B4238E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SvefoAjLDytm8ktzdPf0/JIkNl2xmhQspaNnt1IDy5M=; b=tny0NLIhL01Li7C+ceJc3HgyVP
	RAvnvMqiDEA95SWzK1gy2KvLHzcWAB47rdkym4WFklPQDCCstjdZHzR9y/dpKNshYMinVQV5S8EUg
	TtS1gU6pL7Wb55kWC2wjdC38UxYpYxkgDxMgtrM5geVlbo2uwn5B/qz4zhxVxCjBFtUAizgZpokyz
	r2TM4/mXhaB0H0XHcijVtu/N9+R9pozc7rOjbBVEVZZqCshNmG8rOZyF9rVeAVzf5+nJahNbwckWL
	Qq/Gw9JH+kiGioZKZrWqUXWhdY0Kg6IEuWCK0MZ9M04bEOOFIlyiwW3nr0WJH2vAWWgob3Edi/7+S
	fyuSpchQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMMqF-00029S-31; Sun, 27 Sep 2020 02:55:11 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMMqC-00028i-Da; Sun, 27 Sep 2020 02:55:09 +0000
Received: by mail-pj1-x1044.google.com with SMTP id kk9so1594505pjb.2;
 Sat, 26 Sep 2020 19:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdI7d+rqTIus/Dk9IPQIHfyY4/Pg7193PjaOocT5lDU=;
 b=BsgegHhV3kefxn2D8GvNrxhp0LxzvLSwSKkojhRVVzWb71cHzJQrp5Cmopy5sYghVw
 LKs6ZGlZHINXlRyyoW+vB1qtQHcIXfKiNWDpDAYs8npfTxh4FXABfra/r9yRIlEVdRN2
 F8Uc7hjz8n4VKGlU462m+IPQdEVtPHqXsWFcbLbdh3SwGASXdn0daDd5usbT17c2JpNs
 j/OXWCWXWikHzVz1F5xrDDxbBIt+A1Ol9VVpfEBj6xrhKes+0QFk/GyZHk3jhNpoiUyO
 ESlWSmw/HGHrSHRtEr+Gz44oTd/fmHMjiJV9mwdkklwutPvBtGHsmH+v01LTUHjvsCpM
 Uwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdI7d+rqTIus/Dk9IPQIHfyY4/Pg7193PjaOocT5lDU=;
 b=sHiQAo12kTnq3g+Jvk1sL2sMSURoegjhORwZBYVla4YEWZkj0qAcMAaH8Z+rxkbJlR
 QFd9zBOH3IU5hEBtbBpvUJZdnWu61NwB8UPsu6P/JUHNwCKG+xrb3mjANKgiVl724KfE
 DP2GjqmcMnPhrzr4hdoQlV5FYGJT9Pgsa7GQFkqNs0yyeeTRXooO321zI/IRB004ARp9
 SpLJeMdl7/HOPpdGllIcSyRU7XR35EiGlOgx9/MadTAK8mowP9NxaodZzpo/wIa8PYez
 FMs7mNwWffkVKNrlR/QHRi98MXVPMXz2wVKt11UK68sKyZf+789pzTQIfDFW0BxGjclp
 UP+g==
X-Gm-Message-State: AOAM532PKSOD8JmvIhonwos7DTnonPuVQYf2/KjUVf9kQiVhJd4FiKwa
 WHVeByPgbQxmsywjiNB2jdmN+k0xOGopCpnJ
X-Google-Smtp-Source: ABdhPJy8i2o3+umP00g/fisYoUR9aq+h9qENz1zxtHXrPf0UF0Oc1U9Hi2JEZOQs2ZFMccMPAhQESw==
X-Received: by 2002:a17:902:7c8d:b029:d2:80bd:2f30 with SMTP id
 y13-20020a1709027c8db02900d280bd2f30mr3826797pll.22.1601175304211; 
 Sat, 26 Sep 2020 19:55:04 -0700 (PDT)
Received: from buster.buster.your.domain
 ([2402:b801:2840:8200:21e:6ff:fe42:5032])
 by smtp.gmail.com with ESMTPSA id x13sm6685025pfj.199.2020.09.26.19.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 19:55:03 -0700 (PDT)
From: Brad Harper <bjharper@gmail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH v2 0/1] mmc: host: meson-gx-mmc: fix possible deadlock
 condition for preempt_rt
Date: Sat, 26 Sep 2020 22:54:17 -0400
Message-Id: <20200927025418.12382-1-bjharper@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_225508_477092_4C8C3F99 
X-CRM114-Status: GOOD (  16.99  )
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
Cc: Brad Harper <bjharper@gmail.com>, linux-rt-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a updated experiamental patch for review following discussions
with Jerome / Sebastian regarding the usage of threadded interupts in
meson-gx-mmc.  I don't have a complete understanding or am I a kernel
developer but this is my best efforts attempt to address this issue.

Also thanks to both of of them for opening up the discussions and 
Kevin for pointing me in the right direction for patch formatting. 

Force threaded interrupts for meson_mmc_irq to prevent possible deadlock
condition during mmc operations when using preempt_rt with 5.9.0-rc3-rt3
patches on arm64.

Using meson-gx-mmc with an emmc device on Hardkernel Odroid N2+
configured with preempt_rt resulted in the soc becoming unresponsive.  
With lock checking enabled the below inconsistent lock state was 
observed during boot.

After some discussions with tglx in IRC #linux-rt a patch was suggested
to remove IRQF_ONESHOT from request_threaded_irq.
This has been tested and confirmed by me to resolve both the 
unresponsive soc and the inconsistent lock state warning when using 
5.9.0-rc3-rt3 on arm64 Odroid N2+.

Further review and testing is required to ensure there are no adverse 
impacts or concerns and that is the correct method to resolve the 
problem.  I will continue to test on various amlogic devices with both 
standard mainline low latency kernel and preempt_rt kernel with -rt 
patches.

Changes since v1:
- Add spinlock_t lock to meson_host structure
- Add spin_lock_init to driver probe for the host lock to ensure the 
  irq will not attempt to fire again if the threaded irq component
  is not complete


[    7.858446] ================================
[    7.858448] WARNING: inconsistent lock state
[    7.858450] 5.9.0-rc3-rt3+ #33 Not tainted
[    7.858453] --------------------------------
[    7.858456] inconsistent {IN-HARDIRQ-R} -> {HARDIRQ-ON-W} usage.
[    7.858459] swapper/0/1 [HC0[0]:SC0[0]:HE1:SE1] takes:
[    7.858465] ffff80001219f4d8 (&trig->leddev_list_lock){+?.+}-{0:0}, at: led_trigger_set+0x104/0x270
[    7.858482] {IN-HARDIRQ-R} state was registered at:
[    7.858484]   lock_acquire+0xec/0x468
[    7.858491]   rt_read_lock+0xb0/0x108
[    7.858497]   led_trigger_event+0x34/0x88
[    7.858501]   mmc_request_done+0x3f0/0x450
[    7.858505]   meson_mmc_irq+0x284/0x378
[    7.858511]   __handle_irq_event_percpu+0xcc/0x4a8
[    7.858515]   handle_irq_event_percpu+0x60/0xb0
[    7.858519]   handle_irq_event+0x50/0x108
[    7.858522]   handle_fasteoi_irq+0xd0/0x180
[    7.858527]   generic_handle_irq+0x38/0x50
[    7.858530]   __handle_domain_irq+0x6c/0xc8
[    7.858533]   gic_handle_irq+0x5c/0xb8
[    7.858537]   el1_irq+0xbc/0x180
[    7.858540]   arch_cpu_idle+0x28/0x38
[    7.858544]   default_idle_call+0x90/0x3f0
[    7.858547]   do_idle+0x250/0x268
[    7.858551]   cpu_startup_entry+0x2c/0x78
[    7.858554]   rest_init+0x1b0/0x284
[    7.858559]   arch_call_rest_init+0x18/0x24
[    7.858565]   start_kernel+0x550/0x588
[    7.858569] irq event stamp: 1925495
[    7.858571] hardirqs last  enabled at (1925495): [<ffff8000111e3ba4>] _raw_spin_unlock_irqrestore+0xa4/0xb0
[    7.858576] hardirqs last disabled at (1925494): [<ffff8000111e3c58>] _raw_spin_lock_irqsave+0xa8/0xb8
[    7.858580] softirqs last  enabled at (1857856): [<ffff80001024705c>] bdi_register_va+0x114/0x368
[    7.858586] softirqs last disabled at (1857849): [<ffff80001024705c>] bdi_register_va+0x114/0x368
[    7.858590] 
               other info that might help us debug this:
[    7.858592]  Possible unsafe locking scenario:

[    7.858594]        CPU0
[    7.858595]        ----
[    7.858597]   lock(&trig->leddev_list_lock);
[    7.858600]   <Interrupt>
[    7.858602]     lock(&trig->leddev_list_lock);
[    7.858604] 
                *** DEADLOCK ***

[    7.858606] 3 locks held by swapper/0/1:
[    7.858609]  #0: ffff80001219eb30 (leds_list_lock){++++}-{0:0}, at: led_trigger_register+0xf4/0x1c0
[    7.858619]  #1: ffff0000b0696a70 (&led_cdev->trigger_lock){+.+.}-{0:0}, at: led_trigger_register+0x134/0x1c0
[    7.858629]  #2: ffff800011fb83d0 (rcu_read_lock){....}-{1:2}, at: rt_write_lock+0x8/0x108
[    7.858637] 
               stack backtrace:
[    7.858640] CPU: 5 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc3-rt3+ #33
[    7.858643] Hardware name: Hardkernel ODROID-N2Plus (DT)
[    7.858646] Call trace:
[    7.858647]  dump_backtrace+0x0/0x1e8
[    7.858650]  show_stack+0x20/0x30
[    7.858653]  dump_stack+0xf0/0x164
[    7.858659]  print_usage_bug+0x2b4/0x2c0
[    7.858662]  mark_lock+0x2e8/0x360
[    7.858665]  __lock_acquire+0x238/0x1858
[    7.858669]  lock_acquire+0xec/0x468
[    7.858672]  rt_write_lock+0xb0/0x108
[    7.858675]  led_trigger_set+0x104/0x270
[    7.858678]  led_trigger_register+0x180/0x1c0
[    7.858681]  heartbeat_trig_init+0x28/0x5c
[    7.858686]  do_one_initcall+0x90/0x4bc
[    7.858690]  kernel_init_freeable+0x2cc/0x338
[    7.858694]  kernel_init+0x1c/0x11c
[    7.858697]  ret_from_fork+0x10/0x34

Brad Harper (1):
  mmc: host: meson-gx-mmc: fix possible deadlock condition for
    preempt_rt

 drivers/mmc/host/meson-gx-mmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
