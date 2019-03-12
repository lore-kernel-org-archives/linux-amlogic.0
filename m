Return-Path: <SRS0=/Yv9=RP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED293C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2019 18:29:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAE8213A2
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2019 18:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rt2BI2/h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDAE8213A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=meCUQXdaifVbZ1HnzDG/JISCSkP4g2ZoWwf8co/fZvs=; b=Rt2BI2/hl8M50z
	9dPWb3s+xbUasbn5jwv/Q0gkc3vc4nL/VLfROcny9cfUjrxIuDfYpzOBhDxNOUmsM5K3RPEA1/F1h
	8QGRq4eEncq6OEGTuzMTKB/PgzYe7wDMoCvd1D/gta1JNex9o4K/NN36KdNsjFo7YYhhP90SUyCcb
	7HeGC1YR5QAHmQ4iccRhfzbOoS+2K23Fepe9Tax974KaJf/wOl8mzV42U+G4W88BdHRa7c1Z+hpcl
	aq74CtN270xaUOovk5DlFf2JD1QTIVlpsdUbNVwPPbfEJPmbETEwLlxKueicJUvaxjTOLso9qg04f
	9se9ZwTxOIKJ6LP/SR6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3m9S-0002nN-Av; Tue, 12 Mar 2019 18:29:22 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3m9P-0002ln-F3; Tue, 12 Mar 2019 18:29:20 +0000
Received: by mail-oi1-f195.google.com with SMTP id a81so2900583oii.11;
 Tue, 12 Mar 2019 11:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A0W8M0h9pVz4S1woOp3zWrpRBRJfOEQUVwAacXlRraU=;
 b=I45kr5YeNXRmn5A7MBolxyIdgJ+kSkzTyzVFx4UG6TNP04rNhZbpTzPXI8HIp+NSnN
 /FSm9qUsPrAR+TPFlbNJzSw0e3qVavAu1pnu8ZX0p7QGzdHnvyeDEr2br5newVxj3gKe
 8RBWcLdg1ygkA1XuyqU73avbjpyampTI+knrFHbdh3pUc8usnm8+sBip+t48gyjdnt59
 5WbbugL1wopTzpr4J5YcAlp6V4MTuQLzQe1jCUwKHPa6q4ftGafRZA+c9CjKbFAuK5cz
 rP6G6fM45kRziEFckuQtDs2p4nkPQh/HYSmwuBG6JmyOqZRIe4lodt8yJHA796+QSiQP
 ZdyQ==
X-Gm-Message-State: APjAAAVCfl2eJ135ioZ/j5JHl5Ls/o2LoNgBEvCggmC7+ZD6Makyim6K
 zgWCXj0kw3nV8mOK78Dpjw==
X-Google-Smtp-Source: APXvYqwFL1fHvcXK2pqJI8F3F50JNEwtKD3vAov4tkJu0f79/0mdEsNA1aRs5AwXdAx1UT4bMe0uSA==
X-Received: by 2002:aca:aacb:: with SMTP id t194mr2653082oie.129.1552415358101; 
 Tue, 12 Mar 2019 11:29:18 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 71sm639965oii.33.2019.03.12.11.29.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 11:29:17 -0700 (PDT)
Date: Tue, 12 Mar 2019 13:29:17 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: usb: dwc3: Add Amlogic G12A DWC3
 Glue Bindings
Message-ID: <20190312182917.GA22114@bogus>
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-5-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190304103846.2060-5-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_112919_503478_52F8B103 
X-CRM114-Status: GOOD (  13.17  )
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
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, hminas@synopsys.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 balbi@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon,  4 Mar 2019 11:38:42 +0100, Neil Armstrong wrote:
> Adds the bindings for the Amlogic G12A USB Glue HW.
> 
> The Amlogic G12A SoC Family embeds 2 USB Controllers :
> - a DWC3 IP configured as Host for USB2 and USB3
> - a DWC2 IP configured as Peripheral USB2 Only
> 
> A glue connects these both controllers to 2 USB2 PHYs,
> and optionnally to an USB3+PCIE Combo PHY shared with the PCIE controller.
> 
> The Glue configures the UTMI 8bit interfaces for the USB2 PHYs, including
> routing of the OTG PHY between the DWC3 and DWC2 controllers, and
> setups the on-chip OTG mode selection for this PHY.
> 
> The PHYs phandles are passed  to the Glue node since the Glue controls the
> interface with the PHY, not the DWC3 controller.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/usb/amlogic,dwc3.txt  | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
