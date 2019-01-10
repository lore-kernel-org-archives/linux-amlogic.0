Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5058C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 08:14:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F5D214DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 08:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MfMpjp9m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAkGQfyV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F5D214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3pWvBXCM26gytV5RIrLdPcbJByH4ScGdgG5EUbrkPhA=; b=MfMpjp9mDUOz2oU8W2r3joDwL
	54G00InMnPdLStsQO+33W2Wbv3EacRQMDM3Gl9rz9INXcYf5LG1dT9winRH3Joq135nHUJlsfUPrT
	PiGjUCysfneAVZXz6XzdehDeWjNzxvj/tfJw9yUR6DT3hjG9qOF+PAF8zBw+sjuF+Mw+2smyzvydz
	kD0YUrDuzexAhW0QzLvJjf5JVjfMWIFyyO4RYX6mcwvcYmSg4uxVbPf+n2C3cGwomcrPvtNllVdSS
	rUhfuFsK3HLPMiDYL9Y8i3Wn2JCHPNJK5PGGrNTJbC6xKgsMu8WEWE7eNpKYhSxuBLzrrkuUkS3R6
	9R5jnp3AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghVTa-0004i5-DL; Thu, 10 Jan 2019 08:14:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghVTV-0004h0-WF; Thu, 10 Jan 2019 08:14:03 +0000
Received: by mail-wr1-x441.google.com with SMTP id p4so10262426wrt.7;
 Thu, 10 Jan 2019 00:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q4WN81rY19/CSQtn+Prqc4S1mOrzTHhv233JBqPegqA=;
 b=aAkGQfyV2tagvj8JZXf393JSz3g+WiisdD2pcK8cSsrdp5McbrOnjyHdWJKSuzzFIt
 fHVShHwaxgJqc3p/KAoIpnhqT4IKx1vrLDIuRt+ADa7QDbfcNKsctZmqDBg9M8mfZFxZ
 dKQcAob+q7SDWDR6rWz0OqTcdWv8f/llkuAq0berl26qtTQKbyo7EgcBFMSAHarTTJZn
 Hf8DHIWKR6heQu2WuDeqyO/c8NdxYvBfHzNVFWtBJHPUQhYavP4JF3TYjWKPTpyfElpP
 byKmr7h6r8qC/ZVQDjTIwtucz5uqN+hzb9yYHljA5NHBjYPPwAB/2njt3iO3U68TsS/Y
 0x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q4WN81rY19/CSQtn+Prqc4S1mOrzTHhv233JBqPegqA=;
 b=bf7MqgU6LFiIVztkaU57E/gGrWiz1Hu/+R2Aq1k+u18owwgXThKknyWdYKyMjCGhFo
 ldKL/smZ/ld9eUpa2XtIo65W+mKbT3V5HONEGbCwVOv05XUM9GzZDqt+a3arAkl97DL5
 5gIE3J5TRV6yeY5WMDVJrrfksG7978o5fKAjiIILdAihQry6X56vBpfOJYFLruklAZZt
 g8TrAfhZtZXdsguqozbyWvbP5Q+FHS5g9NoO5rQ1yO1klvqmpWp0DW7UXSu712J3m/Xf
 lTv5J2YrZlvUxOdUGs0SE/f309t7FqssaMSK+McB1Du924kc+9m0gMMhK1DO5i5u2m13
 GQgw==
X-Gm-Message-State: AJcUuke+ExOCB0SYDrdkmSYiNqpU/+3GhPUr/PQASlPUTATA2tD7y1+l
 sqjs0ZVq3GjyXpjftQXyhDc=
X-Google-Smtp-Source: ALg8bN59N7NHJOiUVMQQM/JVj8/9w9D3mCPv33TMTKCI2zGTEeXlDIvR0nJgcG/XoW9K6ZnSumXyDQ==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr7863298wrr.155.1547108039556; 
 Thu, 10 Jan 2019 00:13:59 -0800 (PST)
Received: from localhost (pD9E51040.dip0.t-ipconnect.de. [217.229.16.64])
 by smtp.gmail.com with ESMTPSA id x186sm15969012wmg.41.2019.01.10.00.13.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 00:13:58 -0800 (PST)
Date: Thu, 10 Jan 2019 09:13:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Message-ID: <20190110081357.GC5213@ulmo>
References: <20190109202934.29304-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_001402_066896_B7352E7A 
X-CRM114-Status: GOOD (  12.82  )
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
 David Brown <david.brown@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, arm@kernel.org,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
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
 Chunyan Zhang <zhang.lyra@gmail.com>, Chanho Min <chanho.min@lge.com>,
 Duc Dang <dhdang@apm.com>, linux-kernel@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Content-Type: multipart/mixed; boundary="===============6751076035491025702=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6751076035491025702==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 09, 2019 at 02:29:34PM -0600, Rob Herring wrote:
[...]
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi      |   4 +-
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  12 +-
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  16 +--
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlw2/sUACgkQ3SOs138+
s6GbWRAAj2bdv3QOTZa5i0HnM41y5ws/ECQCaxNW1+MeTLqiQgdheGAHfjD7evuk
vndnIolDpOB7x1xSgQd7pS8b1YkPvdtGRHqb/04VCU1UfahF1EUkPdZn0isNfIa8
av3cPOP674KwtJtVpyK4bChk6U5YUI1coSFtUOBk40i5KUlJ0ORhZJLTfLJW0JA1
/muJLHYdLJlgHx3BdcHlgpFEVzweRXplA8cTNcJlf8c/gah8jDTApWCip3TiDTAD
J0EAo7S5Ofm3O3JxRHuOBr+EQM2QkJSUbzuPDZrCurLseCFYd9A19puiqUnCIJnz
ioZDY7bZUTkSC1DPPyu9txfMAfgoBEPCcg1y0bxVcqXkwEJStPJEB+jkKHress6H
trp+QGUnpxWQ+MmnEYsVWpSmXCwWggIIKPku8yH76PMQzo79UoYaH+3XVpqLccQg
iVZgtvdkU+Qs3F7pNjbgusvX++N2ziOirbCKsotwbU6Bl9tpcnPrIZ8lVAFXozaS
puOLmuHaZc7/pP6UzBg43YnV7Dt9CSR3SLccR2Qep2cKZTTeMGNlQUF9TK+tzzv9
0Xb01uHzMrCRva+bUIWc/jrXSCxqcJjHOcN1xRfJw21Xk9lcwsnJC0mjn2r/zBwy
0fMoxes4Qor/IBcJxYWQvQkKrzYFtRMAmVAlR+O1ZaD13owdjPA=
=RZj4
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--


--===============6751076035491025702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6751076035491025702==--

