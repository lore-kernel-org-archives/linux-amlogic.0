Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED79CCFA18
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 12:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7L13AYblisr2Sog1LoK9JTTQng9z8VTsaaxo4TKRUo=; b=Ly/MHiqtNglc8x
	iQnEnkKtlz7zhvpzsGHyTem41/dw/tB5SWjz3INZahFsrABXU3bfsv+YS3CqbJBwUMalDB/RteQYn
	9jor0D/inTOXbK0Ybr42J49lz0wt67e/JzqOyavtEh804yZNu3vD3dAOfHmQZTmlfenMt2UWoNLui
	f27OwejE4+nbMkY/RYWKTfstvwdhgse+/k5inERqzGTGcyUkImQ3unyr41pr5FuZgXPcyY2itWqEL
	fU2rF/48oK2vvyL2WAeDlvO99VkxWUx+faVym8Fv1NFsC73jK9amCTfSptWgu4MxxYyTr46x50gMA
	ovbtcC1k7VOa2ejdZWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi64-0000000372p-0TZX;
	Sat, 08 Nov 2025 12:31:14 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi60-0000000370n-0wGz
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 12:31:10 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-794e300e20dso1068732b3a.1
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 04:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605067; x=1763209867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
        b=X4Dr+pkbxK6mPAb21GwdJxmUq4lxC+WL176LO/GZFBG+yIgj3/vnS8NBxI8bpKutwh
         t+EN8YVBdnLUnj+3c+QNDdlMIeJPOCoqJEDWYdfqG8qePxyHp2xYKozcNAP1G78xVANB
         k6UbxZnSoAP6PXkx3w/y6Yyo+rwS76SDrFb2F9wqU+dJXYfEXMRt8bhaOJ9G9F0SsCXL
         FtFqFilwD3IeInkrbfcbnnefruC8M3EOK4AWmvhukMwZLQL++asEkcL9xEFyw+xAZCwO
         KhEjAr69GIHnGBcZY9mBnuUiUxezqOD4mODgNAqwYQXq95lqWyvxp5pBJWi0JQtl5cn/
         2qbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605067; x=1763209867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
        b=NHTrufjKb2sM1ljCIF/YaMGeFaK+G6fr/70VQ4AztAPZhWHP+XugGrBXM06tUPCSt0
         eQ2q72SjtCNC6fmyHGR7xRdTlnZdT74oM/mF438I7aGt/034ETEK/hNi0lHiMOeM1TuT
         pP3QKOnka3xPGWN04CAx0U/fz6aYnUV6j4SPrYAcEtg5P+JhAZ64nsW1zxV3legWPKYr
         K45ca3RRRO3BNSlTz34PfB51kgSp0SP3SrFsyjcZ4GjnI4Sfpzbl65uNGrNtM7s9ErlS
         p8lzKIFGOwSZyTPBaSILA3F9QUB3/GqCZV9ouDtCJ2o0LmFnZEpUxY7J9YCOVRva9lPR
         Txcw==
X-Forwarded-Encrypted: i=1; AJvYcCWJS1odmBxk1DiRiGzW7bg83g1kwdD6JuMVoBgTGQzHIS8A662euVoM//Yjq8dUd87nRsVN+9USEwiGUQTp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy89JBgYS+31PKfNl+lNKbmhRon9MFU1Sv6B9TeYcEO0hvCEFmD
	+cYw0hT95k3xyVXSK/sBcCI6zga/CwoDrUgUShglSENtS9R1af8IlqDdDuQqTMxZdNoMqe/72m6
	ILXt3rwYofkSZtyDlrvaapI/xCmiIsJ4=
X-Gm-Gg: ASbGncs2/sDogOSykn+hefTxkHkgkZYlV3vf+C508bhbgTI3IhyB8cRuUxubrUIkNaJ
	njFue3t+xPudJ5Z7Cfvsz3/zNhD4MVdKlFT6IwYUQtAmoufSEsEtGRkc6tq/aI5IS2Ccap7mlm8
	eGIMk0c/CAb0Sn32ry3sO8/9N7O5S5OI+Ltp9oBHhwu4xkbLplBrbP2oZqOfBKGUjOLsInX/5ed
	ntFXWvFLptrHBFP7Bw/ZsQXLrkYTVBYFfSgxUXPFcGmrpSFZlOUbnW+EEF8fCBtOfkyvKzE4ewu
	LyLPccF3lllhK2hZ
X-Google-Smtp-Source: AGHT+IEuHvgMZMmDRNRPAfeOAymHEAn1hYvpEGWDduP2LeVblYn4NjcSRVQL/UdeJaq1Z4u9o2SDmDIZmKAPg0jARQs=
X-Received: by 2002:a17:903:3804:b0:295:5898:ff5c with SMTP id
 d9443c01a7336-297e1e3429emr34741885ad.16.1762605067406; Sat, 08 Nov 2025
 04:31:07 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:30:56 +0100
X-Gm-Features: AWmQ_bkQCCCHuH8ylnNhyHhFQTUKFqSEN4LNOb9Me0YP6OYeddbK-4LWE8Q83H4
Message-ID: <CAFBinCDf4rHs-Q1ZVo_WqF1r8_aLJ745B0tG+=6NpmbBOe2c9A@mail.gmail.com>
Subject: Re: [PATCH net-next 08/16] net: stmmac: meson8b: use phy_intf_sel directly
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
X-CRM114-CacheID: sfid-20251108_043108_341043_5ED44789 
X-CRM114-Status: UNSURE (   6.66  )
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
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBSZWFycmFuZ2UgbWVzb25fYXhn
X3NldF9waHlfbW9kZSgpIHRvIHVzZSBwaHlfaW50Zl9zZWwgZGlyZWN0bHksCj4gY29udmVydGlu
ZyBpdCB0byB0aGUgcmVnaXN0ZXIgZmllbGQgZm9yIG1lc29uOGJfZHdtYWNfbWFza19iaXRzKCku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJt
bGludXgub3JnLnVrPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJs
dW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
