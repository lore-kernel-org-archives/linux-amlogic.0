Return-Path: <SRS0=/Yv9=RP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F78C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2019 18:23:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7592087C
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2019 18:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmCd9hlt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7592087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGz7tZoMJc3giBKC9vMbf0gQWYOZE0CUjxZ9qqIsJjQ=; b=jmCd9hltmY1Zwl
	DjGN+pDGRAkULMwKVLqn/e3Rvx5TtFgWjDZbNU0jSeAJVdrwUbG85o04kEQG3CVWIR0V0Qcqg3OWX
	AJHdJoEcnu7HglePkycSY97cie9suWXES+5VkPpH4KdX3/t9EJS5ZrIw3XZOBbKnxbe2dEoRS7jv4
	Nb8tFyH/3kPyU9FikA2Dyp+v+QWe/ECVdLWJzaYMjgdTPjLx+fnxeeeD1K2uVv+11920ZcMi7lID2
	Hz27z01ZKRTlHZIefxjM6fpBLDZidLM+VobwQQPSOw+0xoXW3bswElt/TXlmDejV/5ZtSWKFAVUYN
	hXT0egtYEA06aYJTJgVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3m3a-0000fc-FF; Tue, 12 Mar 2019 18:23:18 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3m3X-0000WG-Kx; Tue, 12 Mar 2019 18:23:17 +0000
Received: by mail-oi1-f196.google.com with SMTP id t82so2888368oie.12;
 Tue, 12 Mar 2019 11:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MtR/uROcIP2ZKKxWXfoHxV1cDC5Gi853VTEPlMwB4SA=;
 b=VICqlH7OBZ/VQ8jMECxwGTk7eJliU5QaRY5zAuw5GkQYFiWz2lVZ+zJ/9nuDJAGquY
 Pw9BRb5JP2gCl+JC4sDk0E6BNchnLQ88qvsyB/rxlMahscbLQWDJyoBrKXeTb8Dvd5mA
 F5KpcE4CPcRkF7NS4VoAfp6fgPjgZoP6FhaNQmJf7g/rGnigHhth2vOBIRSw2A2woMxB
 zSr33PlW1p9tRXmdtEscVve8JVs+bADi8Kbpc4mT5GCRGhoYIQWHjITkquS/hOvoDl0F
 b+1JWtFNOU+LF51XkHRXStm3OYDbfpQ8FL23SAAn6sR1EmVKQvltxMIJ3fpxfx683cgu
 pDSw==
X-Gm-Message-State: APjAAAUwwZq7+gW5U1cHVGpS8aCQ8JSEc1cPSxMCGozquzRuj7RW1/rn
 xRCVuUY6uKT3Qs1BFp0lUw==
X-Google-Smtp-Source: APXvYqx+pOkxpw30qVr1Yg4ci3ubTz+pAp7YBtpcJF8ds1zk+6ersy64sxKubxp4HG4AbWgsGpOVvg==
X-Received: by 2002:aca:df45:: with SMTP id w66mr2462110oig.94.1552414994459; 
 Tue, 12 Mar 2019 11:23:14 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w22sm3820004oth.45.2019.03.12.11.23.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 11:23:13 -0700 (PDT)
Date: Tue, 12 Mar 2019 13:23:12 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: Add Amlogic G12A USB3+PCIE
 Combo PHY  Bindings
Message-ID: <20190312182312.GA12396@bogus>
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190304103846.2060-3-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_112315_695429_92AA9C4F 
X-CRM114-Status: GOOD (  10.21  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, hminas@synopsys.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 balbi@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon,  4 Mar 2019 11:38:40 +0100, Neil Armstrong wrote:
> Add the Amlogic G12A Family USB3 + PCIE Combo PHY Bindings.
> 
> This PHY can provide exclusively USB3 or PCIE support on shared I/Os.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
