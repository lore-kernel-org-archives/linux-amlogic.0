Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92808C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 12:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEDzoXUGQwOVXtRq/RfNgzopOpclxgp2UtC0cKKvWso=; b=YOHrL54cAmmn/c
	PpVPzpK9BoU/XIfmWc2rMPVv3PU/5DuaM1C3Oa7JeClGfJlD2CKCGI97wsWmv+6a1Y3SG81BbaxIt
	SWHDgIWlJHxz2WBB7db5AkwvVDEy3UqIXZvWp8yqPlZdtOix59EtT6H9TGnqK3pIXUR/mpQ6u8bEJ
	9Ll8QQhE5cI0bJvEdLJ6GbHxNBNCfphiRKBHSSTlL/ErTSAdu3zPXHQWNzrZZvmgqQ8aXqne7vumb
	b1Ph4+TsDvDXUq/0D3vqOMSRa45WtUsy72BpZMV92QxU6wtNI2PrN7JsjsM/9Bb2EmZLaDf5PfPFx
	oYlMQExfE10Cx2JJzPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2uXP-004MEl-V3; Thu, 30 Dec 2021 12:28:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2uXN-004MDm-KM; Thu, 30 Dec 2021 12:28:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D3786169A;
 Thu, 30 Dec 2021 12:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BE6C36AEA;
 Thu, 30 Dec 2021 12:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640867283;
 bh=q08v2xMnzhH1M5Hlg4JEoffzO4GwcuQDHUieT0yNTrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H9FzBOz8i87TrcUN8k5pMrfSe+nrNoS/4KYb1LB5lrRNyLXdRgGbIy5wZAn+NelGg
 WtUD0TviyU0Dl6Q73l1vWePMlkgYpodI5kJXPrXTSFXD4cHMqU77mAjqV4maC5eM6a
 gb3Asc84rE/f3Q4VHxj1W3dnGDKJOHI5zf0U7Vgs=
Date: Thu, 30 Dec 2021 13:28:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vyacheslav <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 3/6] dt-bindings: serial: meson: Support S4 SoC uart.
 Also Drop compatible = amlogic,meson-gx-uart.
Message-ID: <Yc2l0Rp3lrfYr6PP@kroah.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-4-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230102110.3861-4-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_042805_733399_7CA3132A 
X-CRM114-Status: GOOD (  10.72  )
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

On Thu, Dec 30, 2021 at 06:21:07PM +0800, Yu Tu wrote:
> Deprecated, don't use anymore because compatible = amlogic,meson-gx-uart
> don't differentiate between GXBB and GXL which have different
> revisions of the UART IP. So it's split into GXBB and GXL.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Again, your subject line is way too long.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
