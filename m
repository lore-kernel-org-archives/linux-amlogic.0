Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F2CC43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 14:46:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5633820657
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 14:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gXxk/wAK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kHfvlw3E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5633820657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnJzUZ0B4AVHq0imDpGcUQ4ZkzfoEk+Ts8GFTHqTlxI=; b=gXxk/wAKLMvVTw
	cqzvvA5pXBVGqnIQf16rOKQVCRFFdTidZhofYcHDQG6SmAR6Cz+BcY2ndAbGo12m6D8R55GnNjACQ
	4+5GR8Pdx/DnGtvNacFQCOH2fMK2mcLhCNRTQ1VEyGjMxkRLP81hlyW5ky22FLeamuN13M15ji4Ud
	zzL21rwRIinjaCG8YRvP6O7JVRYbUKjyFx2MpHP03l1B7qo2ah0A+K5F4d7MfEIAY42ubQDy8laHc
	JGHvdRCBaZjV/Y/0MfPBtUa7Dz5K/av9a0gMFQIwLUGoaJf1Jew201UPouDQmVZ0l0iHYi8h2/ZYD
	1TN4bVhywY9K/exQo3wQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj3VS-0005hV-7F; Mon, 14 Jan 2019 14:46:26 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj3VP-0005gQ-6S
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 14:46:24 +0000
Received: by mail-wr1-x443.google.com with SMTP id v13so23155105wrw.5
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 06:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nrl+fuIu80Mu0QkykiZk+mpDQueE8P1fmoNfr6hKOqs=;
 b=kHfvlw3EpwGdPrXZa7EBfSS4c8tcIPrPIrSdkeTm/cMoFy7jKvEcrcCavxtTc9D2hm
 4eLCTbMIQx0n0V7zZTNZSLHQmnJTKWk3UxKYJTqB/te0vfpT5QpsGdCgOPFEEcZHHObz
 QqWlkh+wxRScc9EAbHcx6VRVLVE+JIxiVsZM0MtrWXLYF7TsvHzvPlHQ/SQlt/EoRnTg
 AmN9ZOcEUHTVmY/1S6XEZkK8V0gfG9lZHVm6mNckpOBptVrTlOL9kVUKO3dVYm+VHjok
 wl8y6Yz+OO5ZjxSdw/kr0WEc2NDaXGvTjr1YQks2rl04/gtNmSdWe1nWYnpR8T6s/PbF
 q95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nrl+fuIu80Mu0QkykiZk+mpDQueE8P1fmoNfr6hKOqs=;
 b=WBnuA/UU9htmjurI/G+21lsREMzQ0z+94/y3MohQt6hLTD4bMVwyBvOj1tnMdmxlAD
 O/N1C7mJjg1RxOPapAEg7Wzrhg2uC5R/YrpFISun6OQQ3alI4mwys2+ntrQALCNfYlPs
 oXzhZX4NrDCe5vFBYkf+a8PgLckvkd1l/crVZGnyN9Nk/3bUF75irBDPpuRUJkU83k9+
 9Ooqs3nmw50RcbYFMqf+E0QPs6sqqdDY4qS+GIvwYZfkOgw4TUic1OMUeAh7hAi57Z3s
 3Y3gHmM0UB/w8jUTH+4uusVw1pL45Xd/7Ivf7sNPBw4/s8iNZoxZtdu/eJwdq/XoG5rC
 1CXg==
X-Gm-Message-State: AJcUukeQBb7yUNCNKZtXcyG39GsSH7ke7HHIVhAgBRXozNYQgvEM6sKl
 C43cjrR1S+PfHPJM6gjwCW/KFA==
X-Google-Smtp-Source: ALg8bN6C+D6KAjLfLrvbrGj6nR1fh5Mqb4ogInfF5luAF2K8CeSqUc+HHI2DqEIx8ZloW5TJ5pipgA==
X-Received: by 2002:adf:ef88:: with SMTP id d8mr24539487wro.163.1547477180686; 
 Mon, 14 Jan 2019 06:46:20 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c1sm26663149wmb.14.2019.01.14.06.46.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Jan 2019 06:46:19 -0800 (PST)
Subject: Re: amlogic mmc_partitions support
To: Peter Korsgaard <peter@korsgaard.com>
References: <CALtMJECdszQv+ZqbPv9dfq2QbogVJMfth+fNL40pgwh0_RtbCw@mail.gmail.com>
 <1d699426-5744-5149-f136-66db54b87056@baylibre.com>
 <87ef9fxq5z.fsf@dell.be.48ers.dk>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <1f584568-7071-141e-b551-f64bb7215608@baylibre.com>
Date: Mon, 14 Jan 2019 15:46:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <87ef9fxq5z.fsf@dell.be.48ers.dk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_064623_248043_ED5A0424 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: linux-amlogic@lists.infradead.org, Andreas Fenkart <afenkart@gmail.com>,
 krzysztof.michonski@digitalstrom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Peter,

On 14/01/2019 15:35, Peter Korsgaard wrote:
>>>>>> "Neil" == Neil Armstrong <narmstrong@baylibre.com> writes:
> 
>  > Hi Andreas,
>  > On 14/01/2019 10:54, Andreas Fenkart wrote:
>  >> Hi,
>  >> 
>  >> What is a feasible way to port the vendor supplied
>  >> drivers/amlogic/mmc/emmc_partitions.c into something that could be
>  >> mainlined? My thought is to create a custom block/partition/amlogic.c
>  >> driver. Would that have a chance to be included in mainline?
> 
>  > Basically, Amlogic uses the eMMC main partition as a MTD devices and uses a
>  > custom DT partition scheme to export named MTD partitions to user-space.
> 
>  > They don't use any "standard" partitions schemes on the eMMC main HW partition.
> 
>  > Mainline will never support DT-defined MMC partitions, and will never support
>  > a MTD indirection to a MMC HW partition either.
> 
>  > You can try to implement something similar using FUSE, but it won't be simple.
> 
> Not knowing anything about the vendor driver, if this is just about
> splitting up a single eMMC partition in sub blocks and not about MTD,
> then this can be easily done with the dm-linear target of device mapper,
> E.G. something like:
> 
> dmsetup create FOO --table "0 <size> linear /dev/mmcblk0 <offset>"
> 

Indeed, it would help, thanks for the pointer.

Andreas, this should be done from user-space in an initramfs code right before
switching root to the legacy userspace, for example, nothing in the kernel will
be accepted to do that.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
