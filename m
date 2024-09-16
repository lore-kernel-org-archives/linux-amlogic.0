Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5A2C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 17:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RAYSAEHfLB8alkMdazQ53z82dOZu0N2a8vmt1yKAMc=; b=yRbCcGS/XScSpA
	WbXjN6hngHg+v9pTIjIsZmAAWOpsl9Ox2ZSP4zDqJ3Q2S9PfM4827bFuAxgfDI2Ftvq2MYdxot6PT
	jeUf8g/S0hPg9bmXTUoeusdz5Zxy3OJyL+5mv3ioJKJYAC20x0gKpfcJOPLXXG6HvwkwZuk3jBLXv
	lJpTtCOHu+OtdqOLbP33j0CLrp6uqWvtmxefXT1/4Im7mbQJz/HYDzcSzZkFYAXEoW3AhkMPi2xQo
	Ui0mBCD9HbaDHrOASUzeHnX93HQYsfVHtiUOuMpIeVOHNBaeo0yqrfpILasr78/NtLzwZ6aGC3dMl
	9arR/rPMQh2dOBDgyCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFRV-00000004aYS-0UZe;
	Mon, 16 Sep 2024 17:23:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFRS-00000004aWw-0yjB;
	Mon, 16 Sep 2024 17:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83412A4105E;
	Mon, 16 Sep 2024 17:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D086AC4CEC4;
	Mon, 16 Sep 2024 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726507393;
	bh=nBMpe9G5hX+7mnkTEs+rD8NKlNfpBVsk7V90+43erik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ad4X7v/v7VOIVBO5YYXnJF6fy7P7yN6RTL+277um3XnwWhj9KpGXfHuDCZJUWlw1G
	 4YWGavyLmyw6nMohxL6DbeB5LlsCweNA2Xe7R1TWx8mx739Z3Y375FTkL4TEWZE/pV
	 C2TY0sqoINVoBIyQ55c5wt/SbTAfPqcR5nuJk/fWFW5NoaFexcHEJScsrQlrMqp8rP
	 dhCr/jqrKmOtdOPQfSqVbd4OvdQHAXUEBXQFyaJ5oTD19vLE/LzwNHuyi3SBUuvfXF
	 08TGx2pAB0r61UPwg3qD9bsa37VkiZ1rQRed0aN4cA9NT98NCdNLna0zBTIzqWFnOS
	 f3xVO8HlQVdww==
Date: Mon, 16 Sep 2024 12:23:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] dt-bindings: clock: convert amlogic,meson8b-clkc.txt to
 dtschema
Message-ID: <172650738929.834858.9318382302373477607.robh@kernel.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_102314_357631_8F1DCF6F 
X-CRM114-Status: UNSURE (   8.28  )
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


On Wed, 11 Sep 2024 17:09:06 +0200, Neil Armstrong wrote:
> Convert the Amlogic Meson8, Meson8b and Meson8m2 Clock and
> Reset Controller to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/clock/amlogic,meson8-clkc.yaml        | 45 +++++++++++++++++++
>  .../bindings/clock/amlogic,meson8b-clkc.txt        | 51 ----------------------
>  2 files changed, 45 insertions(+), 51 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
