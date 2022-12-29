Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC866C4708E
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Dec 2022 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAvkbnP85QkErsKXxEx14gDABzfP/4cIosfGN2O7aWM=; b=J4cUo9VOlbLces
	rxGBdRMqwwDEYcMjY5h/yPEOEfRLRrmVe6N8CazbJt1XSvP/YDs9ayDsbeSBTNRAKnSmAGINHBxZ/
	nhMxCA+xiLjtpzBH8ZbmF7zOCpDzx3VHeXcZ01mvamyxkcs20n8yRhZtgrl2ntQIf88lbu/TKzPzu
	4zRzR3Eddtrsq3NKiDGVAeNrwaAHyuId+dowpQqjdyV9av7tuuWM9v0Hui7IyrTYC1k+zV5jEUXjs
	GnICTlkY/ZpsRu+hAjDK3V1qYNS+h4JWRs6kOPQp4nj4EHmIGnQd+UvJasbRSLNrzNOFn0hR77FSG
	PaMZzW7FD7Z2fadKtG6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAsJz-00Fls6-V6; Thu, 29 Dec 2022 12:47:44 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAsJW-00FlZL-AE
	for linux-amlogic@lists.infradead.org; Thu, 29 Dec 2022 12:47:16 +0000
Received: by mail-lj1-x22b.google.com with SMTP id s22so19283764ljp.5
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Dec 2022 04:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwlHQh/HrIzNcutcWsMZeEMw0aP4F5M3XhGtMBD6WXM=;
        b=pAqZmGU4P85yvDEF63iAQS+tfhpveUvau9apwt4AMUIum53eci+ip3O+KP1vYexcHy
         mJcA1BiaLWRgbnmWoLQx6B4qF8rNcqOMoy/VMC+0SLVocbT7b/2Lwnsd5CxCOHEgtCcK
         rCCT57Pfl5ec/7feP3UZx5AjV4/pCozbBQrb9AHeZowZC4bB2aUKxOl0N7rgq95mfVr6
         bG8nEWFPfn7UHFKbLvTJG1PG4wsb2ulqAXiWfMqrFeNO8l3Vp+FdTlDBCQeLHDItinYq
         esww68BbuNKzXodV6kUgYKlIcxc7VUxDlbMg/7vQ7syaL1b4aq0Ak49Jw7/9yXJodDKY
         TnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwlHQh/HrIzNcutcWsMZeEMw0aP4F5M3XhGtMBD6WXM=;
        b=dqv82kN/NgDQWA4MTjJIDfGxwBumTxeHBuXlOBpjlZEAzTnrbJv+toNCgOaD28GiT8
         37ujk5aHINA2MlcAhBdxKQ5YWyb9eq3CpztFlkZK72K16Je50KvxcaNTSoyNezAmfYvh
         So0PS0PGRCJ1mXkjC3fCtl5vpLE5I5e+MkmM+9g6O7uVfApNN/C8E8fhvN4ykxHiTAwM
         B11PuLz9OBHa/thbskHGmJ9XjeJcr+4pNqj1x0w8/kBBY1lUNLTpBmvHBfypJCaBzY3B
         U0kRKsoKmAoWQ75FquCRqaV3K4+fd3nMROvYcMyHxW4CUrjWHBqekuv+FzBHuql4SBye
         2LEw==
X-Gm-Message-State: AFqh2krKfVxjx1sPpHgxFExx9xWkBXmM/XW/MbYod+1OCo0RktslOFfu
	wIn0RMe0az4G83XKDbj4X7WUfA==
X-Google-Smtp-Source: AMrXdXudCbA5TUDJ9hNmgsbZrXxH4udzwLP/bRirbMXWHixMbxhSfP9j7YQEq7ObViYmABuCHTPgqA==
X-Received: by 2002:a2e:3c09:0:b0:27a:189f:5716 with SMTP id j9-20020a2e3c09000000b0027a189f5716mr7402647lja.14.1672318028996;
        Thu, 29 Dec 2022 04:47:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y26-20020a2e95da000000b0027fcbcc3bedsm792616ljh.51.2022.12.29.04.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 04:47:08 -0800 (PST)
Message-ID: <7b04573f-8f54-8e38-83ab-f5865da81b88@linaro.org>
Date: Thu, 29 Dec 2022 13:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 16/23] arm64: dts: Update cache properties for qcom
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-realtek-soc@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
 <20221107155825.1644604-17-pierre.gondois@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107155825.1644604-17-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_044714_495238_9511E113 
X-CRM114-Status: GOOD (  10.25  )
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

Any progress on this? Pierre, are you going to resend to target specific
maintainers or SoC?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
