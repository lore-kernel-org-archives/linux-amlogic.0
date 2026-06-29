Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A283C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 14:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=L+Xdvphv7Wf/RzKqsAWI1i+V1Jf/5s0nTDML0EFE9Co=; b=mE7NOuZzkpSL5D3KrW13ZmnKmN
	MFAW3oH73fOC7XtTU3ofKQ9fMQBUMf9zxxU4bQ5DaFrholywBqiG7Z63YCO6XBkiYKzE9fDjtRr/6
	1prTdHdeICkn7WwkJbZLh4Eq/4UBH1rv0dUIvsLijIb3Y5Esy+f5Br2RNq877JfCT9/OWshERzCj8
	xBCPFaWJrRa588IjsPk8LSQYn1/SQJ4M5GK6jjJkl0q8GOhyV/r141418lMf0CVNunGyalfKbUG18
	JhgTIutWgBPuKlqjJDDimQpemxWt8VgmqV6s1XBrmHiIBrkY7OZSe19DRJ07UeYn2Wht5jjdaeRRf
	vsmof69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCe4-0000000Epug-3dSP;
	Mon, 29 Jun 2026 14:07:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCe3-0000000Ept7-0CeN
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 14:07:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21F12600B0
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC901F00ADB
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782742049;
	bh=bbeOSfk9uz1Wrt6J5wAea4CxiJx++/6lvqEjtpLfRco=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=T2cBdcpBltZQbc/dS7w2Gl2UqhEoGQ6sdZtr1MrFNY2Gfj4Fw8rJzfCdKmFa9eifU
	 QWU8f1v8zuNGrcQVWX5ifehqs0rA4wDyXJA4IlJPuu81HSPqEmIyvSi0reKC7kHHlc
	 ydLju7W1RcXkhe2yIGg5qlr8ShNspLlI2Vzx9LP1h8PnkPuWdpKk+T8mQybcO8e3cI
	 txMnh5sPsuUr7F7RRH6SxymxmbPs85PPP9e2n2UASI970GaWEEzMMBHMSauWdKugVS
	 v/eRkREv5Qmfajz5+IwHjZi7FdEVC5OIywvBkbFlrgzhj66+6mSPly3N9XttVJNe8p
	 JnzzBMyZpIvWQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39ae3c76e24so17950891fa.2
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 07:07:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrQn3dCLKYgZGkhdAKo10t8aCq6ItUVuazvjGjcdho1q0owE5vFRIIM6BK8J2NCRIKluAAdfVJkBgfcM3S+@lists.infradead.org
X-Gm-Message-State: AOJu0YzeqUoIOb0o+/MfP4MM83X9FvoqWJGz+QraMoXwAk95JvIrWjIK
	THyZFuv6cUFAYrwvZymbC6DomXOms1JXIK9JjQRPZLFMp/hKfKaXNjbU2ndSqzSkHcPSCN5d0tx
	g96vCUudGHYzBh8ArKpFYzkbSGEh54KL03lGGEMqIWg==
X-Received: by 2002:a05:651c:146c:b0:396:5d0a:765a with SMTP id
 38308e7fff4ca-39acb8ffa66mr33873361fa.21.1782742048596; Mon, 29 Jun 2026
 07:07:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 07:07:24 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 07:07:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com> <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Date: Mon, 29 Jun 2026 07:07:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
X-Gm-Features: AVVi8CfgGr0R3g5nrNxVwL-t6-jaKI4wsgAKUpj-c_HwbEC7_gerPUuikt96dHI
Message-ID: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> Thanks for your patch!
>
> On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
>> This is essentially the same hardware as sa8775p rev3 but the PHY is
>> managed by firmware over SCMI.
>
> So why can't it be reuse the DT bindings, and be compatible with
> qcom,sa8775p-dwmac-sgmii-phy?
>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
>
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: serdes
>
>> +examples:
>> +  - |
>> +    phy@8901000 {
>> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
>> +        reg = <0x08901000 0xe10>;
>> +        #phy-cells = <0>;
>> +        power-domains = <&scmi7_dvfs 0>;
>> +        power-domain-names = "serdes";
>
> Ah, this uses power-domains, while the existing bindings for
> qcom,sa8775p-dwmac-sgmii-phy use a clock.
> I guess the clock is the correct hardware description?
>
> Adding to my list of examples for backing a hardware-to-SCMI remapping
> driver...
>

Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
driver instead of the MAC driver where it was previously. Instead of cramming
both HLOS and firmware handling into the same driver, I figured it makes more
sense to have a dedicated, cleaner driver as the two share very little code (if
any).

Bart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
