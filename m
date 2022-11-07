Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943F2C43217
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Nov 2022 17:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFLKEt/rPKIkyFAYieEe/vh6ig6DpUCwoBJ3mbnUk7I=; b=AyzXBtIfEtpkWW
	IIMfUA2z6CWwurhRU1z4SM22NzkbXdXuFfBvCWYomgsVDNoczbsna6KFcJHgvbQttwLW6dWu5cJ4w
	D5+DSx4FUDtyfwOENLxaOQcdju+Zk8iZOZLvZp2iaKQtOZWsn0skTvjgsVO1ezRAzkX4rVeIfOlyl
	0UzohzdpFOarftdIlBjpPULRAX8nEzRyZ4Rb0xoLajVO3WaqAWp4+3QUJojS/NeY8vdj2EzSX2bKg
	2Dl00bGILOvVc5CNULUd7WWWaAQCZJU0WuK7cob+9Ub5sbhv/iay3FNifZ0XyDR06zqe2w705ktDU
	lvtGV4feovU3RhZP1XyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5vr-00Ggjf-Gs; Mon, 07 Nov 2022 17:29:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5qM-00GeCs-Ms
	for linux-amlogic@lists.infradead.org; Mon, 07 Nov 2022 17:23:33 +0000
Received: by mail-wr1-x431.google.com with SMTP id j15so17276676wrq.3
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Nov 2022 09:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvaPSs8fyqOoYJCARQSmEYvWvJcQ6213Af5lmOXmlOs=;
        b=xcVX0HciIopS10hO1hF2BBxDXuHgkPxqVaEKmG9x8IFSDoxgZYQNMBeezZJXO50gjj
         lJ+vgQuWl3sJ5Vyub7dMjSMlxaXQupdd4ejM/0NtAnOzrg8O2VzQG6fG29uBzXTRxGjp
         5WPD71A6pLrNbaLFcXm7UGXoeEOBgUHm9T9DHHpIkgOG8E9v1RnN/IVedpCwQ4ipOzNH
         OnTXoVe+ndli/k6xfB+gQLR1AhK0agnvK+i7afnw1FV2fR3nZSckfyDeYw9ClIUCKWgo
         Y33Er6tX/z8i5IZuem8+9IlV3IcznWU98HB8KPPuzuvBSLGpqLIFA41FQxMipc5lEd8d
         hVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvaPSs8fyqOoYJCARQSmEYvWvJcQ6213Af5lmOXmlOs=;
        b=p6n1WuEQAa6pO+XCbCJXgrpn6xY963cBWLipVo1QuX/isM+cVqi2Qpr0P7jOA8xmmy
         zT4MyVB7HrXFigQ9oL4Im1t0KPn2lVIUUBiuRST0xB/VCY9EO9Uo+kBZFU/LkGwqUXpN
         f4M5pG6PbBzGTQWe1C4S82rmqT+pf1/eOV64z9sacLE/tRBRO210Yd49rX/FjnIn9QUx
         ARSihkZi9Ex/Mu9YkN7zOvu6Sbk+t6KVDt4amk+dWjPwqVAbAtvZmB4bUbvA4Jqzvezh
         iz/w4qmlVa8mDn6bV8ZWdlSYPgYtrUBNJG9ahPLUprOLagagb5rpg379hLOifyL9MSQV
         e7Og==
X-Gm-Message-State: ACrzQf03O3uJn00l5Ctew7+Zyz+R+StrS2MvZhcdONLq0s5AjbZsX+vo
	7F5v3OxITvkrPWci+J5JOy2thg==
