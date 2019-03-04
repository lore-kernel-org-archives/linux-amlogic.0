Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URI_HEX autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CE4C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 13:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BF3206B8
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 13:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UApku423";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv89EQe8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BF3206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YPgRqsfDfDix2Z3ehN7e0YZNIMWF7o2YMbTE4Mdu+OU=; b=UApku423eCifpkXIOlz7+a/P7a
	CvxL/JH8fu2qrr7ezW0BIyNc+aateF+bP/ihvzlSeEN0DckQPU2i+glrKSRB61bjtkBkpzouzuJC5
	UK5BHYmO1wJ44B/vOR8A+DroeV1K4dnpCYQdF7fQSwJg/ilhPIkoJfuK+mvw5qTH8LXvmb521lIk6
	9uiK1rXIqoIqno3RXDdRKdncSovJxaL7mWfzMMUdjsgI0Z/fv72eyaFAOi7ZNOEYwiXYirDzBO+cj
	6NuON/l50LkthyQca95s8kUbHRdt01wP8hJHoWUYgCO9HqipszSh1U8Ah9ZJWqcPnEoPbIA8j7dVy
	ZxSVLFew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0o6n-0001Bj-R3; Mon, 04 Mar 2019 13:58:21 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0nvC-0004mc-TK
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 13:46:24 +0000
Received: by mail-qt1-x841.google.com with SMTP id p48so5160635qtk.2
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 05:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=2iOVz78u7bAE+bdM9xG/dxsb+bWfbNl28yYobs8MYDk=;
 b=Mv89EQe81fKfCzdGTO7nzCcuTxR4QsyHN+mpscd7K2y0GoOoTN1KXiN01mvM2/vHhC
 AdvUUI/goIT0zCsDT+YxoO/FFKb3t2G/pOENeiXXmpehJj1PuM9O/owbNhqeU1gTWn/n
 LT1U1n0x+PkYXT/ATkYu5anThzKS6upc3NHQw3+NRFmyKtRaoKX8UE3sipSZ0Qqa+YiX
 4MYbTKysvbOsHbiMAXHwRqqYxctvDe8Oskux9uAm3Bd1oaouGfFs8OOc1zPzGNGC7Wi+
 6oegd3SOWE40TA/1HQDxhPx7qtIi+JjGutHp+TK8yJkqrY6luByBiRENWghc23LWxLkO
 FImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=2iOVz78u7bAE+bdM9xG/dxsb+bWfbNl28yYobs8MYDk=;
 b=AF4FTolpAeT5TENOUOM3qWHwtzdbcIKDdTZnWLlQ6YoIY0m4gTHIb4S+SdVy6ynye6
 KxuQJ6r1d4qnwuLxR/46YqajXDQd7J+TLm3TCd+ExfvGDHL1P4L0bsGSZTRvAlGXTUIq
 mYuktZq7BqPtOg8+TA2rh7ib2RoxrdWmF7aMTVPsTwfV5NtU6e8NkS7FWvgO5ThtML7+
 CjvwNXLcS1EERxAxRGxmWcRXYnOP1w7LlNfwo+I5fHwYnc1c7JQG6SklotKzSI8kvEZK
 uXNMYcbr6fERvBNb44y4YvS5pMUsA96G1RHlZgTOUfBAczCxaA14qp75nQx1ze5Q3NXM
 BGvQ==
X-Gm-Message-State: APjAAAWDu1jBl36w4DV3fCLjru44bx+bhdvz1HnyMVP8HkC+vazIZlcH
 El9yEvO/JYzJkbVfbBPI4ydWa2vnZ/Q0vUaxTmVP5NRm
X-Google-Smtp-Source: APXvYqx3rKngNeP5QH6SmN/8gwZu+8x+NuPbI7dorE1r6HIg40RK6J8v7XAlhw82PGprLrqr40b/QdaoBaPtW1Jaqhk=
X-Received: by 2002:aed:2a56:: with SMTP id k22mr14621044qtf.85.1551707181668; 
 Mon, 04 Mar 2019 05:46:21 -0800 (PST)
