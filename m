Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB3AC64ED6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VA5NJDDBKPMSVs9qyhGsjKM0GsaCTWZxsHNNonrQgfI=; b=dYD13t11tiP6qi
	4GXJQE/rKydTzNftlxSifZivR3WztmY33GGMnDVetKedXgrOeEujcF3I3sBZZppTs9MpS7xieqfX7
	5muhpQ4mEOPevPjCWrSPOylCrVAT/EBmdrH7dVrDIG9oZYL7Ivhs7lAAuZuz9c69+lyN9CToGjaEV
	9bV3ivZ3wf+QZq5cfTMhI1Y3gGDtGtbrIDBIPNiAKo//jlJMPPi8H2iw06kPzR+W2P7u31Ep7SE63
	xSv6BbM48Rf7o3WKAemJWwv2CHg9K9Kbg11sq+l4QImAymYCyfcNOdIssd/foPCtxwRjlU44m/3kW
	Vq00vN0FVijfUCownxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWfww-00AIGD-Nr; Mon, 27 Feb 2023 16:02:02 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWfwt-00AIE9-7y; Mon, 27 Feb 2023 16:02:01 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 6DE665FD23;
	Mon, 27 Feb 2023 19:01:56 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677513716;
	bh=NnkvUE19Ly88YE4py1Bip01LJrtgfHm0WJhoIJfHc6o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=YaX3Q3xBXtWolaD5d4b4ilGtUb4OYoNfYDbpX+kcm46Xl2P7dRTFrM7lWyuEGuKn+
	 c91NsYXX5YcsIzecoDI5FOySRhnUOFNLTD1LroGurymqzkvXRg8mx/vpxe4A52HGvW
	 +Ee1MBwHxM/m5LrDr11nPLdKHflRbSt/Bz85VxjsyXr6Nb6bJwgooa8blZ7IX50Vwo
	 +1vnEJrSD6bb2zkhqdtdliPLRV2mrNJ8bb3j8C65LwIo79wZNCMTZEeq+farWU22cp
	 xLHmr2QnUwOo+OAcHY57b5aXMsHsGaI9EPNecxoZmICjwrYNYvwGBkk7mHMOpTOkE+
	 LYvZ9YfK0gXyw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Feb 2023 19:01:56 +0300 (MSK)
Date: Mon, 27 Feb 2023 19:01:55 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
CC: <arm@kernel.org>, <soc@kernel.org>, Alexey Romanov
	<avromanov@sberdevices.ru>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<linus.walleij@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
Message-ID: <20230227160155.swzhbchrn57yfe6w@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
 <13cf3223-d3fb-1a3e-f13a-77db3b6d144c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13cf3223-d3fb-1a3e-f13a-77db3b6d144c@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/27 12:14:00 #20900843
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_080159_661929_F0805128 
X-CRM114-Status: GOOD (  21.02  )
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

On Mon, Feb 27, 2023 at 03:46:50PM +0100, neil.armstrong@linaro.org wrote:
> On 27/02/2023 15:28, Dmitry Rokosov wrote:
> > Hello Neil!
> > 
> > On Mon, Feb 27, 2023 at 09:15:04AM +0100, neil.armstrong@linaro.org wrote:
> > 
> > [...]
> > 
> > > I'm aware Amlogic also runs their kernel as 32bit to gain a few kbytes
> > > of memory, but those processors are ARMv8 and the arm64 arch code
> > > has been designed for those CPUs.
> > > 
> > > So far I didn't find a single good reason to add 32bit support for
> > > ARMv8 Amlogic based SoCs, if you have a solid reason please share.
> > 
> > I totally agree with you, but I suppose it's fully related to 'big'
> > Amlogic SoC like S905_ or A311_ series. A113L (aka 'a1') is
> > a cost-efficient dual-core SoC which is used for small, cheap solutions
> > with cheap components. Every cent is important during BoM development.
> > That's why usually ODMs install small ROM and RAM capacity, and each
> > megabyte is important for RAM/ROM kernel and rootfs footprints.
> 
> Do you have figures ? is 32bit ARM kernel really lighter when ARM64 one is correctly configured ?

As I mentioned in the previous message, we have reached good results for
userspace profile. For the kernel, we have disabled heavy cost memory
features (like dynamic tracing) at both configurations, and get more or
less the same results for memory footprint (pre-allocated for kernel
sections).
I can provide rootfs figures/results, but I'm afraid it's so workload
dependent and very custom for us.

> 
> > Why am I talking about rootfs? For such small projects a good
> > choice is buildroot rootfs assembling framework. Unfortunatelly,
> > buildroot doesn't support 'compat' mode when kernel and userspace have
> > a different bitness.
> 
> well this is a buildroot problem... the kernel itself is perfectly capable
> of running an AArch32 userspace.

Based on your and Arnd arguments, agree, this is a buildroot problem
with compat mode definition.
Buildroot must have it for such configurations with mainline kernel.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
