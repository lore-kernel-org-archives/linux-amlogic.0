Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AD7CD343F
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2026 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W6M1Rtb8jyzRNhuwfE2v/VGgV+RcChAGSlzYjI3VVpo=; b=WKvLiLYiQQ8BtE
	Dcw6oDapU6rPFIl7vFMz/iyNixkee2G5hFbYNCAG9t02fyvhNklsgkIKtMtUoCiCFGMFcHlRDagYS
	1+LLQkE+wvJe59KWX+7cWVjaIzgAmB9IpbzQHAY++fMvlqttkKRSdnOdRvb/daDUbXAikaRHHSoiB
	C8wZAKCpNohBnqMb6iHZ61HvNhKTD5w2akJL4RlpLiZXzDs1EgPozWD0FNbF9bWzYL3bDzaBHoMD9
	wv+ohWD+lNEw5mDkqgT/JkB6PlYmYSFGypsswuVFVd3Jw0TV53x1y5tpAQ5xhwtuul3pe5JE/Tnw3
	zYZbK2HqVb8OXGRVtcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtg1-00000008asR-2LyS;
	Fri, 15 May 2026 14:38:09 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtfz-00000008arR-2S26
	for linux-amlogic@lists.infradead.org;
	Fri, 15 May 2026 14:38:08 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aa0cf8bca3so1475292e87.0
        for <linux-amlogic@lists.infradead.org>; Fri, 15 May 2026 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778855885; x=1779460685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=StZsbJeEJPo8M4uDdGQIgmZ75YI487IGeU37Pfexsek=;
        b=Wfns1NOCzKUFP6L9TMaIUR6BC5BrMUsG8JwVHe343gEEupUolpUSBet2WNvCjL2Sg6
         4peCBxNxVGiICkdBG5OKbbtTZfqhkyq2zScwx5V0JuXO76QWTWA+d51N3xIUmH0VsmMy
         Kl9erjnlqw3Fmtw7WaLPoyWEm/kqtNLUXnfAUD2cBdt3eQHd3qfcI5tAmmzOh6h4Wc+w
         JWTlnwPruOqozTYK2Rl8VKyG/WCWJ7kJesHvqaL6Sb+A0TBQJHjbun1XMFcZExkHozNs
         8DzE5hwSHS2TTQb7gBZ0OXVN34+weVGWRgrHxGMIdF/E9Hm/7keV1tJoMyYHzlPcGUIS
         Tm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855885; x=1779460685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StZsbJeEJPo8M4uDdGQIgmZ75YI487IGeU37Pfexsek=;
        b=LM1c4XTkVntiKXsGtgZWt5K05HhZomDKT50LdcCs8rCvi15ZYEP3iZ9hdL3EExzQOh
         AjdVmKzIDhf8UzipRGj57vkhuECEM6iIs0HnFD/gSYlAdN+k39V8JI4mncLit181SGKQ
         ZOGnb3mzz5YIKgM9UCe21/DO9zSci4I/4cTb5tQfRHCANyFkEEVGhUQm+NICm9MLsFFg
         d1sbjJZJzE6mxe49oCDXUel7fX/EFnrCb7DPsiIDCH1sTOS5dezG/iAI8wm3NDVvmpav
         tPGnhnNv6aUh0H3cVlsEBnFjTTOgOTVsO1G2rhnIWBkn5QV8HWxqkKUFTwGppt1mE9FE
         Um5g==
X-Forwarded-Encrypted: i=1; AFNElJ+WlWdqkanltMrjV1bV08GGhjsXT2LX3vkTKJu6BzEONBl96+QuPRi4nmRA4QXRiBZyKkoW1zTTKtiXW0tJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzigx3pyPrk4lYrlZ+N6BfXQrkXs6/1ka+qVCL1SwIgL5YPqxAQ
	xoLmULT2m88tgXB25tPdo6+42ouQPmoXVsELaqHrHo6oKolaOZz9ZrzKajXn0VbnfMbWZA==