MIME-Version: 1.0
References: <CAJDSL=VG2YbAwuL_1SOVfWfD4gWquNG353p8LkCP+jiFpiN=9A@mail.gmail.com>
In-Reply-To: <CAJDSL=VG2YbAwuL_1SOVfWfD4gWquNG353p8LkCP+jiFpiN=9A@mail.gmail.com>
From: =?UTF-8?B?QW5kcsOpIEJhbHNh?= <andrebalsa@gmail.com>
Date: Mon, 4 Mar 2019 14:46:10 +0100
Message-ID: <CAJDSL=W7X3am=iCOvafyzLuL8hzZriDWh4Zs2zfgBZDdDJtx7w@mail.gmail.com>
Subject: Possible regression in driver meson-gx-mmc in kernel 5.0.0
To: linux-amlogic@lists.infradead.org
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_054622_973054_3F83C6C6 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 04 Mar 2019 05:58:20 -0800
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello, my first post to the list, nice to meet everybody.

I cannot boot kernel 5.0.0 on my S905 TV box (using
meson-gxbb-p201.dtb) from an SD card, see the errors below (captured
from serial output).

If I revert only meson-gx-mmc.c to the version in kernel 4.20.13,
kernel 5.0.0 boots without any problems.

It seems the problems occur because of patches introduced by Jerome
Brunet in December, see
https://lkml.org/lkml/2018/12/6/745

My guess is the removal of the spinlock allows for race conditions
that cause the mmc driver to fail when writing to an SD card.

I am available to test the driver further with any proposed solution.

Regards,
Andrew

...
[    5.004812] EXT4-fs (mmcblk1p2): re-mounted. Opts:
commit=600,errors=remount-ro
[    5.146421] systemd-journald[1490]: Received request to flush
runtime journal from P
ID 1
[    5.384651] meson-gx-mmc d0070000.mmc: Linked as a consumer to regulator.2
[    5.384691] meson-gx-mmc d0070000.mmc: Linked as a consumer to regulator.1
[    5.384774] meson-gx-mmc d0070000.mmc: Dropping the link to regulator.1
[    5.384810] meson-gx-mmc d0070000.mmc: Dropping the link to regulator.2
[    5.400751] meson-gx-mmc d0070000.mmc: Linked as a consumer to regulator.2
[    5.400792] meson-gx-mmc d0070000.mmc: Linked as a consumer to regulator.1
[    5.400838] meson-gx-mmc d0070000.mmc: allocated mmc-pwrseq
[    5.423057] Registered IR keymap rc-empty
[    5.423126] rc rc0: meson-ir as
/devices/platform/soc/c8100000.bus/c8100580.ir/rc/rc
0
[    5.423365] input: meson-ir as
/devices/platform/soc/c8100000.bus/c8100580.ir/rc/rc0
/input0
[    5.423654] rc rc0: lirc_dev: driver meson-ir registered at minor =
0, raw IR receiv
er, no transmitter
[    5.424036] meson-ir c8100580.ir: receiver initialized
[    5.451279] mmc2: new high speed SDIO card at address 0001
[    6.123900] Generic PHY stmmac-0:00: attached PHY driver [Generic
PHY] (mii_bus:phy_
addr=stmmac-0:00, irq=POLL)
[    6.133968] meson8b-dwmac c9410000.ethernet eth0: No Safety
Features support found
[    6.133983] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
[    7.718995] print_req_error: I/O error, dev mmcblk1, sector
27401016 flags 801
[    7.719007] EXT4-fs warning (device mmcblk1p2): ext4_end_bio:323:
I/O error 10 writi
ng to inode 805638 (offset 0 size 0 starting block 3425128)
[    7.719012] Buffer I/O error on device mmcblk1p2, logical block 3293031
[    8.162241] meson8b-dwmac c9410000.ethernet eth0: Link is Up -
100Mbps/Full - flow c
ontrol rx/tx
[    8.177336] print_req_error: I/O error, dev mmcblk1, sector
28635136 flags 801
[    8.177350] EXT4-fs warning (device mmcblk1p2): ext4_end_bio:323:
I/O error 10 writi
ng to inode 805606 (offset 0 size 4096 starting block 3579393)
[    8.177358] Buffer I/O error on device mmcblk1p2, logical block 3447296
[    8.178186] print_req_error: I/O error, dev mmcblk1, sector
28570600 flags 801
[    8.178194] EXT4-fs warning (device mmcblk1p2): ext4_end_bio:323:
I/O error 10 writi
ng to inode 805589 (offset 0 size 0 starting block 3571326)
[    8.178198] Buffer I/O error on device mmcblk1p2, logical block 3439229
[    8.422031] print_req_error: I/O error, dev mmcblk1, sector
13734800 flags 4801
[    8.422045] Buffer I/O error on dev mmcblk1p2, logical block
1584754, lost sync page
...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
