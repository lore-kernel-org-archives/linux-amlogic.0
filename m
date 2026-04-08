Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4234DFD5F98
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Apr 2026 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZ9l7PUiN+oqhiH6bLWcIleH8MM12kYxOZGr9vfoHRQ=; b=KLzBy2w950TAk+
	Uh/qo84u1lL63bsjWrCkWzLI5DR0kzxJOYWy9wH1Mp0b1xBRHorsjBtLLETs6ntjcmdulYPyMK3q2
	MaNw8OsIhsJjcrqAwmaCy6CU0FNceFjaIcf8McYmkDz8yvf7438SgDkYqpizSI5RA1Q4WOH2j6Gu3
	tfSmNIGRThoyU/nBRFwRONoffOMSCmnEzxSff/ZNnQJmyNM2wmozFFCaEFnLN963sd8AdJk3D2q4L
	mR0jJmQRO6UV7Ov7aGWz7Q4Kh2lPLczx/XedfnbxR2ik/ppkFvRyMXSJ7cXWAr/gCWGjGWhlxTUMK
	A2DiJMm5/ESmr2iWltXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOvi-00000008ZfY-0VZN;
	Wed, 08 Apr 2026 09:10:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOve-00000008ZeN-2hVM
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Apr 2026 09:10:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso6264143f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Apr 2026 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775639429; x=1776244229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TS2/VKVyUdq2KA9lPz5OLVvEFHblHBqRgRRSos+joo=;
        b=VxSg6yZN3WDkZxCE8i/N5BlJCbkpC3XF8zdO2bEO9dcsvZDpL0xHrjHCoxN3QPaxUf
         1MwyLC/gOb9ZMRPKNDyWxhvdpinOi3q7UptMFCcKuyJX+cIrS5Z8EQhPOn6F/a3UepdL
         RtHg+YvUnY5G2TNSFfHbQCz/S4PSwWXGGmk7IrZb/drSg819OtzM/K44WyGx7OwC6He9
         w58ObvmElCg9SoyPpe+QbmYEPsFgTd6u80+G+0JcttmBHy6mJ8NGvm94ld7a5TEfP9f9
         TMi+NeRXCPDsXE1h4VehsIkBxh1i5Ew32ShlbllpYigDLckcgXcLJkBLAwqu63dN4ddU
         BX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639429; x=1776244229;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5TS2/VKVyUdq2KA9lPz5OLVvEFHblHBqRgRRSos+joo=;
        b=kZUibZWGArIzunxmGOaTMKNjxyTGoKVHG67iYqmgTtcJdCzof9dIV8zCKhfKNZ3iId
         XdMMk2twJKb77U+5obMRc4R9GcQCzxsz3xDqR/uglixUgaYRhZXSi3UnPPD/y7TYgjJc
         IsPxkg1U+CsSxNk2wT1+0dKv2o6FWqUgaNi0r8aQ4kqlzbMe/60bM3ouy3q1+jng+Hvn
         Gr46fI20i4mFGhSsy/Djqza8apc57wKe147G9qPuRhJ4CQ73tvAQlRnoGhEMjLwpYiE6
         XjxTM0Fj05Fb0KPCmx8ExCb8wnS982P4lYhoOVH8p7iLk8PEBy7AR7ekGZI63bHo72tk
         u58A==
X-Forwarded-Encrypted: i=1; AJvYcCVhtsVeLJ7yX+L6aDEPsUtzBTIm/9qzt2stfT2PPGKtkv49k6oQBp88tCCRYKXQwb4CA1pmdk+kYOt5fJpj@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo2JCzEeGNYKQtd+5X6TT/7ps+YaSUvHdiAh9ULWaLMekJLYFe
	KEJjB/DRxr7R1wRITVItz2svFlZD1i8QK9of0DWLuZHMN9dMZvf8Do7aGmc1dEfVnyo=
