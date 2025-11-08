Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3386ECCFA18
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOIYZxtw7uKBlLVp8kN8Sj0Yf4K/6HoZ+5j+TMcMIWA=; b=WfxWMUnlAbJyTA
	Knufzq/mpifC071GnX9mA04i8Gu1aZDso1p6QuCjY1Fd3nW8b1HzfEdUCpJFfUFLtz5gNJktbl1Bv
	sAciDg2LgDecFKLJ+frJvKtgVC8GAooLg3On5/7ZZcW2fzxXdR3Fcx9OUAzEGtaqlRmo0qoD3mG9e
	cd6r01DKULDJSa4vT4APRGLClecyIzdtiy/ZHtOv5VTgLtQYYXnmj2UwsL4LwM9GRfgYyOoUyKjGp
	IRgN1JKmnV2J2ouDKs2tXJiwAv8UiJBGqvqr4/qhejzQVk8+OLZdlAP/KxsQmgx5qxvWRW6DhiGgW
	0A8qcMGjK6mN+N5ujCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi6K-000000037Ai-0zF7;
	Sat, 08 Nov 2025 12:31:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi6G-0000000377x-0zVN
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 12:31:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34101107cc8so1265909a91.0
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 04:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605083; x=1763209883; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
        b=fIf3w2bVAq5YPmJUA5shFinG41AWqtA8AJ+wOdu6FDdFKb4bFzCoRSv2zscTXlHI9P
         uyA69YFj5QM78PX3FsfqYpO4eVCCzv/jBnJRPVfScrom5RNjPdjn7t7rvTTRu/23y/HP
         UDhdReVDcHcamhCKS2saDgsyiM59bxAH1aVL2Yyh94YEqAkavPusUmK7YR/3xS6LK0Ot
         9s1rt+1mVPIXRhMpoT2g3PPMcyauZVOIRXJb/X7luStQhiD4q057CkEp3dHZf/k0iAkn
         3Q37nk51SLy4BXqEQ8NMO3C2wQvi2v2bz22iDsiTg+DaJimCBId47SsQb147ipow31m4
         e+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605083; x=1763209883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
        b=NLQ+G4Yab46ZnGKrlLyW2g2qRhqP0Lrx7q8Cyrw7xvgg7TRzHIDUxLUKpFzzswLosH
         l4hW5MEexuTS2G2pJ9hidCienJfV/Jy+TCZxwXGxe+6uN8nXRnbg3QoOgAVjVL3Y1I6q
         oGT4NUyt97g3FTboBqMVqobVCeviLvinHZI3C6vjcEBoeX8GwN/faPAC05enWbXBk7tw
         3GMnQ9twhMXnEd/BEfnGLFqvGIjjGW2Jsr5OCOz76tQDAVZpvcGSm89VQDy8sBslIeB8
         /392KsNzRPjBXcE0OCB9G2j8LbVZ3aRH8AhDFk2j/AC/j6buKsOcrZCL03XBS5CRKFeh
         FW4A==
X-Forwarded-Encrypted: i=1; AJvYcCX0V2lfj3cMoxqJTmVTjue77AHrBo0z47RrSVRlRaJSLgqrmR+U12DOwExvXf2DeNLhCxohtvbnZRsLmk9F@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3DyO5hi3eY7O3p5wLZ8ByvCiT5wMAw+z1mE3yhFtjxjoTGpOg
	FZDaUPa0MA+sMm+MnnWrDMhY+6ZslgqFjBPyxOVPEAMcqHUTZz+uER9FHXlNfh3hxEvkpHaQJMI
	Gfq4fLpXXPQIGeVx1phBnx5+xO+wa9i4=
X-Gm-Gg: ASbGncvsKsZZ+EDDGz1RqjO4EYZ/Un4d3O3/0sC0JbFL4TbPfqnJMKW2uxmKXHGQcNx
	5a9TQKQbLhpcSOCLWtQDQdvxK5jD3vRs4QewumKv7sCd4wAnpycuhDxy6XoIP/PDU5vnq3sdc4j
	mi24DxY2xPI9EYA8ozw+KT3/77NApPPB93k0P5KGZANJwsMdDXv5i1nhLKKekRlaIS2UAbn2tEx
	saKNafnzQdcu+2xTyIdJbNlNX6iuGFpRl84ELOVbeV9wndeknMJ0j0+kjGEz6rTBhnSolcLKby3
	eZn3b+r8Zg6b6bev0JPf/Fwv4yuiFB8l5qtd5Q==
X-Google-Smtp-Source: AGHT+IHx494bsoHJaju4RengP4iXpGRFmMQLliiMWy2Q89R/cSWBMiB3q+hcgQyoomcv+0z0cS+rAooMlyw+VCTekJU=
X-Received: by 2002:a17:902:f791:b0:297:dfc8:8fd with SMTP id
 d9443c01a7336-297e571236dmr29139155ad.51.1762605083407; Sat, 08 Nov 2025
 04:31:23 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:31:12 +0100
X-Gm-Features: AWmQ_bn_kIDv-pwz4dNwmzBqCanYs2atUFgMMshyNEi0RKuzPdaQ1v4towlIcoM
Message-ID: <CAFBinCBp1x3KWe-5mWoGwFEVxEoSKhTXKYfGgNKS-eDsbW8X+A@mail.gmail.com>
Subject: Re: [PATCH net-next 09/16] net: stmmac: meson8b: use stmmac_get_phy_intf_sel()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_043124_334436_6B7EC56F 
X-CRM114-Status: UNSURE (   7.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAzOjI54oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBVc2Ugc3RtbWFjX2dldF9waHlf
aW50Zl9zZWwoKSB0byBkZWNvZGUgdGhlIFBIWSBpbnRlcmZhY2UgbW9kZSB0byB0aGUKPiBwaHlf
aW50Zl9zZWwgdmFsdWUsIHZhbGlkYXRlIHRoZSByZXN1bHQgYW5kIHVzZSB0aGF0IHRvIHNldCB0
aGUKPiBjb250cm9sIHJlZ2lzdGVyIHRvIHNlbGVjdCB0aGUgb3BlcmF0aW5nIG1vZGUgZm9yIHRo
ZSBEV01BQyBjb3JlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGlu
Z2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
