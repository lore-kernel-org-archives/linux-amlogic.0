Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF338E95A60
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Oct 2023 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUWMPf6H0unT1JRamZR+EfFq7dqag0ax0QwwoYzJXHU=; b=He9M0cNz/EtZeD
	6gNQVn9rXrL7fuJGpI5byxcMhEP7gQ+MANVaGt4F3A8zhTYp2VpNv4TydIwtJ6nk5MRCy94+aIEuT
	w6IWTcawC1BGxwg8mLnhimnYZt2V+7aCgi0umSRNUpblWaz+P2TL6h9DKEm/tj6gE48z3wYtzP68j
	KaC7rz0Neu1g/iUfrJIIO4RHU5w8GP3Eh1Jv9F1abdVRca6CXdGeYuOylx8EnSqbAfhDMB185w1Ex
	lbtW5/jf4+lCVq9zoWcAW/otQAdlgDSqMEFhp73CUgcCNejzTGIL9WwRwH7ydG05MB8zdeCADcRUC
	M+FFCrynCm9K9byfiUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp4F7-007IJW-19;
	Sat, 07 Oct 2023 10:09:05 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp4F4-007II9-1N
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Oct 2023 10:09:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50337b43ee6so3787553e87.3
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Oct 2023 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696673339; x=1697278139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWGnWC1nRItaPmklKxpuYvpPobvm6bbDsTmyxg2t6ZQ=;
        b=bKv+mennLEWtay3RPiEM2eAKNXfiLxq0IkYM9Svyq0pHZzIN+V51SoVM2IWibH6AOn
         2+VCMCB0Sc41FaczwoCjPeqrrxHdqmqJ7Tuf8xys4EWaOIBOrU0ZcBWfDheOIzl/1lPZ
         ytNvVCKkRk+S9pfwBvAaoHOLYa+CsGpeTTko0sUKurS7PjEN1AN1QBJ4VmfVkyMNjCfv
         WE0pJrwdEVVbkzi00q3wI8aDbkjXVn9ch97OB6F8dk+pYIThflCP069Go1BRExP6R+PS
         un4tf70EjpCxifYHEDEYptuOJnW7nl9GgMndJQToBQC/xd5pwl4x4hiIjqNY4axf+b+i
         sgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696673339; x=1697278139;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWGnWC1nRItaPmklKxpuYvpPobvm6bbDsTmyxg2t6ZQ=;
        b=Pr6SF97ZWqHEednYJzxbsyX8110BDhUrL1ykxbHIPpLa9DrsWpGME+gmoXLmP2nLGq
         mXWDXV0FCgmBiRPbKJ+mkR7drYa+Wtf7VFglZnPkaNMfBZ3bzY5mXXib9PYSHkLJXm8Y
         0dwmH65BIzy08u/iV95R4vD1P1UxLg6sarDRWqUwWz5c6JFzgMchKw/6C7uLtgkEHQr2
         6LMVVQD0pwkR+9vlaHeVci0rxfZsSL++C79I2FvPlJRgk0hRJOPOdyL1Xlg+TKN7Rvnm
         zE/w72H3CyvZQT+6YdgOIJB+aw+C7iFAl8YbbrTxmkev2wNtNx2LVM99onK6J3toS7FG
         uQbA==
X-Gm-Message-State: AOJu0Yzqccdwao73NuJPRnG+rM0uSCbYPiz5M/CPlKpywtvK2c5kSNIZ
	bXRPCuAw59pGkjSPSXe6cA4tig==
X-Google-Smtp-Source: AGHT+IG0CVCgqlPv2wxsTilLt17MBMEobW1SOqaRN9HJEasIJ3z9GUosQp+zA7kkduMp8d0uOJsWaA==
X-Received: by 2002:ac2:5e33:0:b0:502:9c4e:d46a with SMTP id o19-20020ac25e33000000b005029c4ed46amr6837138lfg.32.1696673338827;
        Sat, 07 Oct 2023 03:08:58 -0700 (PDT)
Received: from [172.20.10.4] (82-132-213-54.dab.02.net. [82.132.213.54])
        by smtp.gmail.com with ESMTPSA id v7-20020adfedc7000000b003197efd1e7bsm3796811wro.114.2023.10.07.03.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 03:08:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Vincent Shih <vincent.sunplus@gmail.com>, 
 Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>, Komal Bajaj <quic_kbajaj@quicinc.com>, 
 Kumar Thella <sthella@codeaurora.org>, 
 Keiji Hayashibara <hayashibara.keiji@socionext.com>, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20231003064018.7502-1-zajec5@gmail.com>
References: <20231003064018.7502-1-zajec5@gmail.com>
Subject: Re: [PATCH V2] dt-bindings: nvmem: move deprecated cells binding
 to its own file
Message-Id: <169667333484.74178.7121029453685069845.b4-ty@linaro.org>
Date: Sat, 07 Oct 2023 11:08:54 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_030902_539028_DCA80EAE 
X-CRM114-Status: UNSURE (   9.51  )
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

Ck9uIFR1ZSwgMDMgT2N0IDIwMjMgMDg6NDA6MTggKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBTdXBwb3J0IGZvciBvbGQgTlZNRU0gZml4ZWQgY2VsbHMgd2FzIGRlcHJlY2F0ZWQgaW4g
ZmF2b3VyIG9mCj4gImZpeGVkLWxheW91dCIuIEl0J3Mgc3RpbGwgcGFydCBvZiB0aGUgbnZtZW0u
eWFtbCB0aG91Z2ggYW5kIG1heSBiZQo+IHVua25vd2luZ2x5IHVzZWQgYnkgbmV3IGJpbmRpbmdz
IGFkZGVkIHdpdGhvdXQgbXVjaCBvZiBhbmFseXplLgo+IAo+IFRvIG1ha2UgaXQgbW9yZSBkaWZm
aWN1bHQgdG8gYWNjaWRlbnRhbGx5IHN1cHBvcnQgb2xkIHN5bnRheCBtb3ZlIGl0cwo+IGJpbmRp
bmcgdG8gc2VwYXJhdGVkIGZpbGUgd2l0aCAiZGVwcmVjYXRlZCIgaW4gaXRzIG5hbWUuCj4gCj4g
Wy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIGR0LWJpbmRpbmdzOiBudm1lbTogbW92ZSBk
ZXByZWNhdGVkIGNlbGxzIGJpbmRpbmcgdG8gaXRzIG93biBmaWxlCiAgICAgIGNvbW1pdDogNmQy
NTMwOGJiOWRlYjEwYWU2MmJkZWVmZGYyMzYyMDcyYTVhNDgzNgoKQmVzdCByZWdhcmRzLAotLSAK
U3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
