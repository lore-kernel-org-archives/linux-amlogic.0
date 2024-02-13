Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A5EC48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 07:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNDB/XOEwMaHdOvZ5CFNGlvrCYqiq1Z0ORLuFhKaUnQ=; b=lNYE8qVjlFMrV5
	ggPRcODaNAN9Lg5lga8d9utsav1vEhJzkm33AuqPBp50MCbTUaTz1LvVuaNN+Xt09asc6CaQespqs
	q518xmzMeG2kQg42xCCtz7Mss/sJE9ZnVGZWYz/tBqsjXBLoe/qb0JqGDo2+0gw90BjHfmOVXrK0f
	7wfS40JjGX1Pstyp7BOJSiIfaPG0FnbRgwsSyy5d606BgzziWJysPOin88xqNsxy3x/n6nPa8F1sk
	ZDiOJ3Qcm5DAGxcigkEdpAE1GVRtFQcAMLRQazNI9gpQAhPhxGKkvCRWUx4zE+obUUfEkWkcGfRaH
	fJZVNfuFNrLT7H/MrTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZn6W-00000008EHW-2UM0;
	Tue, 13 Feb 2024 07:21:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZn6T-00000008EGE-1m3u;
	Tue, 13 Feb 2024 07:21:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40efcb37373so32101375e9.2;
        Mon, 12 Feb 2024 23:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707808875; x=1708413675; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8CoOnrmU5IgwoMjOJC9hlVJa4bE1pFzCtcl4Q05gH4k=;
        b=SXeyf2P3wHXsuMtzzD64yRDY/04vATaH6VMXUel6C6Jnqub/XlvYqB4oYx718Z/KoM
         th4JVy1pdooCmpDmjVoUyGMQYJkLRpU6mafgf84IrpS1kWRbt1JoLxtGxMfon7yK/jnM
         BVrOwe9GxXqDtr5uaG+jh4L06RU4ZYd4AzEL13ShuoI4Gz0pV8GOJDSkiZzImCWEx3WI
         7cFi0MIYkD/ZIOPc4vJMprjOroBa9DR0otHBX5J4b4JHA/iT2GRgz7C5uZmocazSt3oF
         FtpoMAMn/heiEjng4II1pdwIvJqMZaBnYhsmGnUCk+zOc3OmY8ut3J3YfWSD5/r9+TLn
         rhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707808875; x=1708413675;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8CoOnrmU5IgwoMjOJC9hlVJa4bE1pFzCtcl4Q05gH4k=;
        b=rLsvWTvaqp0O1sEy7xAmK1U7LRYjr08qheFPHNS0KRe+yYzNhg8sGrJrtAw9TcqFkJ
         n5D61tNuThUGDKJfJ+1UDpU0Re2eaXzjBYD6+hnKhgpOe7mjm38Ycj16uuuwmlcN52jh
         jkUWYIVtsXeOoowTtru0ycMJKBCuZw6bnOAbwanmbHAQEvPQnRQoWPr1UQIF5+OOf4H7
         1nIFMIjgHNGstQeOZuFDcaktaJEN+uDDPIQhLOl2Gf/QLZYwVQr4O5UCRLqss9rHU7nA
         OkxbfHPZCZW1MRf+XLTw39cXjMeRqJXRXqU5uJjWtvl6oXwG/0kxtweMLBQZNrI2prVw
         wwxg==
X-Forwarded-Encrypted: i=1; AJvYcCVHCSsWqN4caFCNOnaf53+azFZ6dyzhB3L3ft5XtSmnHpqt7e0GU5GltWXAusFtflvQe5yyVmARalqNjnnB30gvFmsvyQT7mlbjsXJSskGoYgW0fIZP35EmKu06UgOzUHlA8ckFvQUskATqaPciKiBwS9fyghT5mg==
X-Gm-Message-State: AOJu0Yyk6w6sRW1/PAVBPlCYVIOKaBrsv0MFFphPxJIco5NPjp329JVD
	f8sn3CkrK+reKKSfz/iBeHmsRO23+5Nx94+F81hSV+6swH8QTibp
