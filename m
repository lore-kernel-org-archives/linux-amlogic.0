Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E61C77B72
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 06:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLhUjVNfb1EdI3iK/3LU5V5k+SlwRQwl41EuVAr9kpQ=; b=MY/7A4ULcD+FZq
	6mdGFZV94Id3emmtZ8l6ovYNAh8oShqXHgOGWG6dA81WFuUWv0K/CmsLXNCL/6I4n7cFuQ3GnuUxm
	zJwlyGvrSsruXSfkno0OmiFCyv3jigdFVrq0vuNPgcDASdPAl37QsqehdlnRd7E8wnflDwQIDycuS
	WQJ2uUu4jFU48GdLR4fLbsvh7qNtmh3njYddIa+reEtsGuW+O6cXKSv7TvefIy9jG+h0HTxQLEclC
	UemkUcx707XtLTGRI3+fH3cyOpaYUIEutZm4y+deIEYeHt/CRtXRrYOLIL+0bwdMACEAA7FMnoF5z
	SBE2ryJwZdI8MdesGdKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poIDo-00F234-1X;
	Mon, 17 Apr 2023 06:20:16 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poIDj-00F1zW-0R
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Apr 2023 06:20:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id dm2so61321246ejc.8
        for <linux-amlogic@lists.infradead.org>; Sun, 16 Apr 2023 23:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681712407; x=1684304407;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJzj86LhSJdAtbDEWAVBqUw/9fJfGhViwtTg9bTQuwI=;
        b=UwxNUHi1Q2SgXqIq3683UkBdctv5eKKX4T6cw2UjfsXc5YW6Z3PBE6NlPjLW6oVX8G
         kwN3WLBuMU05G6+iRNYz4AZAV6bHlfUVNFqrywbO0pBt8oD6KYzVcHpeWoGmx1hDTw2Z
         KDBCiGit5JahQBASnL1rzyGRy43I70DwwKGxJ2LI1rlRjLOC+s/4sO1GLMxjvOkb1b/T
         5+39CQS1xToB6e9McpvQoD7TYUklpGa9WnUh/ubH/roqVLknUgjocOXkSxqtFtXXR0PP
         dC31xa56ppER0VHU4Dpk+mo3NIAVMs1Nf0+pr4opnCQ2wUQ7Noh4n4hLAjs8xQFRm2bX
         ct0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681712407; x=1684304407;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJzj86LhSJdAtbDEWAVBqUw/9fJfGhViwtTg9bTQuwI=;
        b=Ni2VtMnnWrqAcPEyc2yVj6QOiw98St6HV2RK99xZRfzBeqhYcenoDtGuyOiA8XCsW9
         AWXB1yM2ACT495arh2PjthDIMv1wryL3uDw9nYnsSH3S2GPmeFjXSLIVFPn0vAqqKnXh
         iAo6Xbm6oJnB4AHDuWRLcIemv3DunR+YNl2/ljszJEwLgqoD0VCSXvzd4nqdhkTpivIR
         KVwWJPdB+fh18RJaC5kN7OZOEYrJW7BjJZ82u7iATEduqk0PEEkMOTE0N7ZyBLcT2Qek
         Hghj4ooxy9xgoxiWeoYJEMYQA3vib9OoRZbMayMunv9EVhgYHffqwpuVrUhxRxJA6wVx
         xUHA==
X-Gm-Message-State: AAQBX9cDGWnll8moR7pl3O1LP+YFieQc/hhPxbmLSD3ASjHpisXIO6UI
	OnIowpH7V9/fnFOZEzYgFp7Usw==
X-Google-Smtp-Source: AKy350b8SXOaVHs71B0PzryL6gYZwUkAWF9/MWVAL9BYOIq7rQp8WPjgG4lUStlvKPn23FMl4BQA3g==
X-Received: by 2002:a17:907:a08d:b0:94f:8f37:d4e with SMTP id hu13-20020a170907a08d00b0094f8f370d4emr707144ejc.65.1681712407414;
        Sun, 16 Apr 2023 23:20:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b0ac:4d3b:966c:b33d? ([2a02:810d:15c0:828:b0ac:4d3b:966c:b33d])
        by smtp.gmail.com with ESMTPSA id s15-20020a1709060c0f00b0094ca077c985sm6072788ejf.213.2023.04.16.23.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 23:20:06 -0700 (PDT)
Message-ID: <9edfca01-4191-8eca-32c6-c95f7c7601ae@linaro.org>
Date: Mon, 17 Apr 2023 08:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/6] dt-bindings: watchdog: realtek,otto-wdt: simplify
 requiring interrupt-names
Content-Language: en-US
To: Sander Vanheule <sander@svanheule.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Justin Chen <justinpopo6@gmail.com>, ?ecki <rafal@milecki.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>, Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jamie Iles <jamie@jamieiles.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
 <75148300a158ceb0f86043535b089838e1d1bb61.camel@svanheule.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <75148300a158ceb0f86043535b089838e1d1bb61.camel@svanheule.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_232011_252058_B897E08B 
X-CRM114-Status: GOOD (  11.77  )
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

T24gMTYvMDQvMjAyMyAyMTowMCwgU2FuZGVyIFZhbmhldWxlIHdyb3RlOgo+IEhpIEtyenlzenRv
ZiwKPiAKPiBPbiBTYXQsIDIwMjMtMDQtMTUgYXQgMTE6NTEgKzAyMDAsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6Cj4+IFJlcXVpcmVkIHByb3BlcnRpZXMgc2hvdWxkIGJlIGxpc3RlZCBpbiAi
cmVxdWlyZWQ6IiBibG9jay7CoCBTaW5jZQo+PiBpbnRlcnJ1cHRzIGFyZSBhbHJlYWR5IHRoZXJl
LCB0aGUgZGVwZW5kZW5jeSBvZiBpbnRlcnJ1cHQtbmFtZXMgb24gdGhlCj4+IGludGVycnVwdHMg
Y2FuIGJlIHNpbXBsaWZpZWQuCj4gCj4gTWF5YmUgSSdtIG5vdCByZWFkaW5nIHRoaXMgcmlnaHQs
IGJ1dCBpc24ndCB0aGUgZGVwZW5kZW5jeSBzdGF0ZWQgaW4gdGhlIGJpbmRpbmcKPiAiaW50ZXJy
dXB0cyByZXF1aXJlcyBpbnRlcnJ1cHQtbmFtZXMgdG8gYmUgcHJlc2VudCI/IHJlc291cmNlLW5h
bWVzLnR4dAo+IGRlc2NyaWJlcyB0aGUgcmV2ZXJzZSBkZXBlbmRlbmN5ICgiaW50ZXJydXB0LW5h
bWVzIGlzIG9ubHkgbWVhbmluZ2Z1bCB3aXRoIGFuCj4gYXNzb2NpYXRlZCBpbnRlcnJ1cHRzIiku
CgpUaGUgaW50ZXJydXB0cyBhcmUgYWxyZWFkeSByZXF1aXJlZCBieSB0aGUgYmluZGluZywgc28g
dGhlIGRlcGVuZGVuY3ksCndoaWNoIG1ha2VzIGludGVycnVwdHMgZGVwZW5kaW5nIG9uIHByZXNl
bmNlIG9mIGludGVycnVwdC1uYW1lcywKZWZmZWN0aXZlbHkgd2FzIG1ha2luZyB0aGUgbmFtZXMg
cmVxdWlyZWQuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
