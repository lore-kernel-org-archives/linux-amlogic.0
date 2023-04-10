Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DC7C77B71
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 21:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtjZFj5vU2ehT8uKtHgrNPD8Iw3rroWFJiILSKrOakI=; b=N/7l0FH0a0VG+m
	MhMJ2lZz3UomSBtXVopL17sTkhUdRzdoJWy504OaKAK+zB072iv078jlglQhGu61ov8jcUZfj1sOb
	vt5FyvEz0U5tdM9dPSjxv3MIzhaxGM8XrBV0S8f7E0IE3ph4FINRarpmF/XploRvV3wc7MYsdy5tC
	j7OfCj2LgKB1BvwIFjdo+iQ/rz5Yr4PMdyjYDO8K6B+bA5z310yHlrVKs6qOD+6aITZXa2S1vsp2g
	URI+XMR1stjAZ4hJ9b1Sp8qCEuc5oi1J7O0k0AKrKHDNq2PivLHJpDrFGukFyiiqYJdNir/r4EHIp
	VG5aeK4T/vNKYvcscrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plytj-00FxFB-2A;
	Mon, 10 Apr 2023 21:17:59 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plytf-00FxEM-23;
	Mon, 10 Apr 2023 21:17:56 +0000
Received: by mail-ej1-x633.google.com with SMTP id kt17so3233044ejb.11;
        Mon, 10 Apr 2023 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1681161471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HX4pMm0HUYEgd2HxlMec5J8tdhlQ5dZZpC9ZyoRDBIw=;
        b=Mf/2sJDz+Q4/r6ZzIqgYpTRIMkeidgGXr5qgvkaW0hCi1LnR/EN45FJeDOZGhdmn9Z
         qYqbrpBGAhFgBHngNfpROJXLRi/Ggsuh3bhekiBgZhJz6Yf2FNqzuRt0R5s5TYLbUDBG
         0C/nLRQpZiIUpxAVu4BySNEh+mYV4SY4fNOoBxEttoOtX1nq6C6+4qum/rEemEJ/3mjV
         1IC2gBBSjHCR9h7G/x0n9qksEZ7ckpaDnw5ZPUdunTdlGqG2oJjyI4JvkiLAjqq2bBZ3
         12E7YZKDtYFDSz2i0LqM5svjqWfFThBkqHw6DEDcM1sIf6bcTz72EY2deds3/QONc9GI
         IWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681161471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HX4pMm0HUYEgd2HxlMec5J8tdhlQ5dZZpC9ZyoRDBIw=;
        b=Ug4w2T9k9lirPn/wYcmCo02I8FHVgVqty0rPxuNnekRpvXdFzi1TfQdyyRe92iYyfm
         8i6DlAN4PLXJy07oh3zOIofvPOrBIr6BFj+1tfYkrkYxGYROZ/wVptVK7nQ5Afurnwva
         TpmOyPo/xuMFiA3evlvw2z9DZDrb7Oi1h7T2jBKj/18ItmeOy52hwQfhMuUJgNE0I5V2
         cFvXHuc8v94uwAN39zgsyx2jv8mnQ/gzh/7czLOGIsYt62PH+eKiI1UnTd7yq1/d3MtQ
         I/ypheahdfmPWuL53jOQUAatnKfE6CrWW4zvBukTD3yKtwa6vYEv64X/PwtMk76d8X1a
         z4eQ==
X-Gm-Message-State: AAQBX9fAVzBFdmpjWk2Ly7zbxgqxzMVthMPL2YtqxVAxpcVzedd/IB/F
	HlUv7mwUMorhl32TL6UK5Zj0WnkguhOdqlsl9nc=
X-Google-Smtp-Source: AKy350YXOtyl8kqEN+naCYoiJKtnE7t02F/SyPuKcF33pzLILbum3kNrqoFNlOANdeMKlYMnoqA1VBXvBdAwgJAstFw=
X-Received: by 2002:a17:906:b301:b0:930:90ce:a1a6 with SMTP id
 n1-20020a170906b30100b0093090cea1a6mr3288633ejz.6.1681161470764; Mon, 10 Apr
 2023 14:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <ffc3e4e7-b2ea-1a56-4fff-6554ad3775c0@gmail.com>
In-Reply-To: <ffc3e4e7-b2ea-1a56-4fff-6554ad3775c0@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 10 Apr 2023 23:17:40 +0200
Message-ID: <CAFBinCAbG1apYVgaMuegk=aT67YXer9dfc3NEuLbjxDwPEJR0Q@mail.gmail.com>
Subject: Re: [PATCH v2] pwm: meson: fix axg ao mux parents
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org, 
	Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_141755_672505_0C88742D 
X-CRM114-Status: GOOD (  10.46  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBBcHIgOSwgMjAyMyBhdCA1OjE14oCvUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdl
aXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGZpeCBpcyBiYXNpY2FsbHkgdGhlIHNhbWUg
YXMgOWJjZTAyZWYwZGZhICgicHdtOiBtZXNvbjogRml4IHRoZQo+IEcxMkEgQU8gY2xvY2sgcGFy
ZW50cyBvcmRlciIpLiBWZW5kb3IgZHJpdmVyIHJlZmVyZW5jZWQgdGhlcmUgaGFzCj4geHRhbCBh
cyBmaXJzdCBwYXJlbnQgYWxzbyBmb3IgYXhnIGFvLiBJbiBhZGRpdGlvbiBmaXggdGhlIG5hbWUK
PiBvZiB0aGUgYW9jbGs4MSBjbG9jay4gQXBwYXJlbnRseSBuYW1lIGFvY2xrODEgYXMgdXNlZCBi
eSB0aGUgdmVuZG9yCj4gZHJpdmVyIHdhcyBjaGFuZ2VkIHdoZW4gbWFpbmxpbmluZyB0aGUgYXhn
IGNsb2NrIGRyaXZlci4KPgo+IEZpeGVzOiBiY2NhYTNmOTE3YzkgKCJwd206IG1lc29uOiBBZGQg
Y2xvY2sgc291cmNlIGNvbmZpZ3VyYXRpb24gZm9yIE1lc29uLUFYRyIpCj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKPgo+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
