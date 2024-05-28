Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED9CC25B7E
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YnW8AiVY7JHvPolQ+Gsg0UGw8jfx3HbznoW5k5iYKgA=; b=YImLz2WZ7VDoHfGv6zPk8bFWUo
	M5M4zj3P8rggyAXWs8pLeLzVXmKuRcNmb3VRlq9XwGSsDN8XTY1/qz2kB4uPLVgvqPVqBJ8um10xX
	G5UwQX5adTemCqtwPxJKF7Xo4bX7PE1bybY9q8XhsEqpDbi0h8X3b9thz2eLK6sqBQkc9HjEYpW95
	1TdTCQqKxAQiFvkKOOZhdjntd2cUayyZnSgRbxJ+Pf5XigZfjKhXtJfcEgLXHeEoanPsEArD2E1UY
	lLW0r+7XobNOjG1YIfepvdmyLtx4YYlKxfwSzDt6SDnKZjOd6xnTnM/PgV690iu2qanC9bgBFhi5C
	GOF3MSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0pe-00000001ZnE-45OS;
	Tue, 28 May 2024 17:41:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0pX-00000001ZkL-2DHP;
	Tue, 28 May 2024 17:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12874622EA;
	Tue, 28 May 2024 17:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A69EC4AF0D;
	Tue, 28 May 2024 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716918106;
	bh=2WG8Xkeg5/Ff6RAW5YMx7uPU5FeuGNoTNHsOpsHRehQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eieCx/XlgmI+jlhbY37vUn6HYPJW/gdOMKp6mGaNzjjz3GOLToGr9QjASihqrsJbG
	 LxXvFXrAz7U4G6jbq+TKzDZCIGnrtrkdkJHIG3U6AOAzLt1ZPrvfHuaI9FiDy28wQH
	 nqaNeIA43S58NjBfrTuPRI3AkibBoH88oec2U0ZBkWv6srzSyTnCdeXyfv+i+9Y0Dn
	 +lrojj7a+Ruvrtku4jyFHIj7T66kfQSF4y6OMVYH0htFqt1re7FU0/SiUmmO8mHUKM
	 Z8CqT9IDh+70zIPOsrQJFZ/8ld246XSWA3LUDKxQCpmgm5EyGWsxawSmTPN6ElHLqQ
	 HVMaos4AAKWsA==
Date: Tue, 28 May 2024 12:41:45 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Igor Prusov <ivprusov@salutedevices.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20240528133215.2266419-1-arnd@kernel.org>
References: <20240528133215.2266419-1-arnd@kernel.org>
Message-Id: <171691793458.1180705.102565751927092612.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: amlogic: ad402: move thermal-zones to top
 node
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_104147_677055_7913CA6E 
X-CRM114-Status: GOOD (  11.35  )
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


On Tue, 28 May 2024 15:31:59 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> It appears that this accidentally got added into the spi node, causing
> a warning.
> 
> arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts:119.16-161.4: Warning (spi_bus_reg): /soc/spi@fd000400/thermal-zones: missing or empty reg property
> 
> Fixes: 593ab951232b ("arm64: dts: amlogic: ad402: setup thermal-zones")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 62 +++++++++----------
>  1 file changed, 31 insertions(+), 31 deletions(-)
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


New warnings running 'make CHECK_DTBS=y amlogic/meson-a1-ad402.dtb' for 20240528133215.2266419-1-arnd@kernel.org:

arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: spi@fd000400: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/amlogic,a1-spifc.yaml#






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
