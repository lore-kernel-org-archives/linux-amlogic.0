Return-Path: <SRS0=y5YC=UX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CBDC43613
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 08:46:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF991208E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 08:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WBikuPOH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjDY/QKB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF991208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDrXOx2yafVTr7le0NVn7P5TIZFXnffmqwOuBjlFgFE=; b=WBikuPOHiHMW/4
	4jF4KI/18trwpXckfzGU3WeQrUttes1flhLHKFJEWoGncqxhAMQhho/VLA2FI3T81HSwGfBVOG86n
	+rjl3RTm9nAcUZYdGtKHAkYgYTUU2sXUjrwY+OvB41/c+qzrWngg9S1ZMrtg0Ox3d7xipeS0kpArJ
	WnH79nRQYsAOrKkzT9yRK0IZcVAvccKxei+lNTTAzrzJ+y11lmFvwRzKxBHk51CziUFVdFmRVI+s8
	E4JdYMpjwJhV5YjVfNV2KkB4w9KPLNiRLMJhCEwxWFvgZ6nHh8D5F7yJ8MvEhTWCwiEe08mRO3YD2
	MxK2skNObOlFiH+ijjwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfKcE-0005oe-1f; Mon, 24 Jun 2019 08:46:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfKcB-0005o2-Gy; Mon, 24 Jun 2019 08:46:16 +0000
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80CFD208E4;
 Mon, 24 Jun 2019 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561365972;
 bh=6TATCU0GhRHaB0rZ9tfc9t4qrBINVwEG0u5ftLPSTlw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PjDY/QKBI+ZmiRu4XX5GjZ+Dxb7JafvXOpjtp0XIFHK7kAYe+4vTjTP7fLhq+Gwar
 cIO7Hp1AlzQAq3jUaVimcx+xWM8engZwm4nI9CecRPKmim6kOUBmPtoa0X4p4C0ECn
 R70MfPPaNNLE4g+ultolziA9ZCDL02joNNjc7APo=
Received: by mail-wr1-f41.google.com with SMTP id k11so12964992wrl.1;
 Mon, 24 Jun 2019 01:46:12 -0700 (PDT)
X-Gm-Message-State: APjAAAWgMQsv/9NzyDsIJBtramg9CSIh3yALyO+4KM2hr1GM8JNGhz2W
 sQ+/VfvL54ihK9g9zFso4OC5br5n33cfG0mtgJM=
X-Google-Smtp-Source: APXvYqyoWqaBwTU9Yx0egHzCZIsc7sDUKXLjaMVV3B3oAgm/AEkZz3CA10MVePBc4MRlkeaIIL1ilUaJ2ZFhMBX4/fM=
X-Received: by 2002:adf:fc85:: with SMTP id g5mr21861481wrr.324.1561365971112; 
 Mon, 24 Jun 2019 01:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <0292EC91-0CBE-4F22-8F28-BD581A157CD6@dlaube.de>
 <2543a892-d7b6-f528-4df3-923edbf1dd85@free.fr>
In-Reply-To: <2543a892-d7b6-f528-4df3-923edbf1dd85@free.fr>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 24 Jun 2019 16:46:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v67qE0AV9SaJA3ALXHwoPsj=mSGNsnQ-xTib+iB8K=U-eA@mail.gmail.com>
Message-ID: <CAGb2v67qE0AV9SaJA3ALXHwoPsj=mSGNsnQ-xTib+iB8K=U-eA@mail.gmail.com>
Subject: Re: Help offering for AmLogic S905Y2 Mainline Effort
To: Daniel Laube <mail@dlaube.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_014615_593299_3F004139 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jun 24, 2019 at 4:36 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 23/06/2019 22:42, Daniel Laube wrote:
>
> > recently bought a cheap HDMI Stick Computer with an AmLogic Chip (S905Y2 on x96s Board)
> > because i was told that it had mainline linux support. That seems to be
> > true only partly because there are drm drivers missing for the gpu and
> > no video encoding/decoding support.
> > Because i would like to get these things working in the future i would
> > like to offer my help.
> > I already ripped that thing open to get access to UART to see boot progress.
> > Could someone please guide me where i can help with the mainlining effort?
>
> I suppose the first thing to do is try to get in touch with whomever
> might be working on this at the moment or in the (recent) past.
>
> Look at the MAINTAINERS file, to find "official" maintainers and reviewers.
>
> The baylibre team seems to be handling some of the mainlining effort,
> so perhaps they are in a good position to provide relevant information.
>
> There's also a specific mailing list: linux-amlogic@lists.infradead.org

The #linux-amlogic IRC channel on freenode is a good place to start as any.
AFAICT, most of the active community contributors hang out there.

ChenYu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
