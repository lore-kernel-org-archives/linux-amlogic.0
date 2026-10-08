Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CE3CA600C
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2026 14:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajbdTpa3jWfgDROFp2L78Kscsi7BRImRA6XmanwDiaA=; b=XKSBBZe25Huz14
	s0yeLim0N3zxCMVOBh5ZKxH+tRFg70rv/7ImkHQiDlXA0rZtNMzgma+Y/hGGP7kj2gJHUwaL80lmm
	Ea3WR/czpyGEYLSqHn97RSm93v0Ov6YshbaqP0Q7OU0JvLJUDAWGiAqDR7WgZ760GzncRSahDD+b2
	mVXBoxiF4SuYI5QJKsf0Cc26ofzxvNjTRu8VAw2i+bB9kgQiqJ9+l+gxWa7IXa0qirSozhw3+vFUO
	Kq2VmHZnungqeadGWGN4Ab9F/TONTZ4YZfRh0Nsx7TafsKm+ybmUtgX+mCILme3wGApunKRWE5zK/
	iLnuvo/sTVajuWn+xpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEoyh-00000004Woo-2OA8;
	Thu, 08 Oct 2026 14:20:11 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEoye-00000004Wnw-2WQL;
	Thu, 08 Oct 2026 14:20:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791469199; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=B9eUFbUFWwy+2EylRYhJhGUtWUmB8HuyzXWW0t6BvoWrSKpDj1lgBTy/WOJoyy0dclVDPeyKiwtvUFT8Kk0kc3WbGwheHcHfcAiD6vXUktcDDPbpUM+9tOYxhesMzB7yKULBDZbKfAgNGFvzLtE0N+keg/qqnAXXvdlL5/PJhe8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791469199; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7H7GHV2tpd9DQz0mx8nIagNiDC6A1GJJbocolPx7T98=; 
	b=fpfGEzomxY5Qk7S8L75uDxyhpCXzletoUou2RkZ+uAmi5yDgow/Wlne75r2uXzGrmMbaSPwguXRQo/PQGSe45/THWial4zGM4rx8SLt+YiWTiqDv83+1awd8x4SWJu6hKR35jjnZ4sWWABqWTyIFypzbq8GSOcWbu406R49Z3p4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791469199;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=Date:Date:Message-ID:From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7H7GHV2tpd9DQz0mx8nIagNiDC6A1GJJbocolPx7T98=;
	b=PWfaoUeh8JsfEE2VS9gnSMNZgcBJuy0C8d6EJrBqI1DjFTk4lyxYG4Hk1KKAB/xz
	IWUyL4reb45QH+TTHeV1JPQx11dbrbixSf6Hq8ca0OYuO/xab5LgIO+joINrUcVgpQI
	Y5fIxXl9rDD0/GnvDx1P4pFcvcvlFV9/BWjiRCr4=
Received: by smtp.zoho.eu with SMTPS id 1791469196359881.6653594573447;
	Thu, 8 Oct 2026 16:19:56 +0200 (CEST)
Date: Thu, 08 Oct 2026 17:19:54 +0300
Message-ID: <a12a6d283cd8382311117c6b95bfee23.iav@iav.lv>
From: Igor Velkov <iav@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, iav@iav.lv
Subject: Re: [PATCH] irqchip/meson-gpio: Allow the GPIO interrupts to wake the system
In-Reply-To: <70897195-0ffc-4d80-80d4-e60f87c6101e@linaro.org>
References: <20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv> <70897195-0ffc-4d80-80d4-e60f87c6101e@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_072008_922797_BF922093 
X-CRM114-Status: UNSURE (   9.96  )
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

On 08.10.2026 10:36, Neil Armstrong wrote:
> The code sound valid but the this paragraph means nothing, adding or removing
> IRQCHIP_SKIP_SET_WAKE should not change the fact PCF8563 would wake up the ODROID-HC4
> since the BL301 firmware hardcodes which gpio can wakeup.

The test was suspend-to-idle, not mem. The SoC never enters the firmware
suspend there, so BL301 does not pick the wakeup source: the CPUs sit in
cpuidle and any interrupt left enabled in the GIC brings them out.

Whether that wakes the *system* is decided by genirq. suspend_device_irqs()
keeps an interrupt enabled only when irqd_is_wakeup_set(), and that is what
enable_irq_wake() sets. Without the flag enable_irq_wake() fails with
-ENXIO, the interrupt is suspended, and when it fires the flow handler
masks it (irq_can_handle_actions(): irqd_irq_disabled -> IRQS_PENDING,
mask_irq()). The alarm fires once, nothing calls pm_system_irq_wakeup(),
s2idle carries on and the board stays asleep until a power cycle. With the
flag the interrupt is armed, pm_system_irq_wakeup() ends s2idle, and
/sys/power/pm_wakeup_irq shows the alarm. That is the 4/4 against 0/1.

> I guess this flag simply removes an error when setting the gpio as wakeup source
> which means nothing in this platform anyway. So please rephrase.

For mem you are right: the firmware chooses the wakeup sources and this
flag changes nothing there. v2 will say s2idle explicitly and describe the
mechanism above.

Igor

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
