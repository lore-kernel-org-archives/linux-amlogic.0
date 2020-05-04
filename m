Return-Path: <SRS0=PlEO=6S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5736C3A5A9
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2020 17:32:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DDF206D9
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2020 17:32:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="adjioxFU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4DDF206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTnBydwbWMY6dYhS5y8YaocbK4zNTorFvZazy3rHHA4=; b=adjioxFUzb5K05
	q1Ru4Iky3Qy2tWjlbtU6lgUQejo8itrBT9CPJcf91WIlBdK25s3TQx3WaxKQ3w1Ci/H7XU4Nv3GT9
	WWq4oscvIzzan61FWRntPT0CjA06wWGOrmVFSwBFQ/A4bVO83N4JiQ/v40pNwUK7f8VGBRlX3Kut8
	MBx+iLEteJO4WnRN7O5YO3dk3v3Dfiv1N8ru/rOOoUhr49eMZaQlAxwbcFsbpaImvw0Cnfn3D1tYZ
	vpVew/dVfy4XaTV3TQH+vqMILjRt0/i4Ahbln5AiSEwe5X0u17iCjC+OwEoS2t8J9ph8OKObKnSyv
	XykeOKezUk0FUv/yxNaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVewi-0007Oa-Kv; Mon, 04 May 2020 17:32:00 +0000
Received: from smtprelay0130.hostedemail.com ([216.40.44.130]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVewg-0007Ng-IV; Mon, 04 May 2020 17:31:59 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 9EFCC180A55F0;
 Mon,  4 May 2020 17:31:56 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: twig62_4aee47edd0d24
X-Filterd-Recvd-Size: 1976
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Mon,  4 May 2020 17:31:54 +0000 (UTC)
Message-ID: <28790ee42242ecc0b0050943a27f569dd1aeec16.camel@perches.com>
Subject: Re: [PATCH 1/6] dt-bindings: phy: meson8b-usb2: Convert to json-schema
From: Joe Perches <joe@perches.com>
To: hex dump <hexdump0815@gmail.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Date: Mon, 04 May 2020 10:31:53 -0700
In-Reply-To: <CAKTihDVy6oSuQe4eP87hWO17tBu3=XZ-PM41YOqLVOtXJ8+YeQ@mail.gmail.com>
References: <20200502114752.1048500-1-martin.blumenstingl@googlemail.com>
 <20200502114752.1048500-2-martin.blumenstingl@googlemail.com>
 <CAKTihDVy6oSuQe4eP87hWO17tBu3=XZ-PM41YOqLVOtXJ8+YeQ@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_103158_669264_144C903B 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
 linux-kernel@vger.kernel.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2020-05-04 at 12:55 +0200, hex dump wrote:
> On Sat, May 2, 2020 at 1:48 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> > Now that we have the DT validation in place, let's convert the device
> > tree bindings for the Amlogic Meson8, Meson8b, Meson8m2 and GXBB USB2
> > PHY over to a YAML schema.
> > 
> > While here, also add the fallback compatible string
> > "amlogic,meson-gxbb-usb2-phy" which is already used in
> > arch/arm/boot/dts/meson{,8,8b}.dtsi.
> > 
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Tested-by: hexdump <hexdump0815@googlemail.com>

Is the kernel now accepting "Tested-by" lines from robots?

If hexdump0815@googlemail.com is not a robot, can you please use
your full legal name instead?



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
