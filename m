Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFF4C47DD9
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Mar 2024 08:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwDHofWVjQUvBaBOKcYuM4meEeJcBBhKU2IeAUAiU2I=; b=yKy3PykvMKdqaV
	BsaiXtQC9TsCeJMLtwU6FOznU+V3faBO2VfgmurDCwQwjOnB2ejyCX9nE/uU06NfYUOGso3yf4776
	WCiAunyxKaXTewUoWJKCD0Uene6CnNqGeAGD3jjmsU2srNTVsueuOCiNdmm1Or/pkpC7bSxbt4MVF
	Omt0+lAmLMd4O3LxlscFwDJxXc/WRIHEeRzvgwTRUvROECaDOadfKTfutmWazJLhVvKg4icYofkSM
	y2n3i2PKaaLjHFF0C8e3rQFDYKXXwoTPxpYBLkuYLuDdiYV/cjVk9+jUKdwz/4bG8Q3CoxDsWmeR6
	inZLRL+gZpbd4o8gcJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnaFq-00000006MoN-15Lf;
	Fri, 22 Mar 2024 08:27:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnaFl-00000006Mnp-3wce;
	Fri, 22 Mar 2024 08:27:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4141156f245so13382795e9.2;
        Fri, 22 Mar 2024 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711096069; x=1711700869; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zr+XUqwA0CHqxnSCgayp4Aa3jADCAmxoEHkuAHYePu0=;
        b=OsCLgZAnEzKlGRCHvOrZgU/SAsEDpTJx+oUU6uGSY+Vly4zFwO+8+//ewod0YiejU0
         wmnVhGugPqr5rUjzUhnxZH1X6ieTpyT4YRZ+HcLMOo0du9y7v7tP10UINOP6AdoLCXIS
         JlNsUA0ssg1HXGx3o4/Tx/dRossdaFZqbMCmtv4de6iWUEEz49TLTEmImIhT32KPWWiH
         tFgrK3gbBgJfUJLikivVC0s1eA6WyN56vAYkfalekGBOxilPUQGJaZg8azsMtqAcuO5w
         nGQkzrJictD3W00Hv76UL/rFyeq81Z0bgH7Qa7I9LvDG4Wzsf7hm11GIWFX/SMjvIE9k
         vOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711096069; x=1711700869;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zr+XUqwA0CHqxnSCgayp4Aa3jADCAmxoEHkuAHYePu0=;
        b=BnpUXf0E85xGttjIiu8g4ny2hp7hWMSVTX8MrdSqySslzzf3pCiJZHUdIDQDvJEn9V
         tagqzepH7ajvlTBOt0gaRV2/jCbVJz5X1SXun+YXgBL6IRxHbUAbm/M4a+Uk7EhlHLQU
         yA8StmNT8m74dD0OJS3LwkHOuAxlR7l46hh29yKqfpMs4VFMcpMrXuRZhVsk8xZTQkiy
         cQqSdcLLprpL/VZP9zjau+m1wwy9sE+RnNIEB2QOFNtVrMDxIx3guMrTz9VmQrz1sdDh
         K6PlAz9uCOZew+aQtHjW9UhYaVjSeQqG9VZL8mnqzJgKXNHooi/SCTA8zj8v/ziWU8Tb
         NNSA==
X-Forwarded-Encrypted: i=1; AJvYcCWbPI+dvkPBlKBOMpBEbfFR7fHtH+8xoUR1ZjFCZRm669eJHab1LEgYpjvQM2yhYd7vq8JCulXapwXasUaM1eCmAO+hmSIoziaNOGQc7oO3+PtOKDfPFojFs24z08dVN8KZKocC0eTP0P1q3/PSmPf7gVSydRK3VA==
X-Gm-Message-State: AOJu0YzB/H0tdgdXXsHM+mPmmQrDoZbhr9GnzuKPgm77D/PWkJd0ZPHl
	lW0GSmHMMl7uDEhszVkqerlwN4vQYhEmuEbGNye4HIC0qyvDzloX
X-Google-Smtp-Source: AGHT+IHF6weDCPs1iJNBsZtU/cT8b1lCliqN4i6j9hmH230LshT6I6zLwsAUrSpFE24jIFx+LELVpQ==
X-Received: by 2002:a05:600c:1f81:b0:414:a6d:52d8 with SMTP id je1-20020a05600c1f8100b004140a6d52d8mr1008838wmb.17.1711096069294;
        Fri, 22 Mar 2024 01:27:49 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id o7-20020a05600c4fc700b004141250b36fsm2333681wmq.11.2024.03.22.01.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 01:27:48 -0700 (PDT)
Date: Fri, 22 Mar 2024 09:27:46 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
Subject: Re: [PATCH v5 09/21] drivers: crypto: meson: process more than
 MAXDESCS descriptors
