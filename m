Return-Path: <SRS0=Oax9=W5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EA5C3A59E
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 14:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D32421670
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 14:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EKM8ItGN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D32421670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvboxdsOecBQPKw/qkcoC3u7Ns/xKDCxdKY5HqchMX8=; b=EKM8ItGNakITXZ
	P5m+BWLrpUKqug+1vHFb/k+u2CXK3sLzYDVNew3eUR4HECv3f7GJr9JUH3sMpflq6rDu1qsuY7IRV
	wsZVjfydDKS+OC7g+tAouH8w1X9epcuD+Wa6pOA+wqqgdehTYBwORhmTw7g0PkdT6SGX/OEmJqVr8
	yJLixwm+bQUXBXt15WgvPgnjsHt5owduwizdn3K9KLtmYbHJB7lyeghLeO/vqdYTHz3oxA5RYXyc3
	lssnwJurlzu0i637sIssNg5+3PkDyLpxkNCBMxoEN5JKdA3GsUKQmGsYd+zCczV+qQl+aIpMylPGL
	bHJObMu1n16BUpYoekfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4nPN-0003tu-In; Mon, 02 Sep 2019 14:34:17 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4nPK-0003tW-Hy
 for linux-amlogic@lists.infradead.org; Mon, 02 Sep 2019 14:34:16 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E5B0B1BF20E;
 Mon,  2 Sep 2019 14:34:00 +0000 (UTC)
Date: Mon, 2 Sep 2019 16:43:07 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH] PCI: amlogic: Fix reset assertion via gpio descriptor
Message-ID: <20190902144306.GA1011@voidbox.localdomain>
References: <20190901133915.12899-1-repk@triplefau.lt>
 <20190902105536.GG9720@e119886-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902105536.GG9720@e119886-lin.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_073414_745631_0646B914 
X-CRM114-Status: GOOD (  11.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Yue Wang <yue.wang@amlogic.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 02, 2019 at 11:55:36AM +0100, Andrew Murray wrote:
> On Sun, Sep 01, 2019 at 03:39:15PM +0200, Remi Pommarel wrote:
> > Normally asserting reset signal on gpio would be achieved with:
> > 	gpiod_set_value_cansleep(reset_gpio, 1);
> > 
> > Meson PCI driver set reset value to '0' instead of '1' as it takes into
> > account the PERST# signal polarity. The polarity should be taken care
> > in the device tree instead.
> > 
> > This fixes the reset assertion meaning and moves out the polarity
> > configuration in DT (please note that there is no DT currently using
> > this driver).
> 
> The device tree bindings for this give an example configuration:
> 
>         pcie: pcie@f9800000 {
>                         compatible = "amlogic,axg-pcie", "snps,dw-pcie";
>                         reg = <0x0 0xf9800000 0x0 0x400000
>                                         0x0 0xff646000 0x0 0x2000
>                                         0x0 0xff644000 0x0 0x2000
>                                         0x0 0xf9f00000 0x0 0x100000>;
>                         reg-names = "elbi", "cfg", "phy", "config";
>                         reset-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
> 
> Is the 'reset-gpios' line still consistent with this change, or does
> this need to be updated as well?

Good catch, the polarity of the reset gpio will more likely be
GPIO_ACTIVE_LOW.

Do you want a separate patch for that or can I just include it in v2 ?

Thanks.

-- 
Remi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
