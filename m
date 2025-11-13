Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49319CD6E5C
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Nov 2025 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qnoc3F8xVnoDntv8hdinaUK2H+a60j4hzd/gr5oSriA=; b=rQVSo7+V51UyWR
	eRSZiz2E/74KH+sMBbvqeHYATLQWrQ5p1BRIT3gCFJhqORjShdgtVOPwPduHNKcq8n46HybUCaV0k
	3aAKC65B65f8JT9MTCWEJlLOlZpj5QkjbOAC/ij1CPqN+PY1KFXaqpbBUrkUPlCR713QPF5T58BBD
	mg8J/IN3qKZhC3bkrPh6aRv+KMAlNo927Qf3NW36ANlQpZtPfAZAe5UwuGW13kj8SCvaYrPU0L557
	STCUg+VBYfRaq0kleYdTQmtG9Sj9VxLSEPGegTDBc312yKxpAChJnxe/rT4jDDpB28n0UniFP+hfv
	CEWtYcwklgwU7PIgc/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXEA-0000000AWu4-0dUy;
	Thu, 13 Nov 2025 13:19:06 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXE6-0000000AWsU-2A6R
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Nov 2025 13:19:04 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-594476f218fso603918e87.1
        for <linux-amlogic@lists.infradead.org>; Thu, 13 Nov 2025 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763039940; x=1763644740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZfCaucUzkZTNK+50YPVLfmUuvxNRaVom6NqjpdOeAc=;
        b=K59WUnJpeZ/8W9ndOHLrcN7OAuxHTOsIsZQQBc4zS3rc42zO4P42RtAkg/Coor5MYc
         bCSImfuZJzc/AtDfh4GTx0qr+O3NbavZ3SEHu0ePxZTnsE9zhKHQrt7ojI7uOqI8mFgF
         1i4hqTBomZWFOgfJMgXWckG+ci5FnPSHwYzHcf++aS87o8gAdQXHyqOQeYjoaV/7DVcT
         9fLRVmR0EaQ8MC0weEdOb4M6iuA7tOhPzyF0zaH1mRQTtDYejxhi4ks3KHrva5XjBycq
         x2pdjy44QPUAYFFe99VdALwmn2axKXwPqLf9ZsSF8Lk1O0FdeoYKsz9FF3UnIPyu+UMj
         jhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039940; x=1763644740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZfCaucUzkZTNK+50YPVLfmUuvxNRaVom6NqjpdOeAc=;
        b=TqoQg7soaL9vqvYiknIv2zG3JfymeuhSd+bGxCow4Lxcwvgxf68+AF4q03lszOYU+k
         zSQGb60Y+dcWecQKY4eY18HAr7QQRigqsR3V8rvdn6M7O9smzJA6iGH/ql+grzsiTf8B
         mrNhiezdmDkgoiv+S/ekUj2YyIH2UJdmyRl/LsNbfSdyMwvrp2Q8RGzn1ty6hrpFtqjt
         OgNQqh6C5TjqeyIQiGPiQPWlSgah0jvZgp8QsvRZEGyv4X2vTXFJNIl7s7MNsERr0HLB
         AdkQjOKgqw3Ywinsrm0C4tLVz3ktHEmWj+21Zyg5Shx9rRtpRu8gAiWK5eWYERC14jEf
         Sr9A==
X-Forwarded-Encrypted: i=1; AJvYcCWM+bxJF3eUmK/5SrkkILAqdHCGnKH7z0KFdOiJzgAg6FKhsSGlHi0QSkxS/qm1Pd43rF6Svdh59NJPPrY0@lists.infradead.org
X-Gm-Message-State: AOJu0YzKlqZAJW19pRWQY0gc5dpWLnp3VYJlIP+xRfZwcvig7Bkalb2T
	Nj/PoyAXfMK8e6VtQAUFQRPof962b/YOLglth/KQvmjYRfnBdNTPGMs8MUIiumUs6kyOn9m+/iz
	XevJ7lK+oeHPt1fKa+Z5lggtPCymx6I4OZli949wFHA==
