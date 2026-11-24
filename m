Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14EA606A31E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2026 22:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uS4wpzjK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=AhqVxwLS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P6HpApfrNGMnWTCkVYB+QprnxWO8gWb3cetbkLA1L3w=; b=uS4wpzjKtlnwPC5LRHPaPoD7PK
	LGNk7FCaPESYSOhGs8GXnFLIr62vQkOqenF+6d6TPDlK27MZILLxVYtiL93dOzUBzShWDNydqFtq7
	il625nxJZYPbZqFydeq57xq/9IVLDvysK7XDDDlIIRopLb+btd+lAJy6Qn8RAfp23WoTCOe6shgkU
	RjqgbpIkkMNP19ZcVIH7F7hVOBEHw1WRCu4j4CN2rcucSOj2OJ4CM5GujgmDgjkHZ1D1V6eCDvu5z
	QvPVXisS+cbAC/xUv8jIZtuksyb+exFd8PUMoy/I/Hdj8U6A2klHNnG/yi/E/lV8Ok38V94wuBXUb
	ql1cwSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyeT-00000007xak-0nim;
	Tue, 24 Nov 2026 22:06:13 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyeQ-00000007xZV-0Nf8
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Nov 2026 22:06:11 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8b335eeb340so44136347b3.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Nov 2026 14:06:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557968; cv=none;
        d=google.com; s=arc-20260327;
        b=LDHZYp2iPYB0F6nqZYzdwckKIsWclySaC4AkM9ZFnB0+ohlCAhJDHNsBQZbsTiahfv
         VjA0ZTj3DFF+PIgL660T4lh/s7sXrEwMvoqDDR0uHQEn0GgWwSZp04fVTrkpBKRwf9Rn
         Rjt9R3XpAESRr0DaQ+VR3J60HoWnauwxIR0oreLcgSJtGgOEwp5oW++WIav6NoqsUAC5
         jqNaSJx4W5CtjXV2p9KpXzzCoMLdKr8P+2R3zao8OJl30XDrSEHbMUyU2zxB0xfwLtGW
         59xRWblv0ppib1GwA5Epvue1IL6tPOh7Kq80+CZ5swTgZnd7LMMQ1RqF6vX6dKu0j2fr
         cScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        fh=pUgotUxp1bjYIlYfH+56vMm8vCbReiQnzdEWUx+/Ru4=;
        b=KXj7HwkqYzHOtix97MCemLO0sh7eOVw2Z7jSR/fFAlxKSJSC6Ixg7NOidCKX0kslyO
         f25Us5Yo1HThV2Mk1zfjE1dcZUCkkky7zlzjTtgndIy8liLLo5RPfKSBwfTY9b4CDIwY
         fw3mPzuPanidz+D/6mGSNtRQGXRN97oZRie4Ik/1fibDCQhIXPWSMQ5hWSZba4pB6vV+
         4pQe1MyCLGhZoOUcRqy4Rj6kb6EgoyAqvkLu6Q09kBNL0SgpKFg3Z/1j/zJ0/HAdqMFn
         KJy2U/vXSqbkgOKsMJjqRo5iF6Dap7D1yoOjDQZ7IVbUQBCYvrB1G9uTpUWwX/ChuuHE
         LVXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795557968; x=1796162768; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        b=AhqVxwLSgjgAG7V0kNF3adCyY7mxk2N2UgoBcI+3x3RvrGNz8DOk/mE14XQaclSnOc
         mk7xX0paYGCpEbmwN2T8GvsEgoMWBvXd43E6e/cqhlTra2J+wMVNoXD2YPPSbmwM4uOq
         uYqe/C+4Wx78HaYWVfGtJyD+GHxeSzdP5HYV8pjdFCg5XT3lSo20p5bc/pbfN032woXh
         H336EtNIUGVWBjelXxoibQ35Y8ie+5zqUtLXy94FjwlV125ZjY9/YKjqBMRCUtFCNBN/
         fGYtofewXuSAbGYABaACHVVKhLJXZidN+KVGHdi4SwWFkdKF4Tj2PI+hSopV7OOdCTtc
         fL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557968; x=1796162768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        b=fPaVk1FllH6kVgi1TR2o3lxv6UYWL4vPH9vV72iPoF89qUCVZAyyU18AJ5TWNifiDK
         kkXflcChAoXZt49Lycaq3DhuDY31x9Chp6OkLjcTs5BpeoXg8LJ1cSfp8ul+SDIT4BNb
         XjrJ+6Iy9c5JK+WJmaQ0tm7czIQNsdMJjTnl/smwEBKNIUItfWPDo+O7HwbzpofpmZD3
         bz+PIlDxuLeW6En/lGgfvzLAInihrlKsfM/UWq3/oFrlGsO9UsXjB5GgU7XunTgbOWW7
         v5UbcLp1uwMnvDoIRtaTfW0sA1wqDDroDP6CMp2FtpR6QEsZp0+SSMee24pyQkM29O6u
         CC7w==
