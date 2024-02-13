Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBE5C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fxWwpmI+KlCTvvs6wfpcBSg4wfKbrveIaLq7R8aM70=; b=EmhVYqFyRGkyrx
	8cOa6Tl0Gu6ScZoFAJaILruE66jrDf7CmgMyc69cnsEp7VBkVL8/km7u4w4GKamhLMU1CBoueuFJw
	jdj4uDoJwM2aIlGqPRIgcVMzrkR8YnOj95WngtapIr9OeA7JXmP5ivIAzC9U/axkbkP+A56AJz06Q
	Gchw27/WFTRZEu/JJV1V8SFHf+rgmGdrjRSB9RN/OsmEZ6U/z+/wfZ1VIiqOcK80QoA8BdMKnl7Ei
	vTsdC7XzX8J9JuhdbiXJ40lZKvKL3bJ4smdq31KDHvo64Irs717qk/ua782hwqsk3BqHoW62pei6G
	W0MNXinosNAdrk0JUi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtBz-00000009Osr-19ls;
	Tue, 13 Feb 2024 13:51:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtBw-00000009OsF-0kxy
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 13:51:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5F281CE1BC5;
	Tue, 13 Feb 2024 13:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A650C433C7;
	Tue, 13 Feb 2024 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707832277;
	bh=HNhK27P/m0iZHnaSdD6ARgBcTakNthY+kBcRycKd/LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBQJNzpS0WRPH8pgo/PWe64NvyKCeFuzLG/q949mn/LVMrLK5bB5x8iw8Jfb0bNIs
	 5HVDuGaY4i3dRZqMhOcq6fSOoWohTANgn8OTu3+UOB+MD/4R8HY8hpuJVQ4dJDeywf
	 9653oQzL3wKE+zp6iTR5TIwLTcuActBiun+mD91pmBEw5LAYx36jkREB8heM3yPwlx
	 B5rRJo2Z6Kv3V4sahdkkcWJs1a4aJxvBxhOmOuQb5Pw+3dviiZ7OfkxPDoCKqxTOOf
	 Bth2NP2gsRmFarGIS0E9NgQy/Tt6aQc5NLQJpKDMTUjThGABYV6d+R8sxkViMjzVNK
	 rCJzzzF/V1dfA==
Date: Tue, 13 Feb 2024 07:51:15 -0600
From: Rob Herring <robh@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: AML <linux-amlogic@lists.infradead.org>,
	DT <devicetree@vger.kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: add fbx8am DT overlays
Message-ID: <20240213135115.GA1090963-robh@kernel.org>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <5ac4741d-766d-4b6d-95ac-669474d05e6a@freebox.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ac4741d-766d-4b6d-95ac-669474d05e6a@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_055120_449537_6C5412FF 
X-CRM114-Status: GOOD (  14.39  )
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

On Mon, Feb 12, 2024 at 06:53:01PM +0100, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> Add support for two variants of the fbx8am board.
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile                       |  7 +++++++
>  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 35 ++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 25 ++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index e9baa2cf02273..2fd7c7a18126f 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -81,3 +81,10 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
> +
> +# Overlays
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtbo
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtbo
> +
> +# Enable support for DT overlays
> +DTC_FLAGS_meson-g12a-fbx8am += -@

Overlays need to be applied to something in the kernel at build time.
Applying is done the same way as composing object files for modules.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
