Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18816C43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 13:45:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F90F2083B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 13:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qVKxI46r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnkJYqZE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F90F2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qmz7tzAKMhSl+fAAaAxFh+RwGCmBXvXfXqBcxa38NgM=; b=qVKxI46rrgVpolevjxyb0FtO+G
	4JBPr6+fMyrf8ewB1qn5zIFGKpfaeiLMUyE1Ex6qkh7Vnmz1wpChTohXOP9+uq05fIn6fT6kuXF+V
	DzdZVyyWIhKt8i3h6X4kDeAo+FL+QcxzgDgaduAW1MoUwCZAPCo+9BtgROQpHIClamsTZ3YRf5kVZ
	KXye2s04EZdznwzupLkS7tpBcG5uTikWXVM/6YDSwVC3h11ZlxSznDrjsXextvWhoUVeFC7KJPbt9
	BKZsKxRAySe2BXOivaGPI5vAE805iV6lZBBbmp4tNFuAVzbHL74OyipK99hIYRUavwbzHZaGeRKVj
	iRURKNWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIuDg-0004lh-Ap; Thu, 17 Sep 2020 13:45:04 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIuDc-0004kV-Ph
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 13:45:01 +0000
Received: by mail-ej1-x643.google.com with SMTP id z22so3352505ejl.7
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2020 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:user-agent:mime-version;
 bh=jvuJm5Lml43JWOtPYUo33iZeD3mjlsZBcdGdPpBstf0=;
 b=VnkJYqZEcMSVJmYTKcvFy+VQngf+Ue+pOu+HIv23QfYkstfeuvYQ1SNVeesdu7WoN/
 frC+H1OIF8hF5Pw3OI6DbWHQnuC7PYy6DPsg5gqLUdvEz57WdURXDbsQvkcTFrs3gWFv
 CXWTpcg16S2Ov/SUOsyc/3RUf/Xkt8oGexHBVyZyRxIEF/92EV2MPrdgqJj008cdq5PL
 Eya2cSN92JTl00QVNwz00hVO3GTAihyKwSRiHfjgGi/lGE7XNSJrNsPs4/DfOrdexF2p
 LmltahprdJ2z7V/tCWpIU0zr9RDpKxvXKnk6DfHIVyBnCBi7bQQJNR3YNMIbxPWqlm4j
 1I9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :user-agent:mime-version;
 bh=jvuJm5Lml43JWOtPYUo33iZeD3mjlsZBcdGdPpBstf0=;
 b=Z/oWIqudllWOLdSA2igz5/NSPdYWYTxCwToHSaYDttuQtnih7uconm+76HrmIKAf+k
 11RATywYF1RCj+Rwpmdus0keO8xAHSaEINO0rLjR+kfbRkJoPgUnkwM29kqGfWCgk4OU
 +e15Wv6BiGisJeWBYrr8d2RIgIJZ0dfQ2xpmOLJKWzX1TiAs4JXDCkP+QqO7TNAkHUD+
 8GloznQ7GxeJPXpvFYfkmJa3fjfsJwNLbKhrI+MYSS8e9MgF55NCEUwdFkCL3B4W10at
 orCb9ewiIlSF/orOcjDliLfyvYTaxyLHzRfOpNfmxCh3u5WeRU2SDm4gu9bVReTvfqwM
 8ATg==
X-Gm-Message-State: AOAM5305T0dYViof2L93WJA3yNuL4ggZTXPdlhoryuJPHN3mllZ5lrfP
 itn2tKEl1/oIsH2Pmcsi6bY=
X-Google-Smtp-Source: ABdhPJzbcFt7VT8GULWFaUfyor44QICNUot+0vYBC56TdEKk1bddPuRc/huzEkwTMPF6DISwRzQibw==
X-Received: by 2002:a17:906:6ce:: with SMTP id
 v14mr29865306ejb.451.1600350298177; 
 Thu, 17 Sep 2020 06:44:58 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 r15sm16435069edv.94.2020.09.17.06.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 06:44:57 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1kIuDY-0003mv-JN; Thu, 17 Sep 2020 15:44:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: s805x USB broken in 5.8?
Date: Thu, 17 Sep 2020 15:44:56 +0200
Message-ID: <87y2l8plev.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_094500_841793_E47E4E79 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

I recently updated my meson-gxl-s805x-libretech-ac (la frite) board from
5.7 to 5.8, but USB seems to be broken? Given the USB phy warning, I
take it that this is related to commit 2f9139c2609fd71 (arm64: dts:
amlogic: use the new USB control driver for GXL and GXM)?

