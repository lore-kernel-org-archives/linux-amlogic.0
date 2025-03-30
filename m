Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE17C36011
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Mar 2025 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5maU+4Xrx2+nH0xJW+uSMOgpCd3AJSn8jzoDzNRB7/A=; b=N7U0XIqzcYJ5w/
	DD83ohX0+AIE6TQZKXVNuE3bFhxUAJD/SnW+NM8QWV1WuFPFNmtMLKoFA5r4tdHn0FFNKWORNIUAM
	S5ixREXr8EWuJJCZWS02rV/5EQcQkhap8gLKzRBpNX6RLOIzu5No12XS48FfnCEt8HY3c9GEr3ui4
	5uKGx6cFN/DO81oDFIHiJqnxWcA0hGHmDWNvBaKkC2V+lbJVvSvYdRS1SFR2YgllMqxKNn4qd6j9C
	xEQZqQqK+kOBf0KmFLrmU8PKt0NB3suXOrkSFAU4+tbRYmrWAUEG/tjQeDp5O5+ZTJHshrQ84/26y
	ISN9TjALahFUJqV5uCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tytLE-0000000GGsV-2Am9;
	Sun, 30 Mar 2025 14:08:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tytLB-0000000GGs0-34v6;
	Sun, 30 Mar 2025 14:08:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 819D643741;
	Sun, 30 Mar 2025 14:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A021C4CEDD;
	Sun, 30 Mar 2025 14:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743343722;
	bh=LUNlOYjoJtR6+clEBUbrqDLTYdqMe7/XahYp2tVYzz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OzX+btqPnXdQnxDdtC+MgH0y2su0B3Q9rb4mjPFUuMbBR6fveId99VkuFVJDF5RDy
	 xpxizkQzir8PMcCcppTfz0Ewl76E76tA73MLL7edbZdk6J7vQg84YUhmVx8C5al+9S
	 ou7zmYaCMMVbyUPANs03OYmcurr0DnCUwNoZktNCCf0qw/nwDTkQBud6aV43Url0xk
	 xE+qPnxQV3Sq/leew3rkyw48lLTzFlpm82n1e3CpPI0hj8zpAJaNXsjI+jksar7ctP
	 T54sH2e5/hjRMtw9ALVsYtLrdfe7IzRXoWlEul8kwZYtl0G7xikuCl73gjQMae73Ub
	 Z7AJRSZaFES6g==
Date: Sun, 30 Mar 2025 15:08:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/2] iio: adc: meson: add MPLL clock workaround for
 GXLX
Message-ID: <20250330150834.2171d106@jic23-huawei>
In-Reply-To: <20250330101922.1942169-1-martin.blumenstingl@googlemail.com>
References: <20250330101922.1942169-1-martin.blumenstingl@googlemail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_070845_796196_9E760262 
X-CRM114-Status: GOOD (  20.64  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lars@metafoo.de, robh@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, gnstark@salutedevices.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 30 Mar 2025 12:19:20 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hello,
> 
> Amlogic GXLX SoCs seem to be mostly the same silicon as GXL. The only
> known differences are:
> - one less Mali-450 GPU core
> - no VP9 codec
> - and an odd one: the three MPLL clocks need a bit toggled in the SAR
>   ADC register space
> 
> This series attempt to fix audio output (which relies on the MPLL
> clocks) on the GXLX boards. Unfortunately all we have is a downstream
> commit [0] without any further explanation (or anyone who wants to
> provide details on this). Since it's not clear if this is a gate, a
> reset or some other hardware fix: the driver side includes a warning
> for users to update their .dtb along with kernel images in case we
> ever figure out what these bits do and how to model them properly.
Applied to the togreg branch of iio.git. Initially pushed out as testing
to get some early testing before I rebase on rc1 next weekend.

Thanks,

Jonathan

> 
> 
> Changes since v1 at [1]:
> - added Krzysztof's Acked-by to the dt-bindings patch (thank you)
> - added Neil's Reviewed-by (thank you!)
> - fixed meson_sar_adc_gxlx_param to be independent of future
>   to-be-upstreamed patches (fixes a build error)
> 
> 
> [0] https://github.com/khadas/linux/commit/d1d98f2ed8c83eb42af8880ed8e206aa402dd70a#diff-c5aaf54323ef93777c5083de37f933058ea8d0af79a1941e0b5a0667dc0f89b3
> [1] https://lore.kernel.org/linux-amlogic/20241231194207.2772750-1-martin.blumenstingl@googlemail.com/
> 
> 
> Martin Blumenstingl (2):
>   dt-bindings: iio: adc: amlogic,meson-saradc: Add GXLX SoC compatible
>   iio: adc: meson: add support for the GXLX SoC
> 
>  .../iio/adc/amlogic,meson-saradc.yaml         |  1 +
>  drivers/iio/adc/meson_saradc.c                | 34 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
