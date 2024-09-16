Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CE4C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 17:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSgACrnObbShRJlaY9FkoMQU0mckH6tKMXPv3NaaFrk=; b=HyH9YIqQzhLDWV
	h79CrhOreHsnukVHVPuO1lze0zA0nBanB000mMrbrZXZnamkkVuCGSa7rckC2afjgiIJDkkS/VOCt
	A62w6hsGfU/ABM48gn6e7ytW1W1bsJLrTuzk+9bBy74JzMhrm1Qgs/MsCKJM9Q16DvPneHp+MxdsG
	83Ky0L/5SuFCJYrPw/LNbIrtXnPZeIBjArJv9Rzh/D0rzhDQirJtDKOQuJRmUfqXuWE8XXYqJVGKL
	lqKLYn6yF8WPbZuDfOD9rbsDBZq3A89YPUFLcaVSm3Q0pMrMluF8sWpBI/B9niwjJJ9Y86sydOeNi
	0pxxBZux2301IBULm9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFkT-00000004cmK-0UTx;
	Mon, 16 Sep 2024 17:42:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFj3-00000004cPg-0HGW;
	Mon, 16 Sep 2024 17:41:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54F60A417A9;
	Mon, 16 Sep 2024 17:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88D9C4CECD;
	Mon, 16 Sep 2024 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726508483;
	bh=WloC7Qh/dLsituTGu+eNmaO/f60monF/EFxD1o3csTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pYOM1LZsrgkaAz4oK4zF9ZHnqMRf07KFptCLqVRXkqSMDSNZbfmFFUlbFyAQeqoKK
	 CfuSaUjL5WDiUww44Pex4wE/sVOMeZ9D/aTMdqL4Y59UXXSdeEOmOeXgBBGao2Y1E3
	 VVmaTaHKo9uDpZQkHAyc4/dybfagoB4Z5mjfMDISXZj+6tZQzJG5QlOxdVyyFK5Ufw
	 /KNaB0x7vRKhThBYusOLYLF8fS86Kx/UHHiAdaT1cfH32RgoO1Qu1UAZ2l/954t+cG
	 cjF98NCl6YUXnCQfzDNGEb2IEAfu88VzLpHmFdMmDxFj1YuMK4VePvx8wlmD9g1edW
	 F/otK1TVZGL7A==
Date: Mon, 16 Sep 2024 12:41:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: iio: adc: amlogic,meson-saradc: also allow
 meson8-saradc to have amlogic,hhi-sysctrl property
Message-ID: <172650848142.859049.15257284071045853888.robh@kernel.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-amlogic-hhi-sysctrl-v1-1-b8c3180b2fba@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-amlogic-hhi-sysctrl-v1-1-b8c3180b2fba@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_104125_206386_F525CAD2 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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


On Wed, 11 Sep 2024 17:29:53 +0200, Neil Armstrong wrote:
> The SARADC on the Amlogic Meson8 SoC also requires the amlogic,hhi-sysctrl,
> property, document it by adding the amlogic,meson8-saradc compatible in the
> adequate allOf:if:compatible:contains:enums along meson8b and meson8m2.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
