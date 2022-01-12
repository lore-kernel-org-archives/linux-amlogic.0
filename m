Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75096C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 01:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uW5Tp0tGltKSMGx4t2Yw/i4/i68qMs9DaBrsLtHeAs=; b=xVDlvz5rxepjWA
	Ql4GUFa8hR9Ab3TN2VXDhLZ1Wv/cXU7s0gVuN3aoCPx/RccnWWrd979B1Nd/I1gn4PrsO1IPDpo6o
	GcQyIn+TOYvavNoVMXXGqIw8OFVMwx7ytAK9mYt71sgqXPy4Rj6IuU3xkgjgiXIKm8y1QaOgZ1mP9
	YvEqedQ2aoCH+P0d6pZzKpXjFAYvECtFTZd67M21hdwjb5Y1Dp75OZRruPi2AKdcLZAjGUANecRrw
	m84+KCvUah6FX4VsU0mkmt4DB9ea57+uDAm0dlW8HYLluUnoT03E1hX/UaI+kWd10xZmnGC3d5lzg
	uO/+WDb1iHpKXJp5yfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7SkK-000gdO-VY; Wed, 12 Jan 2022 01:48:16 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7SkI-000gbj-C4; Wed, 12 Jan 2022 01:48:15 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso903710otr.6; 
 Tue, 11 Jan 2022 17:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ik98dbcozYmPN6lZff3Ua7PUGw9hdVOCzctxvy/Tu10=;
 b=B9wTEOQUC0b45M78Dfgig5uggFBI6rQpxft5rzMDN+b8DE3XhdciPRVK8Vik7/7XiI
 DEX/vo5qvu0PMve9hz7bjtF3p+6pyiqYeEYoIc5lBu2Ly34aUZhDunIQa/LD4SZwWajQ
 D2R/zweu8QAp3UhN0Q01/Clh1Qa8zibD9IcBhVLnEGoocxlUZDW9Dju3pgzkkRipmLw0
 oHDKQyBfPUlgnfgn1Yn/Vd6gRhvRokLfjw+hTPwDDmJo0eNeF+cXpo4wi7VQ6ixoxurY
 SICFTf9Z7QT12jqebwtYxPwSmwsx5zt/s3MnusAoem3dt+8QiELtOo1IQ5oQBzrbyHPz
 xbfQ==
X-Gm-Message-State: AOAM533VsYYa/ziBXiGXHzDu64rW1UP9EM6kvejQ3ih8T6iLBmfIZ4IC
 Kz8QUJ5HozUSqjcqXmyCRg==
X-Google-Smtp-Source: ABdhPJz42u2no1OUu7eszZ7PMR3hrkXlHdBWiL2Rf3E54ziC8XPMBGWquYR+2+gzMoyGthdl9nYGGw==
X-Received: by 2002:a05:6830:4393:: with SMTP id
 s19mr5148173otv.272.1641952092777; 
 Tue, 11 Jan 2022 17:48:12 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t26sm1991074oic.51.2022.01.11.17.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:48:11 -0800 (PST)
Received: (nullmailer pid 3894790 invoked by uid 1000);
 Wed, 12 Jan 2022 01:48:10 -0000
Date: Tue, 11 Jan 2022 19:48:10 -0600
From: Rob Herring <robh@kernel.org>
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: devicetree@vger.kernel.org, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 narmstrong@baylibre.com, linux-arm-kernel@lists.infradead.org,
 p.zabel@pengutronix.de, robh+dt@kernel.org, martin.blumenstingl@googlemail.com
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add compatible for Meson-S4
 Reset Controller
Message-ID: <Yd4zWnQxB1ZK8IPo@robh.at.kernel.org>
References: <20220107023931.13251-1-zelong.dong@amlogic.com>
 <20220107023931.13251-2-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107023931.13251-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_174814_436838_85A30D84 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

On Fri, 07 Jan 2022 10:39:29 +0800, Zelong Dong wrote:
> Add new compatible for Amlogic's Meson-S4 Reset Controller
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
