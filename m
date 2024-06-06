Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C993DC27C54
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SsUBfrKl/9BB67uywL4HZ4XBkNQ2wEl8eywSgBGYnUU=; b=oeDTxlLenVbkKE3k9hLCPkUXU8
	3Dn8zMZ0VZGpsB2ypi9tARJiUO2wlqhccBzS3rvHRt3bI3NfGRN+45b3/xOZ3ZqWd7+nXRfMHOdmJ
	1xOcR/PAPUy0ZRvaaqtyTnxe4xv5xxySNBoUTUJxOPgBHVQTYQfBzgxswFR1SYx+hjGV54Nt3fWYi
	uhbVfSd+3clzIjeg6R8kY3Eo9jw3vt12Q63rfa0hcICuH3e8D+TL2YH9zvc5Mtm7S6GJttYwv4uU3
	PNrL73Vn4A+oE9faN0/KJ/hmWE3roT3R10fKsH033KpJvVxNiltTdria6zbYug9pSNoNE/9zuWOs+
	BllbdOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFFTT-0000000AOO0-0yN1;
	Thu, 06 Jun 2024 15:56:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFFTP-0000000AOLh-2DNs;
	Thu, 06 Jun 2024 15:56:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0AE361E16;
	Thu,  6 Jun 2024 15:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA4EC32781;
	Thu,  6 Jun 2024 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717689378;
	bh=tgSaH7pDA3q488BIGAg9INFjOhEWBEU92Cre1GIHnnA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=nxHxUkDy5SRXgOUC05eRFC9BM0omMZ1mJdaJJ5BTQ8mSdDDepnOjlXjqS/4JUjWoq
	 7EuUUBdiYF7wGJH3Wimq2/EgzENSUqdtPWE/6bSrBUmttExLsHFlxngfNObfFtdEkS
	 BUl1QNfQH5rbO9257a0+EHiJO2aT2Hz88curu3ZWONVInuRcoQSfomCBEbB3UuLIqg
	 rmfR9u6F7TRzdbpoGCkIYv09MJa9fbXWuvBa3DYlw/MvhBBbefYGiO7kE5pBWY3Sfi
	 7OJRysDSPVMqJyolD54U0YUjea88gIXWW/+tboACn8KlCd5VHuxb9yMof763cUZnGz
	 t+FJ+DMqmnP+Q==
Date: Thu, 06 Jun 2024 09:56:17 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240606094513.3949323-1-christianshewitt@gmail.com>
References: <20240606094513.3949323-1-christianshewitt@gmail.com>
Message-Id: <171768925717.3793270.14812356444317886177.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: add dream vendor prefix
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_085619_666805_6C8BD0EF 
X-CRM114-Status: GOOD (  10.45  )
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


On Thu, 06 Jun 2024 09:45:11 +0000, Christian Hewitt wrote:
> Add a vendor prefix for Dream Property GmbH
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y amlogic/meson-g12b-dreambox-one.dtb amlogic/meson-g12b-dreambox-two.dtb' for 20240606094513.3949323-1-christianshewitt@gmail.com:

arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
