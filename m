Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E6DC43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Dec 2018 10:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E75892133F
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Dec 2018 10:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hVs0jl2X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GDTzsRZb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E75892133F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znpsYChvvyohasioBLehhe3Ovn5qN52BXYgZhIQhoNE=; b=hVs0jl2XMXpGLI
	7oVLcALCBCaL1SztiHutXkzSC3GLXnzHT8daA6VLfQVG2R6+QZRwYlU63O9D4FW1ZJtuMnkgiKHS+
	2A1Qh867gGFwvBlBpvgXpgbzmSYg//7cnZ7a0kPOp76jYAP3FWgm3w3278D7Naj+rhlBkBYWx2bLv
	c5f/BHEOZuCn+QTSJZ6TXoKE5fMMVUo9z0+rs5slXdNEgs4VqOmVxDiYmSY1M4Poxekpmg3OXeU08
	9bstssWWswsICm52LRZETkPhAQuX2isD40u+KgYmfaA7QZ2KOI9Cw2WQBcDlU0I1SfjwEnlpgFeiA
	1SZEIz2xCHfb+2d+gJSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gdvHw-00053m-Qr; Mon, 31 Dec 2018 10:59:16 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gdvHt-00053R-AM
 for linux-amlogic@lists.infradead.org; Mon, 31 Dec 2018 10:59:14 +0000
Received: by mail-oi1-x242.google.com with SMTP id y1so21682253oie.12
 for <linux-amlogic@lists.infradead.org>; Mon, 31 Dec 2018 02:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6vJok3r7dD/ElA/fhlGmJoKwJMZIyE6SKpcTBpk1UIw=;
 b=GDTzsRZb2i/PkRtYemdPR0IZIc42aX4XOfUKP4+Ae3bHq0fzc4SLd//gEvUpP9+AoP
 c0tnW7dlc35k9p0hSrxqWQh/nNwjasSCauImBypY/HdmspNHGpvcliGkRDARKIYfJ3Ud
 vIFyQtB4wElsXF1a0++BaC6WdPWQ9NGenUi2UauwJkKO0VGnV2vDAN8MOC1Idx8xbiwd
 JuIn02AG01qLaYs2BoS9u6CpUdg2eDNrVsaKsE6Pjt8ZDn1dD0O4fzqkXorK44nzKxOP
 8Bo3BwbSYH785Y3xO/rY0T9iZ1xIFOkUHCH9Hf29iZiu5L0EgYF6VR3XxKgC4aAOtAz8
 PlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6vJok3r7dD/ElA/fhlGmJoKwJMZIyE6SKpcTBpk1UIw=;
 b=YwMk4AvjcVVuw+pwOFsICfuEibY441uUq+s8x71YOUhiQ2CySv84DjgH4ZjTkVr80K
 Veyos6jMfbLRyD7JgYq1nLPifmHpnMhfPekbdXGLaHp/M9xiI0t+Fd3AWq5zcwDMHBq2
 Bm7b/qBzWUHxIsmNDPS1Y28xMTtwfGZUW9/TjwmIVPNSwtM1CZVcpKgQknhhOQlFivhU
 CB6xfaAEBqo331JKiBtDPkCq0SKIu/1+eY389OtlnvUJ4FuwTLckyF5BajsFoiPfRaQq
 rviA+iswRQmdgnN5IrY60ajExvIAVcfWz7KOwtgNXo9+AI4ZyvIb84S2fLaYJf7MeBx1
 Eu9Q==
X-Gm-Message-State: AJcUukcR+9BQlBd4LqmVqBFbskRsCqf9dq7SwL4p3i5WPWk8WLaZGI5V
 kdd767mP/yKv+LY32qx+b6ew0mvxwL/mhXbkOSidz3B5
X-Google-Smtp-Source: AFSGD/Xpe308ie/zolBldN48dnD43ElT1PAJwZ1uIuFonL6HiPCwPIut/XzWiUvUwD1r8DgeZTTvvX85mL/RLPWQUZA=
X-Received: by 2002:aca:4ace:: with SMTP id
 x197mr25581442oia.129.1546253951403; 
 Mon, 31 Dec 2018 02:59:11 -0800 (PST)
MIME-Version: 1.0
References: <20181229143556.27339-1-martin.blumenstingl@googlemail.com>
 <20181230181505.GA1690@ingrassia.epigenesys.com>
In-Reply-To: <20181230181505.GA1690@ingrassia.epigenesys.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 31 Dec 2018 11:59:00 +0100
Message-ID: <CAFBinCAkV_1shUgs7tpBzVHaBBhWqPk0iW7CvHeyRZcaaS9iwQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Meson8b RGMII Ethernet pin fixes
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181231_025913_391845_C36383C6 
X-CRM114-Status: GOOD (  17.25  )
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
Cc: linux-amlogic@lists.infradead.org, khilman@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Emiliano,

On Sun, Dec 30, 2018 at 7:15 PM Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
>
> Hi Martin,
>
> On Sat, Dec 29, 2018 at 03:35:54PM +0100, Martin Blumenstingl wrote:
> > Hi Emiliano, Hi Linus,
> >
> > could you please test the patch from this series on your Odroid-C1?
> > I tested it on mine and Ethernet seems to be improve Ethernet transmit
> > speeds greatly (at the cost of a small drop in receive performance).
> >
>
> I redo the tests described in [0] with your patches applied.
> Here is what I got:
>
> 1) Start packet generator on laptop:
>
>               | incoming traffic | outgoing traffic
> =====================================================
> nload (board) |     ~940 Mbps    |       0 Mbps
> -----------------------------------------------------
> nload (laptop)|       0 Mbps     |     ~940 Mbps
> =====================================================
>
> 2) Start packet generator on board:
>
>               | incoming traffic  | outgoing traffic
> ==============+===================+==================
> nload (board) |     ~460 Mbps     |     ~256 Mbps
> --------------+-------------------+------------------
> nload (laptop)|     ~256 Mbps     |     ~940 Mbps
> =====================================================
>
> 3) Stop packet generator on laptop:
>
>               | incoming traffic | outgoing traffic
> =====================================================
> nload (board) |       0 Mbps     |    ~940 Mbps
> -----------------------------------------------------
> nload (laptop)|       ~940 Mbps  |      0 Mbps
> =====================================================
>
> 4) Restart packet generator on laptop:
>
>               | incoming traffic  | outgoing traffic
> ==============+===================+==================
> nload (board) |     ~460 Mbps     |     ~256 Mbps
> --------------+-------------------+------------------
> nload (laptop)|     ~256 Mbps     |     ~940 Mbps
> =====================================================
>
> So, now the board does not drop the entire incoming traffic while
> transmitting at full speed, but gently decreases the transmit rate
> as one would expect.
awesome, great that it works on your board as well!

> Sure it's not working as full-duplex yet, but this is a huge step. Good catch!
I'm not sure what could cause it to not use full-duplex (whether it's
the PHY, MAC, SoC implementation, PRG_ETHERNET registers, ...)

> Just a question about the patch 1/2: why you didn't remove the variables
> "eth_txd0_1_pins" and "eth_txd1_1_pins" in "pinctrl-meson8b" driver?
(10/100 Ethernet only requires TXD0 and TXD1, there's no TXD2 and TXD3 there)
I didn't drop them because there may be devices out there where the
board designer decided to route TXD0 and TXD1 to the
eth_txd0_1_pins/eth_txd1_1_pins

> Apart from this doubt, your patch is fine for me.
>
> Tested-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> Reviewed-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
thank you for these!


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