X-Google-Smtp-Source: AMsMyM7dwh679I/4aVESswFC63KiZ02GYCgSXc5NPAI3HOlnbYGw5TYYzogTeiS2g+J/y9CgYglUIw==
X-Received: by 2002:adf:f243:0:b0:236:b1ae:dd4e with SMTP id b3-20020adff243000000b00236b1aedd4emr31060544wrp.425.1667841800926;
        Mon, 07 Nov 2022 09:23:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bd12-20020a05600c1f0c00b003cf4eac8e80sm10668648wmb.23.2022.11.07.09.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:23:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, Pierre Gondois <pierre.gondois@arm.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Sumit Gupta <sumitg@nvidia.com>, Kursad Oney <kursad.oney@broadcom.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Avi Fishman <avifishman70@gmail.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 Scott Branden <sbranden@broadcom.com>, UNGLinuxDriver@microchip.com, Arjun K V <arjun.kv@samsung.com>,
 linux-tegra@vger.kernel.org, William Zhang <william.zhang@broadcom.com>, Paul Elder <paul.elder@ideasonboard.com>,
 Andreas Färber <afaerber@suse.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Ming Qian <ming.qian@nxp.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, Sameer Pujar <spujar@nvidia.com>, Nancy Yuen <yuenn@google.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Joakim Zhang <qiangqing.zhang@nxp.com>, Wei Xu <xuwei5@hisilicon.com>,
 David Heidelberg <david@ixit.cz>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liu Ying <victor.liu@nxp.com>, Liviu Dudau <liviu.dudau@arm.com>, Oliver Graute <oliver.graute@kococonnector.com>,
 Lucas Stach <l.stach@pengutronix.de>, Vadym Kochan <vadym.kochan@plvision.eu>, Matthias Brugger <mbrugger@suse.com>,
 openbmc@lists.ozlabs.org, Lars Povlsen <lars.povlsen@microchip.com>, Thierry Reding <thierry.reding@gmail.com>,
 Akhil R <akhilrajeev@nvidia.com>, Viorel Suman <viorel.suman@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, Shashank Prashar <s.prashar@samsung.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, linux-renesas-soc@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, linux-amlogic@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Shijie Qin <shijie.qin@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chester Lin <clin@suse.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Peng Fan <peng.fan@nxp.com>, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Aswani Reddy <aswani.reddy@samsung.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Li Yang <leoyang.li@nxp.com>, Johan Jonker <jbx6244@gmail.com>, linux-mediatek@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, Kevin Hilman <khilman@baylibre.com>,
 Jacky Bai <ping.bai@nxp.com>, Ashish Mhetre <amhetre@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Patrick Venture <venture@google.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>, Bjorn Andersson <andersson@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Anand Gore <anand.gore@broadcom.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Brijesh Singh <brijeshkumar.singh@amd.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tim Harvey <tharvey@gateworks.com>,
 Magnus Damm <magnus.damm@gmail.com>, Vidya Sagar <vidyas@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Marco Felsch <m.felsch@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Prathamesh Shete <pshete@nvidia.com>,
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>, Tero Kristo <kristo@kernel.org>,
 Rafał Miłecki <rafal@milecki.pl>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Nishanth Menon <nm@ti.com>, Martin Kepplinger <martink@posteo.de>, Chanho Min <chanho.min@lge.com>,
 linux-samsung-soc@vger.kernel.org, Marek Vasut <marex@denx.de>, Andy Gross <agross@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Christopher Obbard <chris.obbard@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Abel Vesa <abelvesa@kernel.org>, Andrew Lunn <andrew@lunn.ch>, linux-realtek-soc@lists.infradead.org,
 Daniel Machon <daniel.machon@microchip.com>, Benjamin Fair <benjaminfair@google.com>, NXP S32 Linux Team <s32@nxp.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Tomer Maimon <tmaimon77@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 Ray Jui <rjui@broadcom.com>
In-Reply-To: <20221107155825.1644604-1-pierre.gondois@arm.com>
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
Subject: Re: (subset) [PATCH v2 00/23] Update cache properties for arm64 DTS
Message-Id: <166784179768.2741261.6976284587125292925.b4-ty@linaro.org>
Date: Mon, 07 Nov 2022 18:23:17 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_092330_766059_418C5FED 
X-CRM114-Status: GOOD (  12.99  )
X-Mailman-Approved-At: Mon, 07 Nov 2022 09:28:32 -0800
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

Hi,

On Mon, 7 Nov 2022 16:56:53 +0100, Pierre Gondois wrote:
> v2:
> - Update/Add patches for missed cache properties requiring to be
>   updated for the following platforns: bcm, amazon, arm, exynos,
>   freescale, marvell, mediatek, nvidia, socinext, tesla, ti.
>   Missed cache properties were detected using Rob Herring's branch:
>   https://github.com/robherring/dt-schema/tree/cache-rework
> - v1 of exynos, tesla were merged.
> - Updated wrong reference in commit message.
> - Added received Rb/Acked-by.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.2/arm64-dt)

[03/23] arm64: dts: Update cache properties for amlogic
        https://git.kernel.org/amlogic/c/49f65e2eaaf96de1282bb82039386c2d2d04ee53

These changes has been applied on the intermediate git tree [1].

The v6.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
