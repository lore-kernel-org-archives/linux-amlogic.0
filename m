Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CE1C678D4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Mar 2023 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eY9+RFzg4eNKoLnWOxXtFILF+/j1ZIHHggvnwtm0Vbw=; b=El9F04HBZ92a2X
	CbzQxoTkaq1AukANffxHVlWBZ5ouh3odLNljVlNQD4MlF9PibHpjPcv2QGWaOowmyeyuDw84EwvIo
	sPqOJJKXt8MCXrv9HBg7+7//eLlpwxMR8egIx6x6y0GUA8cMBJbcK+JhzEBrb5G8k4O22+y0kVr33
	knIWtCA8mJNxXtP4W7tZKaVfV6nporemReYUZXT37ba4f8IdDYodJu6+U3c8/vw9Hds69v6gAPUB0
	gvIZ3bUubR9bEcMIx31yO+Sk22bXIvDLeJ+5Sl/cMBaGV8F75M8t4PnL4sXCz4KBqcRoP9YaT/NUI
	NS93ebTVc4V+XJtx1OLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXejr-001KtJ-Iq; Thu, 02 Mar 2023 08:56:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXejo-001KsN-Qy
	for linux-amlogic@lists.infradead.org; Thu, 02 Mar 2023 08:56:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EDEF261540;
	Thu,  2 Mar 2023 08:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968EBC433A4;
	Thu,  2 Mar 2023 08:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677747389;
	bh=eoE3BSuOF9U6nSiuduUdzvmOmH7E3fGV+JurSGV6L/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kJD8dgfjSajccXXQZIDokCyc1flrDrITjcsUh+oZpt49AT7dAVbl0e/vdbpMppApn
	 p3FyTpnMJmj790EIAqmvo3YiWJCURBumv4z3+EoSQywUvdJEGeQT7n6jtWEevwwtC2
	 tK4CZDspxgufCuEx6+F7CAFsLnE1c1N7FgN8u1cpNCIJ4aOOzti8BxVIl/thqmCjOT
	 bOmsy0Y4TFQ1ThgDDvKEILJ6LKDQzJRfbifsMSAuyor3IT6r/aX257yOmVPI49sZ+X
	 ICpT4G5kmOD+Fp17UszGDV3OoNfGpC9v3pUt0QQWLd8tolyTg9f6atWjwof2yhvRcA
	 TxfLrEJsp3V4w==
Message-ID: <ad325c16-b0ae-0bb8-407c-f37cc3f070e7@kernel.org>
Date: Thu, 2 Mar 2023 09:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR
 Controller
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-3-zelong.dong@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230302063402.42708-3-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_005632_962110_0322B97A 
X-CRM114-Status: GOOD (  18.70  )
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

On 02/03/2023 07:34, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible for Amlogic's Meson-S4 IR Controller

You do more than written here... Also, add full stop to the commit msg.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  Documentation/devicetree/bindings/media/meson-ir.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
> index efd9d29a8f10..2a6662edd04d 100644
> --- a/Documentation/devicetree/bindings/media/meson-ir.txt
> +++ b/Documentation/devicetree/bindings/media/meson-ir.txt
> @@ -5,11 +5,14 @@ Required properties:
>  		  - "amlogic,meson6-ir"
>  		  - "amlogic,meson8b-ir"
>  		  - "amlogic,meson-gxbb-ir"
> +		  - "amlogic,meson-s4-ir"
>   - reg		: physical base address and length of the device registers
>   - interrupts	: a single specifier for the interrupt from the device
>  
>  Optional properties:
>   - linux,rc-map-name:	see rc.txt file in the same directory.
> + - amlogic,ir-support-hw-decode: enable hardware IR Decoder, and register
> +				 rc driver as type RC_DRIVER_SCANCODE


Please convert the file to DT schema (YAML) first, before adding new
properties. New compatible would be fine, but not new properties.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