This is an unmodified 5.8.9 build of the aarch64 defconfig:

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 5.8.9 (peko@dell) (aarch64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2020.08-427-g882a8550bc-dirty) 9.3.0, GNU ld (GNU Binutils) 2.33.1) #1 SMP PREEMPT Thu Sep 17 15:02:47 CEST 2020
[    0.000000] Machine model: Libre Computer AML-S805X-AC
..
[    0.000000] Kernel command line: console=ttyAML0,115200 earlyprintk root=/dev/sda1 rootwait
..
[    1.279949] dwc3-meson-g12a d0078080.usb: USB2 ports: 2
[    1.279979] dwc3-meson-g12a d0078080.usb: USB3 ports: 0
[    1.284880] ------------[ cut here ]------------
[    1.289294] WARNING: CPU: 3 PID: 33 at drivers/reset/core.c:309 reset_control_reset+0x128/0x150
[    1.297906] Modules linked in:
[    1.300929] CPU: 3 PID: 33 Comm: kworker/3:1 Not tainted 5.8.9 #1
[    1.306962] Hardware name: Libre Computer AML-S805X-AC (DT)
[    1.312491] Workqueue: events deferred_probe_work_func
[    1.317573] pstate: 80000005 (Nzcv daif -PAN -UAO BTYPE=--)
[    1.323093] pc : reset_control_reset+0x128/0x150
[    1.327666] lr : phy_meson_gxl_usb2_init+0x1c/0x70
[    1.332405] sp : ffff800011e33ad0
[    1.335683] x29: ffff800011e33ad0 x28: ffff800011a57000
[    1.340944] x27: ffff800011dfbcc8 x26: ffff00003f027ec8
[    1.346205] x25: ffff00003f027eb0 x24: ffff00003f027eb0
[    1.351467] x23: ffff00003f56b800 x22: ffff00003f5f7400
[    1.356728] x21: ffff00003dd05308 x20: ffff00003dcf6a80
[    1.361989] x19: ffff00003dcfa380 x18: 0000000000000010
[    1.367250] x17: 00000000f4bff80b x16: 0000000000000068
[    1.372511] x15: ffff00003f56bc70 x14: ffffffffffffffff
[    1.377773] x13: ffffffff00000000 x12: ffffffffffffffff
[    1.383034] x11: 0000000000000020 x10: 7f7f7f7f7f7f7f7f
[    1.388295] x9 : fefefefefefeff30 x8 : 0000000000000000
[    1.393556] x7 : 0000000000000000 x6 : 0000000000000000
[    1.398818] x5 : 0000000000000000 x4 : 0000000000000000
[    1.404079] x3 : ffff00003dd05308 x2 : ffff8000106a50e0
[    1.409340] x1 : 0000000000000001 x0 : 0000000000000001
[    1.414602] Call trace:
[    1.417021]  reset_control_reset+0x128/0x150
[    1.421245]  phy_meson_gxl_usb2_init+0x1c/0x70
[    1.425644]  phy_init+0x74/0xd0
[    1.428752]  dwc3_meson_g12a_probe+0x2cc/0x550
[    1.433148]  platform_drv_probe+0x54/0xb0
[    1.437115]  really_probe+0xd8/0x320
[    1.440652]  driver_probe_device+0x58/0xc0
[    1.444705]  __device_attach_driver+0x84/0xd0
[    1.449018]  bus_for_each_drv+0x78/0xd0
[    1.452813]  __device_attach+0xf0/0x150
[    1.456608]  device_initial_probe+0x14/0x20
[    1.460747]  bus_probe_device+0x9c/0xb0
[    1.464543]  deferred_probe_work_func+0x74/0xb0
[    1.469030]  process_one_work+0x1b8/0x330
[    1.472995]  worker_thread+0x1f8/0x420
[    1.476704]  kthread+0x140/0x160
[    1.479897]  ret_from_fork+0x10/0x34
[    1.483430] ---[ end trace 433380d964d6069b ]---
[    1.488039] phy phy-d0078000.phy.0: phy init failed --> -22
[    1.493639] dwc3-meson-g12a: probe of d0078080.usb failed with error -22
[    1.502403] scpi_protocol scpi: SCP Protocol legacy pre-1.0 firmware
domain-0 init dvfs: 4
[    1.525880] ALSA device list:
[    1.525902]   No soundcards found.
[    1.532312] Waiting for root device /dev/sda1...

And then nothing.

I see similar issues on kernelci, E.G.:
https://storage.kernelci.org/chrome-platform/for-kernelci/v5.9-rc1-2-gf048ccd37a8b/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html

Before I dig deeper, am I missing something? Is this a known issue?

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
