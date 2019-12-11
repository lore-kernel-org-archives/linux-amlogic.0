Return-Path: <SRS0=S6c6=2B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5AAC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 10:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5847621556
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 10:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nnKPiUKn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKFA7/+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5847621556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6obHSlYh1ToenggAiCR4I4tkHeK8BLZXt4nWt4m0xQ=; b=nnKPiUKns2IgrE
	f3z2QS2DkwIqmkAa+eyRJPt8ZfbdusKepKQ/m1UA/9J74xgatVRqQJJBYQc/MatKBz0owf3nhhIdn
	fu3dF0DE4G6Bua/BE4BhxT2ybUJnb3+/rUawdYAeQ9Ty+sR+Rq/5f29g8nzF/h2VvwUB52OhAl5t6
	S5Aof1at2zytZcf1wh1kxG7z9gGO8Xt7uwitqOiwpRc3k8iG2SI3AIc5aHAwZQCLDqG0VVFzgO4wG
	6P/6QUXP5cDi61vaKj6t7Mw0GhUn8qpFGtvH1djg2JgM+JtG6cBzjIIun0c5ANXSlcpu2GWlMZo2M
	Yh8MCzFd3WuHwL81j4Ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iezJy-0001f5-Ju; Wed, 11 Dec 2019 10:34:18 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iezJq-0001XP-F5; Wed, 11 Dec 2019 10:34:12 +0000
Received: by mail-il1-x141.google.com with SMTP id g12so19013604ild.2;
 Wed, 11 Dec 2019 02:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dOmVU46s6nV+n0B47S9FUyCMpYjTYJPpLDGRrRSRigA=;
 b=HKFA7/+6tylk60vhCVFcqc+BPuWBQ2OPBDe/7Z1erDUzjZdWn9QRbN1+/YWglnVRpn
 ZEyMWn00OVns4EbGCXtpU0/dDnHxoV6ixZFCdS3p6uqgLHVrt7kJ8l70cPNODSJznmew
 GTBvgWCcv11jqKiEUs9GCmdP+MvSIzaoYt4vmnWj7dbIAUv9FbR5qKotm0PRAVXDA4yH
 iahuo7fjQTrLs2z8qdkGTk6OINGZMKPhehiZrx8Ftzw0pVNfprfG0jAgUzM98MrZPrJ4
 MVTIOpe1l90Vv9OxHIKbGaI6szxgpEIcRlCp4fhF/GOmKxA/RdL2O4OnEza9M4B+RC5g
 JZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dOmVU46s6nV+n0B47S9FUyCMpYjTYJPpLDGRrRSRigA=;
 b=bvKe5M+xKNEPRmfGAYkU02roJ5ubPmzOqg5MhC8BHYJogNFn9Gm+/4052tLKdDMmxf
 rMM6FP6oetcENkQKYLX6vEKHrOsnNGcYXJC37WPvjKbfRkXnQiXe1ZtvqX6jCuPaQrNJ
 6BWcHcv1ydxjYQXNVUoFqYbne4Dn8crDsWaXwLAMB4RhpaJuH/3BLDSPQhMtFSeipFz7
 gIM7S/Zd8Ch/xzkLyOBR+iV6yOdRK9o33xXzIrDJg3ZgBOyQr096O4izH89VWMEauBfS
 +48u0/HoMW1VfW9rdRTv0V/mlnCEMejWZdXGN0TP14fFJ5lZ568f4cYfDpl7aGr3jwK+
 L09A==
X-Gm-Message-State: APjAAAUNiDBrPDUpO1H0J53yfk+xQbg1tHXA2Fi8kU5sR1txCoylTknW
 kKdsJFiSv3vhXSu+d8iigKyWsr0YgBZZVBV9ZtE=
X-Google-Smtp-Source: APXvYqx9ymukFe/tBUQNK7wtKGmsWiAPG+2T6ub8VNY5LvUHiZqsh0RhNmlZhmC+X9W69a0rPzCnGegI2mJzlejoBIk=
X-Received: by 2002:a92:3919:: with SMTP id g25mr2235862ila.221.1576060449476; 
 Wed, 11 Dec 2019 02:34:09 -0800 (PST)
MIME-Version: 1.0
References: <20191211084112.971-1-linux.amoon@gmail.com>
 <a4610efc-844a-2d43-5db1-cf813102e701@baylibre.com>
 <CANAwSgQOTA0mSvFW5otaCzFPHidhY7VFcrXZHjCD-1XkQpcx3w@mail.gmail.com>
 <20191211095043.3kngq7wh77xvadge@gondor.apana.org.au>
In-Reply-To: <20191211095043.3kngq7wh77xvadge@gondor.apana.org.au>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 11 Dec 2019 16:03:58 +0530
Message-ID: <CANAwSgTNX1Q4VWymXYyvcByFhr+f3C9AqpG2G7dQp+0DPLR-JA@mail.gmail.com>
Subject: Re: [PATCHv1 0/3] Enable crypto module on Amlogic GXBB SoC platform
To: Herbert Xu <herbert@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_023410_531675_49B01637 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Herbert,

