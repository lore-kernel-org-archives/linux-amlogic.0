Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C018C64ED6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dW6miCk6VdxWuJ1adc8LLejeWzbKKMvhn9w4MVkvshw=; b=xNxmUFwg6Qv/Vc
	r114PcHJ1cDywx8Et5DcStfNlkpGIvf0xKOj0LAVHbgrcdWMVPzFDRP4FrRcMzXRyWvuFi+53/V7c
	NcCVCFKom/yaDtOA3IgkOztCtKxRH3iulpguI76KEH26+LhCYzVPh4D5NleaQyDeBUT2F3CttWBxH
	B8UbUvRwhUGzROTE4f8xmHEKN93/itY7U6Kh2J0akLul/rf8aCWqv31VRkfMs295/FZHOAfg068Nr
	uTbTSfGubrErfxZtqdvGTX/RxWtaUA6QIpSRLC+c280T7nrs9e3UseUlg6kiMp2xa7SpM7hEwK5Zq
	eogMJ6KYFnoOzS/ASD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWeUQ-009y2l-RC; Mon, 27 Feb 2023 14:28:30 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWeUL-009xzV-T0; Mon, 27 Feb 2023 14:28:28 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 083DA5FD18;
	Mon, 27 Feb 2023 17:28:11 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677508091;
	bh=dHA/Wc3Fmu2Ic2yiLPy7ks11PfgCivPYbG1QvntY4RI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=Zel0j/24EN18NurGpIm8rfbVXkCFfOOYSv6j+TFBnkDIF93AbsupE4YvZNiqr2ls9
	 HLIME5RCEC+i59clo7uAiR7k/8V2yphl54m96LCEI8I9CK085pJ997peXOfXCIAUEN
	 lqFz+VxIO9FygFdBB0Ud++tuxrrWwp5edkjMPux51JEC96LTAcyKUzIg2U3MHszt3C
	 7FtthXWvaU475A8AMJ1LW/TjeBR4YuZrK4KYNRZ5+YfEgBLzCRKZq/bdJdAncbYrdw
	 R3pv7BnyiFrsIXUdE/6ftXHANj5YTUpD3o6h5jsgSh7qe0JTD9MoPad4M/BEckMh+y
	 38xFN9hEqd9MQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Feb 2023 17:28:10 +0300 (MSK)
Date: Mon, 27 Feb 2023 17:28:09 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
CC: Alexey Romanov <avromanov@sberdevices.ru>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<linus.walleij@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
Message-ID: <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
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
X-CRM114-CacheID: sfid-20230227_062826_148661_32C441F8 
X-CRM114-Status: GOOD (  13.64  )
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

Hello Neil!

On Mon, Feb 27, 2023 at 09:15:04AM +0100, neil.armstrong@linaro.org wrote:

[...]

> I'm aware Amlogic also runs their kernel as 32bit to gain a few kbytes
> of memory, but those processors are ARMv8 and the arm64 arch code
> has been designed for those CPUs.
> 
> So far I didn't find a single good reason to add 32bit support for
> ARMv8 Amlogic based SoCs, if you have a solid reason please share.

I totally agree with you, but I suppose it's fully related to 'big'
Amlogic SoC like S905_ or A311_ series. A113L (aka 'a1') is
a cost-efficient dual-core SoC which is used for small, cheap solutions
with cheap components. Every cent is important during BoM development.
That's why usually ODMs install small ROM and RAM capacity, and each
megabyte is important for RAM/ROM kernel and rootfs footprints.
Why am I talking about rootfs? For such small projects a good
choice is buildroot rootfs assembling framework. Unfortunatelly,
buildroot doesn't support 'compat' mode when kernel and userspace have
a different bitness. In the internal project, we save several
percents of ROM/RAM free space using 32-bit configuration (mostly rootfs
ROM space, to be honest). Therefore, for such 'little' cost-efficient
SoCs we can make an exception and support 32-bit configuration, from my
point of view.

What do you think about that?

> 
> And as Krzysztof stated, the support is incomplete and cannot work
> without a dts file.

Agreed, we shouldn't merge dead code. But there are several question to
discuss there. Please check my reply to Krzysztof message.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
