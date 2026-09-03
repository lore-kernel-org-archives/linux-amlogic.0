Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF1BC61DD3
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtSLWLvtuXnJPFVOXhNy/zMP0yZhATHbYL/z7WMbNjo=; b=xAt/pRZoH7gi0E
	dxyjN5pAD8jrhqK/mAiJJutDoXyVRfYoulVhTgU+1ICqM8df1XrhPYpunjC4Ch4A1pARvY2WLi2El
	QqO1cDYAiRtWC7OFdj+dA5sgiJm7cTeJTpId5ZDrXHq4Q4SlopnEG/9H/gD/KeJjb5RpfaD1DKtny
	bvFDASIBFsNb0qAlDxlgH4cQthPaPddYFvavMCQKlRbzBDr3ymSdARzZevYEjML46lK9J3HxCbAWr
	XQ/RXm0skUH1CwR9F0QWLhnbpdnza95inbUMAeqj4L0GB+1XG3Z49SxIIyPl7ulkTkG4O8tBAjz2Q
	e0BIPSM2rjOy5Gcfnczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Cw-0000000GgVA-2912;
	Thu, 03 Sep 2026 07:50:02 +0000
Received: from hqu.edu.cn ([210.34.240.11])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Ct-0000000GgUS-3j94
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 07:50:01 +0000
Received: from [198.18.0.1] (unknown [23.151.104.61])
	by cmweb (Coremail) with SMTP id C_Ai0gAXetmcJplqdxEHAA--.14790S2;
	Thu, 03 Sep 2026 15:49:54 +0800 (CST)
Message-ID: <ff197003-be1d-4934-bf33-9337bc833168@stu.hqu.edu.cn>
Date: Thu, 3 Sep 2026 15:49:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903073643.B92A71F000E9@smtp.kernel.org>
From: Raspberry Kan <raspberrykan@stu.hqu.edu.cn>
In-Reply-To: <20260903073643.B92A71F000E9@smtp.kernel.org>
X-CM-TRANSID: C_Ai0gAXetmcJplqdxEHAA--.14790S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKFW3ZF4kZF1ruw45Kw4DArb_yoW8JF13pF
	97uas5KrWkC348Ww47XayxJFyYq397ZF4rZFn5Kr4kGr4DJF13tFZIkFW7KFWUXr18Jw4j
	9Fs7A345K34YkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgtr4UUUUU
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCFAAHss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_005000_506967_E4301C74 
X-CRM114-Status: UNSURE (   5.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

First of all, I checked the device tree extracted from the stock 
firmware, and it explicitly describes a third pixel processor (|pp2|).

The original vendor DTS can be found here:
https://github.com/Raspberry-Monster/MiBox4-LibreELEC/blob/misc/mibox4_gxl_tf_2g.dts#L10

It specifies three pixel processors and includes interrupts for |IRQPP2| 
and |IRQPPMMU2|.

I also verified this on the actual Xiaomi Mi Box 4 hardware. Lima 
successfully detects three pixel processors:

|lima d00c0000.gpu: pp0 - mali450 version major 0 minor 0 lima 
d00c0000.gpu: pp1 - mali450 version major 0 minor 0 lima d00c0000.gpu: 
pp2 - mali450 version major 0 minor 0 |

The corresponding |pp2| and |ppmmu2| interrupts are also registered:

|GICv2 200 Level pp2 GICv2 201 Level ppmmu2 |

The driver then initializes successfully:

|[drm] Initialized lima 1.1.0 for d00c0000.gpu on minor 1 |

So this particular S905L-based Mi Box 4 appears to use a Mali-450 MP3 
configuration rather than MP2. I have not observed any initialization 
timeouts, reset errors, or SError failures with the third PP enabled.

As Neil mentioned above, the Mali GPU is already defined in 
|meson-gx-mali450.dtsi|, so this redundant definition will be removed in v2.

Thanks for the review.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
