Return-Path: <SRS0=y4a2=EP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177E0C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2020 08:41:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D5BD20702
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2020 08:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vThb55Ka";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mdragon-org.20150623.gappssmtp.com header.i=@mdragon-org.20150623.gappssmtp.com header.b="HvBdtT/E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D5BD20702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mdragon.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+mNllp6K7zSxVh0IjCm2OAQ2K1VR6/Ukq8G1eDXihGU=; b=vThb55KaRgGLzgpfgTzI0kytj4
	hY1646I04ux77/PxLmdq+QmdJQRontcM5q7/DiLYgNEIvIdqcF4KJgW7rVG94E27yE2g/8wDxrBDI
	4bcn7XTE9HsF3vXKh891otW80HwRNcYceSdNelJUV77wq6P24QDOrTyWoWhquDo+Q0V5B8YTVghpf
	P5fFzt8cIXtzwSH1/72lc89DBGonyC97rmS2XgzZGC3mmLzoPNWXThF6dK7Y/nirzM9ZuzDYXBLTI
	dWzwVQQHSuCj7GNeUBr9cYfpIS3rMyvQfgL6z6iEuCRzVubzWuyq2hX1EifNHlC2OkDQCBVbon4Wp
	9eMe0mzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc2jM-0006zL-Hu; Mon, 09 Nov 2020 08:40:52 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc2jJ-0006yr-PE
 for linux-amlogic@lists.infradead.org; Mon, 09 Nov 2020 08:40:50 +0000
Received: by mail-ed1-x529.google.com with SMTP id p93so7793694edd.7
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2020 00:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mdragon-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=xQG4INGUTMNzG1IU20MPFjgfb/QQScTLe/I9RJcJATw=;
 b=HvBdtT/EBoDTw4yYIvYZPqAIQu6V6MviKbiK1udjSha/PlitXsor7x/rAC6BhERHTc
 zOBJT3LCcGxjuGFoPtZDwlwuLhG48e1vZzT+oTVmDPusJe7FuFFqYL5C48sZhaT42u97
 0HeUB6RKA2xlSZzBQd9hvnKKc51GiyrfFnmrKawYNIceB+9/0i/mgeLi4cwcO6F4HtHn
 EfWdItRWp7fSY9jekkd1D5wanw7cckcgq7HI+oU9AszcvUkoty3hyJfr9EqoIGRgos1c
 kNwzKzmGDZfp3FY5ltKpVFFvXlNY+5sEdlbUzDibIjgf28s3bqJBsG3vMrigqrY+aXB5
 5ioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xQG4INGUTMNzG1IU20MPFjgfb/QQScTLe/I9RJcJATw=;
 b=G3Ob78Ipq9EL2Z3gsPsosMWrpjFnYCVANOCeqyeua/hR15xXKyEXpk0JhW5NlBQL1u
 fEQsUBUb04HtxuA0fPhr9hLg7OZRYlfIhUp9hSzlRS6r9LCuc5l7IL8LhfTrTz/M7Yx7
 ogT3xkQZKhiMVFB1cnuSP37KvB27/15aVoPLQdo+T8EOp8dztCBu7ivpu1HhrcTPzuzq
 xsxxLYnCVmibs9RAjnQ8yEDARuwRyz/S1pgyjZoOUg1uDafSxwJERf62My95/d3BSzG0
 ftlVZNAgcRDqST4kYXGxcitJYhfgJD3VxzY868/Ae2XuqvxF6wtdpJmZocws8zRSR3Fw
 xEjA==
X-Gm-Message-State: AOAM531kFfhOLxLiXxN+ufXGIfShYlJCNSzdVPc9VIis/D3mqrl6BfMN
 dF41qIMh6CwrkfrdHQGi973soQLag48fcy56XJbMVahKGqF6ZQ==
X-Google-Smtp-Source: ABdhPJyW2+cT3LrFtAcUUNrzaLDUUjjEYsdtruovAjV/xZAEm/Y5j67XLgfsglkFxheEGpFmvMn2vpTYFoit/cqchkk=
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr13803728edv.302.1604911247661; 
 Mon, 09 Nov 2020 00:40:47 -0800 (PST)
MIME-Version: 1.0
From: Michal Lazo <michal.lazo@mdragon.org>
Date: Mon, 9 Nov 2020 09:40:38 +0100
Message-ID: <CAFW1BFwi9nXW3ZZjK2pH2JUPh9Xj0PdM61+4sOY-YjA=i-AwEQ@mail.gmail.com>
Subject: How to fix pcie ranges for nvidia GFX card
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_034049_864957_64AB7925 
X-CRM114-Status: UNSURE (   5.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello
I have khadas vim3 with nvidia PCIe card
Anybody has an idea how to fix pcie ranges so we can have nvidia gpu working?
This is what I get in dmesg

[    1.548188] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 63.008
Gb/s with 8.0 GT/s PCIe x8 link)
[    1.562742] pci 0000:01:00.0: vgaarb: VGA device added:
decodes=io+mem,owns=none,locks=none
[    1.571028] pci 0000:01:00.1: [10de:0e0f] type 00 class 0x040300
[    1.576944] pci 0000:01:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
[    1.583263] pci 0000:01:00.1: Max Payload Size set to 256 (was 128, max 256)
[    1.622407] pci 0000:00:00.0: BAR 9: no space for [mem size 0x0c000000 pref]
[    1.623803] pci 0000:00:00.0: BAR 9: failed to assign [mem size
0x0c000000 pref]
[    1.631136] pci 0000:00:00.0: BAR 8: assigned [mem 0xfc800000-0xfdffffff]
[    1.637861] pci 0000:00:00.0: BAR 6: assigned [mem
0xfc700000-0xfc70ffff pref]
[    1.645033] pci 0000:00:00.0: BAR 7: assigned [io  0x1000-0x1fff]
[    1.651070] pci 0000:01:00.0: BAR 1: no space for [mem size
0x08000000 64bit pref]
[    1.658576] pci 0000:01:00.0: BAR 1: failed to assign [mem size
0x08000000 64bit pref]
[    1.666410] pci 0000:01:00.0: BAR 3: no space for [mem size
0x02000000 64bit pref]
[    1.673913] pci 0000:01:00.0: BAR 3: failed to assign [mem size
0x02000000 64bit pref]
[    1.681763] pci 0000:01:00.0: BAR 0: assigned [mem 0xfd000000-0xfdffffff]
[    1.688500] pci 0000:01:00.0: BAR 6: assigned [mem
0xfc800000-0xfc87ffff pref]
[    1.695648] pci 0000:01:00.1: BAR 0: assigned [mem 0xfc880000-0xfc883fff]
[    1.702385] pci 0000:01:00.0: BAR 5: assigned [io  0x1000-0x107f]
[    1.708426] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    1.713592] pci 0000:00:00.0:   bridge window [io  0x1000-0x1fff]
[    1.719626] pci 0000:00:00.0:   bridge window [mem 0xfc800000-0xfdffffff]


And this is what we use right now to setup ranges
https://github.com/chewitt/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi#L137


Any idea how to properly set up ranges ?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