X-Gm-Gg: ASbGncu44iRAMbNI9sSCudWFLjf7f08fYGSRNhc6WYXzuR62akFqIY3d+bwnE7FAh5z
	UD2/TLJvywcO3Va5KfCjLaNpADzJ9N6yMOBOgd2+6UUOr32ViUAI8UIAYOG8VTMaZG9vXZ2c54l
	u+3FjIgNwvHuwCg764GsmKo+h1kn5XqtEqqkYH3wSRRuDDbhvdV32T3gaoXe7PD3QuUtcHszVSp
	l8BGSVjTL8Po2UslO12VisNb1YxEdgsjjy5e6MR2r/TJmx7MfVMz9+u3RtTHCo8tp1oNA7/wjFh
	RWqDIUcnq2MIEEtJ
X-Google-Smtp-Source: AGHT+IHeVzTuj43c2XKQpZBw2ErEf3YOWTRFAtQ1vaZEEtKBTkEs3tR1Hd50SIgH+QjYllZZcXodcrSS9KZ8vRhrh3k=
X-Received: by 2002:a05:6512:3152:b0:595:7b24:d36e with SMTP id
 2adb3069b0e04-5957b24d58cmr1396653e87.7.1763039939830; Thu, 13 Nov 2025
 05:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org> <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
In-Reply-To: <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:18:48 +0100
X-Gm-Features: AWmQ_bkdL6yYgjauNyydNchJ2jLFj9s46UQ7WB4-Hc5rFElcxZ0Jmq78mNjUwDc
Message-ID: <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_051902_816548_6A1D50EA 
X-CRM114-Status: GOOD (  13.26  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo0OeKAr0FNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS83LzI1IDExOjI5IEFNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEluIG9yZGVyIHRvIGRyb3Ag
dGhlIGRlcGVuZGVuY3kgb24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZpY2UgcHJvcGVydHkK
PiA+IGdldHRlcnMgZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVz
IGFuZCBzdG9wIHB1bGxpbmcKPiA+IGluIGFueSBsaW51eC9vZi5oIHN5bWJvbHMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBs
aW5hcm8ub3JnPgo+ID4gLS0tCj4KPiBbLi4uXQo+Cj4gPiAtICAgICBpZiAob2ZfcHJvcGVydHlf
cmVhZF9ib29sKG5wLCAic25wcyx0c28iKSkKPiA+ICsgICAgIGlmIChkZXZpY2VfcHJvcGVydHlf
cHJlc2VudChkZXYsICJzbnBzLHRzbyIpKQo+Cj4gVGhpcyBpcyBhIGNoYW5nZSBpbiBiZWhhdmlv
ciAtICJzbnBzLHRzbyA9IDwwPiIgd291bGQgaGF2ZSBwcmV2aW91c2x5Cj4gcmV0dXJuZWQgZmFs
c2UsIGl0IG5vdyByZXR1cm5zIHRydWUKPgoKVGhpcyBwcm9wZXJ0eSBpcyBhIGJvb2xlYW4gZmxh
ZywgaXQgY2Fubm90IGhhdmUgYSB2YWx1ZS4KCkJhcnRvc3oKCj4gYWx0aG91Z2ggaXQgc2VlbXMg
bGlrZSBpdCdzIHRoZSBwbGF0IGRyaXZlciBjbHVua2lseSB3b3JraW5nIGFyb3VuZAo+IG5vdCBp
bmNsdWRpbmcgdGhlIGNvbW1vbiBjb21wYXRpYmxlIGFuZCBpbmxpbmluZyBwYXJ0cyBvZiB0aGUg
Y29tbW9uCj4gcHJvYmUgZnVuY3Rpb25zLi4KPgo+IEtvbnJhZAo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