X-Gm-Gg: AeBDiethn+XSW3pVUbJ4TuXqCjRe0QvbF4Yi41qAssha6eOPPbC8OR7/ctg5rN28W2b
	8jHUbPaVwLUGsAcWf8PgnGn0CVL3VpYEaO+LGYBCV1gAEgYAiYgkXwAY+FZrowAlfLH5xtFq088
	/qB9EIYp+usJoNe+EC9ZkM99Zuksa91YaqNy94UGnYS1Xf9P/hJBKY+/vnHRXvXCvW2iZVXkKur
	WdkNMLrmSYDVBsD0PUkQ9jPaTCnyS6vQtnXhxEON3LMApolcNwmI6J0t7Yy17UBEm0P/inttErS
	CTFVYgb6y/SzRkAelnLNSyFZc7VKlzlRNhJCx7nPmmkYL3BlZ940daHSE29wYSRGoBMGyyASsnb
	utGxA/7CbN2p5AEgwmZQcfFcmtmvR4cYRTyQfTs3WpDQPahO6pmwOrNSXFgCX7d6UiOieOvZfII
	KbEhLFSIaeBuaBKiPxdRqIJxSBkVESiLiX0UN0Fogtttnh
X-Received: by 2002:a05:6000:420f:b0:43b:490a:db51 with SMTP id ffacd0b85a97d-43d292d51camr29919094f8f.24.1775639428466;
        Wed, 08 Apr 2026 02:10:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c54bdsm57690680f8f.16.2026.04.08.02.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:10:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260331-fix-aml-t7-null-reset-v1-0-eb95b625234c@aliel.fr>
References: <20260331-fix-aml-t7-null-reset-v1-0-eb95b625234c@aliel.fr>
Subject: Re: (subset) [PATCH 0/2] Fix Amlogic T7 null reset ops and DT
 required property
Message-Id: <177563942766.3408542.9299972787072286481.b4-ty@linaro.org>
Date: Wed, 08 Apr 2026 11:10:27 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_021030_710846_5D345C51 
X-CRM114-Status: GOOD (  12.96  )
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

Hi,