On Wed, 11 Dec 2019 at 15:20, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Wed, Dec 11, 2019 at 03:07:53PM +0530, Anand Moon wrote:
> >
> > name         : ecb(aes)
> > driver       : ecb-aes-gxl
> > module       : kernel
> > priority     : 400
> > refcnt       : 1
> > selftest     : passed
> > internal     : no
> > type         : skcipher
> > async        : yes
> > blocksize    : 16
> > min keysize  : 16
> > max keysize  : 32
> > ivsize       : 0
> > chunksize    : 16
> > walksize     : 16
> >
> > name         : cbc(aes)
> > driver       : cbc-aes-gxl
> > module       : kernel
> > priority     : 400
> > refcnt       : 1
> > selftest     : passed
> > internal     : no
> > type         : skcipher
> > async        : yes
> > blocksize    : 16
> > min keysize  : 16
> > max keysize  : 32
> > ivsize       : 16
> > chunksize    : 16
> > walksize     : 16
>
> Oh so you did actually get them loaded.  You need to run tcrypt with
> mode=500 instead of 200 to test the async ciphers.  Does that work?
>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

I get kernel panic, I will try to look into this much closely.

[alarm@alarm ~]$ sudo modprobe tcrypt sec=1 mode=500
[sudo] password for alarm:
[  754.382673] tcrypt:
[  754.382673] testing speed of async ecb(aes) (ecb-aes-gxl) encryption
[  754.385583] tcrypt: test 0 (128 bit key, 16 byte blocks):
[  754.385774] SError Interrupt on CPU1, code 0xbf000000 -- SError
[  754.385776] CPU: 1 PID: 121 Comm: da832000.crypto Not tainted
5.5.0-rc1-00012-g6794862a16ef-dirty #3
[  754.385778] Hardware name: Hardkernel ODROID-C2 (DT)
[  754.385779] pstate: 60000005 (nZCv daif -PAN -UAO)
[  754.385781] pc : wait_for_completion_interruptible_timeout+0x20/0x120
[  754.385782] lr : meson_handle_cipher_request+0x344/0x700
[  754.385783] sp : ffff800011e9bca0
[  754.385784] x29: ffff800011e9bca0 x28: 0000000000000040
[  754.385787] x27: 0000000000000010 x26: 0000000000000000
[  754.385789] x25: 0000000000000000 x24: 0000000005300080
[  754.385792] x23: 0000000000000002 x22: ffff00006d08aa00
[  754.385795] x21: ffff00007f68c4d0 x20: ffff00007f68c4c8
[  754.385797] x19: 000000000000007d x18: 00000000000000ab
[  754.385800] x17: 000000000000006c x16: 000000000000001b
[  754.385802] x15: 000000000000000c x14: 0000000000000010
[  754.385805] x13: 0000000000000000 x12: 0000000000000000
[  754.385808] x11: 0000000000000001 x10: ffff8000119d7e80
[  754.385810] x9 : 0000000000000000 x8 : ffff800011add000
[  754.385813] x7 : 0000000000000000 x6 : 0000000000000000
[  754.385815] x5 : 0000000000000000 x4 : 0000000080800010
[  754.385818] x3 : ffff800011acd000 x2 : 000000006d093002
[  754.385820] x1 : 000000000000007d x0 : ffff00007f68c4c8
[  754.385824] Kernel panic - not syncing: Asynchronous SError Interrupt
[  754.385825] CPU: 1 PID: 121 Comm: da832000.crypto Not tainted
5.5.0-rc1-00012-g6794862a16ef-dirty #3
[  754.385827] Hardware name: Hardkernel ODROID-C2 (DT)
[  754.385828] Call trace:
[  754.385829]  dump_backtrace+0x0/0x188
[  754.385830]  show_stack+0x14/0x20
[  754.385831]  dump_stack+0xb4/0xfc
[  754.385832]  panic+0x158/0x320
[  754.385833]  nmi_panic+0x84/0x88
[  754.385834]  arm64_serror_panic+0x74/0x80
[  754.385835]  do_serror+0x80/0x138
[  754.385836]  el1_error+0x84/0x100
[  754.385838]  wait_for_completion_interruptible_timeout+0x20/0x120
[  754.385839]  meson_handle_cipher_request+0x344/0x700
[  754.385840]  crypto_pump_work+0x10c/0x228
[  754.385841]  kthread_worker_fn+0xa8/0x188
[  754.385842]  kthread+0xf0/0x120
[  754.385843]  ret_from_fork+0x10/0x18
[  754.385862] SMP: stopping secondary CPUs
[  754.385863] Kernel Offset: disabled
[  754.385864] CPU features: 0x00002,24002004
[  754.385865] Memory Limit: none

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
