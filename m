Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1DCC54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 14:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAZnU3ktkt5y8OS2dtxCklNhh5RtglZ1x/YBOFoaalM=; b=BSWTL0H7xC8fqr
	gJXT7c+4pENLFbBjv1XMYumzvb314Z89xr6dwNGY9U2cOpWYJ9u36LGW7tCyKEITVWOdzOnb8lMZE
	mJvcRMbeWzBS6wcrqKEQ3wtYH1WVCkKmw3GPVPr+XaeLMPxrPICGYAtlloz4Zl3cblHUMZSu9tnA6
	4ZuTvYQWdUzvLTQevEZc5VRJIgv0Z7L55uzQATBm6srLskSHDYSJ7oLPUHHkDqi1n40ofUezDCPSg
	SyL56JOyXAV/YW2/gBiZQXicS4tw9X358IW7BuO5f+2GKQez64zdes2rAEPusUPfeTw1VbMtp3Fq0
	PRVcJ/x/yUIgCoI11+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrQ-007ZDj-Av; Wed, 25 Jan 2023 14:34:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgr6-007Z3d-Bb
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 14:34:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF0CD61515;
	Wed, 25 Jan 2023 14:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57A8C433D2;
	Wed, 25 Jan 2023 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674657267;
	bh=/rDP5UhwKBQYCpfhWtHHSqGm5SlvzBbl+sQ26EEgxMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gwNt9WwmTGTPrf5qkSpugw8IdJ7YSqXadQ+oHswh9HaeTC2csIIeMBVCQGLQf7ZbO
	 KgE1zCMW6XA2oQY/X0n0IB6TBGRYUTeX8F+HZMoVm3hyuEwQhpjLvNejIjYHsOXp19
	 K821lD7Fic+ef6mKT576LvxvGZnUZ+kj93GI7KTc=
Date: Wed, 25 Jan 2023 15:34:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Icenowy Zheng <uwu@icenowy.me>, linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: usb: Add device id for Genesys Logic
 hub controller
Message-ID: <Y9E98OLYedOsXHHV@kroah.com>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
 <20230121175639.12818-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230121175639.12818-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063428_455728_134511FE 
X-CRM114-Status: GOOD (  11.90  )
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

On Sat, Jan 21, 2023 at 05:56:29PM +0000, Anand Moon wrote:
> Add usb hub device id for Genesys Logic, Inc. GL852G Hub USB 2.0
> root hub.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v3: - add Ack of Krzysztof
> v2: - drop the vendor name from compatible string.
>     - drop the -OTG and -QFN76 suffix from commit message.
>     - drop the GL3523 USB 3.1 root hub device id.

I only see 4 of the 9 patches sent to the linux-usb list and cc: me, so
I'm totally confused.

I'll drop them all from my review queue now and expect a full series to
show up if they are needed to be merged through the USB tree

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