X-Google-Smtp-Source: AGHT+IEBIcujhRDn+1hfgiVtv9AVDgqqgKjFxDvFFBFMnQPxLW374rkT4yy5yy/O2btL53SNRC3jEA==
X-Received: by 2002:a05:600c:4e4f:b0:411:b334:2ff0 with SMTP id e15-20020a05600c4e4f00b00411b3342ff0mr1033156wmq.24.1707808874828;
        Mon, 12 Feb 2024 23:21:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJ+mVPsRajillNQzfK5RfT4+AfUgV6U+MVBinI8U04MvPycDa2dobzqU+K0Eww377kXmD7SsZDI0t9VZdK0fT7JxBe9m6TbunNmmC0oa95bNnLw3FWCCGhMy+QH3zHQ7lxLcCeKv2nFxwRYC3DXf0oOurYkdqlpwli/hUOx2ORhWZ2yaSd+mIdnLdOty4IIjYrGN+IwT8+Iz0NNVxsQOc3o4vj68khEtLKjeLK1flXAnr/6VFdch1Bmc3tzhRUJ30Hr0SN6cDS+HqETBcItLNb+4PL2STGilGGSTQyG5pETo9pT7/pwBogHPy8/L9phG0EO1hVTotJIk7sOdsnOln3wbqlsPTnFdK/S5cK8WcDF6jpV/hKr12gSmb/Njchw7Gx3WGRpNBz6Z5m5tqj/7NI5u+qQ/PW8mTWDwum48fMgOZyMA0A0lyvoHJabNNJZN1A+U6//yTwkI691g2K9xjhdEBt1/sjaI33zglgaKjqny4u8cKsT7DUrouZUxdz5DAvCHOQWC0wReh0EwdqtCd8vNQJN+XQh6jjp8ARLqS7hLwdPsBnx83zpRdtPjZevE6oofuZVmZZ15Ce1L85EBIHdTch61FpGMIpZDlB5Sb3IVRpGX4KvyguaDAi+5FcUGqGQsH2wK07
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id m14-20020a05600c4f4e00b00411bff9f7cbsm695225wmq.37.2024.02.12.23.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 23:21:14 -0800 (PST)
Date: Tue, 13 Feb 2024 08:21:12 +0100
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
Subject: Re: [PATCH v4 00/20] Support more Amlogic SoC families in crypto
 driver
Message-ID: <ZcsYaPIUrBSg8iXu@Red>
References: <20240212135108.549755-1-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212135108.549755-1-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_232117_486870_1935A10C 
X-CRM114-Status: GOOD (  10.99  )
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

Le Mon, Feb 12, 2024 at 04:50:48PM +0300, Alexey Romanov a =E9crit :
> Hello!
> =

> This patchset expand the funcionality of the Amlogic
> crypto driver by adding support for more SoC families:
> AXG, G12A, G12B, SM1, A1, S4.
> =

> Also specify and enable crypto node in device tree
> for reference Amlogic devices.
> =

> Tested on AXG, G12A/B, SM1, A1 and S4 devices via
> custom tests [1] and tcrypt module.
> =

> ---
> =


