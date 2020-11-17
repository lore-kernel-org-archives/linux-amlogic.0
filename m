Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25364C63777
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 09:20:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E972463C
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 09:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NcuaR56T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmSlsSfT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E972463C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4c8VqCF+rJprIJmuhKpslS12mk9Wl87WrzWlOOAafLE=; b=NcuaR56TSM4bEr6YU3a2X7VLb
	auvF7SNhodNIPvtDggslFiWhYmIAH4BImmDVgS61ICJjrpYUcjDrWWwc2lvk8IfYoy5AWjy/9B79p
	b8UwIeGUgeWotvrHiYDjw4pitWbHEUJqBg73v4WednWPcjQX2crOkRJZBLYMwUrODS3VjfrM++L0v
	LTxGW2//YfeDZBDxfnSTAvpNFZ/kjkf/KH/NVcvKiE2iWN+1Rjed/4p07bucRJNEvJ/Qv9K9k2abH
	Ydh1NIFDUrhdYu71NcRHUF+CMwufetiu2CmlbWV6v5RiFvXEqMNp0//Be/Qhg9htIIrcs741e3lMx
	gA/ms717Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kex9Y-0007N3-06; Tue, 17 Nov 2020 09:19:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kex9U-0007Lx-E7; Tue, 17 Nov 2020 09:19:53 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B4E02417E;
 Tue, 17 Nov 2020 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605604791;
 bh=W2obSm8Q5WV3J0n3YYVGmzEgDz3xGzgFoH4NhA880LY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qmSlsSfThTdhsSFxqYJ8Ssxf74VZV4gCGKJP6Xzh0J0UaDYFvOAcer//u1GVrLJcR
 yUOwRen2klvD5MHwIVJBsDzZic9MqzCy4Xjw7vOaDH8wg53nUmusjicPu4fcpJqpyd
 Bv8+6izebH3AYsBoF21oTj670rpQE/fJI9fgsGsI=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kex9Q-00BHax-U0; Tue, 17 Nov 2020 09:19:49 +0000
MIME-Version: 1.0
Date: Tue, 17 Nov 2020 09:19:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/4] drm/meson: Module removal fixes
In-Reply-To: <0b429c41-421a-2ae0-66a0-a142c56acadd@baylibre.com>
References: <20201116200744.495826-1-maz@kernel.org>
 <0b429c41-421a-2ae0-66a0-a142c56acadd@baylibre.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <09de6683eea499cfd83ab0c67e0cdca2@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel-team@android.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_041952_725103_79EDD7F9 
X-CRM114-Status: GOOD (  18.35  )
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On 2020-11-17 08:49, Neil Armstrong wrote:
> Hi Marc,
> 
> On 16/11/2020 21:07, Marc Zyngier wrote:
>> Hi all,
>> 
>> Having recently moved over to a top-of-the-tree u-boot on one of my
>> VIM3L systems in order to benefit from unrelated improvements
>> (automatic PCIe detection, EFI...), I faced the issue that my kernel
>> would hang like this:
>> 
>> [  OK  ] Finished Helper to synchronize boot up for ifupdown.
>> [  OK  ] Started Rule-based Manager for Device Events and Files.
>> [    7.114516] VDDCPU: supplied by regulator-dummy
>> [  OK  ] Found device /dev/ttyAML0.
>> [    7.146862] meson-drm ff900000.vpu: Queued 2 outputs on vpu
>> [    7.169630] fb0: switching to meson-drm-fb from simple
>> [    7.169944] Console: switching to colour dummy device 80x25
>> [    7.179250] meson-drm ff900000.vpu: CVBS Output connector not 
>> available
>> 
>> and that's it.
>> 
>> After some poking around, I figured out that it is in the
>> meson-dw-hdmi module that the CPU was hanging...
> 
> I'll be interested in having your kernel config, I never had such 
> report
> since I enabled HDMI support in U-Boot a few years ago.

Yeah, I was pretty surprised too. I have a hunch that this is caused
by u-boot DT exposing an extra MMIO region (dubbed "hhi") that gets
picked up by the kernel driver. *Not* having the region in the DT
(as in the kernel's version of the same DT) makes the driver work
exactly once:

Decompiled u-boot DT:

         hdmi-tx@0 {
                 compatible = "amlogic,meson-g12a-dw-hdmi";
                 reg = <0x00 0x00 0x00 0x10000 0x00 0x3c000 0x00 0x1000>;
                 [...]
                 reg-names = "hdmitx\0hhi";

Decompiled kernel DT:

         hdmi-tx@0 {
                 compatible = "amlogic,meson-g12a-dw-hdmi";
                 reg = <0x00 0x00 0x00 0x10000>;

There seem to be some complex interactions between the HDMI driver
and the DRM driver, both using this MMIO region at any given time.
But I admit not having tried very hard to follow the DRM maze of
intricate callbacks. All I needed was this box to reliably boot with
the firmware-provided DT.

You can find a reasonably recent version of my config at [1].

         M.

[1] http://www.loen.fr/tmp/Config.full-arm64
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
