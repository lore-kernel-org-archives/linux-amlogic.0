Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620AEC52D7C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2024 18:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPo/7jKbFY83DWrgI70Ei8afERcJzY0Y6lp8oZAxGB0=; b=vOMLeN4NOc6WtY
	1PByrwDhJhdIEP5wLnJ5kmEbYCRbOrvukqUwqk51b5WtANfd/j5qg5hj6D42hXR/hz7U0wLNtUh/8
	9nfCWIz0vMQloaS4ht+iHLfcewEnJf+WNG5SumXWa4Ad1njfo9x5oWBNN1HhxkydnlDA4vRPWUIiu
	ZvRPTmuZW04F1GjxkiUqWQQpUaU5aDMi7f/0ymi4eo7UkpmfnGyFRgUyfJpmZK42uL+uKg8FOiFhw
	Oke3kVTOupWX3nk5NHQkSbVeY5TlFardg/q0NyXHXnGiBpKHcYOrrkjFH8LzkmY0XvjY1wuObAn2h
	9GPg+o56bI/h3GrSG4cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYjq-00000000FTZ-0W0i;
	Fri, 23 Aug 2024 18:10:18 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYjm-00000000FSw-2n6p;
	Fri, 23 Aug 2024 18:10:16 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-270263932d5so1628804fac.2;
        Fri, 23 Aug 2024 11:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724436613; x=1725041413; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NbtN34OztMcTIBRWursUybQnLUd+2YeirAS1R5D30cM=;
        b=gXsbR8HxaulNXKmsKPDLNENpXSVOK4UEl0nZtv1XQ5qctcbw3XvxkegLe0zr08X1UB
         22llNx5/r0IYm2LMzCbAzWZZxdcQCmuRHdjCgM/S9yk67iAp/OHdy9ULKxSUZtm9yncB
         1kPuvnh/dTvXBUzW3JBJgjbGVc4cKLRStY+SrN576mEiN7OejRSnCVfRslh0hxipkxVJ
         IPwsw+lww0cYJrEWKbS//bS6GPBVx3CfnAij00Iy5CabYKLNFuPGSLfYQRMsBbmBsyvX
         zjxyJA0S4YI6qJoaOwydHrEnDDnHnop5bkA1HKp727HNhaelHBE8FYcS/dH1Yevdy/7w
         LPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724436613; x=1725041413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbtN34OztMcTIBRWursUybQnLUd+2YeirAS1R5D30cM=;
        b=w1bhP7f0y0qVU+CDHFmEYxkhTQYtdfvxVoOhxxaIRVbz+GLTeiDuyunI4SDVEQSN9U
         MpWQaLvewop+56aWWeimBcne/e2xXpsujCpJQ7iRR6E5C0wk3corYn0I5KUC61J5m06s
         YIFIViwb0V+tD7aCuUuO7juEUb4/JQCOWSZAsDlSHmCBmVLLo3UY7EAPhceD+KMwcr4r
         N1xsLYCsGgUc2HQlDsdj/T8ggNTA2o5sOuXhZhG1bN7MYwzNmYmKhgSJs+V+nrWpbD+T
         sNCOZrpzLweC5/QpGt2NL7hvF0RdB7hRV4m8K5YX/bftGPcUVxL+yqbYGgejy4efApBU
         bEkg==
X-Forwarded-Encrypted: i=1; AJvYcCUb/f5tRVIkdxplbU+oT3hg399kXJRNfZrp/bBUByWpQtVDlUVlig5SWTdO1eVAYMZb9h9/cWIczGkf/vVUolO+cg==@lists.infradead.org, AJvYcCVUTKaAwtqdxJvCyNKDLwhLq6vh3z4DZT7TsJhwsI+/cR+eHFVACKf1HpHTupMRRnSqIiuI9uCW7h1oXX8B@lists.infradead.org
X-Gm-Message-State: AOJu0YxE7nnQshGnqHM1LlKQPN6rJJT44mtDghJ/OSpALjCxogTYDAqh
	G8ZBhpdp3spfpKcfF9EFpSYH3WTLYucLn5Rea41UARIp+zaRckLTWxntBNDEQynpUEoEOMYQfx0
	W0H9PiMMhJL901Dd8XspYU9b656A=
X-Google-Smtp-Source: AGHT+IHCk1CU0qiBSKUqy36ZULXUFuPlzCEntBPbtvUIZxFil/4taZiG19VCpHB1UWL9NQRCafYKkjCZbc4xE1Jnlys=
X-Received: by 2002:a05:6870:b525:b0:261:446:c405 with SMTP id
 586e51a60fabf-273e63de2a7mr3349911fac.4.1724436612812; Fri, 23 Aug 2024
 11:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240820145623.3500864-1-avromanov@salutedevices.com>
In-Reply-To: <20240820145623.3500864-1-avromanov@salutedevices.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 23 Aug 2024 23:39:54 +0530
Message-ID: <CANAwSgSwY+XSfw2styzY49Ti_zDntQBPMnbOLeJUt2srwde-6w@mail.gmail.com>
Subject: Re: [PATCH v9 00/23] Support more Amlogic SoC families in crypto driver
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	vadim.fedorenko@linux.dev, linux-crypto@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@salutedevices.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_111014_738054_5488EC23 
X-CRM114-Status: GOOD (  29.36  )
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

