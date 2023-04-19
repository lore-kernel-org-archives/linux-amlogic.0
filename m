Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B91C77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+jMOTP7/1zFmXP3Lhh6JFX5GRiOWANhSztzLaqXQ/w=; b=jrQBQ2WPBI9qjn
	JslaPQpkQ/iQB+8GdFtSzLCkPw0vV9gu9hJt/kjMB4HN3CRr/CLzd91Ad507fx5u2+HNGqjLO8P7I
	dgssPgVvkHPoiEd0Dr8Ik5btwOW4tKHRs2UC7WCf4GO0GUzDdxUwvZDEmr+DYoPnhIhD+OUjn1L/A
	CjA4BWLn0OyXXPX6x8O4VbDuP52SfiSgkvENCsVL8AC1C3kHHgxeCQfw5f6KK/eE4Q8Pl1UnoGzWI
	0RUf9QPGSU/PAZ7YMbqXlOQyaGkeaUPhiKHHvItLpfPlkBk2Edh2wqnHUg8F7mifG3xY1oyOVyz3a
	Af/IZJpaYdU6leVLQyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp7ZU-005Tu7-1Y;
	Wed, 19 Apr 2023 13:10:04 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp7ZR-005TsO-2A;
	Wed, 19 Apr 2023 13:10:03 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 291395FD04;
	Wed, 19 Apr 2023 16:09:55 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681909795;
	bh=IItLTqDxjvCGXdjeoJBZnXotcgeQ3UjMBOLSC4wQqX8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=GohN/u7AQ9sxe95m+jrE0LJMpS/4E9mXc6FMMgMBqZQJVskpo+carnzbQ65hrRwNO
	 4xAIWpANJpbqEs7ppJTJkmSlFvBEJgFig2AQscL+pFxEdo1WS/2MqaNaidNWt4oiuT
	 jKQa8Lhcs7BFdsNL6SGIks5ETEkEnml3JrZtJGxdUV2S9JtfdrGdA6yZIDgf6q2LAU
	 V552y3ifwIil99+TFR30fz/g6SE/tQvjUI7EknyO3Yj6ngPrrQWDu5Np5NfQIJAYyr
	 J47afxniSviUmr/Sb31VUjmbmmYwvb7T3EkPhYH79+ylOfhi0BtPFKrdXbchyGHVJ/
	 3Hp5bRvwMPfqA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 19 Apr 2023 16:09:50 +0300 (MSK)
Date: Wed, 19 Apr 2023 16:09:50 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: =Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [RFC PATCH 0/2] Baisc devicetree support for Amlogic C3
Message-ID: <20230419130950.p7u4sqpi4ed65hie@CAB-WSD-L081021>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/19 10:42:00 #21127526
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_061002_250319_DAB28FF8 
X-CRM114-Status: GOOD (  16.03  )
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

Please replace "Baisc" with "Basic" in the subject, it's a mistyping.

On Wed, Apr 19, 2023 at 03:38:32PM +0800, =Xianwei Zhao wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Amlogic C3 is an advanced edge AI processor designed for smart IP camera
> applications.
> 
> Add ARCH_AMLIPC for the new series.
> 
> Add basic devicetree support for the C3 based Amlogic AW409 board,
> which describes the following components: CPU, GIC, IRQ, Timer, UART.
> It's capable of booting up into the serial console.
> 
> Xianwei Zhao (2):
>   arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
>   arm64: dts: add support for C3 based Amlogic AW409
> 
>  arch/arm64/Kconfig.platforms                  | 12 +++
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../amlogic/amlogic-c3-c302x-aw409-256m.dts   | 30 +++++++
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi   | 87 +++++++++++++++++++
>  arch/arm64/configs/defconfig                  |  2 +
>  5 files changed, 132 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409-256m.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> 
> 
> base-commit: ae68fb187b59bc8645974320808ab2d7c41b1833
> -- 
> 2.37.1
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
