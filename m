Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE5FC001B0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 04:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpOu08Gvt8/pD1Tm8sTx44ggiRr2jWPpQazOi82kG6Y=; b=p+MsmiMMIfembS
	T6fvEaewL+BRJiSydzQdkwmXDd4OUsTo/kr/yHn2DmBsPb+CVwD75ITdD1MR2hoY2DjLMXI9lM3xZ
	bw03YlVnNLBYVksPqoW4Xz9T8Who68GDtqJHj2rtPpVd9ryT1wHMQ4qi87RHdDRlHFQIutAop7Qc+
	qgC8VjJcOjgamZPx3CGKyuJeHddPSiTEzQHh8XKvUOCs7EZn/v9BbaxMRZPcVJknin6ZqTJHlgglN
	VI8oLHwniZwu2EwS3ZM0l5ypbSl8seSbzUmuHkcRb+zSWD57kjvDqd6HmuCbCGCOHhW+cLiHsjcIn
	2jaPTpiiJOrziOUTq1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTElR-001jij-33;
	Tue, 08 Aug 2023 04:56:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTElO-001jiM-2E;
	Tue, 08 Aug 2023 04:56:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2BFB8623AC;
	Tue,  8 Aug 2023 04:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393F5C433C8;
	Tue,  8 Aug 2023 04:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691470569;
	bh=ELUfEuvS0j0li9IwceiGdgjft+KJVK1MZXLiEqWDXgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOLjsR8EoLIrFIkrhqY+hMx2irKxdw3xXoiBl8ZTHwejVBTh13wWBuAFxjtCiOxkv
	 NyzK3gV6wML/xQAxvyzP3pAI14lV13JPbBVPR4kxFBhhf1GFadlSkNvgEdZ4vKVhvX
	 fxYOlrCsxgQnHQwDJuVu2nocarwz6dSOgVR6FCNg=
Date: Tue, 8 Aug 2023 06:56:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luke Lu <luke.lu@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: meson-g12a: do post init to fix broken usb
 after resumption
Message-ID: <2023080851-duh-scroll-09bf@gregkh>
References: <20230808032510.31754-1-luke.lu@libre.computer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808032510.31754-1-luke.lu@libre.computer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_215610_796975_0EAAB062 
X-CRM114-Status: GOOD (  10.09  )
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

On Tue, Aug 08, 2023 at 03:25:10AM +0000, Luke Lu wrote:
> Device connected to usb otg port of GXL-based boards can not be
> recognised after resumption, doesn't recover even if disconnect and
> reconnect the device. dmesg shows it disconnects during resumption.
> 
> [   41.492911] usb 1-2: USB disconnect, device number 3
> [   41.499346] usb 1-2: unregistering device
> [   41.511939] usb 1-2: unregistering interface 1-2:1.0
> 
> Calling usb_post_init() will fix this issue, and it's tested and
> verified on libretech's aml-s905x-cc board.
> 
> Signed-off-by: Luke Lu <luke.lu@libre.computer>

What commit id does this fix?  Should it also go to stable kernels?

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