Message-ID: <Zf1BAlYtiwPOG-Os@Red>
References: <20240301132936.621238-1-avromanov@salutedevices.com>
 <20240301132936.621238-10-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240301132936.621238-10-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_012754_010847_56FB0DC8 
X-CRM114-Status: GOOD (  12.61  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Le Fri, Mar 01, 2024 at 04:29:24PM +0300, Alexey Romanov a =E9crit :
> 1. The old alhorithm was not designed to process a large
> amount of memory, and therefore gave incorrect results.
> =

> 2. Not all Amlogic SoC's use 3 KEY/IV descriptors.
> Add keyiv descriptors count parameter to platform data.
> =

> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c | 441 ++++++++++++--------
>  drivers/crypto/amlogic/amlogic-gxl-core.c   |   1 +
>  drivers/crypto/amlogic/amlogic-gxl.h        |   2 +
>  3 files changed, 280 insertions(+), 164 deletions(-)
> =


Hello

I have started to test by adding patch one by one and when testing this one=
 I got:
[   21.674995] gxl-crypto c883e000.crypto: will run requests pump with real=
time priority
[   21.679686] gxl-crypto c883e000.crypto: will run requests pump with real=
time priority
[   21.704366] ------------[ cut here ]------------
[   21.704480] DMA-API: gxl-crypto c883e000.crypto: device driver tries to =
sync DMA memory it has not allocated [device address=3D0x000000000264c000] =
[size=3D48 bytes]
[   21.717684] WARNING: CPU: 1 PID: 263 at kernel/dma/debug.c:1105 check_sy=
nc+0x1d0/0x688
[   21.725512] Modules linked in: meson_rng meson_gxbb_wdt rng_core amlogic=
_gxl_crypto(+) meson_canvas libphy(+) watchdog ghash_generic gcm xctr xts c=
ts essiv authenc cmac xcbc ccm
[   21.741211] CPU: 1 PID: 263 Comm: c883e000.crypto Not tainted 6.8.0-rc1-=
00052-g595d4248b127 #24
[   21.749834] Hardware name: Libre Computer AML-S905X-CC (DT)
[   21.755353] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   21.762252] pc : check_sync+0x1d0/0x688
[   21.766047] lr : check_sync+0x1d0/0x688
[   21.769842] sp : ffff8000820fbb40
[   21.773119] x29: ffff8000820fbb40 x28: 0000000000000000 x27: 00000000000=
00000
[   21.780192] x26: ffff800081d639d0 x25: 0000000000001327 x24: ffff0000028=
8b010
[   21.787265] x23: 0000000000000050 x22: 0000000000001327 x21: ffff800081c=
23a20
[   21.794336] x20: ffff800080fe0bb8 x19: ffff8000820fbbc0 x18: 00000000000=
00006
[   21.801410] x17: 645b206465746163 x16: 6f6c6c6120746f6e x15: ffff8000820=
fb540
[   21.808482] x14: 000000000000000b x13: ffff800081002748 x12: 00000000000=
00249
[   21.815554] x11: 00000000000000c3 x10: ffff80008105a748 x9 : ffff8000810=
02748
[   21.822626] x8 : 00000000ffffefff x7 : ffff80008105a748 x6 : 80000000fff=
ff000
[   21.829700] x5 : ffff00007d9abb08 x4 : 0000000000000000 x3 : 00000000000=
00027
[   21.836772] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00000b3=
14ec0
[   21.843844] Call trace:
[   21.846260]  check_sync+0x1d0/0x688
[   21.849710]  debug_dma_sync_single_for_device+0xb8/0xc0
[   21.854885]  dma_sync_single_for_device+0xc0/0x11c
[   21.859628]  meson_handle_cipher_request+0x49c/0x7c4 [amlogic_gxl_crypto]
[   21.866356]  crypto_pump_work+0x160/0x2ac
[   21.870324]  kthread_worker_fn+0xe4/0x300
[   21.874291]  kthread+0x11c/0x120
[   21.877483]  ret_from_fork+0x10/0x20
[   21.881020] irq event stamp: 9880
[   21.884296] hardirqs last  enabled at (9879): [<ffff800080988834>] _raw_=
spin_unlock_irqrestore+0x6c/0x70
[   21.893698] hardirqs last disabled at (9880): [<ffff800080987ca0>] _raw_=
spin_lock_irqsave+0x84/0x88
[   21.902668] softirqs last  enabled at (5638): [<ffff800080010674>] __do_=
softirq+0x494/0x4dc
[   21.910947] softirqs last disabled at (5627): [<ffff8000800161f0>] ____d=
o_softirq+0x10/0x1c
[   21.919227] ---[ end trace 0000000000000000 ]---

Regards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
