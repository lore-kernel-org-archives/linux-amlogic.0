Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA58C43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 14:42:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F2A220657
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 14:42:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QtX58hHP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tcupFVMu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F2A220657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ospEFC7pkmP36YsbMoNuzH8H90d/d4C/uZzpKfAN4Ms=; b=QtX58hHPAQ7bmS
	De9KE+kgQnPOAWY2CtjXRdHBewBMUatSvPczv6ytlikLFTiLi0wpueJh7oBjF9twy36+/A/LpwodN
	UU7SiO4uTyzOWb2/8l/wKqTZRFNE526rA7168L9aXggo5ayyyQk0mWacHuWZKmpwknwKo5Tp0V48a
	+OAsDDtExkVxJxVCzSPRcaiR9yhDRf2w338K+XE5kD/ITBgZdHDDF52n63L9oTo1C60Y4DWnDVFz2
	w4RkfKABlg+D12aMD4BAeCf9jNrbZ1I3RumLUFiW/DeC4GJ/7lNSwToy7S2aCKNDSqDcQqaT64Ads
	UeRNT4uESvYpPNFG2MDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj3RR-0003pW-Ad; Mon, 14 Jan 2019 14:42:17 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj3RO-0003p1-83
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 14:42:15 +0000
Received: by mail-ot1-x32c.google.com with SMTP id w25so19444132otm.13
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 06:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=51tjBo+0x6ZxLRvCtqCQdHDUPTea2YVOdnZGkk4m72Q=;
 b=tcupFVMu/PFeqzjRD+qtFFrUVaa95J3hifdItREy1v3Z89ZCevhgMlx0AKkNDPTDKO
 ibYP5C5A9R9ja4XPEHNUECabzdB4w7/xGQxz1WFWmgGmbK3zMv87nBum0FTv+iBpMn51
 97WJNcx7ByoWBD0h3ydvmUvnfeKsCtJ/rSNElSu77xCrOFUCYVO+yz7/U+gYXkOrZAjo
 ThK5DaPL0/dUsCJedStwJzKunc+7C/SWuouW8SI93M44xQnT0eBMPi0RZpJbPVuJ3RQH
 p0AZHTsOaOrYc1T+fA7zaTbadevIS/Xpw/VB0fvGox5JcFDSfuwlOo5QUTEWKZK6wVHz
 1wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=51tjBo+0x6ZxLRvCtqCQdHDUPTea2YVOdnZGkk4m72Q=;
 b=WxrfJ0Sqs2ZIeYDsVyFQ6xNmfCXCDSfrihKZPny2dGwRz1vh+hJbXvSseSmn4is7MF
 dB8OOps+Y/7i3nXxW3GTTbPnhsO8dErYch4jN5Prqufpj1nN3dHPKr2OjJUhlLqhYj4w
 uk72YeQKU3hsdrmWT90RSMtoNK6JI5BFko21BdrCJ9nQpiOttNjKmNlzt2nJz5/CINV6
 6TJu+MejwnJSCdZt+KM1p1XgEgd8ycPHea3xVK2kPayl/ytqRe9x/qBN1/oTuKt23q4X
 YZ/96IpSqucOCFn5RYD+tSGWpOEQ4GaaJgYkCYsYaefZ2ca0zw4KzieG/sDQTLcJlxzO
 JaFg==
X-Gm-Message-State: AJcUukcXZzPCIZZxWP3X+vjxTkFjNf6MtfCNXMJ9Hnl3ESvJtFrtHjxs
 TTF0XgzOKBt8C/gdn4rpNrlhapvj6EpxNA6IUWY=
X-Google-Smtp-Source: ALg8bN6ztadrcfC/9avd9uCIsOlLwvMqQmlxAGYK7YH5Fo6SJA1d5fQkbKFvr1FgSYbu9RTJZnqqlt4DxTFrxXhkjWg=
X-Received: by 2002:a05:6830:1289:: with SMTP id
 z9mr15894031otp.281.1547476932998; 
 Mon, 14 Jan 2019 06:42:12 -0800 (PST)
MIME-Version: 1.0
References: <CALtMJECdszQv+ZqbPv9dfq2QbogVJMfth+fNL40pgwh0_RtbCw@mail.gmail.com>
 <1d699426-5744-5149-f136-66db54b87056@baylibre.com>
In-Reply-To: <1d699426-5744-5149-f136-66db54b87056@baylibre.com>
From: Andreas Fenkart <afenkart@gmail.com>
Date: Mon, 14 Jan 2019 15:42:01 +0100
Message-ID: <CALtMJEB=tt+Cr5Avq2m2Y15T0JsXn9FW50=x+pTw-OQe3yQN4A@mail.gmail.com>
Subject: Re: amlogic mmc_partitions support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_064214_308283_C08CAE0E 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: linux-amlogic@lists.infradead.org, krzysztof.michonski@digitalstrom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

Am Mo., 14. Jan. 2019 um 11:00 Uhr schrieb Neil Armstrong
<narmstrong@baylibre.com>:
>
>
> Basically, Amlogic uses the eMMC main partition as a MTD devices and uses a
> custom DT partition scheme to export named MTD partitions to user-space.

I've seen the dt section about partitions, but the partition table is
also stored on the emmc.
It's at an offset (36 MB) and uses a custom c struct.

#define     MAX_MMC_PART_NUM                32

struct partitions {
    /* identifier string */
    char name[MAX_PART_NAME_LEN];
    /* partition size, byte unit */
    uint64_t size;
    /* offset within the master space, byte unit */
    uint64_t offset;
    /* master flags to mask out for this partition */
    unsigned mask_flags;
};

struct mmc_partitions_fmt {
    char magic[4];
    unsigned char version[12];
    int part_num;
    int checksum;
    struct partitions partitions[MAX_MMC_PART_NUM];
};

I'm trying to create a prototype. Is this something that could be
mainlined then?

> > Anybody else that tries to support the existing amlogic partition
> > format, not the implementation, as is. I want to upgrade the kernel
> > via fw upgrade on existing installations, but not touch the u-boot nor
> > the formatting.
>
> Some people forward ported it, and is available on some git repos around the
> Khadas VIM support.

thanks,

/Andi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