On Tue, 31 Mar 2026 16:24:03 +0200, Ronald Claveau wrote:
> 1. As reset is required for MMC DT, this patch series aims to add the currently missing required driver ops.
> 
> Whithout this patch the following kernel null error appears:
> 
> [    0.459197] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [    0.459978] Mem abort info:
> [    0.460324]   ESR = 0x0000000096000004
> [    0.460791]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.461471]   SET = 0, FnV = 0
> [    0.461830]   EA = 0, S1PTW = 0
> [    0.462220]   FSC = 0x04: level 0 translation fault
> [    0.462722] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [    0.462826] Data abort info:
> [    0.462829]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    0.462842] Mem abort info:
> [    0.462849]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    0.462859]   ESR = 0x0000000096000004
> [    0.462865]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    0.462874]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.462882] [0000000000000000] user address but active_mm is swapper
> [    0.462890]   SET = 0, FnV = 0
> [    0.462901] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    0.462909]   EA = 0, S1PTW = 0
> [    0.462917] Modules linked in:
> [    0.462925]   FSC = 0x04: level 0 translation fault
> [    0.462932]
> [    0.462939] Data abort info:
> [    0.462951] CPU: 4 UID: 0 PID: 90 Comm: kworker/u34:3 Not tainted 7.0.0-rc4-next-20260319 #41 PREEMPT
> [    0.463920]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    0.463927] Hardware name: Khadas VIM4 (DT)
> [    0.463940]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    0.463951] Workqueue: async async_run_entry_fn
> [    0.464277]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    0.464286]
> [    0.464294] [0000000000000000] user address but active_mm is swapper
> [    0.464304] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.465935] pc : reset_control_reset+0x48/0x1d0
> [    0.466409] lr : reset_control_reset+0x38/0x1d0
> [    0.479907] sp : ffff800083943b60
> [    0.479911] x29: ffff800083943b60 x28: 0000000000000000 x27: 0000000000000000
> [    0.479926] x26: ffff80008310a9c0 x25: 0000000000000000 x24: ffff000100372005
> [    0.481212] x23: ffff0001003a4000 x22: ffff000100fee988 x21: 0000000000000000
> [    0.482976] x20: ffff00023f00a788 x19: ffff000100fee980 x18: 0000000000000006
> [    0.483865] x17: 64656c62616e655f x16: 7469647561206465 x15: ffff800083943530
> [    0.484753] x14: 0000000000000000 x13: 000000000000022d x12: 0000000000002000
> [    0.485642] x11: ffff00023efdc754 x10: ffff00023efdc740 x9 : 0000000000000000
> [    0.486530] x8 : ffff00023efd8a40 x7 : fffffffffffffe70 x6 : ffff00023efd89e0
> [    0.487418] x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000001
> [    0.488307] x2 : ffff000102002488 x1 : ffff8000822248c0 x0 : 0000000000000000
> [    0.489196] Call trace:
> [    0.489500]  reset_control_reset+0x48/0x1d0 (P)
> [    0.490062]  __device_reset+0xc8/0xfc
> [    0.490517]  meson_mmc_probe+0xe8/0x3d4
> [    0.490994]  platform_probe+0x5c/0x98
> [    0.491448]  really_probe+0xbc/0x298
> [    0.491892]  __driver_probe_device+0x78/0x12c
> [    0.492434]  driver_probe_device+0xd4/0x164
> [    0.492954]  __device_attach_driver+0xb8/0x140
> [    0.493507]  bus_for_each_drv+0x84/0xe0
> [    0.493983]  __device_attach_async_helper+0xac/0xd0
> [    0.494590]  async_run_entry_fn+0x34/0xe0
> [    0.495089]  process_one_work+0x158/0x29c
> [    0.495587]  worker_thread+0x18c/0x308
> [    0.496053]  kthread+0x11c/0x128
> [    0.496453]  ret_from_fork+0x10/0x20
> [    0.496904] Code: f9400262 2a0003f5 b4000902 f9400040 (f9400003)
> [    0.497661] ---[ end trace 0000000000000000 ]---
> [    0.498234] Internal error: Oops: 0000000096000004 [#2]  SMP
> [    0.498935] Modules linked in:
> [    0.499319] CPU: 1 UID: 0 PID: 88 Comm: kworker/u34:1 Tainted: G      D             7.0.0-rc4-next-20260319 #41 PREEMPT
> [    0.500669] Tainted: [D]=DIE
> [    0.501025] Hardware name: Khadas VIM4 (DT)
> [    0.501547] Workqueue: async async_run_entry_fn
> [    0.502109] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.502975] pc : reset_control_reset+0x48/0x1d0
> [    0.503538] lr : reset_control_reset+0x38/0x1d0
> [    0.504102] sp : ffff800083903b60
> [    0.504513] x29: ffff800083903b60 x28: 0000000000000000 x27: 0000000000000000
> [    0.505402] x26: ffff000100059028 x25: 0000000000000000 x24: ffff000100372005
> [    0.506290] x23: ffff000100ec9400 x22: ffff0001003f6e08 x21: 0000000000000000
> [    0.507178] x20: ffff00023f00b440 x19: ffff0001003f6e00 x18: 00000000ffffffff
> [    0.508067] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000839037e0
> [    0.508955] x14: 0000000000000000 x13: 0000000000000290 x12: 0000000000002000
> [    0.509843] x11: ffff00023efdc754 x10: ffff00023efdc740 x9 : 0000000000000000
> [    0.510732] x8 : ffff00023efd8bc0 x7 : fffffffffffffe70 x6 : ffff00023efd8b60
> [    0.511620] x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000001
> [    0.512508] x2 : ffff000102002488 x1 : ffff800082224a40 x0 : 0000000000000000
> [    0.513397] Call trace:
> [    0.513700]  reset_control_reset+0x48/0x1d0 (P)
> [    0.514263]  __device_reset+0xc8/0xfc
> [    0.514718]  meson_mmc_probe+0xe8/0x3d4
> [    0.515195]  platform_probe+0x5c/0x98
> [    0.515650]  really_probe+0xbc/0x298
> [    0.516094]  __driver_probe_device+0x78/0x12c
> [    0.516636]  driver_probe_device+0xd4/0x164
> [    0.517156]  __device_attach_driver+0xb8/0x140
> [    0.517709]  bus_for_each_drv+0x84/0xe0
> [    0.518185]  __device_attach_async_helper+0xac/0xd0
> [    0.518792]  async_run_entry_fn+0x34/0xe0
> [    0.519290]  process_one_work+0x158/0x29c
> [    0.519788]  worker_thread+0x18c/0x308
> [    0.520254]  kthread+0x11c/0x128
> [    0.520655]  ret_from_fork+0x10/0x20
> [    0.521103] Code: f9400262 2a0003f5 b4000902 f9400040 (f9400003)
> [    0.521860] ---[ end trace 0000000000000000 ]---
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[2/2] arm64: dts: amlogic: t7: Fix missing required reset property
      https://git.kernel.org/amlogic/c/98da3e91a6157d2833af356620665a9734d26133

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
