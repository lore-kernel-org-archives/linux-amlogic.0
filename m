Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5BDC433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 15:13:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF3CA21D43
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 15:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l1q9jMQS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t04BzDJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF3CA21D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QeWfg3/AuZEgtKYB6aRhO7CzlXNGDEwdzICJJqVr7q8=; b=l1q9jMQSPzsQ+qDMUh9gdeZHo
	u3NaP66HC/FWSkN89tCKAaQVGXh2mbv4ZjWoBMgnxlRqBuPsJmbAMQeRo68sKOyMVmnmoG4WTBH9G
	R1fGopwZOXvRlUM6bMenkxVls10eHT36sEzAj4d02NXHKu3/N8hQ8YLi1/nSAB4x2SnLMwRVkWgoh
	ohdR0F9dgmDxA6OqHRiVR1SzUiw/7sNWXU/voVvkSuF8f9y8yUuECYjTtY3ZjGwij8CLvDGsMt0rV
	RgWV+oGKypNOFVMvYKUn7IworXkqoJTyxTg5yKUdklwMv02QMOtm3Bpujk/uqJhL/mGXRIqGaDVZz
	vMgxbR4eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvab-0001FH-AU; Thu, 17 Sep 2020 15:12:49 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvZD-0000Kj-UX
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 15:11:25 +0000
Received: by mail-il1-x141.google.com with SMTP id t13so2594589ile.9
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2020 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=66iCdH9C3e4B76Cm5c0cZIK3v/0uTGqZwrcm6Xofp64=;
 b=t04BzDJG66+bHB3x8AKmlxDNK7oQBBOpnecC7rWxn/B3a92zw4wMoVLEt/hKp1yWlZ
 v/c3PSivO/qi4Nhp63Rsajsw1MYtsSWv5KwadX+k9O3MFPCzPj7O0n6zpTm2pgPx+qcW
 4y/eQG692fTj/wSXX6zWdas+3/MYdLTTGICT7bFijdt3hBB8AYTgh6jgvIprehSfkb/z
 Qvc5HL3q4Wx8yHw+fSri9doX82HQzY6j4x+BI80zeAFaNjKCJLkWrZgPZZ8QyS2iBzyO
 dG+e49+RlO+vbwRww3p2fMdKweVPBDGuT49iiBcl1QR7zS9/mfhK+NzYuJbGEf2iAJBO
 ir4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=66iCdH9C3e4B76Cm5c0cZIK3v/0uTGqZwrcm6Xofp64=;
 b=GEdgJIwoSpaitK8XWp9p5u8mxIr9YvO7rjv+qAZE/pyaGN0nmgtsTqrQpaUaAy166M
 pe9k73KqvB68tCj52nx+DC5uqO955qJrVsJcilGke6OszZ+8HD0pIbLboWB2EhzjwiJe
 ntmDaYwWS+mtyNYQt0w8nLJaoaYRUGbSyq6r6p8UEa6UBexwikj9MpHs5kaM5W5ETMup
 r5MngDbw4vzUYQy30AwFDxWpZY3tr6UH9dYrIg5uy0wsKbOIFGi2R5NcgiSCYbmva1Xp
 v8o+vZRbIkK8EOOQHmRDU077vBzLiarutd8hX9pindxqAad7pAMizaBW1PBLPpetTKOI
 ha6A==
X-Gm-Message-State: AOAM530pyRwwggcd3FcctnosFxGA3BDSpxd1PFH0gxBQKT17O2uZyVPB
 DDdroMWeIk2gkzuk/Krutpi9b6bAruSo/YJqQfPOjG87xuzE2g==
X-Google-Smtp-Source: ABdhPJxIf0oQlNjvB8ZoBHVnYi99/25+yzO86E9JJ3RG2VclmsGjf3dqusNbYuZB4TZsDUQgHnjLX2RQjQkMR2ZT4hs=
X-Received: by 2002:a92:c084:: with SMTP id h4mr3786427ile.6.1600355480943;
 Thu, 17 Sep 2020 08:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <87y2l8plev.fsf@dell.be.48ers.dk>
In-Reply-To: <87y2l8plev.fsf@dell.be.48ers.dk>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 17 Sep 2020 20:41:09 +0530
Message-ID: <CANAwSgTx9FHnueO0-K5M6kFhhWLJ0MEdcDKDnxbrwDnkM+AK3Q@mail.gmail.com>
Subject: Re: s805x USB broken in 5.8?
To: Peter Korsgaard <peter@korsgaard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_111124_076466_7C888139 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Peter,

