Return-Path: <SRS0=U5JB=6T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC4DC47256
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 05:06:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD94206E6
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 05:06:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iCJKNyGB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB6AmbTa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD94206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TE1TB+eDWSTn3B737WANkRwc9+kVQxu9AnIlv2K6js=; b=iCJKNyGBnfk6k4
	4uyVLPg8wurLtcYtATuI1dEL9WjheCYnC5WdkwOBOSy9sWwECEHZOE0B7WGLwQCOuGBBN+RJw2ejh
	iNDYxb4ygEfkEE8VJFHGz26IBB2i1y6FcWy62ymeEpPcr/VhV0FlGIuh8aomONEigO6UPg7x1Za+x
	VKhmH3Y8IppWNuOe0/Eevx9qz4zvCmOiW1qPMvEPT/2lc+pMxhYpjqBPsDr3CmrX7l2orTFz9zB3s
	WiT1aEHgUV67iKDu7sMyHTMONCid14+K+x8psI+elj/HRhDEsqy7rKKdK/St2SNuoJ7EkVTQnhg1M
	LBsob5XQpsA0Stw0KpPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVpmn-0001L8-A4; Tue, 05 May 2020 05:06:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVpml-0001Kf-Cs; Tue, 05 May 2020 05:06:28 +0000
Received: from localhost (unknown [171.61.99.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD0A2206E6;
 Tue,  5 May 2020 05:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588655185;
 bh=e8VuXUN/uzQjDtcEKXPbNGAiXnGLHtDXeImNxpzII78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YB6AmbTa38GjMc7eliqreZ+dpQzlNmREktrgqMMyF+yMZbRhh6FVKFQrGsMR6yhzz
 KfgOtZEgzTbQM5+VCXglPTXTEvBrWAKJwrYTuuUuQhQPuS/sgyIk5S2+qL4EWR1zEB
 jSAPb5EhR65ZKTu8+6zgki6eksV7C0REvhS5p9SY=
Date: Tue, 5 May 2020 10:36:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/6] dt-bindings: phy: meson8b-usb2: Convert to json-schema
Message-ID: <20200505050621.GU1375924@vkoul-mobl>
References: <20200502114752.1048500-1-martin.blumenstingl@googlemail.com>
 <20200502114752.1048500-2-martin.blumenstingl@googlemail.com>
 <CAKTihDVy6oSuQe4eP87hWO17tBu3=XZ-PM41YOqLVOtXJ8+YeQ@mail.gmail.com>
 <28790ee42242ecc0b0050943a27f569dd1aeec16.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28790ee42242ecc0b0050943a27f569dd1aeec16.camel@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_220627_456866_5704A9F9 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, kishon@ti.com, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, hex dump <hexdump0815@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 04-05-20, 10:31, Joe Perches wrote:
> On Mon, 2020-05-04 at 12:55 +0200, hex dump wrote:
> > On Sat, May 2, 2020 at 1:48 PM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > > Now that we have the DT validation in place, let's convert the device
> > > tree bindings for the Amlogic Meson8, Meson8b, Meson8m2 and GXBB USB2
> > > PHY over to a YAML schema.
> > > 
> > > While here, also add the fallback compatible string
> > > "amlogic,meson-gxbb-usb2-phy" which is already used in
> > > arch/arm/boot/dts/meson{,8,8b}.dtsi.
> > > 
> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > 
> > Tested-by: hexdump <hexdump0815@googlemail.com>
> 
> Is the kernel now accepting "Tested-by" lines from robots?

Should we not? bots have been given Reported-by...
> 
> If hexdump0815@googlemail.com is not a robot, can you please use
> your full legal name instead?

Looking at emails, this doesnt seem a bot, so I am asking for full legal
name for these to be added.

Thanks
-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
