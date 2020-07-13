Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05253C433E3
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 16:06:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4C72076D
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 16:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rGh6oyfu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4C72076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlrobertson.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Message-ID:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w4chZAT64ZKjEoxOTZnOukZB3uVSfRaHgi6ZTiA+sq8=; b=rGh6oyfu0tyR6UXXl/igLlO7gh
	iO6M8etVnGEuNR5pywkrxkwFF5/ipTWFbDuFieQlmJywvgSGJrQNFyY649NHWpvRWWbHazkTix/bF
	d5D0Rw5zSFiM6Q/fZugiS0IsE3esZTN1nZ/kdiRT1EoMG4ATEs5S342C4pxnLUKKHrUY0JsGj3wqq
	nrlNZ6mHPNpldfistHSFapmzOxEfR+mnPmu62ZMQqoveONeAdlVcKUXEOk8cd7zPSLbi6k1Zr3Sv2
	OYMLB+pLGvXAJECYvl/PQ9KvBVzyT+GZhb5HU6MFWlLAtSMWOmBI/7Yw9AMQSOT4CQ73V0ZZtDXwU
	mXuRsjaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv0yC-0004uQ-Ir; Mon, 13 Jul 2020 16:06:20 +0000
Received: from sender4-op-o17.zoho.com ([136.143.188.17])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv0y9-0004tS-Gv; Mon, 13 Jul 2020 16:06:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1594656370; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ha7k+CCN6jQjNKDb9ZYB9YU+RHDYozuTji9vMqqkS7jG0IuxNO3WiNBnxfIM4c5/Rg0r8G48GlemAobS3waazvNhRBeRYlTKFVGEeC2KdekLQWmAzIBAHsxdQWo3kPSlnn/tIYd707Gh6/abNU/UadVBlbpHylcKIAmG+1jMwpo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1594656370;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=7KSZTOs+/hEim4hLOZbcVt3SaaLm51cMpcgcMyNKHMI=; 
 b=PQ1bMLrOEE/yW35Dr8naMJFU5An/qYubYn4i55Xq2fC4Rbx8KaGfmBErywraGRNOZDNaeJIuhe8DnUMjj/vADSZ2kF9kl1oOcmiF0lX+tJ03KpeojWmX1aXXttNCzz1p+MlcaQlLiqpxePRg8PzQjOx+pYhMJRO5L6b/WSD7rBE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=dan@dlrobertson.com;
 dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from gothmog.test (pool-108-28-30-30.washdc.fios.verizon.net
 [108.28.30.30]) by mx.zohomail.com
 with SMTPS id 1594656369264747.1241619546078;
 Mon, 13 Jul 2020 09:06:09 -0700 (PDT)
From: Dan Robertson <dan@dlrobertson.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Message-ID: <20200713160522.19345-1-dan@dlrobertson.com>
Subject: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
Date: Mon, 13 Jul 2020 12:05:21 -0400
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_120617_728557_961E3342 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
 Dan Robertson <dan@dlrobertson.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When testing suspend for another driver I noticed the following warning:

WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
Hardware name: Hardkernel ODROID-N2 (DT)
[..]
pc : reset_control_assert+0x184/0x19c
lr : dwc3_meson_g12a_suspend+0x68/0x7c
[..]
Call trace:
 reset_control_assert+0x184/0x19c
 dwc3_meson_g12a_suspend+0x68/0x7c
 platform_pm_suspend+0x28/0x54
 __device_suspend+0x590/0xabc
 dpm_suspend+0x104/0x404
 dpm_suspend_start+0x84/0x1bc
 suspend_devices_and_enter+0xc4/0x4fc

In my limited experience and knowlege it appears that we hit this
because the reset control was switched to shared and the the use
of the reset control was not changed.

> * Calling reset_control_assert without first calling reset_control_deassert
> * is not allowed on a shared reset control. Calling reset_control_reset is
> * also not allowed on a shared reset control.

The above snippet from reset_control_get_shared() seems to indicate that
this is due to the use of reset_control_reset() in dwc3_meson_g12a_probe()
and reset_control_deassert is not guaranteed to have been called
before dwc3_meson_g12a_suspend() and reset_control_assert().

After some basic tests with the following patch I no longer hit the
warning. Comments and critiques on the patch are welcome. If there is a
reason for the current use of the reset control, I'd love to learn why!
Like I said before, I have not really looked at this driver before and
have verify limited experience with reset controls... Was working on
another driver, hit the warning, and thought I'd take a shot at the
fix :-)

Cheers,

 - Dan

Dan Robertson (1):
  usb: dwc3: meson-g12a: fix shared reset control use

 drivers/usb/dwc3/dwc3-meson-g12a.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
