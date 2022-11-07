Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CAFC433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Nov 2022 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzZh9kH1Fs6TBJgDVFMoqgmPkFsY/mM1T1HbvHuaRKc=; b=t3Exju7SgKx2IS
	kCfE5JUVXAyAQUAQXnA0mkFR/STY6pRgvBYup7lloph1hL4xUuNjk8ZKG18mT+gnrGP6bx5EvkxUz
	BMNnFuxDrsqzmAvkGFD2N4oDb6qG9uvO1Q76EaiGvC94AllZHVaSW9s2ylsltnB320LsAo3GshL2Z
	e1zG89lvIvJSbOI7jnJCCo2o0lWJQ/BO8z+huKl4odu3FhalSEHKApzKBG0N+k7fOtjgtYXsvkyhZ
	mMmHQKXjuayDHFT3w+JG/sKB1D26qiEyw4/z006+BXzdzJUCbub0rN93WYBU56SDer9hf0MItkxSS
	7rBujz1pkI2R+1Nyk41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6Ll-00Gxeh-44; Mon, 07 Nov 2022 17:55:57 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6LO-00GxKX-V2
	for linux-amlogic@lists.infradead.org; Mon, 07 Nov 2022 17:55:37 +0000
Received: by mail-lj1-x229.google.com with SMTP id z24so17491467ljn.4
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Nov 2022 09:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PGr+OHpd9QR70TelEUD0vawxtEQ1HAh4AfgGSoeJdCg=;
        b=YJ1bDYl6JLlBjy8eyB95SYQZIKQOVjudBlguIR/pdlO9WhqJqZP5VFxWpqsOhj+q/F
         XPCwvsTaIC3lDzN8fuOI7q/rdvZiXOl2Uyc06eAWQTgYbkVZ3vUTB2xk5bCxCOiEzN3m
         Mig/4KNs+R8/fdK27ItXKObx4D0FoanGoi4XtUJhBebXNS7v73cRMRqO00XvHc9UHSiW
         K673Tc2Wiy+vGBC5vO7XUso8/lieNabysdAzjR/3jdnMeTMH9bYD/q/d1frObSXI0PQk
         CnD/cnz6JdKNse3zFfvIPX0y9NLRwJKX1LxMiucrA8l6H+hTF5v6191LWCt6gDGerOLG
         aV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PGr+OHpd9QR70TelEUD0vawxtEQ1HAh4AfgGSoeJdCg=;
        b=BYDVLQp8bZJ4tIvs0x+1kr6vThSu9JfNoUZ58ZVeCGTQ9rPOYvgRenMZtuhnqH701u
         ZZsPhhPM3l0zpbZWRPS2aalMCUJeyOgi4YNqnTeByko8RygkQVDbMvvKmpM6orlmSwEo
         TGQ1icoqmBxemDgMSElYzF98WCiMNIEvO5QbyE9nbbTv+EUuEhcfqFM8PiAFEwCx123/
         UGvgLyKnHCPe2qZdQk2tpTZ/xpaDXvu5e0cFA8HU3WFn2Tke6ekPKhrmRttawxfAdcti
         1FlcNmNZS7vInjecuujnK5pJWg8cbhqZVncjXAeqN+6COlwDYM4J5B4FSjS2eil5WxWs
         3oWw==
X-Gm-Message-State: ACrzQf3SjXc3d6xONZkLvA9YYLBvFEA97xCgM5p1FplWKCYkBU3hSO98
	jOYVK1RJiBIDDrUqeXG+aw9zAA==
X-Google-Smtp-Source: AMsMyM4i3h9s+NDpf4TdbXxN2HKfcV0lefo8LkPXtTQWjLJHSetVxfR9aJ+uXIefvKsVbJ2ZwlNwvA==
X-Received: by 2002:a05:651c:516:b0:277:2428:3682 with SMTP id o22-20020a05651c051600b0027724283682mr6104769ljp.291.1667843730703;
        Mon, 07 Nov 2022 09:55:30 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id j10-20020a056512344a00b004afd23cf7eesm1336063lfr.168.2022.11.07.09.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 09:55:29 -0800 (PST)
Message-ID: <84b57a5c-3b29-3e40-8375-8496baabdbc9@linaro.org>
Date: Mon, 7 Nov 2022 18:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/23] arm64: dts: Update cache properties for exynos
Content-Language: en-US
To: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>,
 Brijesh Singh <brijeshkumar.singh@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Alim Akhtar <alim.akhtar@samsung.com>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Chester Lin <clin@suse.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Matthias Brugger <mbrugger@suse.com>,
 NXP S32 Linux Team <s32@nxp.com>, Wei Xu <xuwei5@hisilicon.com>,
 Chanho Min <chanho.min@lge.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Nishanth Menon <nm@ti.co>,
 Tero Kristo <kristo@kernel.org>, 73@gmail.com,
 Martin Kepplinger <martink@posteo.de>, Liu Ying <victor.liu@nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Vadym Kochan <vadym.kochan@plvision.eu>, Sameer Pujar <spujar@nvidia.com>,
 Akhil R <akhilrajeev@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Shashank Prashar <s.prashar@samsung.com>,
 Sriranjani P <sriranjani.p@samsung.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-realtek-soc@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
 <20221107155825.1644604-8-pierre.gondois@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107155825.1644604-8-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_095535_148410_752515E2 
X-CRM114-Status: GOOD (  10.63  )
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

On 07/11/2022 16:57, Pierre Gondois wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> The 'cache-unified' property should be present if one of the
> properties for unified cache is present ('cache-size', ...).
> 
> Update the Device Trees accordingly.

Why do you send it again? This was applied.

What is more - you have way too many recipients. Mail servers reject it.
It's impossible even to reply to it...

>  			cache-sets = <2048>;

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
