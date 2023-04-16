Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A0FC77B61
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Apr 2023 19:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0ufDdo4nnuqlv8ng4DXKV13AyFhV8UgPRNB0Kz/5x8=; b=t6AFzzgwkxepml
	LAjARQgjfUYdLuqT2c4aQ8T+cYwyo/JkfNI6FFy2aL2SgWhqfrSiqz/vPlAtzXs+2/vNNMOs+pMiH
	2PgSgL8Bx5gI9YBiLsbEVK5xZsuatXX9Bnhk1eVpWtmNXWoj/10tnsji5nXC8rNcxKnx9Mz4KOymM
	K2pl8deF6jBHEQHx1ODIuB1UHp135dLjMYXLFXGAnhqCRTZrd2B/Bqf0yVj6D6/OVgTO/S5p0A8yU
	R/cOKI3hJ0LI+gzJaWBvI69J9StNne3P7SGCUq5Qtwxp2JjFFqYVFolKs7yfsIFPewNgqPzDj38Vh
	YoQ9vR8IaS2X/jedpsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po7c2-00EK1u-15;
	Sun, 16 Apr 2023 19:00:34 +0000
Received: from polaris.svanheule.net ([84.16.241.116])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po7bv-00EJzF-1n
	for linux-amlogic@lists.infradead.org;
	Sun, 16 Apr 2023 19:00:31 +0000
Received: from [192.168.100.237] (cust-58-62-110-94.dyn.as47377.net [94.110.62.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 31B6A3A3B6B;
	Sun, 16 Apr 2023 21:00:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1681671620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KbiAlrrOOyRd9nSswntO2EM/kuhEbC2Dui2D0jg8mhE=;
	b=yJTuA2IM1/ouSfmFU4g81QYz/Qs036N+Xgao0Ath/i9vW1OlzLPaQPSs5Z/cwJgY+mB5Yt
	9frXAammof4cYeKT3YVKBBWuJmf5TlBYeZdPZpxvHm/UkuLToAfxBulAuQ/nfQnJU4gl/N
	knaWX+2Bmwu0hShO8EBylOfwdt4HsidJ6JVG8BFAGRPK8fnJHUS7eltyRhN2MTg3ab2WE1
	UgpwApF4MwfWTnKCtGazcW0/+MWrMm5ofGGKOhMMnVk7OADQ+R6e9jhHvt6dGh4OC2H0oK
	b9tPCUEGwBSgAzSOzEjLJfpJWZ4oWq8P1U6FwFMzQAju74a9ESqS7tOiZHvUhQ==
Message-ID: <75148300a158ceb0f86043535b089838e1d1bb61.camel@svanheule.net>
Subject: Re: [PATCH 6/6] dt-bindings: watchdog: realtek,otto-wdt: simplify
 requiring interrupt-names
From: Sander Vanheule <sander@svanheule.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Julius Werner
 <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>, NXP Linux
 Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy
 Gross <agross@kernel.org>,  Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Fu Wei
 <fu.wei@linaro.org>, Viresh Kumar <vireshk@kernel.org>, Eugen Hristev
 <eugen.hristev@collabora.com>, Justin Chen <justinpopo6@gmail.com>, ?ecki
 <rafal@milecki.pl>, Linus Walleij <linus.walleij@linaro.org>, Corentin
 Labbe <clabbe@baylibre.com>, Anson Huang <Anson.Huang@nxp.com>, Robert
 Marko <robert.marko@sartura.hr>, Sergio Paracuellos
 <sergio.paracuellos@gmail.com>, Sai Prakash Ranjan
 <quic_saipraka@quicinc.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Jamie Iles <jamie@jamieiles.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, Christophe Roullier
 <christophe.roullier@foss.st.com>,  Shubhrajyoti Datta
 <shubhrajyoti.datta@xilinx.com>, Srinivas Neeli
 <srinivas.neeli@xilinx.com>,  linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,  linux-renesas-soc@vger.kernel.org
Date: Sun, 16 Apr 2023 21:00:17 +0200
In-Reply-To: <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
	 <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_120027_739917_8E66075F 
X-CRM114-Status: UNSURE (   7.48  )
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

SGkgS3J6eXN6dG9mLAoKT24gU2F0LCAyMDIzLTA0LTE1IGF0IDExOjUxICswMjAwLCBLcnp5c3p0
b2YgS296bG93c2tpIHdyb3RlOgo+IFJlcXVpcmVkIHByb3BlcnRpZXMgc2hvdWxkIGJlIGxpc3Rl
ZCBpbiAicmVxdWlyZWQ6IiBibG9jay7CoCBTaW5jZQo+IGludGVycnVwdHMgYXJlIGFscmVhZHkg
dGhlcmUsIHRoZSBkZXBlbmRlbmN5IG9mIGludGVycnVwdC1uYW1lcyBvbiB0aGUKPiBpbnRlcnJ1
cHRzIGNhbiBiZSBzaW1wbGlmaWVkLgoKTWF5YmUgSSdtIG5vdCByZWFkaW5nIHRoaXMgcmlnaHQs
IGJ1dCBpc24ndCB0aGUgZGVwZW5kZW5jeSBzdGF0ZWQgaW4gdGhlIGJpbmRpbmcKImludGVycnVw
dHMgcmVxdWlyZXMgaW50ZXJydXB0LW5hbWVzIHRvIGJlIHByZXNlbnQiPyByZXNvdXJjZS1uYW1l
cy50eHQKZGVzY3JpYmVzIHRoZSByZXZlcnNlIGRlcGVuZGVuY3kgKCJpbnRlcnJ1cHQtbmFtZXMg
aXMgb25seSBtZWFuaW5nZnVsIHdpdGggYW4KYXNzb2NpYXRlZCBpbnRlcnJ1cHRzIikuCgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4KPiAtLS0KCkluIGFueSBjYXNlLCBJJ20gT0sgd2l0aCBhIGZsYXR0ZW5lZCBy
ZXF1aXJlbWVudHMgbGlzdDoKCkFja2VkLWJ5OiBTYW5kZXIgVmFuaGV1bGUgPHNhbmRlckBzdmFu
aGV1bGUubmV0PgoKCkJlc3QsClNhbmRlcgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