X-Forwarded-Encrypted: i=1; AL+hErE1Wsb5guMp3KHR7mnlLWxZ8+Jg0prMN6MaP0EKHfwnSUXXs67CqTdLu9QzmZlZAcauTwOHszWbuggQdt4N@lists.infradead.org
X-Gm-Message-State: APuU4Z9p2lI84N/vw2vM5IquLrhn9lVgo+n6soEhQ14D4zrBZSGrIY3H
	PaB2/mUt5sVs3i27ABVCDohTatnIKlJeUGNFyxXY+7N8oSWCLCUQ7AVjHd0yDJv9E5VZNmh0tI8
	BPpM46nuSjuWd/Kj5t4l7EKUgWvS0p9U=
X-Gm-Gg: AZFdTZcd2mc1V3epjOiYSnL0BOixYuku3wMX5gyrnTP9dDJ81ZNs0uP8pXZzay2qDzc
	FRluAy7tlqwqK87n5TM4ae9Gs7EhEEeKnoDZBMGun7rVETl9Gm0DVl6uSYFom9RdkHxMexgvpPM
	jfOAZahJnBFNEJB+0xUU9PUtIJGGOVtXT1x+gto/vuCynrda452m8Wpnc2aOx25DTVU9ea6dPD0
	brllCuG84CAbVMRyX2RgtDUaBF9X9dIu79zDMYoNeJ2YHRaMFrMlG6mzFevRQgff6Rz/FUtIr2C
	8u58DFkRfgZea3lU6vsjZiO+VzoRbBawLzioRqEWfgPQ9U49xIzHafY2GyH4/XqSz1qmeArW3Hx
	IGUks5A5ZM0HEyK4eNEaL4T9SI3xIduV7lqhXi7q7M2WAqS5Qu71s+2kOWZ84dwn23wuYzA==
X-Received: by 2002:a05:690c:4806:b0:8b3:33cf:1ff8 with SMTP id
 00721157ae682-8b52047e1abmr62214977b3.51.1795557968035; Tue, 24 Nov 2026
 14:06:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
