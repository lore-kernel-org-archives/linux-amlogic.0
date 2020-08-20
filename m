Return-Path: <SRS0=HvuL=B6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4759C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2020 18:50:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3FF7207DE
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2020 18:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TJo+rR2Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JYICZFCW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3FF7207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jn/IAHcdKEwn8A4LKO6DsBy4GGlAicvKTPr83lPsVwk=; b=TJo+rR2ZaqCMCuOXsl9ELKDs0
	t8YTfhh6u0pEK7SRcgJ73TlCQ8JgtVa9ZreRwhVXPUJoIPiH7RUv3UX9FrHNgwGo/TcZcTpUJwKcU
	Cqs480bY7nUwPFK9epuy9rlTunLhIyYB8Gf95uN29KgUMs46peIcSeZQtGyttLu/7ntHKhRxCyAGX
	sfflEqbs64G8+F7irrnBY0/KxvQCkstsLqgASZXBRcubsw2hwJ6gzv97eZ5z57WKwe2ak3T23q/gt
	mciwDpKexq0OQDuFiFx0W9tfqzt9Cxp6pWROreyWZVkesFyBwSQ24p2rNe7afFCvNVJapcJWfsaT4
	FngUXvucg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8pdK-0004qd-Pg; Thu, 20 Aug 2020 18:49:54 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8pdG-0004pL-RL
 for linux-amlogic@lists.infradead.org; Thu, 20 Aug 2020 18:49:52 +0000
Received: by mail-pg1-x544.google.com with SMTP id o13so1577614pgf.0
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Aug 2020 11:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=IWB8f7NbP8sb6+Ay6YNTsjEuuu5Wbf07+ENl/t96l0c=;
 b=JYICZFCWEIMs0LkX5F74HCUrq/IPectyzU6FSyTa9Q5Qu6HNZ+wXFfOFJG1veKwnEb
 iQ0/iRkuJq/vPOMp1iEgCNlBsgYvpX5lRUnrrn01Th9HB9BjYC9XQCQ6QCevnyTKAdDn
 d70/2JG7CJCgvk+oa7PE/7N+p4dSx0s7BLVFm2U2dyWOvdFQpDMh1VMXnRdeYkYlYqKw
 erylgLNyqpOC0gAwJ7yQab0rN6rxMxRchPYc9FF11JHyiFvRF+ly1mzj2RZltYTlE2ij
 5cAhxEEk2oFhTwSeVse1k/45Zw5nt4zeUxL7UzcSKwndK0wLwuI9gnY/UqPDeHRcSOJi
 Uvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=IWB8f7NbP8sb6+Ay6YNTsjEuuu5Wbf07+ENl/t96l0c=;
 b=K3fV7bFpZ+gtjJ5d/0C3v42F1bMRzffWXZQVksJJwWcnuJO/OVNXD1t+fZD2gCOevy
 uSCzfDX7gK+HnMbrA4yjMFgr5ms89MF3GtdrIoPrv2Ez+tr7bGh7Wk/m5m+0SrLeFs1+
 hJZsEyqMT14EGScA7SbVwaG0SUUsbH+GR/MTaRCvjYRxTIzCENyMFezSDL3RiBjTbSNT
 02AqmODJIWbo2Xrg4fXzkNan1L+jSCPfwik/LTlI20EsBRLVtOqe03zRaJ+GUB0UhF1T
 M9N9L2EFFbWikxXD6jvUOe2d7958V+brPMTRIOuWWuNorTkkKaAgDVOFpUrwizeRpq3h
 t6wQ==
X-Gm-Message-State: AOAM530E/zhUrfCulvbQxBJPBi5wi0oerUipOEQ6lRlDQ7q1sje5eT2z
 rpPtenjUIlzwTuTVMOUZnqoXDQ==
X-Google-Smtp-Source: ABdhPJwLSX1861hQqT8xQFw/m+L6xrl13rUD6WuoFlUWaOl/Ua7tf+9bObr6GF/ZcGejbKQsxg7ojA==
X-Received: by 2002:a63:1a0c:: with SMTP id a12mr148299pga.24.1597949388184;
 Thu, 20 Aug 2020 11:49:48 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id g12sm2852879pjd.6.2020.08.20.11.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 11:49:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Dan Robertson <dan@dlrobertson.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-Reply-To: <1jy2m9qijd.fsf@starbuckisacylon.baylibre.com>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com> <7hpn7lci1g.fsf@baylibre.com>
 <1jy2m9qijd.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 20 Aug 2020 11:49:47 -0700
