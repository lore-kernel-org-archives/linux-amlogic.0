Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EE9EB64DD
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jul 2023 17:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBzBqW5RPQvDUGdlidNo1YGrdnu4F3J0krZKM3lSrOo=; b=lECFjrRxTzV2j7
	BaPvQKr5Iq4x/eGUTi96gHH7pJJCFt9EzbMIPwgnE+llnyII3Y1CUThVGuiE1vyTFOacfqOOomyEu
	QhoJAopwqzyReHHpbCNxz1nZhBupzJckYVltFJK8nFSgwjE8707fbSfriRufxxE3vOZYZ8kIyNH1D
	rQYP1QITayZyzijtFrVvv1njWNgxecZE5D2UKHQN49E65lE6798CvEpjUUY1/o7Tsm1f37eLxe6b3
	OoKbFtxyCrAlMu7k8+D6FkZFX+yrh5RkhGjJCYS7IoInZwzUa/PLBxdL0RDvNexW83nMdSbzNsRwm
	J0uewUFacnp+qkPIss1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL5eB-00DV6l-2U;
	Sun, 16 Jul 2023 17:35:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL5e0-00DUwa-37
	for linux-amlogic@lists.infradead.org;
	Sun, 16 Jul 2023 17:34:56 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so5333892a12.1
        for <linux-amlogic@lists.infradead.org>; Sun, 16 Jul 2023 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689528890; x=1692120890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVdQ1h98jD+pCjkWbpSagAlQ5FpMDDjZxvtMGyDKuQ4=;
        b=RbnLycU+GM9MvipDlE8PVYpOGXFqUD1TENGGIHGORHvLxabAbSr4SauiPoD+CLVPMQ
         TkjN3zfv0eIyeBZt8zRha6j88zEzLOj1Du4anZgav+2w20Ymv02/947G5VJo356VqzpO
         FDfZS1aqt3Nm8qdOnS17NQs6mDJoRoDgviKcDg1kV7p+PbDXKnviXlBr7Q5+P0Whlpep
         jOnfX84fe5zVwq5QjnUM9u2hxYokfaN43/ckoos47o7wfyaT3sx4l0svc8F6IBzsonf2
         UGLsBYbv+yMXzKS4nTpUxb1ifvxjfcISVASj3dBKY3iN4A1pdPQ++42L1vO1E2n5iXfG
         BoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689528890; x=1692120890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVdQ1h98jD+pCjkWbpSagAlQ5FpMDDjZxvtMGyDKuQ4=;
        b=Xj4TJ3IRlD2lWhBPsXNVe3bTrxAtwVUPV2lNvGLTmPl4LE6jUszPyNH4pjvfPWZcbx
         s2fKBC7Z9a3d0YFfLeWlzVWgTYf9OtLKWzb+EQOTGTnP1Ax/MJAFkaaCDLuKO3gn5AMl
         Ac27oXo2HaVLo+SFi0Tm1nyd372Js0MLs6a7/Cr7RVHvugqDpVjspMXuX8Je5hruTFwc
         AckGeDua+EZl5t1JlAFnSFlZ/VJF1eGwcKUrJgiVFMepb+7raT17jaT9CjPhf7XuOAaR
         88mXkgQUtOR/DM794pznxRg148mgFY+IFdu2I14IH0g275x6Kj2c/D+Jqx1G9SlzpMHJ
         Hf6Q==
X-Gm-Message-State: ABy/qLbmDmKhSinjh5tWjJ9zsn5bGKE+MPp47zBm7x3Se6WTbgX55hkz
	x6PwLnntOLyfKoI9NUKB4o2rTg==
X-Google-Smtp-Source: APBJJlEgpjm22DguPByGciLFZxBAv4qA3ycUjxHTB47bRiBgUDCW+gMnZGdBGQYd2CV00lRnqKx5Xg==
X-Received: by 2002:a05:6402:b1a:b0:51b:fa0a:dc37 with SMTP id bm26-20020a0564020b1a00b0051bfa0adc37mr10620081edb.10.1689528889834;
        Sun, 16 Jul 2023 10:34:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n1-20020a056402514100b0051e2cde9e3esm8766083edd.75.2023.07.16.10.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 10:34:49 -0700 (PDT)
Message-ID: <6363b737-d849-83f2-8811-cb497f0222b0@linaro.org>
Date: Sun, 16 Jul 2023 19:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] clk: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alex Helms <alexander.helms.jy@renesas.com>, Abel Vesa
 <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?=
 <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-oxnas@groups.io,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
References: <20230714174342.4052882-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714174342.4052882-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_103453_091105_4A9581A1 
X-CRM114-Status: GOOD (  11.48  )
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

On 14/07/2023 19:43, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> # samsung

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
