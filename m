Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA30C3DA79
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Dec 2022 22:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Ng74j3Uh7WhWzJ2ec1tVTSXfOlTyZyFFkSPXPirpc8=; b=JTYVXEdqjnIV88
	rXqbMoG9LIPuXdGjPhcMmfF14BlzBubpRTc6Jv+BKOP2WAWqvsJ5tFd4psxRTTnLxrlvD0SiNltwN
	29XCE0FmqhiHjGL4JavLiV4+xtjBumb0Bxqye5uAj4Qc5iN4SB0e3IWW++RuzZ3kKtUy0xpjmogIG
	JiYYkEabZLvySn76h/lqdxndemif/1R2Pg3/yp1Yo23jHvatbr9Ks8imV0mM5qPl06Oo7VINDDtL1
	kLmwCprVOVmzdMaRhfMV990ZSPvy9wvLL8z2L6g2GT1Qo5b+dgv9rJKOmEf03s5T1vQUla7kEjKyv
	HoKQzQ+c7ahZawQmAO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9wGa-0081WO-53; Mon, 26 Dec 2022 22:48:20 +0000
Received: from djehouty.pomail.fr ([2001:910:13cf:ffff::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9wGU-0081Rt-LK; Mon, 26 Dec 2022 22:48:18 +0000
Received: from nout.ra.nemunai.re (82-64-151-41.subs.proxad.net [82.64.151.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by djehouty.pomail.fr (Postfix) with ESMTPS id D6DDF3F7DD;
	Mon, 26 Dec 2022 23:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nemunai.re; s=thot;
	t=1672094883; bh=c+3OU9wn+8NKzC1KnsLAGtOBdtgvS/WXl4HPdn/7aQ8=;
	h=Date:From:To:Cc:Subject;
	b=i6NVm9glPTlBr8oix7ceiGgO4wBW4UsDe1n2d2AgiVj5/m3Pa6vvd8jl3cl89AmVP
	 jwupnnc+Jc5GkD6cqvKxcHnbwtsU9L5LiL55+Mg3iW4UxllmqmZuou7+29I6YItOfE
	 t+QW+qKt1qrrtMIywDF4NGig+hErJoQSo1HcEL58Wi/a4/EOuyutFhuknvOQUHookJ
	 Dvf2+wS62ZjAqcTOhtpQPfzhugYTdSIQX7L3Y7m3m631rbnYFPHYew+UA0CoQVoMV0
	 CiMRuPo+M6thiIMw/kr7405ddDxA5JVbZh344QMN0oh7tZ+c91hRBQnteH4BFcPkRl
	 QaU45NLyavqs76BZtuqGfWU6IoZHYX8YUyWGinLcDGH+O89Ob2wb/1QNh9rRjhN85q
	 TQicnCQp8JdrDrrqqWhgnqYLpCWFg4L+Z6q2K2p98VUNS0cpsKYcVjAzLwYER0bvbo
	 H6qfjTo2bxeFp6rs9uHQ//sLKhP+/ntXE/RE0lR2rUMdvqp49gsAfYKOvRHCDc1oVx
	 dcVlkc0pDnW9olLzZ0xwjd2sZkzjUQH5HdRnC8Z7uXSYxhIWVEkCvTZzUE1f10zvnx
	 gmAZoJBDMwJazE22FbZsIGZ37uHgso+sAygUMaknqz/QuqP91M9NpyLo7jaJS3xbS0
	 kMld1/hn0FRTT85Bu+Q1EYgo=
Received: from nemunai.re (oupaout.ra.nemunai.re [IPv6:2a01:e0a:518:830::d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nemunaire)
	by nout.ra.nemunai.re (Postfix) with ESMTPSA id DDA8D20326;
	Mon, 26 Dec 2022 22:48:02 +0000 (-00)
Date: Mon, 26 Dec 2022 23:48:01 +0100
From: Pierre-Olivier Mercier <nemunaire@nemunai.re>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [BISECTED] arm64: dts: meson-sm1-odroid-hc4: USB not working
Message-ID: <Y6okoXpwF/LZewhv@nemunai.re>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_144816_746840_54ABC8DB 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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

Hi,

On my Odroid-HC4, the USB 2.0 port (the only one available) was not
working. While it seems I was not the only one in that case[1], after
some experiments, I found that by reverting the following commit:

703e84d6615a4 arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0

it solves the issue: USB is working on latest stable (6.1.1) with this
only patch reverted, while it doesn't with vanilla dtb (with same
config otherwise).


Here are the logs with the patch untouched:

[    1.422947] dwc3-meson-g12a ffe09000.usb: USB2 ports: 1
[    1.426394] dwc3-meson-g12a ffe09000.usb: USB3 ports: 0
[    1.433413] dwc2 ff400000.usb: supply vusb_d not found, using dummy regulator
[    1.438739] dwc2 ff400000.usb: supply vusb_a not found, using dummy regulator
[    1.445913] dwc2 ff400000.usb: EPs: 7, dedicated fifos, 712 entries in SPRAM
[    1.453859] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[    1.458153] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
[    1.465848] xhci-hcd xhci-hcd.1.auto: hcc params 0x0228fe64 hci version 0x110 quirks 0x0000000000010010
[    1.475062] xhci-hcd xhci-hcd.1.auto: irq 18, io mem 0xff500000
[    1.481028] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[    1.486333] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
[    1.493931] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[    1.500710] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.01
[    1.508616] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.515736] usb usb1: Product: xHCI Host Controller
[    1.520563] usb usb1: Manufacturer: Linux 6.1.1-nemunaire xhci-hcd
[    1.526687] usb usb1: SerialNumber: xhci-hcd.1.auto
[    1.531973] hub 1-0:1.0: USB hub found
[    1.540413] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.547374] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.01
[    1.555417] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.562588] usb usb2: Product: xHCI Host Controller
[    1.567397] usb usb2: Manufacturer: Linux 6.1.1-nemunaire xhci-hcd
[    1.573520] usb usb2: SerialNumber: xhci-hcd.1.auto
[    1.578780] hub 2-0:1.0: USB hub found
[    4.565412] usb usb1-port2: connect-debounce failed


With the patch reverted:

[    1.432476] dwc3-meson-g12a ffe09000.usb: USB2 ports: 2
[    1.435820] dwc3-meson-g12a ffe09000.usb: USB3 ports: 0
[    1.443953] dwc2 ff400000.usb: supply vusb_d not found, using dummy regulator
[    1.448187] dwc2 ff400000.usb: supply vusb_a not found, using dummy regulator
[    1.455361] dwc2 ff400000.usb: EPs: 7, dedicated fifos, 712 entries in SPRAM
[    1.463273] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[    1.467576] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
[    1.475268] xhci-hcd xhci-hcd.1.auto: hcc params 0x0228fe64 hci version 0x110 quirks 0x0000000000010010
[    1.484508] xhci-hcd xhci-hcd.1.auto: irq 18, io mem 0xff500000
[    1.490451] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[    1.495756] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
[    1.503345] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[    1.510032] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.01
[    1.518009] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.525160] usb usb1: Product: xHCI Host Controller
[    1.529987] usb usb1: Manufacturer: Linux 6.1.1-nemunaire xhci-hcd
[    1.536111] usb usb1: SerialNumber: xhci-hcd.1.auto
[    1.541393] hub 1-0:1.0: USB hub found
[    1.549091] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.556810] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.01
[    1.564844] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.571996] usb usb2: Product: xHCI Host Controller
[    1.576821] usb usb2: Manufacturer: Linux 6.1.1-nemunaire xhci-hcd
[    1.582945] usb usb2: SerialNumber: xhci-hcd.1.auto
[    1.588238] hub 2-0:1.0: USB hub found
[    1.806067] usb 1-2: new full-speed USB device number 2 using xhci-hcd
[    1.982226] usb 1-2: New USB device found, idVendor=9e88, idProduct=9e8f, bcdDevice= 5.00
[    1.984769] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[...]


I didn't read the specs, but I also tried to inverse the patch (disable
usb2_phy1 intead of usb2_phy0) and it didn't work neither. Apparently
usb2_phy0 and usb2_phy1 are both required for some reason...

Could you reconsider this dts change?

[1]: https://www.reddit.com/r/ODroid/comments/wcrdeq/usb_port_not_working_on_hc4/ 

-- 
Pierre-Olivier "nemunaire" Mercier

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
