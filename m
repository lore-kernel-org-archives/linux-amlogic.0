Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D7EECAAD2
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Aug 2022 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:CC:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s/h7HZr1vR/0MlCyYoMmUCdSi8bTt1T5TSs3Gf0gGFg=; b=LSyKjf5VakbatRvOnk24FGB3NR
	uStIYy5czg98OE6fG9LXFujlns5EoP15bhR6I75TTZKZ1GFDYWST5F1AnN4Kw8Lf4pWQ8DVXk1MTM
	YN8AM0nzhYoWYyH6OjEeqfuGITKqKLMUgD2mg0y/rhckQwtDXV/+CqePt+CMHDyQ0RLFQ3b1z+2h5
	Q1eB9YwXdj4Mqpke4ppW6Ysp2rq1RrCcHaeFtUP3QQ5/OTPzJ7E4yxdspDIR1Ov1PzbfO6xnGAyVg
	dHWCDEVTYJqCWECHD9H3eSNR2BfueXXTfEW5Y7aej1tC1NFP6+Wz8kCRS2cv2xa6Y5z5Y+1oAyZuy
	5931zoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSJnG-0006eT-GB; Sun, 28 Aug 2022 15:01:46 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRXoS-0029bQ-9I; Fri, 26 Aug 2022 11:47:49 +0000
Received: from [10.28.39.83] (10.28.39.83) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 26 Aug
 2022 19:32:37 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
Subject: Re: [PATCH] arm64: dts: meson-s4: include meson-s4-gpio.h
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<narmstrong@baylibre.com>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Message-ID: <e32a8c39-1e47-cad1-e093-2cabb2dd37a4@amlogic.com>
Date: Fri, 26 Aug 2022 19:32:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.28.39.83]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_044748_349489_51D670CD 
X-CRM114-Status: UNSURE (   5.20  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 28 Aug 2022 08:01:42 -0700
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On 2022/8/25 20:02, Krzysztof Kozlowski wrote:
> Why? We can see what you did here, but commit msg should explain why you
> do it...

Sorry, I didn't describe this commit message clearly.

In the future, meson-s4.dtsi will have some nodes that need
to use the meson-s4-gpio.h file.

e.g.
	(1) Bluetooth enable pin:
		bt_en-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
	(2) Audio mute pin:
		spk_mute-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_LOW>;
	(3) ...

So, this patch was born.

Best regards,
Huqiang


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
