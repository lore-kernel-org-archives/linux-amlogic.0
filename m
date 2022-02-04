Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B966C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Feb 2022 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypjKCRog4kPgYtHGl+9zNeviZmNb8ClXciDV/Aop5r8=; b=jUvTtf9HefKGSU
	AvwDqstW1F1WtpU958G8RgEPuJd3CNcXis+tQOJkivm+IZQXosrJ5OjjB7oIF749aAEeaVwmnLw1d
	U6PGMRUAyStUN2HevQM2ykwbe3pSsHla19oRnOs4YBRj8JnOu3dCqow8+qaFERI1CkwpOY8jAfvjf
	5I1+t5+1F2+0PB885WXl+itqSQreV98DzjMneKTkM9aA1NuVdqiYbzyyOQXmtptKtUU6CABIObJmG
	DryH39qmivv7yCg6ZhF2QmGyO8BCzdlO4Hd3XI2V7ls/TXYhvak0yRCm6vZScVMwSvFPrE7J6TloM
	67NoXdLkinh9KJhQPciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFtsz-003lPR-Or; Fri, 04 Feb 2022 08:24:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFtsM-003l5h-EX
 for linux-amlogic@lists.infradead.org; Fri, 04 Feb 2022 08:23:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so3349750wmb.0
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Feb 2022 00:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YoPvGGzXerErReeFppgzdtNkqWy9wD5WssaNJIiZPAw=;
 b=qAz5EkaTZsfsTLh1I6QgmoLeMggzHNVtoruhvmek+PN5S03il39jVkDg9XSuFL/15H
 BMeUWIOxFtE6gKfREYC5rGLvh/G+sr5I3fkqsfxz3KKDRantZ2aYm2oJDo5MVtInsPpF
 Vg84QUlgZAZC1hlGL8rxzsdE8QtolELENIa3m45ocuQsfJqr6Zx7c7/pZhonPfyA0wex
 TZgKDlm1lEjT6m6AUESdCXTVAeN6unUckrfKFO5vQVeW6akFRVw9r9WogICoWfgsZaGy
 Syw6MtoTCthoBy+S19it+H4A275Y33s7KDS1TG+7ulAsTPmz/cuh+lNT8NLiMqcNf4od
 Cdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YoPvGGzXerErReeFppgzdtNkqWy9wD5WssaNJIiZPAw=;
 b=SahIRWPmfEvfFaYK13Z7zNpRoSohpb7RrgZfP0Mc7crLKELqsynCP/PGldznmmTeY0
 Prk8oLI6Uly3REgjkVrdlTjv21UizO67m18+sw7Y88U8E2jQO7MNVsbAbqfjQXN6UxXs
 Z74Ua/P2+c0p0rR+UVzMXbvWqU99NfbLQt6gGsUa4azXDgihNyQ5m+n0FZHIcNoLGzCk
 wj0wa99vX5M8I7ZNoFxURUK023/B7wlhwaf4+Lk5ksxNfU5nMvMzCUkji9f+0s0BCYhG
 9dXRWNFUJ+tHXWqwVXc9JStN+r0lV+wRuppJm1UMCKNOwaCZvr1nLJ+VU37eD4TbaEeo
 E6Lw==
X-Gm-Message-State: AOAM531DtTh6Z4mhYngYZOvrF5IQPeq5sGfsCIZXVG/L1yr01pebuzfj
 /4WcaN8eX3u0cBRBe6pTrvdxjw==
X-Google-Smtp-Source: ABdhPJw1Bomabprev4G5Jse3YWUeThRqx2iBXXS6w/R8YqCmRa+dipbHD0p+G10Qc6MuisMWmLc45Q==
X-Received: by 2002:a05:600c:410f:: with SMTP id
 j15mr1205575wmi.161.1643963004720; 
 Fri, 04 Feb 2022 00:23:24 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:3fbe:ff10:110:739])
 by smtp.gmail.com with ESMTPSA id
 s22sm8914078wmj.38.2022.02.04.00.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 00:23:24 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Lutz Koschorreck <theleks@ko-hh.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: meson-sm1-odroid: use correct enable-gpio
 pin for tf-io regulator
Date: Fri,  4 Feb 2022 09:23:16 +0100
Message-Id: <164396299209.31118.6606096108779211673.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127130537.GA187347@odroid-VirtualBox>
References: <20220127130537.GA187347@odroid-VirtualBox>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_002326_518422_53DD1A81 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi,

On Thu, 27 Jan 2022 14:05:37 +0100, Lutz Koschorreck wrote:
> The interrupt pin of the external ethernet phy is used, instead of the
> enable-gpio pin of the tf-io regulator. The GPIOE_2 pin is located in
> the gpio_ao bank.
> 
> This causes phy interrupt problems at system startup.
> [   76.645190] irq 36: nobody cared (try booting with the "irqpoll" option)
> [   76.649617] CPU: 0 PID: 1416 Comm: irq/36-0.0:00 Not tainted 5.16.0 #2
> [   76.649629] Hardware name: Hardkernel ODROID-HC4 (DT)
> [   76.649635] Call trace:
> [   76.649638]  dump_backtrace+0x0/0x1c8
> [   76.649658]  show_stack+0x14/0x60
> [   76.649667]  dump_stack_lvl+0x64/0x7c
> [   76.649676]  dump_stack+0x14/0x2c
> [   76.649683]  __report_bad_irq+0x38/0xe8
> [   76.649695]  note_interrupt+0x220/0x3a0
> [   76.649704]  handle_irq_event_percpu+0x58/0x88
> [   76.649713]  handle_irq_event+0x44/0xd8
> [   76.649721]  handle_fasteoi_irq+0xa8/0x130
> [   76.649730]  generic_handle_domain_irq+0x38/0x58
> [   76.649738]  gic_handle_irq+0x9c/0xb8
> [   76.649747]  call_on_irq_stack+0x28/0x38
> [   76.649755]  do_interrupt_handler+0x7c/0x80
> [   76.649763]  el1_interrupt+0x34/0x80
> [   76.649772]  el1h_64_irq_handler+0x14/0x20
> [   76.649781]  el1h_64_irq+0x74/0x78
> [   76.649788]  irq_finalize_oneshot.part.56+0x68/0xf8
> [   76.649796]  irq_thread_fn+0x5c/0x98
> [   76.649804]  irq_thread+0x13c/0x260
> [   76.649812]  kthread+0x144/0x178
> [   76.649822]  ret_from_fork+0x10/0x20
> [   76.649830] handlers:
> [   76.653170] [<0000000025a6cd31>] irq_default_primary_handler threaded [<0000000093580eb7>] phy_interrupt
> [   76.661256] Disabling IRQ #36
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.17/fixes)

[1/1] arm64: dts: meson-sm1-odroid: use correct enable-gpio pin for tf-io regulator
      https://git.kernel.org/amlogic/c/323ca765bfe9d637fa774373baec0bc41e51fcfa

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
