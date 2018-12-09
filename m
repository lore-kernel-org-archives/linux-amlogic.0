Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1EAC07E85
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Dec 2018 20:13:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E8720645
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Dec 2018 20:13:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XMqpzgLa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="h7QUwNgS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95E8720645
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1PpKNUKL0JYCHhOFzu8wFQhMtrLu+sA0Jc2PXHskt4=; b=XMqpzgLaKcNS5Y
	XZXRExHsDRvANX2isOENmTf/KsDnCy1s9fnikfFAlmabdXlp5pG/MjGHxlgzc/wkdk70SotG3snVj
	/ucW38HMTPf9BOOxoglelP8M/hMXpGKQ59I0v1WAZI2+NFCpkOo46jEPmksv+7oMXwGO8FxKxii7Q
	qFEMVzJqgqNb149L6AgKmdXvKT4iGBypKRaTkBS8xSxXldWxdxds2GDc9aErqGuujWz3eWXsScZgD
	IqTw3YYBM3PVxwaXAXuHFQzG+FgOY6GKinPs9NX8Ep1KdsItm84I9Z57GtD3jx47g926dYAWlCij6
	M9r5CoWKZGdbspmdGYBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gW5Ry-00074J-MS; Sun, 09 Dec 2018 20:13:14 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gW5Rv-00073g-Rj
 for linux-amlogic@lists.infradead.org; Sun, 09 Dec 2018 20:13:13 +0000
Received: by mail-oi1-x22a.google.com with SMTP id h25so7425083oig.1
 for <linux-amlogic@lists.infradead.org>; Sun, 09 Dec 2018 12:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=mlQ6N0uINjuCcuVQPXSxFQT9BQFp8Tz9j+YsCoXl3EI=;
 b=h7QUwNgS1i0NRTIda1ku7xkE6N8uf03Xa/5kCBYkIvdwZZ2A0mAHerXuxoa5o0mfbL
 4JdpfUX3ojx2tkAWPC989UFkjELYK4qqsdxIitkz6Rl68RpF3UTPve/gRwxGTvk51tpV
 xkhCkNxwIz+AwYnv90ClKzEM5QS129XdxqITXY8u/x1LxzkLDyIbBsxMeAqID5KcU9yV
 ufojo543J3/qHtf4OXplMgnfrhL+4nggBX1sxekpcJ2PH2Ih16cogxa0ZkKaAFr3BCH8
 QoaflO4Mcj9pMMSEcJ7RVy89/gUX/GrkivfUHdsTRjzYfUwYbVtOEV/pOTC7IbLsHylU
 297g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mlQ6N0uINjuCcuVQPXSxFQT9BQFp8Tz9j+YsCoXl3EI=;
 b=I6zY1NBGfqog02PrG5eSNZ+lCdQAAOujNlX7yO0OE/uHFQW02dg7jc30UNLcOBjnz7
 n0Z676dTSo4aPTxc87cQU1mj9yYq78MgeXS1kqSUnKL1iq6Mq5yZiBbrDVtZCSFt4k/p
 2NFFio5uH0sdf1G4MQyaHx0IqQKUVqbwLDM9HQwPk1DJyuxa40IsR0dYFu4WDsteQggI
 4zqErA8Q3WqyNFIhySIo6zUjdcG/w6tigftwfOGznJ2ghE9chY+gW+e3gSxKqmQi/yxz
 KuwMNfJp+vyxIYA4piqN1NloWHw+WWlFqSOfvQqyLvfEIc+ASYXl5VThUCfrDkoqt0Nf
 2tXg==
X-Gm-Message-State: AA+aEWYClBY07EySvavH886qvBlXHvcUYMow0MUvcEx0IKyys5Ew468w
 iNHtOp3PdslqlbfRP7I0gL4jAMUUpfxIFEs4NqbaGAH3DYw=
X-Google-Smtp-Source: AFSGD/U0bkCkw6rTclnST/qAvUahwiH+90CoeGa8VexGmeIiu9w0xIt7Wgor1aMkquBWcoZckMw2zBJ7vW3N6aCDV+k=
X-Received: by 2002:aca:4b48:: with SMTP id y69mr6249334oia.200.1544386380757; 
 Sun, 09 Dec 2018 12:13:00 -0800 (PST)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 9 Dec 2018 21:12:49 +0100
Message-ID: <CAFBinCBcYxAmeZz6Tx_P23Z--GstA5wC2JV=G7QSHssJpHKZRg@mail.gmail.com>
Subject: USB issues on Odroid-C1
To: brian.kim@hardkernel.com, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181209_121311_917841_98A113B8 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Brian, Hello Mauro,

I debugged USB issues on my Odroid-C1 today which doesn't detect USB
devices connected to any of the four USB ports.
This issue only exists on the mainline Linux kernel - USB works fine
with an older Armbian image on the same board (this is why I assume
that the hardware itself is fine and I'm chasing a software issue).

version code on my PCB:
ODROID-C1+ REV 0.4 20150615

The USB hub is detected fine since the mainline kernel is pulling
GPIOAO_4 (GPIOAO.BIT4) HIGH.
I have also seen that there's a PWREN signal (GPIOAO.BIT5) in the
schematics. I verified that this goes to the EN pin of the Richtek
RT9715EGB next to the micro-USB connector.
I'm not sure if the same signal has any impact on the USB-A ports.

I started to look for any clues in the schematics so I started
measuring the voltages at MOSFET "Q5".
Here are my results:
armbian:
- 1: 3.3V
- 2: 0V
- 3: 0V

mainline:
- 1: 0V (during boot it goes to 3.3V for 1 second or two, but then
goes back to 0V)
- 2: 0V
- 3: 3.3V
(I did two measurements: with GPIOAO_5 LOW and GPIOAO_5 HIGH - I get
the same result in both tests)

the pin names for the numbering in the schematics:
- 1 = Drain
- 2 = Source
- 3 = Gate

Can you please look into my test results and let me know if you have
any idea what we may be doing wrong in the mainline kernel? I can also
do more measurements, please let me know what to measure exactly.


Thank you!
Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
