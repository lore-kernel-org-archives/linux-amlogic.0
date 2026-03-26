Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB9810AB810
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 19:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMxn/qP3sqNPH4D7/ASJ/cMuAIQOEf/ubX1TUYsWLeI=; b=ufzvEUB6tz+fBK
	KgyAiwoeQS20EqC54ZamyMRMIqJ4BKF558NRGKqxJ/Nnv1aNujbwG/T7m9S0Fm56bmkYGEPjo6/eO
	KEdgE73K27SwjRuHWKTp2suf7wGzsH9tKV56tcRi+ztKYYgZbk/2iQXONzt0xeSEflYWIl0TK55CU
	9Uu4EjFzLSA68clhl8uKsJKBnq/U7UMVx3Pa/22xB0FFVZydyTUkXZDMSR85MDGyA/+UJYtJ8oMUR
	oMyBsV39W+SK3hrwPv4ngIoAnuoYCFkxR5bCQ+aEPUnXdRHrV92JhSwImxgs/rrf2LXWjKevfPSL8
	sjUdT42z/4aSnjsS83yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qpn-000000069LI-2ToL;
	Thu, 26 Mar 2026 19:57:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qpl-000000069Ko-0QgJ;
	Thu, 26 Mar 2026 19:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7383541AAD;
	Thu, 26 Mar 2026 19:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2D5C116C6;
	Thu, 26 Mar 2026 19:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774555055;
	bh=JttQr6ja19BA2NJCGUge8nm+gAYUlqCp/BXQRJsn6tk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q4rcr3icHxtXNIKV8otrzy/M2ts4J7FKyHvTRDMiThEsg3UsHYnmzKAdkZBLAiAVw
	 eFF4tMoGYttH/02V0fPgQPIa3MhtZJ8b+yceKHAxBRXzsbt1N+72iLv03D+yauctUu
	 9LT26ZJbFPwjYlnM7WNeCBaos22MgZljhJCRLJKRfGjVy+9rUmnGupu+cy6fXs5B7y
	 8kuddANncDFk51SIdCZLxdHVk0ima/XP8697+mocmMMikvRi9Hqbr400A6GkIqfXOz
	 nkUwG1vWUhYvBsSGmWl9Gs6Opcb8SRt/6C3Lw8M1h5hApLzdIb4Wg10GlygF926V2O
	 Be9VPD/rBkL7Q==
Date: Thu, 26 Mar 2026 19:57:25 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com,
 dlechner@baylibre.com, andy@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] iio: adc: meson-saradc: add support for Meson S4
Message-ID: <20260326195725.4be0624a@jic23-huawei>
In-Reply-To: <20260325070618.81955-1-nick@khadas.com>
References: <20260325070618.81955-1-nick@khadas.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_125737_163521_591E17C6 
X-CRM114-Status: GOOD (  20.26  )
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

On Wed, 25 Mar 2026 15:06:14 +0800
Nick Xie <nick@khadas.com> wrote:

> This series adds support for the SARADC IP block found in the Amlogic
> Meson S4 (S905Y4) SoC and enables it for the Khadas VIM1S board to
> support the onboard ADC 'Function' key.
> 
> There are no known hardware differences between the SARADC on the S4
> and the previous G12A generation. The S4 bindings utilize a fallback
> to G12A, but a dedicated driver match entry is included to ensure the
> correct part name is exposed to the userspace ABI.
> 
Applied patches 1 and 2 to the togreg branch of iio.git.

> Changes in v3:
> - Patch 1: Updated the commit message to explicitly explain why the
>   comment regarding the generic fallback was added.
> - Patch 2: Retained the driver patch and updated the commit message to
>   clarify that the dedicated match entry is kept specifically for
>   userspace ABI naming purposes.
> - Link to v2: https://lore.kernel.org/all/20260323013408.429701-1-nick@khadas.com/
> 
> Changes in v2:
> - Addressed feedback from Krzysztof Kozlowski:
>   - Updated dt-bindings commit message to explain the hardware compatibility.
>   - Separated the S4 compatible string in the YAML bindings to ensure it
>     correctly falls back to the specific "amlogic,meson-g12a-saradc" rather
>     than the generic "amlogic,meson-saradc".
>   - Updated the S4 SoC dtsi to use the correct G12A fallback.
> - Added Martin's Reviewed-by tags where appropriate.
> - Link to v1: https://lore.kernel.org/all/20260228065840.702651-1-nick@khadas.com/
> 
> 
> Nick Xie (4):
>   dt-bindings: iio: adc: amlogic,meson-saradc: add S4 compatible
>   iio: adc: meson-saradc: add support for Meson S4
>   arm64: dts: amlogic: meson-s4: add internal SARADC controller
>   arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key
>     support
> 
>  .../iio/adc/amlogic,meson-saradc.yaml         |  4 ++++
>  .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 14 ++++++++++++++
>  drivers/iio/adc/meson_saradc.c                |  8 ++++++++
>  4 files changed, 45 insertions(+)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
