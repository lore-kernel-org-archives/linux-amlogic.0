Return-Path: <SRS0=45KS=NO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFB4C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 22:02:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF08261284
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 22:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF08261284
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9LBENeQp1Dppw3olw0OUEVVXmpT0pCS9tj15hikctc=; b=WurfPEfZDG5flM
	EdLjpithc6BKUFrfT07LaXl8p9SR7NaTUlESo9CPfaUAJx9gvmqRWy2TMOsT3aOx/vB1AjqUVDiT2
	t5ZSgh/KycIgDzB7AGb1QErUBYm188Ve9AP2erF7VxY5cUKSOrhEQL9xjmrA5q3+85i37lBlqVAvt
	Y1UvzB1E5GDFDXEXNZRvetIjMxe+aksT/8SjWBpbYs6VgjyVYKPqtz+Glf2z4vq0njJDQRqxxpuyG
	A3ngCudcq68hHmIMGpywWQjzU6BAw+NFAgBAkRHcs3K++4FzZXP9JSlHXqhVM7mgssXN3EQ07H+ku
	DS8nwnZafxO2ejSLB4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mII1E-000ndM-9Z; Mon, 23 Aug 2021 22:02:12 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mII18-000nbb-HB
 for linux-amlogic@lists.infradead.org; Mon, 23 Aug 2021 22:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=MlJCiy5HfG8+LBY7t6BSnHFgiD/Uog0xgn9jINZ9n+o=; b=VqdGDrznCoCR6TPSXUwHHwEEVY
 uMe9AAcYiwlTkroL3Z45iSRs7PxAV4SZLMTbDtr1qS7B6+pFb0qGCqRD9Z1encObrMAhnqtjdIdoc
 ScHoyZsUoYpZttDRNIoE54L/nRModIfTGDepl+q0EJidAHKAiIiGYlTF8jnj6gfA3Aew=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mII0y-003WP2-D8; Tue, 24 Aug 2021 00:01:56 +0200
Date: Tue, 24 Aug 2021 00:01:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Saravana Kannan <saravanak@google.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, netdev@vger.kernel.org,
 kernel-team@android.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for
 "phy-handle" property
Message-ID: <YSQa1K2J4RG7xgWN@lunn.ch>
References: <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <20210818021717.3268255-1-saravanak@google.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
 <CAGETcx_xJCqOWtwZ9Ee2+0sPGNLM5=F=djtbdYENkAYZa0ynqQ@mail.gmail.com>
 <YSP91FfbzUHKiv+L@lunn.ch>
 <CAGETcx8j+bOPL_-qFzHHJkX41Ljzq8HBkbBqtd4E0-2u6a3_Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGETcx8j+bOPL_-qFzHHJkX41Ljzq8HBkbBqtd4E0-2u6a3_Hg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_150206_614380_7E773AE5 
X-CRM114-Status: GOOD (  13.66  )
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

On Mon, Aug 23, 2021 at 01:48:23PM -0700, Saravana Kannan wrote:
> On Mon, Aug 23, 2021 at 12:58 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > PHY seems to be one of those cases where it's okay to have the
> > > compatible property but also okay to not have it.
> >
> > Correct. They are like PCI or USB devices. You can ask it, what are
> > you? There are two registers in standard locations which give you a
> > vendor and product ID. We use that to find the correct driver.
> 
> For all the cases of PHYs that currently don't need any compatible
> string, requiring a compatible string of type "ethernet-phy-standard"
> would have been nice.

How does this help you? You cannot match that against anything?

How do you handle PCI and USB devices? e.g.

arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi

&pcie {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_pcie>;
        reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
        status = "okay";

        host@0 {
                reg = <0 0 0 0 0>;

                #address-cells = <3>;
                #size-cells = <2>;

                i210: i210@0 {
                        reg = <0 0 0 0 0>;
                };
        };
};

There is an intel i210 Ethernet control on the PCIe bus. There is no
compatible string, none is needed. This is no different to a PHY.

	   Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
