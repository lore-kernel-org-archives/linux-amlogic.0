Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91AECF9C6B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 20:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QahG7UbJP68UhELshaJdJ0CLmhefZ9GcPT8t8KOXpOE=; b=PDSvHYC1Uk4m9s
	vTcahzdw+gfEFUC2JXpgDnemSTzzUPq1s5tlZwZR+5ziZ3YySbiMjsMXPHtR0A1NFrutc3tIAiMlK
	maNc4wDDrKJWhzSk+mXx1wLJZ69YhIQOQjwtt2dmXC4RSDiWaqR/nuq0rdy2sPj7e9dMXpTtlYg26
	ldTxiRabk3hId10oPeO/pQh0Qk9ewMU8njNrxeT6U27rzpMuDXP54svFTorxPXdWqykCYvP6eztPo
	6oVUvVav02azJezFKboVdiPz6iBd9P6P9q776l2uV2pjVJCwctCxCeQFVrOvrjn4Fe24iylB2i90f
	zYQVYiHfe6hGsPQibqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stC9L-00000003ElM-12fI;
	Tue, 24 Sep 2024 20:28:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stC9I-00000003Ekq-1pd4;
	Tue, 24 Sep 2024 20:28:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 761F0A4385E;
	Tue, 24 Sep 2024 20:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045FAC4CEC4;
	Tue, 24 Sep 2024 20:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727209719;
	bh=1BbBMtvhZrJTG25V2HSyKYE2CU7TM+G7e8UL/oziNG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0J9MP8fuBRMumjkooK26XsHl6GDK8uJ6+UdeLVRTkFRZYZqk/W4beOIYSzjYBGq0
	 REg/eMDP6D29upQ1cpmjIGo1cwY6DwMQjuVow4QIgbL+nqw9zaoBoBfV6y6kQ4aFCK
	 QHOp5nvz94CICkKDz9oPoSkoeguhLlIGwZY5xoGZ1oo//9DsgtEFcZug4QJuaW/6AN
	 ZErcfvOBFri/V60jdyf2KMU+TZr+L6mAbU8oFEmsTzRNhxEnERJdST+svLH9eVi8bx
	 eTigUAcZa58/3lbKn1CcB/CSBlhpDBD/X8biDdDmic9s/j77VcL6Sh4TCrwond0b50
	 M1gNnys1hTCVg==
Date: Tue, 24 Sep 2024 15:28:38 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: controller: allow node name to
 be named slot@*
Message-ID: <20240924202838.GA276949-robh@kernel.org>
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
 <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-1-5aa8bdfe01af@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-1-5aa8bdfe01af@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_132840_572701_BA2DB9C8 
X-CRM114-Status: GOOD (  14.21  )
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

On Fri, Sep 20, 2024 at 10:38:03AM +0200, Neil Armstrong wrote:
> In preparation of supporting the mmc-slot subnode, allow
> the nodename to be either mmc@ or mmc-slot@
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index 58ae298cd2fc..f797c32ea688 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -20,7 +20,9 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^mmc(@.*)?$"
> +    oneOf:
> +      - pattern: "^mmc(@.*)?$"
> +      - pattern: "^slot(@.*)?$"

'^(mmc|slot)(@.*)?$'

But the description says something else...

In any case, avoiding 'oneOf' when possible makes for better warnings.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