Hi Alexey,

Thanks for working on these changes.

On Tue, 20 Aug 2024 at 20:31, Alexey Romanov
<avromanov@salutedevices.com> wrote:
>
> Hello!
>
> This patchset expand the funcionality of the Amlogic
> crypto driver by adding support for more SoC families:
> AXG, G12A, G12B, SM1, A1, S4.
>
> Also specify and enable crypto node in device tree
> for reference Amlogic devices.
>
> Tested on GXL, AXG, G12A/B, SM1, A1 and S4 devices via
> custom tests [1] and tcrypt module.
>

I have tried these patches on my G12B, Odorid N2plus.

$ sudo cat /sys/kernel/debug/gxl-crypto/stats
[sudo] password for alarm:
Channel 0: nreq 330
cbc-aes-gxl cbc(aes) 135 2187
ecb-aes-gxl ecb(aes) 97 2005
ctr-aes-gxl ctr(aes) 98 992

But, I am observing the following with crypto/testmgr failed

[    1.915219] Key type .fscrypt registered
[    1.915238] Key type fscrypt-provisioning registered
[    2.418969] Key type encrypted registered
[    4.358508] alg: skcipher: blocksize for ctr-aes-gxl (16) doesn't
match generic impl (1)
[    4.361075] alg: self-tests for ctr(aes) using ctr-aes-gxl failed (rc=-22)
[    4.361089] ------------[ cut here ]------------
[    4.361102] alg: self-tests for ctr(aes) using ctr-aes-gxl failed (rc=-22)
[    4.361153] WARNING: CPU: 4 PID: 154 at crypto/testmgr.c:5887
alg_test+0x56c/0x600
[    4.367839] Modules linked in:
[    4.370871] CPU: 4 PID: 154 Comm: cryptomgr_test Not tainted
6.10.6-MANJARO-ARM+ #3
[    4.378497] Hardware name: Hardkernel ODROID-N2Plus (DT)
[    4.383784] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.390716] pc : alg_test+0x56c/0x600
[    4.394356] lr : alg_test+0x56c/0x600
[    4.397996] sp : ffff800084293d40
[    4.401289] x29: ffff800084293d40 x28: ffff80008124ac58 x27: 00000000ffffffff
[    4.408396] x26: 00000000ffffffea x25: 0000000000000048 x24: ffff80008308b000
[    4.415503] x23: ffff80008124ac58 x22: 0000000000010385 x21: ffff000004481c80
[    4.422609] x20: ffff000004481c00 x19: 000000000000003b x18: 00000000fffffffe
[    4.429716] x17: 656e656720686374 x16: 616d2074276e7365 x15: ffff800084293930
[    4.436823] x14: 0000000000000000 x13: ffff800082ed6153 x12: ffff8000821b1508
[    4.443929] x11: 0000000000000001 x10: 0000000000000001 x9 : ffff80008017e6d4
[    4.451036] x8 : c0000000ffffdfff x7 : ffff8000821012d0 x6 : 00000000000affa8
[    4.458143] x5 : ffff8000821b14b0 x4 : 0000000000000000 x3 : 0000000000000000
[    4.465250] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00000a739dc0
[    4.472357] Call trace:
[    4.474783]  alg_test+0x56c/0x600
[    4.478076]  cryptomgr_test+0x2c/0x50
[    4.481716]  kthread+0x108/0x120
[    4.484923]  ret_from_fork+0x10/0x20
[    4.488477] irq event stamp: 988
[    4.491683] hardirqs last  enabled at (987): [<ffff8000801808fc>]
console_unlock+0x134/0x148
[    4.500090] hardirqs last disabled at (988): [<ffff8000811a0554>]
el1_dbg+0x24/0x98
[    4.507716] softirqs last  enabled at (966): [<ffff8000800c2878>]
handle_softirqs+0x350/0x370
[    4.516209] softirqs last disabled at (959): [<ffff8000800105fc>]
__do_softirq+0x1c/0x28
[    4.524269] ---[ end trace 0000000000000000 ]---

Thanks
-Anand