On Thu, 17 Sep 2020 at 19:16, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> Hi,
>
> I recently updated my meson-gxl-s805x-libretech-ac (la frite) board from
> 5.7 to 5.8, but USB seems to be broken? Given the USB phy warning, I
> take it that this is related to commit 2f9139c2609fd71 (arm64: dts:
> amlogic: use the new USB control driver for GXL and GXM)?
>
> This is an unmodified 5.8.9 build of the aarch64 defconfig:
>
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 5.8.9 (peko@dell) (aarch64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2020.08-427-g882a8550bc-dirty) 9.3.0, GNU ld (GNU Binutils) 2.33.1) #1 SMP PREEMPT Thu Sep 17 15:02:47 CEST 2020
> [    0.000000] Machine model: Libre Computer AML-S805X-AC
> ..
> [    0.000000] Kernel command line: console=ttyAML0,115200 earlyprintk root=/dev/sda1 rootwait
> ..
> [    1.279949] dwc3-meson-g12a d0078080.usb: USB2 ports: 2
> [    1.279979] dwc3-meson-g12a d0078080.usb: USB3 ports: 0
> [    1.284880] ------------[ cut here ]------------
> [    1.289294] WARNING: CPU: 3 PID: 33 at drivers/reset/core.c:309 reset_control_reset+0x128/0x150
> [    1.297906] Modules linked in:
> [    1.300929] CPU: 3 PID: 33 Comm: kworker/3:1 Not tainted 5.8.9 #1
> [    1.306962] Hardware name: Libre Computer AML-S805X-AC (DT)
> [    1.312491] Workqueue: events deferred_probe_work_func
> [    1.317573] pstate: 80000005 (Nzcv daif -PAN -UAO BTYPE=--)
> [    1.323093] pc : reset_control_reset+0x128/0x150
> [    1.327666] lr : phy_meson_gxl_usb2_init+0x1c/0x70
> [    1.332405] sp : ffff800011e33ad0
> [    1.335683] x29: ffff800011e33ad0 x28: ffff800011a57000
> [    1.340944] x27: ffff800011dfbcc8 x26: ffff00003f027ec8
> [    1.346205] x25: ffff00003f027eb0 x24: ffff00003f027eb0
> [    1.351467] x23: ffff00003f56b800 x22: ffff00003f5f7400
> [    1.356728] x21: ffff00003dd05308 x20: ffff00003dcf6a80
> [    1.361989] x19: ffff00003dcfa380 x18: 0000000000000010
> [    1.367250] x17: 00000000f4bff80b x16: 0000000000000068
> [    1.372511] x15: ffff00003f56bc70 x14: ffffffffffffffff
> [    1.377773] x13: ffffffff00000000 x12: ffffffffffffffff
> [    1.383034] x11: 0000000000000020 x10: 7f7f7f7f7f7f7f7f
> [    1.388295] x9 : fefefefefefeff30 x8 : 0000000000000000
> [    1.393556] x7 : 0000000000000000 x6 : 0000000000000000
> [    1.398818] x5 : 0000000000000000 x4 : 0000000000000000
> [    1.404079] x3 : ffff00003dd05308 x2 : ffff8000106a50e0
> [    1.409340] x1 : 0000000000000001 x0 : 0000000000000001
> [    1.414602] Call trace:
> [    1.417021]  reset_control_reset+0x128/0x150
> [    1.421245]  phy_meson_gxl_usb2_init+0x1c/0x70
> [    1.425644]  phy_init+0x74/0xd0
> [    1.428752]  dwc3_meson_g12a_probe+0x2cc/0x550
> [    1.433148]  platform_drv_probe+0x54/0xb0
> [    1.437115]  really_probe+0xd8/0x320
> [    1.440652]  driver_probe_device+0x58/0xc0
> [    1.444705]  __device_attach_driver+0x84/0xd0
> [    1.449018]  bus_for_each_drv+0x78/0xd0
> [    1.452813]  __device_attach+0xf0/0x150
> [    1.456608]  device_initial_probe+0x14/0x20
> [    1.460747]  bus_probe_device+0x9c/0xb0
> [    1.464543]  deferred_probe_work_func+0x74/0xb0
> [    1.469030]  process_one_work+0x1b8/0x330
> [    1.472995]  worker_thread+0x1f8/0x420
> [    1.476704]  kthread+0x140/0x160
> [    1.479897]  ret_from_fork+0x10/0x34
> [    1.483430] ---[ end trace 433380d964d6069b ]---
> [    1.488039] phy phy-d0078000.phy.0: phy init failed --> -22
> [    1.493639] dwc3-meson-g12a: probe of d0078080.usb failed with error -22
> [    1.502403] scpi_protocol scpi: SCP Protocol legacy pre-1.0 firmware
> domain-0 init dvfs: 4
> [    1.525880] ALSA device list:
> [    1.525902]   No soundcards found.
> [    1.532312] Waiting for root device /dev/sda1...
>
> And then nothing.
>
> I see similar issues on kernelci, E.G.:
> https://storage.kernelci.org/chrome-platform/for-kernelci/v5.9-rc1-2-gf048ccd37a8b/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
>
> Before I dig deeper, am I missing something? Is this a known issue?

Yes, please try this patch.

https://patchwork.kernel.org/patch/11740801/

>
> --
> Bye, Peter Korsgaard
>

Best Regards
-Anand

> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