X-Gm-Gg: Acq92OH3/b6okNXPS/q3nj923Nc+0WL5iVm6J5ybfzgOZm9CxV9AcXRCUsHPkNDYAqn
	0K1sb57qAJgIt+ax4G/ebX0WnbyBh9bo065e1c2KNntJnIDjfRS75oAzKMcaQ8sP08W/80nfqPo
	gQDwpTFtsKa1X7mqWfWpQ/pnhtJSOB6yl87r37bKvphh+MywlKfCGdu0h5shCGBYv932Pqfiezo
	3/LGhu7KjmnWy399OtRTkPzq4hY+jEB0mNiGLSS1XmBF/SnXQH0fvBxkbaD+trM/nOjwys9qBeC
	lvdsLRc3tWIJ52vVDRxOnmvWtpNwmfe5+q9MnvT4qKLZ0EIK+NrYfHAKuq3ZOKNP5aBZZwiZPjZ
	3PutG/9PoEn8Gr4/nknBpj6KhI7pIezE4E32/uEJvkOKmyC8gcdk4J1S1+zj96fiTOL+iNiQwP7
	a75MeObcjADBHc1cFax5DF1ukBiMpQ1Cn3zR2KxMKeD0Py5Ivsh4yxB4I=
X-Received: by 2002:a05:6512:3a8f:b0:5a8:86a8:2e09 with SMTP id 2adb3069b0e04-5aa0e733fcdmr1252639e87.7.1778855884497;
        Fri, 15 May 2026 07:38:04 -0700 (PDT)
Received: from qwas-jet.office.tvip.ru ([188.227.12.10])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb38061sm15539511fa.37.2026.05.15.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:38:04 -0700 (PDT)
From: Nikita Maslo <nikitamalco203@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Nikita Maslo <nikitamalco203@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Broken bitbang 1-wire on Amlogic after kernel update
Date: Fri, 15 May 2026 17:38:00 +0300
Message-ID: <20260515143801.2132974-1-nikitamalco203@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_073807_649210_656EDF21 
X-CRM114-Status: UNSURE (   7.64  )
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

I was running linux-6.12.67 on a hardkernel odroid-c2 (Amlogic S905) Amlogic board with DS18B20 on
w1-gpio (1-Wire bitbang), everything worked fine. After updating the
kernel, 1-wire stopped working the DS18B20 fails to enumerate or
reads back the broken-bus, and dmesg
gets flooded with WARNINGs from gpiod_set_value/gpiod_get_value
called from w1_gpio_write_bit/w1_gpio_read_bit.

Hardware: Hardkernel ODROID-C2 (Amlogic S905).
Kernel:   linux-6.18.15 (also reproduces on linux-6.12.69; last
          known-good for me was linux-6.12.67).

Device tree fragment used:

    / {
        onewire {
            compatible = "w1-gpio";
            gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
        };
    };

dmesg, captured on ODROID-C2 / linux-6.18.15:

  [   59.102855] ------------[ cut here ]------------
  [   59.102891] WARNING: CPU: 0 PID: 1145 at drivers/gpio/gpiolib.c:3880 gpiod_set_value+0x78/0x88
  [   59.103569] CPU: 0 UID: 0 PID: 1145 Comm: w1_bus_master1 Tainted: G        WC          6.18.15-current-meson64 #8 PREEMPT
  [   59.103618] Hardware name: Hardkernel ODROID-C2 (DT)
  [   59.103658] pc : gpiod_set_value+0x78/0x88
  [   59.103687] lr : w1_gpio_write_bit+0x20/0x38 [w1_gpio]
  [   59.104161] Call trace:
  [   59.104175]  gpiod_set_value+0x78/0x88 (P)
  [   59.104210]  w1_gpio_write_bit+0x20/0x38 [w1_gpio]
  [   59.104238]  w1_reset_bus+0x84/0xe0 [wire]
  [   59.104272]  w1_search+0x88/0x2a0 [wire]
  [   59.104304]  w1_search_devices+0x54/0x90 [wire]
  [   59.104336]  w1_search_process_cb+0x84/0x170 [wire]
  [   59.104368]  w1_process+0x1c0/0x238 [wire]
  [   59.104400]  kthread+0x14c/0x218
  [   59.104432]  ret_from_fork+0x10/0x20
  [   59.104464] ---[ end trace 0000000000000000 ]---

A symmetric WARN at gpiolib.c:3501 fires from gpiod_get_value via
w1_gpio_read_bit on every read slot.

After a little researching, the suspect commit looks like:

28f240683871 ("pinctrl: meson: mark the GPIO controller as sleeping")

I also tested bitbang i2c-gpio on the same hardware after the update,
it seems to keep working.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
