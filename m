Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5F2CD6E55
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Nov 2025 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmFKWp/PhBW1lqp0j5APvetzZphcsMryHS1CMszxCO8=; b=AseWHJx+pl9dbL
	0SxooYWEHHlm2Xxf3KyV07EPqcFht8KplfflJ8TMHEzFtHAimc4t0tJO4T6xupB2EmJMojBbXZM2z
	EwlEeqD5sCjHO8JrofliehILNjBsazty41aFhIp9WHguLWCqo2w7ZtIasnkHy6woY5FjN8jWBiVaI
	kUmuvZiu98RQTDP6fpcgLc/ngIVCQjlUzykgYDRJgYdjqOkkmnglytBq7FfysmjP6DSDUJEBmkBMv
	2uYkZKj3hEJodaEOjC0C3vMNZbUIbytUL1VtNuGXviq2ozasmeI31K4pKVzeJzB1Gw6WHyCOyAo/B
	J9Iy7OiphkoFcxVuvESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXSh-0000000AYDw-1OWq;
	Thu, 13 Nov 2025 13:34:07 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXSe-0000000AYBq-2Bpe
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Nov 2025 13:34:06 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59578e38613so776817e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 13 Nov 2025 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763040842; x=1763645642; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsN4YM2OD91GPnt+6/gPAgCxZS5BYL1HgW1NfsOpFuY=;
        b=FXwI/eQ2+cL5ul1C9AwJXY8LJsSLus8xbYb/UtvYQcUUL+5/HdShQnJeD1FJDTeSY4
         SOHaHNaKVQvEyK2y69g9VYKh9qASO+dV9MWG1pzcyrZROo0K+tmqGOourEhNo4zmqN3X
         ULp9QnsdAR0lJ0Jmrjgv1hk1yi8JioifbaSHunRof8V2kfs7PHOjWnxKXg5D0eRjdvfL
         k6vOFKcX/dW31IjC+NKqD5oQhou0c5qit++5HLmBG/aLrPBYG3UenSUELbdSC6dTAN5J
         mCAI1UmHkd42tdOOKhwOlIZlH3O0DjwDeiDp+X1VnMsB1JzgphA88AMLR5veCQvinQhn
         yRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040842; x=1763645642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YsN4YM2OD91GPnt+6/gPAgCxZS5BYL1HgW1NfsOpFuY=;
        b=hnZ64lxXIBOkAPeSeVyda9RoE6SzghcyWp4biGoGWputYnFyUzkah4fJ99U4/P+3Hh
         p8Vx35Anl5aYHEYd+zxMHUP+hkxSrduEeenbRvwsmVUenLzIaaKMzHeSAXOZzCuzqMEr
         pFbBKz+yTrEnHXTBNx/otEscpJqq45pdr3GcmOfX0RIBgmViiR0PZHNbwYhRybHY9rpI
         ndBsLuRfGsTFfR9kjujikIo1Iz/XZdsqAWynIsfqpQifIh+pwVLu8wn/ezelmoOGcACk
         lya2lcJ0eQf89z309/iL4eHgMBQZZgMY+wkfFmY967Xq1DoJ1ptO4Dmw3LN9ankMNBJu
         XKBw==
X-Forwarded-Encrypted: i=1; AJvYcCXUf2OSUOUNEjhuxXcMtuj1MGXLQNwdQ3pmwGA/tBkmm0C+fqP4PNasF6qEaiIpTn8uPIZd2R3PvX0Fly7W@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi4lP2J3iUDx7I+ZPojAZ+FDg1EPXLfEVDfzRf/d5QjciFXrcj
	VlimSJOklGuwiR585S0+2C+sPZQueZWuSVpRzedwdMmNocpxIMWQW1MidQ3MetbThyi/VJVMyDs
	pWVfTUedcr7dYvpZ7k6da3tv5U7JUH8T300ApcKxrBg==
X-Gm-Gg: ASbGncs4/1g20ve9aBkeKsrRhNrzfGJPmI1JCA6g62FC0G49rlfbTgQxcsXdtSUv1ci
	7wPO3JhrlrcaFArpcajqqoo/KYcCUuO2nUESaG8eZ7I/LsrnSmYUpe0E+yG+90c1zGW6fKeY7of
	uzJ7trQd7cjL+zrP7I35fPx97dhhC/D+v6UOCzMfW+qMVsuXPVoVlrZ0Y+7WoawxoSQc3g8p6WR
	oesLRxAoNfiXObw5Ys4RBKxfbMtvu7AxBvFrMIqvX5U7ZRQVwzTgdvwgNeMxZusYgP9oiF4vB78
	0HDP/JTEwlMrYwuo
