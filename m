Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5FEC64EC4
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22KcW87YgsMG8T9kfqO/fdvKbc+zOb36Sczj0BueEI8=; b=pR3+0C6x5NdgTm
	QGfnsX8bz+ME9izO/VU5E8si5+w5xOCoygGUAzzX1y+oeC0WlnXMGcT6RdTMTIe+b91oUuntqNNRy
	sPqhpPP6rUN6icJIB7jSYsD1ONU+T8SYBxCA+z8+VJOULZt854DKBMIL+Yn7Sux81OyK2ekxF9YHa
	uo+xlVZQgo1QyS2XoAfRWcuJXA45Ttefq1d2qdFatmbyxgsvtuDCShVMbZePFZyrL0jdj3ciBb5qs
	HrKPwsOcgDU0ecVXYJqjffMAeWxtIeBuzv6nKVCVj4m7EmTvepK4QxmNpJTKYShoRq4woH4k69/P0
	aMMtyNVGlT3IfnxQ4xCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paeYL-00Eyh4-Cn; Fri, 10 Mar 2023 15:21:05 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paeYG-00Eyei-N0; Fri, 10 Mar 2023 15:21:03 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 4ED515FD0F;
	Fri, 10 Mar 2023 18:20:53 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678461653;
	bh=X09i05T2/kREhahqRt82WIF4sPikD7edgXSMZW3ujkg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=ly6ySuexcYRvYaYs5/b/UXEjD6pRxvtWloqYINgYHG+3LnbgLnmY6qVp79LE03lre
	 VYy7lPYitk8ieGvcYo2l1+RlKUZfWIfIprrq76Cr+CTfs9oqddr6IQ4V1SOpgipxcz
	 xcwn93APf436xQ+0JScsrdkVEumpuOruFudx+rUPbRi5DOwL/Dni3Zo1OEO0+7z+Fs
	 9d3vhQhiL+rYlFr5D+5qBfmRRK8Y19Ik4n22u4gfJspXe3ZTsC3lK/eMGbEVoasPZU
	 2q7y5sDpOk0jN6bKNru1IyRra6/Q28cSBUU9HU7GF8OO4vgXpnjk5O7bNEOIL7CAMG
	 77bby9kDm00Qg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 10 Mar 2023 18:20:52 +0300 (MSK)
Date: Fri, 10 Mar 2023 18:20:51 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Kevin Hilman <khilman@baylibre.com>
CC: Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>,
	Alexey Romanov <avromanov@sberdevices.ru>, Rob Herring <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, Linus Walleij
	<linus.walleij@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
Message-ID: <20230310152051.ilz4qsgp3rplt4ad@CAB-WSD-L081021>
References: <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
 <f3e42012-609c-4085-b4f4-bd32bfc34aff@app.fastmail.com>
 <20230227155100.hhl4yvkyfqfyoa6h@CAB-WSD-L081021>
 <a5fa8b23-4ec8-475f-be5e-538b53d6f82d@app.fastmail.com>
 <33b58877-5167-c453-e686-1d10cdca66c0@linaro.org>
 <20230227165049.4y7jx5nnnlibe6kg@CAB-WSD-L081021>
 <7d29f3fd-b8c8-4687-b6a0-b8956dd39f0b@app.fastmail.com>
 <20230228084952.mgx3d3nw65yo5ebu@CAB-WSD-L081021>
 <7hedpxwq1i.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hedpxwq1i.fsf@baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/10 13:19:00 #20932143
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_072101_470167_5E504EFB 
X-CRM114-Status: GOOD (  30.73  )
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

Hello Kevin,

On Thu, Mar 09, 2023 at 01:52:41PM -0800, Kevin Hilman wrote:
> Dmitry Rokosov <ddrokosov@sberdevices.ru> writes:
> 
> > On Mon, Feb 27, 2023 at 07:19:38PM +0100, Arnd Bergmann wrote:
> >> On Mon, Feb 27, 2023, at 17:50, Dmitry Rokosov wrote:
> >> > On Mon, Feb 27, 2023 at 05:38:49PM +0100, Neil Armstrong wrote:
> >> >> On 27/02/2023 17:15, Arnd Bergmann wrote:
> >> >> > On Mon, Feb 27, 2023, at 16:51, Dmitry Rokosov wrote:
> >> >> > 
> >> >> > Most of these don't apply in userspace, so the incentive to
> >> >> > run smaller 32-bit userland on systems with less than 1GB of
> >> >> > RAM usually outweighs the benefits of 64-bit userspace.
> >> >> 
> >> >> Thanks for the details!
> >> >
> >> > Looks like Thomas has already prepared a basic patch series for buildroot,
> >> > but maintainers declined it.
> >> >
> >> > https://lore.kernel.org/all/20220730194331.GA2515056@scaer/
> >> 
> >> I see. I know very little about buildroot, but it sounds like
> >> there are other ways of doing the same thing here. In general,
> >> this is pretty much an Arm specific problem. While you clearly
> >> want compat mode for small userland on any architecture but don't
> >> want 32-bit kernels, arm is the only one that has a different
> >> kernel "ARCH=" value and needs a separate gcc toolchain.
> >> 
> >> If the problem is only the toolchain, an easy way out may
> >> be to use clang instead of gcc as your compiler, as a single
> >> clang binary can target both 32-bit userland and 64-bit kernel
> >> on all supported architectures.
> >
> > Agreed with you. We will try different local approaches to support
> > compat build configurations. For now, prebuilt toolchain (buildroot make
> > sdk goal) is best way from my point of view. Anyway, we will try to
> > solve this problem in the our sandbox and stay on the 64-bit kernel.
> > Thank you for all the helpful details you shared, appreciate it!
> 
> Just to clarify one thing...
> 
> More specifically, this is a buildroot *build system* problem.  If you
> build the kernel separately from the rootfs, it works fine. 
> 
> I use 32-bit buildroot (and debian) rootfs images all the time on
> Amlogic SoCs with 64-bit kernels and it works fine.  

You are totally right. It's one of the possible ways. But in the our
internal project we build kernel + roofs + uboot together in the one
buildroot project ('repo' based). So we will try to stay in the such
paradigm, but will use multi-arch toolchain, maybe.
Anyway, thanks a lot for sharing your experience.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
