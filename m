Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845AEC64ED8
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 16:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wTEzwXTlFnh3CDCjvYVvhBWlFdkn3B0JrCouxI/vA0=; b=vt4Sjf/PG+jQIe
	3Rp6Z4Adgs+E8uJzJMrtsO8GTcz5EzDpGd/FF32osNVLLbL6HjPt89X77POf2mU9tkdaYGUbnywEU
	q6G0GyoOn6tO0+Vgz1+JoScpjYdbHt9IkXdpXQtnlXr+CeP1YpqSToETrPkV/0Cd/tmmqMhHTabcE
	eBbuTqYJJ161rzb3XLg2tImZtzMnJjhpMM101kabVJBH/CFtLr1xPKePE/K9+S4iYVVahKofatZRP
	8/qwO19mFM4r+1upAvhwVYIbZWOQTrLE2b/IKDgTwq8oNB/Jb7stsJbepgxMv/B8oawkgBerzjrNI
	tkbw7D2ILyOozalryzDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWgiH-00APFb-6e; Mon, 27 Feb 2023 16:50:57 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWgiD-00APEv-IA; Mon, 27 Feb 2023 16:50:55 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 411865FD23;
	Mon, 27 Feb 2023 19:50:50 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677516650;
	bh=+o4MePp9OqmjWmI8f3GoSonJgPXKEx/DY7E2POpmxqc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=Is6lD68TXQ+LXSIPeMLcaY1cQuni31x7+SQTRswGrgqyp1Mf2TQmsF19mebjjkdlE
	 SStVzS24WRa1eM3iw3/Zlbs/gA0Av69UL/+Oj/1+v4sNSW9I1IpMOafYnZhS1a5NBB
	 GpBK27em27UMsN/Sv9qNT/guVqMviPD3K3nB4pfcU3sP0T3NjDGgPkkiptdbWsNIa+
	 fTcQiGRGseNijIEhHc6k6IQYbzRdG5aT3ud/9nnGYtbx829b/9JD4Yhqb4TYsm2ktu
	 5mBosKSROlE1B3fb3F/J3g+cL8hvlJYP+wNsIoyXXgDiMhMOSX/tQnIchiIjysI0LW
	 mnnZsZ5PoetSQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Feb 2023 19:50:49 +0300 (MSK)
Date: Mon, 27 Feb 2023 19:50:49 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: Arnd Bergmann <arnd@arndb.de>, Alexey Romanov <avromanov@sberdevices.ru>,
	Rob Herring <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, Linus Walleij
	<linus.walleij@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
Message-ID: <20230227165049.4y7jx5nnnlibe6kg@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
 <f3e42012-609c-4085-b4f4-bd32bfc34aff@app.fastmail.com>
 <20230227155100.hhl4yvkyfqfyoa6h@CAB-WSD-L081021>
 <a5fa8b23-4ec8-475f-be5e-538b53d6f82d@app.fastmail.com>
 <33b58877-5167-c453-e686-1d10cdca66c0@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33b58877-5167-c453-e686-1d10cdca66c0@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/27 12:14:00 #20900843
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_085054_028833_A487C5A6 
X-CRM114-Status: GOOD (  27.02  )
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

On Mon, Feb 27, 2023 at 05:38:49PM +0100, Neil Armstrong wrote:
> On 27/02/2023 17:15, Arnd Bergmann wrote:
> > On Mon, Feb 27, 2023, at 16:51, Dmitry Rokosov wrote:
> > > On Mon, Feb 27, 2023 at 03:58:50PM +0100, Arnd Bergmann wrote:
> > > > 
> > > > I would argue that is a problem with buildroot, and using a 32-bit
> > > > kernel is not something we should encourage over fixing buildroot
> > > > to do it right, or building the kernel separately from the rootfs.
> > > > 
> > > > We do allow building support for a couple of ARMv8 SoCs in 32-bit
> > > > mode, but that is usually because they ship with a 32-bit bootrom
> > > > and cannot actually run a 64-bit kernel.
> > > 
> > > To be honest, I didn't know about this principle. It looks like a very
> > > rational approach "start from max supported bitness".
> > > Based on overall maintainers opinion, we have to prepare a patch for
> > > buildroot to support compat mode :)
> > 
> > That would be great, thanks a lot!
> > 
> > For what it's worth, the main arguments in favor of running a 64-bit
> > kernel with compat user space over a 32-bit kernel are support for:
> > 
> > - larger RAM sizes without highmem (most 32-bit kernels only
> >    support 768MB of lowmem, and highmem sucks)
> > - larger virtual address space (4GB vs 3GB or less)
> > - CPU specific errata workarounds (arch/arm/ only has those for 32-bit cpus)
> > - mitigations for common attacks such as spectre
> > - security hardening that depends on larger address space
> >    (KASLR, BTI, ptrauth, PAN, ...)
> > - emulating instructions that were removed in Armv8 (setend, swp, ...)
> > 
> > Most of these don't apply in userspace, so the incentive to
> > run smaller 32-bit userland on systems with less than 1GB of
> > RAM usually outweighs the benefits of 64-bit userspace.
> 
> Thanks for the details!

Looks like Thomas has already prepared a basic patch series for buildroot,
but maintainers declined it.

https://lore.kernel.org/all/20220730194331.GA2515056@scaer/

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