I started to test on Lepotato board and added patchs up to  "drivers: crypt=
o: meson: process more than MAXDESCS descriptors"
booting lead to:
[   18.559922] gxl-crypto c883e000.crypto: will run requests pump with real=
time priority
[   18.562492] gxl-crypto c883e000.crypto: will run requests pump with real=
time priority
[   18.570328] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000028
[   18.581135] Mem abort info:
[   18.581354]   ESR =3D 0x0000000096000006
[   18.585138]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   18.593005]   SET =3D 0, FnV =3D 0
[   18.593334]   EA =3D 0, S1PTW =3D 0
[   18.597329]   FSC =3D 0x06: level 2 translation fault
[   18.604250] Data abort info:
[   18.604282]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00000000
[   18.612243]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[   18.614552]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[   18.624249] user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000007b8ab000
[   18.626196] [0000000000000028] pgd=3D080000007b8ac003, p4d=3D080000007b8=
ac003, pud=3D080000007b8ad003, pmd=3D0000000000000000
[   18.640426] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
[   18.642929] Modules linked in: of_mdio fixed_phy fwnode_mdio sm4_ce(-) s=
m4 meson_rng meson_canvas libphy rng_core meson_gxbb_wdt watchdog amlogic_g=
xl_crypto(+) ghash_generic gcm xctr xts cts essiv authenc cmac xcbc ccm
[   18.662164] CPU: 3 PID: 264 Comm: cryptomgr_test Not tainted 6.8.0-rc1-0=
0052-gf70f2b0814a0 #11
[   18.670698] Hardware name: Libre Computer AML-S905X-CC (DT)
[   18.676220] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   18.683118] pc : meson_get_engine_number+0x2c/0x50 [amlogic_gxl_crypto]
[   18.689674] lr : meson_skencrypt+0x38/0x8c [amlogic_gxl_crypto]
[   18.695539] sp : ffff800081393790
[   18.698816] x29: ffff800081393790 x28: 0000000000000400 x27: ffff8000808=
74a80
[   18.705888] x26: ffff800081393830 x25: ffff800081393bd8 x24: ffff000001a=
aa000
[   18.712961] x23: 0000000000000001 x22: 0000000000000000 x21: ffff0000011=
b1c50
[   18.720033] x20: ffff00007bac8248 x19: ffff0000011b1c00 x18: fffffffffff=
fffff
[   18.727105] x17: 00000000000001a4 x16: ffff800078edc1f0 x15: ffff8000813=
938e0
[   18.734178] x14: ffff800101393bd7 x13: 0000000000000000 x12: 00000000000=
00000
[   18.741250] x11: 000000000000021c x10: fffffffff81213e0 x9 : 00000000000=
730d5
[   18.748323] x8 : ffff0000011b1ca8 x7 : fefefefefefefefe x6 : fffffc00000=
7a302
[   18.755395] x5 : ffff800078eb4148 x4 : 0000000000000000 x3 : 00000000000=
00028
[   18.762468] x2 : ffff000001aaa040 x1 : 0000000000000000 x0 : 00000000000=
00000
[   18.769541] Call trace:
[   18.771956]  meson_get_engine_number+0x2c/0x50 [amlogic_gxl_crypto]
[   18.778167]  crypto_skcipher_encrypt+0xe0/0x124
[   18.782651]  test_skcipher_vec_cfg+0x2a8/0x6b0
[   18.787050]  test_skcipher_vec+0x80/0x1c4
[   18.791017]  alg_test_skcipher+0xbc/0x1fc
[   18.794985]  alg_test+0x140/0x628
[   18.798262]  cryptomgr_test+0x24/0x44
[   18.801885]  kthread+0x110/0x114
[   18.805076]  ret_from_fork+0x10/0x20
[   18.808617] Code: 1b008440 d65f03c0 9100a003 f9800071 (885f7c61) =

[   18.814651] ---[ end trace 0000000000000000 ]---
[   18.862270] meson8b-dwmac c9410000.ethernet: IRQ eth_wake_irq not found
[   18.863897] meson8b-dwmac c9410000.ethernet: IRQ eth_lpi not found
[   18.870349] meson8b-dwmac c9410000.ethernet: PTP uses main clock
[   18.880548] meson8b-dwmac c9410000.ethernet: User ID: 0x11, Synopsys ID:=
 0x37
[   18.882403] meson8b-dwmac c9410000.ethernet: 	DWMAC1000
[   18.887926] meson8b-dwmac c9410000.ethernet: DMA HW capability register =
supported
[   18.895215] meson8b-dwmac c9410000.ethernet: RX Checksum Offload Engine =
supported
[   18.902627] meson8b-dwmac c9410000.ethernet: COE Type 2
[   18.907756] meson8b-dwmac c9410000.ethernet: TX Checksum insertion suppo=
rted
[   18.914750] meson8b-dwmac c9410000.ethernet: Wake-Up On Lan supported
[   18.921246] meson8b-dwmac c9410000.ethernet: Normal descriptors
[   18.927017] meson8b-dwmac c9410000.ethernet: Ring mode enabled
[   18.932782] meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW=
 Watchdog Timer

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