X-Google-Smtp-Source: AGHT+IGbk7EKeTNsNxEBH5I9gU0KP7DFoTOQ0KZ1rqq8QfnOf06KK/0zwgmGPB54vhErcQD0MD3GXM8/DDcCgOFKTlQ=
X-Received: by 2002:a05:6512:12c4:b0:595:76d6:26ea with SMTP id
 2adb3069b0e04-59576df8d25mr2057027e87.23.1763040842304; Thu, 13 Nov 2025
 05:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org> <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
In-Reply-To: <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:33:48 +0100
X-Gm-Features: AWmQ_bmy5PXcBPeRnFHjyddkz8qETTfAAx4qoRDDnDLUNs7204p7vqOqHs_5gtY
Message-ID: <CAMRc=MfMQ3P-BK239953S9sTAe1_qSc_miWEFDNu83frE3aSqA@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
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
X-CRM114-CacheID: sfid-20251113_053404_606011_D30C8DC4 
X-CRM114-Status: GOOD (  17.03  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo1NOKAr0FNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS83LzI1IDExOjI5IEFNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEFzIHRoZSBmaXJzdCBzdGVw
IGluIGVuYWJsaW5nIHBvd2VyIGRvbWFpbiBzdXBwb3J0IGluIHRoZSBkcml2ZXIsIHdlJ2xsCj4g
PiBzcGxpdCB0aGUgZGV2aWNlIG1hdGNoIGRhdGEgYW5kIHJ1bnRpbWUgZGF0YSBzdHJ1Y3R1cmVz
IGludG8gdGhlaXIKPiA+IGdlbmVyYWwgYW5kIHBvd2VyLW1hbmFnZW1lbnQtc3BlY2lmaWMgcGFy
dHMuIFRvIGFsbG93IHRoYXQ6IGZpcnN0IHdyYXAKPiA+IHRoZSBlbWFjIGRyaXZlciBkYXRhIGlu
IGFub3RoZXIgbGF5ZXIgd2hpY2ggd2lsbCBsYXRlciBiZSBleHBhbmRlZC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFy
by5vcmc+Cj4gPiAtLS0KPgo+IFsuLi5dCj4KPiA+ICBzdGF0aWMgaW50IHFjb21fZXRocW9zX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgewo+ID4gLSAgICAgY29uc3Qg
c3RydWN0IGV0aHFvc19lbWFjX2RyaXZlcl9kYXRhICpkYXRhOwo+ID4gKyAgICAgY29uc3Qgc3Ry
dWN0IGV0aHFvc19lbWFjX2RyaXZlcl9kYXRhICpkcnZfZGF0YTsKPiA+ICsgICAgIGNvbnN0IHN0
cnVjdCBldGhxb3NfZW1hY19tYXRjaF9kYXRhICpkYXRhOz4gICAgIHN0cnVjdCBwbGF0X3N0bW1h
Y2VuZXRfZGF0YSAqcGxhdF9kYXQ7Cj4gPiAgICAgICBzdHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyBz
dG1tYWNfcmVzOwo+ID4gICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+
IEBAIC04MDEsMTMgKzgyMiwxNSBAQCBzdGF0aWMgaW50IHFjb21fZXRocW9zX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICBldGhxb3MtPm1hY19iYXNlID0gc3Rt
bWFjX3Jlcy5hZGRyOwo+ID4KPiA+ICAgICAgIGRhdGEgPSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEo
ZGV2KTsKPgo+IFRoaXMgY2hhbmdlIGNvdWxkIGJlIG1hZGUgbXVjaCBzbWFsbGVyIGlmIHlvdSBr
ZXB0IGEgZHJ2X2RhdGEKPiBwb2ludGVyIG5hbWVkICdkYXRhJyBhbmQgY2FsbGVkIHRoZSBuZXcg
b25lIG1hdGNoX2RhdGEKPgoKSSBwcmVmZXIgdG8gbWFrZSBhIGNsZWFyIGRpc3RpbmN0aW9uIGJl
dHdlZW4gdGhlIHR3by4KCkJhcnQKCj4gYnV0IEkgZG9uJ3QgcmVhbGx5IGNhcmUgZWl0aGVyIHdh
eQo+Cj4gUmV2aWV3ZWQtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxj
b21tLmNvbT4KPgo+IEtvbnJhZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
