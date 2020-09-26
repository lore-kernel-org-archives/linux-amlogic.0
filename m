Return-Path: <SRS0=/xor=DD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A343C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 10:52:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E159238E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 10:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NNqJRV1Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="YfemzFvw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E159238E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=thfZWjg9CTDerAexkTABREswoEOn4+ZUAw/wJAYZA/k=; b=NNqJRV1QXX15gztHuQX6sFmi6
	HfQOXdDqfWHwtyP9E4bALkmfJH9GcIqXvN2RanVX2HoVz8hME4Jw2uDbNenU7iXfrUZUxxH4nPHEs
	8gV28YRNGQneGRhvkYficHl/PVpOGri5eqstruyAWPcKs1KPjVALNUfQQezq/PvFXgH8Q48wfhCmY
	Zc1ga1bvbWqM/th3JGaQuv9d/SiEbporBUvOsl+muNIeaDBVRCUltfcRn+cdjxldni5MoFLPv5GBO
	kxN9iV1lNOdNF7VRfBlXviHqGwEMAnWZ7a4UrltrTCxDGE28MH0XygsptxBLITC5Sr9GbF0Yv0j4I
	n1qB4yV1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM7o0-0001Cq-J3; Sat, 26 Sep 2020 10:51:52 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM7ny-0001B7-2z
 for linux-amlogic@lists.infradead.org; Sat, 26 Sep 2020 10:51:51 +0000
Received: by mail-pl1-x642.google.com with SMTP id e4so687441pln.10
 for <linux-amlogic@lists.infradead.org>; Sat, 26 Sep 2020 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Erv0okPrqcm4hiPfazJ3B+MEgGbrmkvfiAwUSBMTHes=;
 b=YfemzFvwe1AUIq1uBazHfToqDWIuf2mqgxJ2LU1hQxwGCiJqts77x+ngut+gKDqhyu
 L0jV/If4cXfKQgI7ofmQQtAASru2NifOZd2OyX48v5BGSlzEhQZc31S2AhbYotm0THAo
 EnrPESbJ1zEL+w9o8+2tkV9jWWrpDUr6/KCW49HHdbIO62g8Ab/dTtniiVi/JUANGaNK
 Lrn+ye0CnzQS7a2YmpA+hU/1/cq5tj4KQ88CaZyfGIx7IDfvnEBB1XzTCVrMXB5aBgGJ
 5Cuqx87fw4us0mVuVmRuuBqnVrp12zGKKKdOgHIcdOKk+It1htLYK11CkzUjZhbgjykB
 FzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Erv0okPrqcm4hiPfazJ3B+MEgGbrmkvfiAwUSBMTHes=;
 b=TzPOd7Aq1alrrphDdp3RGddpcLf9DUZn+RwE0qpy7QqqGCdcn3hvEJsLu47IpLtWUO
 yhfBJkPO1n+YslITrG91G6CN1/EyjTjw8bXqaVj1S5a9pWEF6+IMNH+dsfQYgaHPjfU5
 gUH0ij5JWggxlYvFRVKoYBHtJrwtd0qnegJitV4mv+vKNTAfnLHew5nL8zVvDo9Yo3GJ
 Uc5PyTJmJqE53bmtoRso3kH0tAlALpJTjLBuC6fTCQYoSjh1NiEZp1Ejk5F41pnm/ch4
 UUcf/eIfNjswi4qKvJE8zx4KU2gRXWMimMUysIKewlL9jgTYx9dvEDv2IY8AVa8qKL58
 ay6g==
X-Gm-Message-State: AOAM533xov5a/w9ULt6MTxtPHG5Vm+z13WaXUQDPMmOQhFixkvM9zEid
 BYxWoowe7A86GRrO03V9CFu9ow==
X-Google-Smtp-Source: ABdhPJyMU8iWdKoFGvrBKhvoBnMIbxxzkFSzD5yj9YM1Q2QfdUWp4vx7kR8Mt1Q+SkQai4c6OUnaSw==
X-Received: by 2002:a17:90a:9708:: with SMTP id
 x8mr1666114pjo.213.1601117502248; 
 Sat, 26 Sep 2020 03:51:42 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id w185sm5619297pfc.36.2020.09.26.03.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 03:51:41 -0700 (PDT)
Subject: Re: Deadlock under load with Linux 5.9 and other recent kernels
To: Christian Hewitt <christianshewitt@gmail.com>,
 linux-block@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <4a51f6d8-486b-73ee-0585-f2154aa90a83@kernel.dk>
Date: Sat, 26 Sep 2020 04:51:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_065150_145306_83E75E1C 
X-CRM114-Status: GOOD (  20.80  )
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
Cc: furkan@fkardame.com, Brad Harper <bjharper@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 9/26/20 1:55 AM, Christian Hewitt wrote:
> I am using an ARM SBC device with Amlogic S922X chip (Beelink
> GS-King-X, an Android STB) to boot the Kodi mediacentre distro
> LibreELEC (which I work on) although the issue is also reproducible
> with Manjaro and Armbian on the same hardware, and with the GT-King
> and GT-King Pro devices from the same vendor - all three devices are
> using a common dtsi:
> 
> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> 
> I have schematics for the devices, but can only share those privately
> on request.
> 
> For testing I am booting LibreELEC from SD card. The box has a 4TB
> SATA drive internally connected with a USB > SATA bridge, see dmesg:
> http://ix.io/2yLh and I connect a USB stick with a 4GB ISO file that I
> copy to the internal SATA drive. Within 10-20 seconds of starting the
> copy the box deadlocks needing a hard power cycle to recover. The
> timing of the deadlock is variable but the device _always_ deadlocks.
> Although I am using a simple copy use-case, there are similar reports
> in Armbian forums performing tasks like installs/updates that involve
> I/O loads.
> 
> Following advice in the #linux-amlogic IRC channel I added
> CONFIG_SOFTLOCKUP_DETECTOR and CONFIG_DETECT_HUNG_TASK and was able to
> get output on the HDMI screen (it is not possible to connect to UART
> pins without destroying the box case). If you advance the following
> video frame by frame in VLC you can see the output:
> 
> https://www.dropbox.com/s/klvcizim8cs5lze/lockup_clip.mov?dl=0

Try with this patch:

https://lore.kernel.org/linux-block/20200925191902.543953-1-shakeelb@google.com/

-- 
Jens Axboe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
