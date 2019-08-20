Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E899C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:32:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC9A2332B
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:32:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lwXzo4uA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oDSjhL2Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC9A2332B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFqHRByLF5S6v1yxmd7xxehCS4QBQWebaqLDKNicxN4=; b=lwXzo4uA25ZSoO
	wGifjj4PV4VKfJi6+ukcMcDSjMEJH52jbl2rLR/fMrMzEvOEPgxhvs8RjPumOh3ydVfDyErwt8G/f
	LsN9cXjMJ6hWihVbKXJLtPJ6Z3eabv90MkB2mkRjkNN6n2xxQ/DGCOF4niii26RkGO54kSB9anJA/
	vN/nHK16AwXglEYs/3TRVlc/cY/UiPojsQhFtB08yf2jYyq3ETqPciQxNwspxiVZhV8NZJAqsEow2
	Kog+PDGwX1gaibxhcmLqpShfUJjV/PNalD0ioEZJyqHzgymysuAbRd90Hr+5H+bhfNtgO9uny7Dzq
	/JaipUtZraA6rWvwG/mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0AoE-0002VG-WB; Tue, 20 Aug 2019 20:32:51 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Ao6-0002LS-3q
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 20:32:44 +0000
Received: by mail-pg1-x543.google.com with SMTP id m3so3850939pgv.13
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=kyEHbcI8OaQsdijhpYJ247ryUC+AhRoozS5mgSer0Qw=;
 b=oDSjhL2YNHp14i8G4UOYppX2LDYc+KQATpHHF3wGLc0y5v0WksfEU2Q+9UzD0p0SHN
 n/Nr+6HeVKShQwoQTzdLC+R8lxmiDFcjgussLq1WpOPFpSPqxMKByyofImYkvntJqwNk
 3Mbspm+ItArW2F26vGCm2bdg0vYXDZe+SrhMg8zu4du0MoVWXnSLPMyxsSf3zianCYo0
 A02OsSc2AWfDxCB8b0GLmTc1bblPdww2Yjy+0cIBAaQjiRmhYf1Uw/plFXOQsUJnD0QW
 6pwxwP4B3WbDJbe15yloVqI100IM4BuDM/PPqkWuKpqgAk29WzRZDCGu+ayucYgoznCT
 RcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=kyEHbcI8OaQsdijhpYJ247ryUC+AhRoozS5mgSer0Qw=;
 b=YszsupAqlAk7FIyMLwbXLOjtRfwZEdIaXtmuV2glbfe0plzELldCkuFE+INOLO1SSV
 QIlWzM4oOZa965pc/YjBvI6+2L3ECuA9S53Njj0oEvyhw7wtFVsicJoBfaF9pCQTBOgW
 pIozfCe3KoFh6EhK23kYSwqeFleycY0/g320XAi2Q7zBH6hVeDOGcbJr++3/99xRrc28
 PAX6DmqMB7ZfNKpivWK7ouWbvpBoMBu9ei8d0mI8KxJFEG2leA0IwUU7KGorPJ6bYGhq
 Jx2As/AdhgujOkKHOoROBWjGXab7SBVHox6yf1W9WWKhTrUN8FWNQkSQaG50mQ5XWWva
 QjyQ==
X-Gm-Message-State: APjAAAVcD7y4jsfrbjhuas9jGfwATxmHDYpP2RAM3IDy5fxhkkwmol31
 MDlezb2GsveDcH9cXD4Up9Tbdg==
X-Google-Smtp-Source: APXvYqxRPX9c2O6zHA+5ot8vijJAGlXF9Zjo5KF2B+Iw4rrZszh1tbBUVvSTk6/XMqwI7rzVhcpG/Q==
X-Received: by 2002:a63:b346:: with SMTP id x6mr26638801pgt.218.1566333161272; 
 Tue, 20 Aug 2019 13:32:41 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y16sm27494422pfc.36.2019.08.20.13.32.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 20 Aug 2019 13:32:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 6/6] arm64: dts: add support for SM1 based SEI Robotics
 SEI610
In-Reply-To: <CAFBinCCNN_DBiriJRjw-AA-OCMFc+UgYi4oSJasJSypYFSbw9g@mail.gmail.com>
References: <20190820144052.18269-1-narmstrong@baylibre.com>
 <20190820144052.18269-7-narmstrong@baylibre.com>
 <CAFBinCCNN_DBiriJRjw-AA-OCMFc+UgYi4oSJasJSypYFSbw9g@mail.gmail.com>
Date: Tue, 20 Aug 2019 13:32:40 -0700
Message-ID: <7hwof7d1cn.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_133242_584430_89EE69EB 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Neil,
>
> On Tue, Aug 20, 2019 at 4:43 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Add support for the Amlogic SM1 Based SEI610 board.
>>
>> The SM1 SoC is a derivative of the G12A SoC Family with :
>> - Cortex-A55 core instead of A53
>> - more power domains, including USB & PCIe
>> - a neural network co-processor (NNA)
>> - a CSI input and image processor
>> - some changes in the audio complex, thus not yet enabled
>>
>> The SEI610 board is a derivative of the SEI510 board with :
>> - removed ADC based touch button, replaced with 3x GPIO buttons
>> - physical switch disabling on-board MICs
>> - USB-C port for USB 2.0 OTG
>> - On-board FTDI USB2SERIAL port for Linux console
>>
>> Audio, Display and USB support will be added later when support of the
>> corresponding power domains will be added, for now they are kept disabled.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> I don't have any details about this board but overall this looks sane, so:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> [...]
>> +       /* Used by Tuner, RGB Led & IR Emitter LED array */
>> +       vddao_3v3_t: regultor-vddao_3v3_t {
> that should be regulator-vddao_3v3_t - maybe Kevin can fix this up, if
> not then we can still fix it with a follow-up patch

I fixed it up while applying,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
