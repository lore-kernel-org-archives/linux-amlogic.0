Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C62C369AA
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Apr 2025 12:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BigMRH21sPfAC5zTMP2JuS9zmkiQidD8dfO4qgP3sY=; b=manFLuumK4tywv
	KbTSzwUTJTtqFNtAk4kh+YNWDb2sD6cAth9Db/xGI/D9kxArFa9kiAEY+c3Au7gqydc+oGmMBksO0
	Kxt7OiqZKOQwwXsvOSe9z6CST4wwOurKwIxETpDTe0GVZesSFmSfUnCSpjf5zuexwaj8qhNXM1dFK
	65WP9ahttOHMaiRusOHJiZPAA72MvJPz8ALxGwg1YP7JfPFEWTHuNDM9NeEBlUcq4Jmq/XBxIZSzI
	OIAfwXRT/IvTWsxFBtgSqywm4HlvYreh868jtDSqPJkg23bRPIv43S+ntE7GelvYgjAqqb3ZPV0be
	TfBpIaKGaNOofuGXkt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rKb-0000000AYsd-1rjw;
	Thu, 10 Apr 2025 12:48:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r9Y-0000000AWYF-2GsQ
	for linux-amlogic@bombadil.infradead.org;
	Thu, 10 Apr 2025 12:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=; b=Z7fiKbC06AJg4XNqwP5B39mdNm
	XmOQI16VVK3pSs5yP0uS4xQBPUV5H4z4YoIHLWqEwRoThwv6AL1ehZs9AHshM8wvADNzLFno11w6g
	KVP51L17lxswMRY/o+Fdd/vww3S0o6gUrDkYhHqkPUjKnSXqNd+b5iqjNsFQHkWBsZwYHONyT1/IF
	QIZeYvI29CXvPpDX8fyPgxaZZYypPaSj+3taxRH3UM9JvUYs9PHwePfEWA0lvw181ooWxwiis3xFK
	JNnNbrB69kLiq2pfmqWRIzXSFa8Hte1kWpRWGR/ndaCG+zvkuBdL/JKDcV/IGiefAobQSg9BfNarj
	21ghNJtw==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2r9V-00000008og8-0jyA
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Apr 2025 12:37:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso7814755e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Apr 2025 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288623; x=1744893423; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=;
        b=Bhog0H53I+LmfUtN/sVi+m0X2iFw2u8kqg7iir1jXBMJqgsKSo8sDwbeymWprDF9cx
         lQCl1l26bO6FUk4PXoZNBxOf0Z7GY2qiW8kt9sB0jqpgpJebO941eIyhwZJTT6qWWorS
         mZVvIg8/FKC4eD+c2VT+zeyBmgFDiamj+zhkzb05Fraw6i23+y/cPO/PZAKX4eKXD23i
         bM1dC0UtUofMuCldWtMlhujI8vHgztO7Fw2txpVFtGNarNU4uKBxExvaQihfkaM7mZYU
         24n/yDoTkv3qHsZER0PgrirqnAW+Zd1pkQmRMVPIKwTqYhgdsV1+LNoecEd2j3nW9m/b
         dbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288623; x=1744893423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=;
        b=cs2dNuxn2519hgpBeCc+3Zz/qJMjAVXmjZABN5sWH2hbgLA9X93/ON+ATN0G1TVDHe
         0kMZ1BT+3xfoMMcZWOEb/Iw8bPkVs+3FjLBok8jRkuFQcmt7znBhO8RbM/RA4FSe0kb4
         1QItkJhgInZ2c7dLlLLwK5m5Us5ciMhM0wmSArzqEKZxd8fbLn7phKb0A0w56iqEOeSm
         dWGxD7W+K4HehO4Zjhv83MBIRfIIYI2klgPtrZpjmqmItlj/xAuGac7KULV590xDcYuS
         I9AADFnAAqozAsA3pqWucgWFEX60q29F4Ni13iSyllfTe6htwoSd0KmZx7KgAd8RofN7
         JNuA==
X-Forwarded-Encrypted: i=1; AJvYcCVlrOR+IhnlOrcFyzaxtUERR+hD2NOrrBqgHPsKswYySE+f1yCdb6OHmr5kzQWeGYcw/kTADS5SWZSM9XxR@lists.infradead.org
X-Gm-Message-State: AOJu0YyB83airNWwMJepsuV3fbWji1mK9It7V5h7eOJjeCgG3ASou84I
	Ix9Y53I4jvrtpTkuLf9MK0D7igPvGNXMCwOJhrioyVo4Kv5BksF+BlyezeldtR8=
X-Gm-Gg: ASbGncuHM06gNQVLvfUOFVaCPZoSXxRHAOhPqsE0rGIMKkWrMu0DHehJBepppeCNjkP
	XK5fqMapKAVgViBNQ9rAZ55xyfFw/WsXepEMOTTYWu61cF4li3ObTst8naVJIg8oLvVBTcrVzJp
	VVZ0zfqEmVhYm7ww4Mf20nbI8MxaRt1Nu//H9mHdgpHtslNO1d6RP1Ri2dVRosfhtYIYCHlIH58
	AsvUFC/XfG1oVz1V0qZgXflEOrR9JpGbbVxBoB4DslfdwRrTw7QU/Z/2sh+vowNuNwj7O6P9jVL
	FLPxIf/RqhKnpepiCubQt5umSPf83+wySTLiDTr3znVBqPhSIRpujgI47Q5RCcGzm9wVkhvjw0E
	B4Sins+iMHsqjDg==
X-Google-Smtp-Source: AGHT+IGMoIZKu18tKxGlE0nCM035PBeR69RdqmMHuq8h1Eu58CnOlQWvz4UQddkUAElDY1GsfzU8ew==
X-Received: by 2002:a05:600c:348a:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43f2fdceccfmr22721935e9.6.1744288622955;
        Thu, 10 Apr 2025 05:37:02 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207cb88asm53015095e9.37.2025.04.10.05.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:37:02 -0700 (PDT)
Message-ID: <20de7ce7-1cfc-40bb-9457-84e462cf4483@linaro.org>
Date: Thu, 10 Apr 2025 14:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] arm64: dts: morello: Fix-up cache nodes
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
 <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_133705_372583_E72DCEC8 
X-CRM114-Status: GOOD (  10.75  )
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
ZSBuYW1lIGlzCj4gYWxzbyBqdXN0ICJsMi1jYWNoZSIuCj4gCj4gVGhlIEwzIGNhY2hlIGlzIG5v
dCBwYXJ0IG9mIGNwdUAwL2wyLWNhY2hlIGFzIGl0IGlzIHNoYXJlZCBhbW9uZyBhbGwKPiBjb3Jl
cy4gTW92ZSBpdCB0byAvY3B1cyBub2RlIHdoaWNoIGlzIHRoZSB0eXBpY2FsIHBsYWNlIGZvciBz
aGFyZWQKPiBjYWNoZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJv
YmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYXJtL21vcmVsbG8u
ZHRzaSB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
