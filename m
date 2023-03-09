Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03D1C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdbeRICIc8km6EMgIbOkUyx57Be7nHSwPQ/JH5n0YeY=; b=jNvZbA9YpE/mzd
	H71jGR908eGUXa3vLefP0+O87WSNbNGNKFmCXtryjPeEHx98Jt8vf9nS4jof9sA2Ta9UDn+edeAlq
	8iLAGW+olmbviTffQU1WlLIzMEWhyMRrkAd7pq5iNs78Aw2stqvWy/3mZc8NMYP0UGoyZgPYjyFS7
	81XXpqJSPNaJM0VEvd3iv7mi9TCMsKHdfDRpCfkvgWvrBMrOC5veqWZMUBnsDHb6LsYs2HZO7ALIX
	ASsveorIysjr0DB9REc4VyESI5jIb3v6vAbh/Fu/ZgAqxrFw/OQSY5YweHgZFKdFWiFF+jlGNgY2/
	IlEZ78jtC+XKT3z8c/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEJW-009Qei-7T; Thu, 09 Mar 2023 11:20:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paE0T-009HeT-Mp; Thu, 09 Mar 2023 11:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A667E61AF0;
	Thu,  9 Mar 2023 11:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C6CC4339B;
	Thu,  9 Mar 2023 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678359620;
	bh=04U3AJP9vp1UtDPX2lLc42jFVHnP70gnbwI48rebeNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=an3FyH9Y36iLn5XxzO0uxeM/Db1L8txd5+ZntT0hpIDFnZdoKn2n7eof69mrls0rU
	 N9LaxmyNYsUExw6yHvGzPGl6qkA6TgCh/j+YhKCDcqrb1du3eJ6ZP2Q2deplEQYWfO
	 GsPokmki+LbjApEZlvoL7cPrHLBiBBFNmGKRd2jo=
Date: Thu, 9 Mar 2023 12:00:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 3/3] arm64: dts: meson-g12-common: Use the G12A UART
 compatible string
Message-ID: <ZAm8OfpNWYKL1HwV@kroah.com>
References: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
 <20230307222651.2106615-4-martin.blumenstingl@googlemail.com>
 <5325f790-50d8-56eb-b8ac-99840d5b3ad2@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5325f790-50d8-56eb-b8ac-99840d5b3ad2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_030021_817453_8076D4AC 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-amlogic@lists.infradead.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Mar 08, 2023 at 01:21:21PM +0100, neil.armstrong@linaro.org wrote:
> On 07/03/2023 23:26, Martin Blumenstingl wrote:
> > Switch meson-12-common.dtsi to use the Meson G12A specific UART
> > compatible string. This enables the "divide XTAL by 2" divider which
> > improves support for UART attached Bluetooth modules (for example
> > RTL8822CS) running at a baud rate of 1500000. Without dividing XTAL
> > (24MHz) by 2 a baud rate of 1500000 cannot be generated cleanly and the
> > resulting jitter breaks communication with the module.
> > 
> > Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> > Greg, please don't take this through your tree. I included this patch
> > to show the overall goal of this series. If Neil won't take this as
> > part of another series then I'll send it separately.
> 
> Actually I'm ok if Greg takes the whole patchset, including this one, via
> the tty tree.

Ok, I'll take them all, thanks.

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