> ---
>
> Changes V1 -> V2 [2]:
>
> - Rebased over linux-next.
> - Adjusted device tree bindings description.
> - A1 and S4 dts use their own compatible, which is a G12 fallback.
>
> Changes V2 -> V3 [3]:
>
> - Fix errors in dt-bindings and device tree.
> - Add new field in platform data, which determines
> whether clock controller should be used for crypto IP.
> - Place back MODULE_DEVICE_TABLE.
> - Correct commit messages.
>
> Changes V3 -> V4 [4]:
>
> - Update dt-bindings as per Krzysztof Kozlowski comments.
> - Fix bisection: get rid of compiler errors in some patches.
>
> Changes V4 -> V5 [5]:
>
> - Tested on GXL board:
>   1. Fix panic detected by Corentin Labbe [6].
>   2. Disable hasher backend for GXL: in its current realization
>      is doesn't work. And there are no examples or docs in the
>      vendor SDK.
> - Fix AES-CTR realization: legacy boards (gxl, g12, axg) requires
>   inversion of the keyiv at keys setup stage.
> - A1 now uses its own compatible string.
> - S4 uses A1 compatible as fallback.
> - Code fixes based on comments Neil Atrmstrong and Rob Herring.
> - Style fixes (set correct indentations)
>
> Changes V5 -> V6 [7]:
>
> - Fix DMA sync warning reported by Corentin Labbe [8].
> - Remove CLK input from driver. Remove clk definition
>   and second interrput line from crypto node inside GXL dtsi.
>
> Changes V6 -> V7 [9]:
>
> - Fix dt-schema: power domain now required only for A1.
> - Use crypto_skcipher_ctx_dma() helper for cipher instead of
>   ____cacheline_aligned.
> - Add import/export functions for hasher.
> - Fix commit message for patch 17, acorrding to discussion [10].
>
> Changes V7 -> V8 [11]:
>
> - Test patchset with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS: fix some bugs
>   in hasher logic.
> - Use crypto crypto_ahash_ctx_dma in hasher code.
> - Correct clock definition: clk81 is required for all SoC's.
> - Add fixed-clock (clk81) definition for A1/S4.
> - Add information (in commit messages) why different compatibles are used.
>
> Changes V8 -> V9 [12]:
>
> - Remove required field clk-names from dt-schema according to Rob Herring
> recommendation [13].
> - Fix commit order: all dt-bindings schema commits now located earlier
> than any changes in device tree.
> - Fix typos and add more clarifications in dt-schema patches.
>
> Links:
>   - [1] https://gist.github.com/mRrvz/3fb8943a7487ab7b943ec140706995e7
>   - [2] https://lore.kernel.org/all/20240110201216.18016-1-avromanov@salutedevices.com/
>   - [3] https://lore.kernel.org/all/20240123165831.970023-1-avromanov@salutedevices.com/
>   - [4] https://lore.kernel.org/all/20240205155521.1795552-1-avromanov@salutedevices.com/
>   - [5] https://lore.kernel.org/all/20240212135108.549755-1-avromanov@salutedevices.com/
>   - [6] https://lore.kernel.org/all/ZcsYaPIUrBSg8iXu@Red/
>   - [7] https://lore.kernel.org/all/20240301132936.621238-1-avromanov@salutedevices.com/
>   - [8] https://lore.kernel.org/all/Zf1BAlYtiwPOG-Os@Red/
>   - [9] https://lore.kernel.org/all/20240326153219.2915080-1-avromanov@salutedevices.com/
>   - [10] https://lore.kernel.org/all/20240329-dotted-illusive-9f0593805a05@wendy/
>   - [11] https://lore.kernel.org/all/20240411133832.2896463-1-avromanov@salutedevices.com/
>   - [12] https://lore.kernel.org/all/20240607141242.2616580-1-avromanov@salutedevices.com/
>   - [13] https://lore.kernel.org/all/20240610222827.GA3166929-robh@kernel.org/
>
> Alexey Romanov (23):
>   drivers: crypto: meson: don't hardcode IRQ count
>   drviers: crypto: meson: add platform data
>   drivers: crypto: meson: remove clock input
>   drivers: crypto: meson: add MMIO helpers
>   drivers: crypto: meson: move get_engine_number()
>   drivers: crypto: meson: drop status field from meson_flow
>   drivers: crypto: meson: move algs definition and cipher API to
>     cipher.c
>   drivers: crypto: meson: cleanup defines
>   drivers: crypto: meson: process more than MAXDESCS descriptors
>   drivers: crypto: meson: avoid kzalloc in engine thread
>   drivers: crypto: meson: introduce hasher
>   drivers: crypto: meson: add support for AES-CTR
>   drivers: crypto: meson: use fallback for 192-bit keys
>   drivers: crypto: meson: add support for G12-series
>   drivers: crypto: meson: add support for AXG-series
>   drivers: crypto: meson: add support for A1-series
>   dt-bindings: crypto: meson: correct clk and remove second interrupt
>     line
>   dt-bindings: crypto: meson: support new SoC's
>   arch: arm64: dts: meson: gxl: correct crypto node definition
>   arch: arm64: dts: meson: a1: add crypto node
>   arch: arm64: dts: meson: s4: add crypto node
>   arch: arm64: dts: meson: g12: add crypto node
>   arch: arm64: dts: meson: axg: add crypto node
>
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   |  32 +-
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  14 +
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   7 +
>  .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   6 +-
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  13 +
>  drivers/crypto/amlogic/Makefile               |   2 +-
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 632 ++++++++++++------
>  drivers/crypto/amlogic/amlogic-gxl-core.c     | 292 ++++----
>  drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 507 ++++++++++++++
>  drivers/crypto/amlogic/amlogic-gxl.h          | 118 +++-
>  11 files changed, 1269 insertions(+), 361 deletions(-)
>  create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c
>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