Message-ID: <7hblj5cfuc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_144950_898844_DC2203D6 
X-CRM114-Status: GOOD (  14.70  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 aouledameur@baylibre.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Thu 20 Aug 2020 at 20:02, Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Jerome Brunet <jbrunet@baylibre.com> writes:
>>
>>> On Mon 13 Jul 2020 at 18:05, Dan Robertson <dan@dlrobertson.com> wrote:
>>>
>>>> The reset is a shared reset line, but reset_control_reset is still used
>>>> and reset_control_deassert is not guaranteed to have been called before
>>>> the first reset_control_assert call. When suspending the following
>>>> warning may be seen:
>>>
>>> And now the same type of warning maybe seen on boot. This is
>>> happening for me on the libretech-cc (s905x - gxl).
>>>
>>> [    1.863469] ------------[ cut here ]------------
>>> [    1.867914] WARNING: CPU: 1 PID: 16 at drivers/reset/core.c:309 reset_control_reset+0x130/0x150
>>> [    1.876525] Modules linked in:
>>> [    1.879548] CPU: 1 PID: 16 Comm: kworker/1:0 Not tainted 5.9.0-rc1-00167-ga2e4e3a34775 #64
>>> [    1.887737] Hardware name: Libre Computer AML-S905X-CC V2 (DT)
>>> [    1.893525] Workqueue: events deferred_probe_work_func
>>> [    1.898607] pstate: 80000005 (Nzcv daif -PAN -UAO BTYPE=--)
>>> [    1.904126] pc : reset_control_reset+0x130/0x150
>>> [    1.908700] lr : phy_meson_gxl_usb2_init+0x24/0x70
>>> [    1.913439] sp : ffff8000123ebad0
>>> [    1.916717] x29: ffff8000123ebad0 x28: 0000000000000000 
>>> [    1.921978] x27: ffff00007c4b1ac8 x26: ffff00007c4b1ab0 
>>> [    1.927239] x25: ffff00007fc149b0 x24: ffff00007c4b1ab0 
>>> [    1.932500] x23: ffff00007cd03800 x22: ffff800011fb9000 
>>> [    1.937761] x21: ffff00007c60db08 x20: ffff00007c468a80 
>>> [    1.943023] x19: ffff00007c466b00 x18: ffffffffffffffff 
>>> [    1.948284] x17: 0000000000000000 x16: 000000000000000e 
>>> [    1.953545] x15: ffff800011fb9948 x14: ffffffffffffffff 
>>> [    1.958806] x13: ffffffff00000000 x12: ffffffffffffffff 
>>> [    1.964068] x11: 0000000000000020 x10: 7f7f7f7f7f7f7f7f 
>>> [    1.969329] x9 : 78676f2c32617274 x8 : 0000000000000000 
>>> [    1.974590] x7 : ffffffffffffffff x6 : 0000000000000000 
>>> [    1.979851] x5 : 0000000000000000 x4 : 0000000000000000 
>>> [    1.985112] x3 : 0000000000000000 x2 : ffff8000107aa370 
>>> [    1.990374] x1 : 0000000000000001 x0 : 0000000000000001 
>>> [    1.995636] Call trace:
>>> [    1.998054]  reset_control_reset+0x130/0x150
>>> [    2.002279]  phy_meson_gxl_usb2_init+0x24/0x70
>>> [    2.006677]  phy_init+0x78/0xd0
>>> [    2.009784]  dwc3_meson_g12a_probe+0x2c8/0x560
>>> [    2.014182]  platform_drv_probe+0x58/0xa8
>>> [    2.018149]  really_probe+0x114/0x3d8
>>> [    2.021770]  driver_probe_device+0x5c/0xb8
>>> [    2.025824]  __device_attach_driver+0x98/0xb8
>>> [    2.030138]  bus_for_each_drv+0x74/0xd8
>>> [    2.033933]  __device_attach+0xec/0x148
>>> [    2.037726]  device_initial_probe+0x24/0x30
>>> [    2.041868]  bus_probe_device+0x9c/0xa8
>>> [    2.045663]  deferred_probe_work_func+0x7c/0xb8
>>> [    2.050150]  process_one_work+0x1f0/0x4b0
>>> [    2.054115]  worker_thread+0x210/0x480
>>> [    2.057824]  kthread+0x158/0x160
>>> [    2.061017]  ret_from_fork+0x10/0x18
>>> [    2.064550] ---[ end trace 94d737efe593c6f6 ]---
>>> [    2.069158] phy phy-d0078000.phy.0: phy init failed --> -22
>>> [    2.074858] dwc3-meson-g12a: probe of d0078080.usb failed with error -22
>>>
>>> This breaks USB on this device. reverting the change brings it back.
>>
>> [...]
>>
>>> In the meantime, I think this change should be reverted. A warning on
>>> suspend seems less critical than a regression breaking USB completly.
>>
>> Fully agree.
>>
>> Phillip, can you please revert this patch until the right solution is
>> found?  Boot failure is much worse than a suspend warning.
>
> I was asking Philip about the reset API suggestion.
> I think the maintainer is Felipe for this change :)

Oops, yeah.  I meant Felipe too.  Names are close enough for my brain to
mix up.

@Felipe: can you revert this change please?

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