In-Reply-To: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 23:05:57 +0100
X-Gm-Features: Aa3M54obAOudEtwcvYkDuGnJHvL3A4XdBNW-oHonc9K3rZo32rUzvFY7EEi7VPQ
Message-ID: <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ulf Hansson <ulfh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_140610_366195_BF0D1AB0 
X-CRM114-Status: GOOD (  13.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUm9uYWxkLCBIaSBOZWlsLAoKZmlyc3Qgb2YgYWxsOiB0aGFua3MgUm9uYWxkIGZvciBwaWNr
aW5nIHRoaXMgdXAhCkkgbGlrZSB0aGUgb3ZlcmFsbCBhcHByb2FjaC4gQmVmb3JlIEkgZGl2ZSBk
ZWVwIGludG8gdGhpcyBzZXJpZXMgSQp3aWxsIGZpbmlzaCB0aGUgY29kZS1yZXZpZXcgb2YgVmFs
ZXJpbydzIEFVRElOIHNlcmllcy4KClR3byBxdWljayBub3RlcyBiZWxvdy4KCk9uIE1vbiwgTm92
IDIzLCAyMDI2IGF0IDg6MzjigK9QTSBSb25hbGQgQ2xhdmVhdSB2aWEgQjQgUmVsYXkKPGRldm51
bGwrbGludXgta2VybmVsLWRldi5hbGllbC5mckBrZXJuZWwub3JnPiB3cm90ZToKWy4uLl0KPiBP
dmVydmlldyBvZiB0aGUgc2VyaWVzOgo+IC0gUGF0Y2hlcyAxLTM6IEZpeCBjb21wYXRpYmxlIG1h
dGNoaW5nIGluIG1lc29uLWd4LWhoaS1zeXNjdHJsIGJpbmRpbmdzLAo+ICAgYWRkIHRoZSBuZXcg
YW1sb2dpYyxtZXNvbi1oZG1pLXR4LXBoeSBEVCBzY2hlbWEsIGFuZCBhbGxvdyB0aGUKPiAgICJo
ZG1pLXBoeSIgY2hpbGQgbm9kZSB1bmRlciB0aGUgSEhJIHN5c2Nvbi4KSXQncyBiZWVuIGEgbG9u
ZyB0aW1lLCBidXQgSSB0aGluayB3ZSd2ZSBiZWVuIGFza2VkIGJ5IHRoZSBkZXZpY2V0cmVlCm1h
aW50YWluZXJzIHRvIGhhdmUgcmVnIHByb3BlcnRpZXMgZm9yIHRoZSBub2RlcyB3aXRoaW4gJmho
aQpCdXQgSSBjYW4ndCBmaW5kIHRoZSBtZXNzYWdlIGF0IHRoZSBtb21lbnQuCgo+IC0gUGF0Y2gg
NDogQWRkIHRoZSBuZXcgTWVzb24gSERNSSBUWCBQSFkgZHJpdmVyIGltcGxlbWVudGluZyB0aGUg
SERNSQo+ICAgUEhZIGNvbmZpZ3VyYXRpb24gb3BzLCBhbG9uZyB3aXRoIHRoZSB0ZW1wb3Jhcnkg
bGVnYWN5IGNyZWF0aW9uCj4gICBoZWxwZXIuCkF0IHF1aWNrIGdsYW5jZSB5b3VyIFBIWSBhcHBy
b2FjaCB3b3VsZCBhbHNvIGZpdCBwaHktbWVzb244LWhkbWktdHguYwpUaGVyZSBzZWVtIHRvIGJl
IG1pbm9yIGRpZmZlcmVuY2VzOgotIHR3byBhZGRpdGlvbmFsIGVuYWJsZSBiaXRzIGluIEhISV9I
RE1JX1BIWV9DTlRMMSBvbiBHWEJCIGFuZCBuZXdlcjoKSERNSV9GSUZPX0VOQUJMRT1CSVQoMikg
YW5kICBIRE1JX0ZJRk9fV1JfRU5BTEJFPUJJVCgzKQotIG5ld2VyIFNvQ3Mgc2VlbSB0byBoYXZl
IEhISV9IRE1JX1BIWV9DTlRMMy4uNQoKTWVzb244LzhiLzhtMiBIRE1JIHN1cHBvcnQgaXMgbm90
IHVwc3RyZWFtIHlldC4gVGhhdCdzIHdoeSB0aG9zZSBTb0Mncwp3b24ndCBuZWVkIHRoZSBiYWNr
d2FyZHMgY29tcGF0aWJpbGl0eSBjb2RlLiBTbyBpZiB5b3UgbmVlZCB0byB0d2Vhawp0aGUgZHJp
dmVyOiBmZWVsIGZyZWUsIHRoZXJlJ3Mgbm90IG11Y2ggeW91IGNhbiBicmVhayEKCgpCZXN0IHJl
Z2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
