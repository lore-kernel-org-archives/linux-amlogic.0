Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB5BC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYKh6rzVJ8SeyYycXFhCBvoxMQkI8G9z+NO8tK41PTc=; b=2XaSqIu1XI7RnJ
	7R7VugKuFUr3N+c04Hc1AI7gvbPnZ8mprF+PmHsF+xuL5uZFMZeMSGBIiVGDI9ovq02Mu5H3dZu0b
	uP1BijBmbzgqjP0yvUF+G3rSz40IOTfGMDIxHb3SF4XPz18rpMclGDHNZS/ENqOQ0P/4rjjEEO7KR
	uzK2pHkYDV3ixPv67yEBF3xOOHT37z9gRPmDs4w1IhJbTTLP8cBmRkB99Ji/sa1lBkucF6vwCBB8a
	DikNiw1tnG6TP4SlR+GqpP3cgkxyANnr1eZUHPB3ng+wx2HWgJMaE+qY/u11ua1oLnWOU+3zC4FXb
	HyWLFDNDLHDIwPydgH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4QDS-009Sis-0k; Mon, 03 Jan 2022 16:29:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4QDP-009SiT-9z; Mon, 03 Jan 2022 16:29:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFC0D61166;
 Mon,  3 Jan 2022 16:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82760C36AED;
 Mon,  3 Jan 2022 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641227382;
 bh=hKFBNm7uS+9zcfXfym6OnPULO39oZtoPlGFqz3VIPCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iYz7E2uTbYMQ0JFww+jaXgwMn6+5V2r63geMzJN4ah8A6iWNWnGf8ngDNv5XDfqlQ
 850xpKD4kNLHJtqDtLLmFgSMe+33UwO4x8JOdWoP2s/Yj7nAu7B5oanCs4Ux1/nePR
 qSvnhyCosdyYZn+FM0g6hGRVZdQ0SwFVCXIkV/QI=
Date: Mon, 3 Jan 2022 17:29:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Vyacheslav <adeep@lexina.in>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Yu Tu <yu.tu@amlogic.com>
Subject: Re: [PATCH V3 1/6] tty: serial: meson: Drop the legacy compatible
 strings and clock code
Message-ID: <YdMkc2YQcYjgR7Qk@kroah.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-2-yu.tu@amlogic.com>
 <CAFBinCCwjS36ss_4sU+o9m8gEprFsVZbqcxgpQxczTNohZqFdA@mail.gmail.com>
 <a296e666-368b-4cd5-427e-30fc66a15b49@amlogic.com>
 <CAFBinCA2V=sx95Q=+4nLDXFK1Os11XVWtK8KauxixVwYXLUz1Q@mail.gmail.com>
 <3865f01c-83f7-a69d-6835-c26f662629b7@baylibre.com>
 <YdMUEzStFf99EeQ5@kroah.com>
 <df9e472e-ac17-26ed-d820-e80d5b7b0e80@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df9e472e-ac17-26ed-d820-e80d5b7b0e80@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_082943_454157_7A7B52A2 
X-CRM114-Status: GOOD (  35.73  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Mon, Jan 03, 2022 at 04:29:56PM +0100, Neil Armstrong wrote:
> Hi Greg,
> On 03/01/2022 16:19, Greg Kroah-Hartman wrote:
> > A: http://en.wikipedia.org/wiki/Top_post
> > Q: Were do I find info about this thing called top-posting?
> > A: Because it messes up the order in which people normally read text.
> > Q: Why is top-posting such a bad thing?
> > A: Top-posting.
> > Q: What is the most annoying thing in e-mail?
> > 
> > A: No.
> > Q: Should I include quotations after my reply?
> > 
> > http://daringfireball.net/2007/07/on_to>
> > On Mon, Jan 03, 2022 at 03:59:33PM +0100, Neil Armstrong wrote:
> >> Hi Greg,
> >>
> >> Martin just saw this patch was applied, but the serie wasn't reviewed enough and it will break
> >> earlycon support on the ARMv7 Amlogic SoCs fore 5.17.
> > 
> > Ok, what should I revert?
> 
> None, we have a fix in the pipe
> 
> > 
> >> Anyway, I'll push the corresponding DT fixes for 5.17-rc1.
> > 
> > How did we get out of sync here?
> 
> The serie wasn't fully reviewed, and I was out of office when it was applied.
> 
> > 
> >> Would it be possible we also receive the notification when those patches are applied ?
> >> Maybe a MAINTAINERS entry is missing so we can receive them ?
> > 
> > That would be good, so that people can review the patches.  Otherwise I
> > have to just guess :)
> 
> exact, I naively thought it would be matched in the:
> N:      meson
> entry but it seems an proper entry for drivers/tty/serial/meson_uart.c is needed.

Try it, does that work when running get_maintainer.pl on this patch?

> >> It would help me track those TTY and USB patches more easily.
> > 
> > I recommend MAINTAINERS entries for drivers that are not listed and that
> > you care about seeing the changes for.
> 
> This is why we have a regex to match these.

Great, the submitter should have used that.

> I can submit a patch to have a proper entry if the regex is not enough/appropriate.

Whatever makes the tools work is fine with me.

> BTW can you point us how are selected the recipients of the notification messages you send ?

For when I apply a patch, everyone on the ack/signed-off-by/reviewed-by
list gets a response.  I do not hit mailing lists with the notification
as that's just too much noise.

Been doing it this way for well over a decade now, nothing new here :)

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
