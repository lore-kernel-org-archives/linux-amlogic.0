Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BF7C43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jun 2022 22:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KO+Is2SAnYdODpUxqSxdxXYs1UIz6B0aeqUVbwcFk3Q=; b=NDtFD7TcKDBjGm
	bcywpkvfpVBdEntxkFOvDvgw+UC5AsmRCWiWDSSTETcqMRdVZE9wmmjRASttiwGOfI0wnwMxHHHaT
	U2Y2n9FKvobDjPjmwz/FcBXeojHA4HkddTUV4+mDuL4fuRzpLkGPpdpYUKqjHWTnXUA9Yj9piCP8A
	pNVAKZjk38d0JewjRYYYqTHsDrHSD6CMGhzugL8TqiBzxU1G0L7VdJl0oB0+VNgQ/F1erRtm5qL7F
	jw9V6J9fixff165jslXXjmqK4kO7T9Pgn1FqbE35wgie6py0vzyFD3ajumwG86+FqNsNLYk6ZLQOr
	nhkYL78VLqU3p5GBji7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5xEG-0036mO-Nx; Mon, 27 Jun 2022 22:29:12 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5xE6-0036kL-0G; Mon, 27 Jun 2022 22:29:03 +0000
Received: by mail-io1-f48.google.com with SMTP id y18so11146025iof.2;
        Mon, 27 Jun 2022 15:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M7JsswKtKFMmct/59/l3KSgs3sKO9aTj7Vg2773Jtg8=;
        b=WIWA4CaYUlV2ldMfQFl0PTcZ4yvUtWthjXpAPpPKfBntY6UVcCo3amNKNkIIqYh9KX
         GijIj0f4QxgSa5rjtdcZ9uJC7ODmUq28SnGxGfxVgGOejME3jfFpvUSMjNXuJBKl9dQQ
         voMNlDD1U/4Ehw6e114B8i2SY5MphJtCXyIOJa0SHAxFTA3uzhNxNN1qrh/afthAIRc1
         adJYqYE3EPVshsvfompaq5NQWmg7r8X5mfjz9dfomIpGGbg5/wqaR6qh3rxtz2Y/JMXy
         nrQB4RPrKfnNsVv8JWpTEO4e6G6g1tfPvcqbDo+geQ0QLdVXAsrW7X5xeurYcDnrVVYA
         Kd3w==
X-Gm-Message-State: AJIora/H17lWI+EtN90R4So+JBPkjbv65QP4jN+pXikkHN6k1NtRpoAk
	wCmk+0ixAK5BZvaGLQOodA==
X-Google-Smtp-Source: AGRyM1s5cyucj24BXjf2ZzIwSpTRK+LqWKYr3SfB5a36Pzs8Y0301ZfisVKbg0gnNo7Gx6l14bDoAw==
X-Received: by 2002:a05:6638:38a0:b0:331:ec50:d191 with SMTP id b32-20020a05663838a000b00331ec50d191mr9258099jav.40.1656368940397;
        Mon, 27 Jun 2022 15:29:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j194-20020a0263cb000000b00331f8fff9a3sm5266869jac.64.2022.06.27.15.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 15:28:59 -0700 (PDT)
Received: (nullmailer pid 3081821 invoked by uid 1000);
	Mon, 27 Jun 2022 22:28:58 -0000
Date: Mon, 27 Jun 2022 16:28:58 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, vkoul@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI
 D-PHY bindings
Message-ID: <20220627222858.GA3081761-robh@kernel.org>
References: <20220616133811.1674777-1-narmstrong@baylibre.com>
 <20220616133811.1674777-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616133811.1674777-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_152902_066305_BCEF499A 
X-CRM114-Status: UNSURE (   9.91  )
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

On Thu, 16 Jun 2022 15:38:10 +0200, Neil Armstrong wrote:
> The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
> panels, this adds the bindings.
> 
> This Analog D-PHY works with a separate Digital MIPI D-PHY.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../phy/amlogic,g12a-mipi-dphy-analog.yaml    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
