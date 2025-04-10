Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ED1C369A9
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Apr 2025 12:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RP7PlSJwkUXZ0cJku8dcVTLo+46IrfYP8qMQHh7RPJk=; b=QD8RTCCG7U+X3a
	g775RvU3ZHkxTtY+Jr4qM/wyzQGbzEnWeXkyfWJNDwFfU2DSk+gV02TF+oBTuqCqr38faIFwTZWVr
	fJsBZ4nhm8SnKqCxm/ZMMt10LlN0i1Da6nOBk0SzT2KauxmmnNojELUCyQJdN4MfWEEExHgq7qTle
	5iNTwIh4hKO1O87EvVUzfvt1WnLnItI0meTuH7F8W+xJ42/HnfSOZlDsHhgh2nVdeoPjaUUIzx3dG
	yzxZV1K7ECTfg0IwaIhp+cR+q+EMwwU35TefPSvLBS8ZrYw69iT5BGtOLk2Tves95HXMkv09UkCBz
	B6ZX47c40Gnp/bIIj8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rH5-0000000AY2v-0Kgp;
	Thu, 10 Apr 2025 12:44:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r8h-0000000AWNV-2S58
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Apr 2025 12:36:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3913958ebf2so651294f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Apr 2025 05:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288574; x=1744893374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=dmQ9O9beqXDsWaPeGT1oTG472KbdbTYygmfBsFn0sXBMvOy5Cee8FwRk01FYoyINjt
         Cq78AV65o8x+F0vN4Xg7vPxB7sZp7akBzuM+cFwJIWaA2EDBgDd8EhqtAumQ18IC5Jcz
         Ox+qu0e6o5VpECmmUM9suJEue3tH4Zu5giSVQpjbiBy7UnUcR4Oz/kaNiBbeERppKk2G
         y76kn3pUyK70pt0d3MF8XscCdzTpiaeK1fUN7OCcgdCzWuvaPOmqZRgUgkOpsEbXmJVn
         Ojp7LTqoAVo0W9FxkvN9QlwXpp/r1LJ68PdxEyIpdfbWPvULyIpFiWqoJ1qCXy5f/EGM
         zd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288574; x=1744893374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=u9HQi1IsiRI19sjoPrxAD1fjSfeZD+CdId0t2Q3C7IZ+b4AeajSJrLf+pN8Qaeq2i/
         D2C2+f+1KJSKAhIAosJlFqWtwKBJIGjuKtrtnS8+2qYPQ14uMo15s3qtjZx6D+xgrUne
         WQN0CdRp8E1b/O57/kf/49FiKLtRLg4GGXjSZ5tRP+awJ898ABWH7E93MVXXKwF90pnF
         yxJhzsvIRzeQimK1fpJHHi5MoBTsrLuwDTfg7EwcNWMJ6rvSDesAXI8zLGV85Rp8w5Dw
         K2a4cEinPsuw0TFmwXkfNwQvsXu8MLxhVZMfUy2H9R3XNZYVNcsLnRbqNEL4nT3RoYpB
         qrTw==
X-Forwarded-Encrypted: i=1; AJvYcCWZKQiyjKWUsyudGtkRnYpv1fvydAYH736UM2X/Mnwk8MS/ZeGIRvn3d+aWV5wcx6U+fvXt6u6CGlmdzpQ6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8REHVmDNCmcri+hSp0tB0a7vXPbVpBAVk35Q+V9YOFFx7Bjty
	Lkeh3u2VhZz1ap37r2YMnNHBGRDEq5AsmWBvFDa9WZbKFXiW5y5Y04gepBMUbUY=
X-Gm-Gg: ASbGncuUPP/DjdE5We1uEu40U6E3uLc+ZArRemIQ95oIWpPis2uRAX33DQ/z61huOh0
	oiSmvbsFktgTCIZHXjnZzFPzqZU89xyUa+zBM4ro6M4f6uRt+mvK4HN85XUr25mz10IFdPA20hE
	2NhYNTDvMxFfRTMWESlqRAVME9FzqP14ImOUpn7A94E2dTh6xvZP0kygyHzJtmoUwuub0p5clx+
	MfuMh8Q7uR0km3o+kmvjumIYeYpwxidZMFu2vAuKMqiLaNhCOeouijso3we6RaIWdiqusFrJloy
	+rOjFnRhnbrPrZpfylS2pg1DKL68X6y+ay9Jw6ikXtzjwJ4FkKSj0RYYJWK6avGKZf1GkMZn3L9
	sb8Q3bcx3XZAytg==
X-Google-Smtp-Source: AGHT+IFetWy1yp/dwylC0fW3Xc3rkEsOkh6f7DWozfmMsr0xNplY7KcWpRd6urR6Mieq6r6/8yNM9w==
X-Received: by 2002:a05:6000:4285:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39d8f498980mr2285415f8f.31.1744288573720;
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf8fsm4624182f8f.91.2025.04.10.05.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Message-ID: <17b9ff87-899e-44ca-b902-ab965cff0879@linaro.org>
Date: Thu, 10 Apr 2025 14:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] arm64: dts: broadcom: bcm2712: Use "l2-cache" for
 L2 cache node names
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_053615_624115_2C874DF0 
X-CRM114-Status: UNSURE (   8.99  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gNC80LzI1IDA0OjU5LCBSb2IgSGVycmluZyAoQXJtKSB3cm90ZToKPiBUaGVyZSdzIG5vIG5l
ZWQgaW5jbHVkZSB0aGUgQ1BVIG51bWJlciBpbiB0aGUgTDIgY2FjaGUgbm9kZSBuYW1lcyBhcwo+
IHRoZSBuYW1lcyBhcmUgbG9jYWwgdG8gdGhlIENQVSBub2Rlcy4gVGhlIGRvY3VtZW50ZWQgbm9k
ZSBuYW1lIGlzCj4gYWxzbyBqdXN0ICJsMi1jYWNoZSIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9i
IEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgIGFyY2gvYXJtNjQvYm9v
dC9kdHMvYnJvYWRjb20vYmNtMjcxMi5kdHNpIHwgOCArKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
