Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF0AC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GT9GNV9FDgavU7T2xIBptAjrkbRiljBA3xctV6vPwg=; b=zYMjPqnL6blL1v
	siLWQSGJUdo9cUBVgLBqxu7QbaV/tcjgtEck7f2+E0e1m1jTMFLyrUPr9Yx7NfdeODUcwoFZFjMqq
	oW4Vam9s54fNOyi6JHCUnZAlREprGTmSpzmljl04FiYK4G1J+M5sQSLWe6hb3iSo13J8rEP/h+S92
	Mwg4lVvB+Sh7jNLSf94YZZppgKRtCtDWWiIvjvXqjelGQHQmyB/x/JA85iRjGoVIjePYQVlHBe0h9
	xjf/i2JTBlzSzvSYj8CVCmTWC7SN9kkXp8YnY7fDW20cH3hXoPh3hco+Iwgby2cICsKmYt6f9IxYP
	HfkXGI136Yr8kFU2+dYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6xND-00CKbg-Q2; Mon, 10 Jan 2022 16:18:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6xNA-00CKZy-Jg; Mon, 10 Jan 2022 16:18:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93719612E8;
 Mon, 10 Jan 2022 16:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB96C36AED;
 Mon, 10 Jan 2022 16:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641831495;
 bh=rS4V/WO3etbLxGRygeuWlcXQr4ydR1z6tfJWlu1EtTE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d2mnaon2KYPN/QbKt30EQ243zPBjMmAIJ8VcqXYrjJ6ReupubGADw+v86TvDBoDCU
 InpXP3k2Vj0uBubhUDqClgoiBbDd2SOcmUFC2Uy+xoMI48PpqcqIVAxv8JCIEBPpzf
 AINBzxbMd3Y0jj8IaOsP5aQHkVMOazB5H63MjE5Zv+gbmIovnfvd7flys5uGVZoWkc
 C7bNiXOFUMlIG6ZXHauoU4yiGlB6vPv8vAebmpwTB9dYmajQOXTma5eG4hHC4hOsNe
 QMHM8vqJfjV3qMiRUTRqT0A/XElQr+9BS+XumDIWdilDv7aA5t+xOTezWvRxsFbNAO
 syjdwTdIbx4Xw==
Received: by mail-ed1-f43.google.com with SMTP id k15so55479647edk.13;
 Mon, 10 Jan 2022 08:18:14 -0800 (PST)
X-Gm-Message-State: AOAM533P3A7Ds7uP/WxDSN5FJ1mOt5sBpFprygJrn2dojBvQddTju3fn
 gOYI9WXWPHX2Lk9XIOaElw5Eo754mjVII97LjA==
X-Google-Smtp-Source: ABdhPJxzI/V2iQ9Y/D5SfWoyQ05XpKPBwP6qYhOYyRpWpiYpvr4ivTJ/0gQCDjzplq09Hl8rg61Ix1TRefJ0/NcCXNM=
X-Received: by 2002:aa7:ce88:: with SMTP id y8mr357803edv.303.1641831493386;
 Mon, 10 Jan 2022 08:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20220110104214.25321-1-yu.tu@amlogic.com>
 <20220110104214.25321-2-yu.tu@amlogic.com>
In-Reply-To: <20220110104214.25321-2-yu.tu@amlogic.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jan 2022 10:18:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKFLnfc5eaUHeo6EkbS0kkpA94rh=Zuda9V9aCragdVxw@mail.gmail.com>
Message-ID: <CAL_JsqKFLnfc5eaUHeo6EkbS0kkpA94rh=Zuda9V9aCragdVxw@mail.gmail.com>
Subject: Re: [PATCH V5 1/5] dt-bindings: serial: meson: Drop legacy compatible.
To: Yu Tu <yu.tu@amlogic.com>
Cc: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_081816_723560_74202F3D 
X-CRM114-Status: GOOD (  12.70  )
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

On Mon, Jan 10, 2022 at 4:42 AM Yu Tu <yu.tu@amlogic.com> wrote:
>
> Deprecated, don't use anymore because legacy amlogic,meson-gx-uart
> compatible. Don't differentiate between GXBB, GXL and G12A which
> have different revisions of the UART IP. So it's split into
> GXBB,GXL and G12A.

You are breaking compatibility. If your dts is updated to use the new
compatible, then a kernel without the change will not work anymore. It
worked before without understanding the changes you are making. It
should continue to. A compatible value like this would accomplish what
you want:

"amlogic,meson-gxbb-uart", "amlogic,meson-gx-uart", "amlogic,meson-ao-uart"

A new kernel will match on "amlogic,meson-gxbb-uart" or
"amlogic,meson-gx-uart" depending if the dtb is updated or not. An old
kernel will continue to match on "amlogic,meson-gx-uart".

If you are going to go breaking things, the power domain distinction
in the compatible is odd...


Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
