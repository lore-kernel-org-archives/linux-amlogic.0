Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CE6C64ED6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uE9lJngCfM6XLFELJsmlCKu5KfYcIpHRACpKDVBbVNA=; b=y0xXzf67J5MRug
	QiefMoT3fXawbBcRFSD4DIiMDXISQZZVQY1JGPcDkI52JPTRN9TzWhH407x6T/Ajr4Z+hVa0mZOtQ
	3A4/9RacRLMbaeD/qSHXrMb4JuuO4nMVwLuT6141a5B/pMCLpIrIBmm+MPuTm5KlETfOeHCBUS0JV
	hH44qzhcOdQw1Rj+lOtWW4E1PZloFLk1iqmUKLS2aV2xLCBuwflQpDqXLLUP6EeY1WAXawTl4FpCx
	zn+eCAlqaHYUXOui6YJJIwm5Oo7RavoEEGehBmh7nA0RH+ZLJcI7tGe3z70sEA6tZPEGsbXuNRolt
	I5AMd/Qkkg8eWBYxwHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWefD-00A0oP-0m; Mon, 27 Feb 2023 14:39:39 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWef7-00A0lO-3d; Mon, 27 Feb 2023 14:39:34 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 2034E5FD19;
	Mon, 27 Feb 2023 17:39:30 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677508770;
	bh=tYgZUWm19uKbwUi7eTlgHZOmZ/p94X0Fb1vTQ3q8QDQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=fHlj3/t6cedaewXNtoScUPJQNeVSSLA5b0RZI4JxTfCognayaE5GnWEjd82ysxbSQ
	 j97FRx2+VgQVqjx/npe+pxYjPBhzH25/x/gaewwdgC+hvNOBjrNxQOXgJrcOfAdlQC
	 q6xBxEG4SZqbfKORd/x1JFkKSNCPq+06XmEcbUOOdX/OLYfJE3pEpyyR3c7E9Y2Eji
	 kGdbCsivU7ZaUOoNphiO+D4XlK/VYSxKMXa2v35wp9u3UQ3D0Px1RIqjO6LdVnpjti
	 gYnAXFYwTfEJ6+T8g+Ep93X7bzZAZ9oXmjfTwS238FE0B9SSgmBGIkgqLapeKwzDak
	 FJhI/M9vBmrPw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Feb 2023 17:39:29 +0300 (MSK)
Date: Mon, 27 Feb 2023 17:39:29 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Alexey Romanov <avromanov@sberdevices.ru>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linus.walleij@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>
Subject: Re: [PATCH v1 3/3] arch/arm: dts: introduce meson-a1 device tree
Message-ID: <20230227143929.h2lppesdiaj7l3gn@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <20230222115020.55867-4-avromanov@sberdevices.ru>
 <bc514ba7-406e-bca8-4d3a-4f8997cd3241@linaro.org>
 <d5d9a1fe-2f66-66e3-d88a-76a12f2ec55e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5d9a1fe-2f66-66e3-d88a-76a12f2ec55e@linaro.org>
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
X-CRM114-CacheID: sfid-20230227_063933_356920_2079A9FF 
X-CRM114-Status: GOOD (  16.10  )
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

Hello Krzysztof!

On Thu, Feb 23, 2023 at 10:09:25AM +0100, Krzysztof Kozlowski wrote:

[...]

> >> describes following compontents: CPU, GIC, IRQ, Timer, UART,
> >> PIN controller. It's capable of booting up into
> >> the serial console.
> >>
> >> This is based on arm64 version of meson-a1.dtsi.
> >>
> >> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> >> ---
> >>  arch/arm/boot/dts/meson-a1.dtsi | 151 ++++++++++++++++++++++++++++++++
> > 
> > There is such file and there is such DTS/hardware support. I don't see
> > any reason why entire DTSI should be duplicated. What's more, your
> > commit does not explain it - does not justify duplication.
> 
> One more comment - I think you just added dead code. It's
> uncompilable/untestable. Otherwise, please share how to build this DTSI
> without DTS.

You are right, Alexey doesn't provide any exact *.dts file for any
board, and *.dtsi file should be included somewhere, otherwise this is
dead code.
Unfortunately, our internal board *.dts file is useless for kernel
community, cause there is not any chance to burn locally compiled kernel
to our product due to secureboot protection.
But I think there is one possible option. We have reference Amlogic
boards somewhere in the office. So we can test 32-bit configuration on
it and prepare proper *.dts file for that. What do you think, it
reasanoble?

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
