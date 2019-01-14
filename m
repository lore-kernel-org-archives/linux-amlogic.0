Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F405CC43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 18:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B49204EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 18:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A9PMTL8G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UiMhmBGc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B49204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqBx7olG5uRD9nwhnQB/KkWyHF75wUaK4dNvTCX+1Ks=; b=A9PMTL8Gf6Ezc2
	GA1ohIbDwrcLliyzF0lobGzySgzyzSUpEaVwS3FY2yhnVE8GQalC9J242JEPgs391RTGuEDN/XhyM
	OgCZyE/hJy1q0WXFKt1Jp8iTJaPKqhp0CwRHcBcvW6yX+Ei8ozJbkZ2zPm7srea04F0uWkYzhNVMZ
	3rn6SmQbvAWD5/hHLL3wPH7CALomXBwk4KFZc/sVCd3zrbeAkxu1tydVd7czh9u8uAnwx4F4HLQ8f
	HXlAy/ql21dCUMKmYHgVQ08DA+AGGbXFy8I6o51Chazv3qB0Z3sUe1zmZImf4Zo59YlMJYpYyaNv7
	2QexXdbWgvQSC7uGrsLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj6eH-0000zx-0L; Mon, 14 Jan 2019 18:07:45 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj6e9-0000x3-8U
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 18:07:43 +0000
Received: by mail-pg1-x541.google.com with SMTP id z10so9791149pgp.7
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 10:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=xoDj2swAOgh3trbt2VuZW/wuDsLNfcd0yMN5VDXfXMY=;
 b=UiMhmBGc0W8WAr8O8UJm6wfpiwpBE0K97NlOMBXhmSLk20b1AMHwXswIVZHBNCMOyU
 NGJ/YPU5PaRvTZrKCUK5BMkRo4lDR0JbTtNeK9TH55apHBeHS65bV/6FchzqRinvGUoF
 kCwKiulA0p/H6syqZNRqEIPSwBtW6yVdO9wKASAfRBqI2fuTfqJy8NLhsK927qaXq9BZ
 kdHjrrW6MyE2TOdEFs4m0uQSac+XGssZqawcBlZB05ZmVX3WnhjN1PVvMuWvCRCZe3kh
 LFPyfvtNTz7gZs38AS8XuEu4/FDX8hdVtwpzsf6W53WiXpx9AYaADHGhG5kSmpERC3cZ
 zNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=xoDj2swAOgh3trbt2VuZW/wuDsLNfcd0yMN5VDXfXMY=;
 b=LPLyGiyxvfFGM3+tfQoh3y5kl4RmGqozoHOeDzrpY+7obhT/f8VkUW9aDUWn1NciDI
 H4f7YMzQv52HVpwZVOuw5kDI278/GctLB1tBN6XW4BCQi6U0Jdp+iLLBwLSV8TafebFS
 F7hA6ON77tDLessAae1qS3X6fLxBHRFVyIkH1zHDWefDf0cBmIMamNBdOzJ3YFofJ93q
 r2CLb1fsvJplWnuU/mOPfjTEnEiqMVuMhDs5pKY3RGhg/74UIwo92KDPLLSgL+76jglP
 p9Ho8SjDyZIRo8GztjtK3JOopDBh1LsklJYLe4HxQ29MQsqcBbgrrmPHnZaJwMLQNrVR
 OiFw==
X-Gm-Message-State: AJcUukfMcYZZAV0NZU4BBis7sEp8zC9vk8cSof/yMB6cIDlHOYZzDwlz
 S2w4ZMsQ2VDZf/bzYnRll3x2rw==
X-Google-Smtp-Source: ALg8bN67ZlPKwoxqZKrrOADnPu1PnM+FTx1HGuPiJY7H68wh6QChT/9O7SOyFP9JBrcDuyzJJwcLLA==
X-Received: by 2002:a62:4e83:: with SMTP id
 c125mr26812517pfb.101.1547489256198; 
 Mon, 14 Jan 2019 10:07:36 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:55a3:6ea4:4b91:28a5])
 by smtp.googlemail.com with ESMTPSA id d21sm1228102pgv.37.2019.01.14.10.07.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Jan 2019 10:07:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>, arm@kernel.org
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,
 armv8' compatible string
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
References: <20190109202934.29304-1-robh@kernel.org>
Date: Mon, 14 Jan 2019 10:07:34 -0800
Message-ID: <7hd0ozkt95.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_100737_301323_E2F700A3 
X-CRM114-Status: GOOD (  11.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-arm-msm@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 David Brown <david.brown@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-rockchip@lists.infradead.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Baolin Wang <baolin.wang@linaro.org>, Andy Gross <andy.gross@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Robert Richter <rrichter@cavium.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Jayachandran C <jnair@caviumnetworks.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>,
 Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chanho Min <chanho.min@lge.com>, Duc Dang <dhdang@apm.com>,
 linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rob Herring <robh@kernel.org> writes:

> The 'arm,armv8' compatible string is only for software models. It adds
> little value otherwise and is inconsistently used as a fallback on some
> platforms. Remove it from those platforms.
>
> This fixes warnings generated by the DT schema.
>
> Reported-by: Michal Simek <michal.simek@xilinx.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

[...]

>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    |   8 +-

Acked-by: Kevin Hilman <khilman@baylibre.com>  # for amlogic/meson

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
