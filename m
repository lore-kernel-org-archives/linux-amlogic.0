Return-Path: <SRS0=6rq1=3G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B723DC33CB1
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2020 16:03:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 800852064C
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2020 16:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RmHRnCbD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 800852064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbU9UBmFAtXyeogd2KIom9RfhmDNxV5MHaFootv9yu8=; b=RmHRnCbDaBWCzt
	QKTGyq8VqIHCx2AHsLDCyAry1BN64TF/OMXHfzJyHd4/MEC/uUAuYs5OECw+c7YAOiC3ByBiwsaFh
	AMVlA3lEHbcCfniMDmIiwHQ/AMgqJx/UD7LpsVMi1UqBK1C/iYK5qA2zpD/Qka9GvmmPvA93Uxe9d
	TeLofniS9lXu6tiGcy7IXXexS8ayroIIVsbuuzp3wgyoMIO2U95YeSw8tVI+CJ2iZ+jAVuSq247JH
	YE7H1UdaZVka9abMeMTntzRTr7i/RQNQ34IoFJHMAKCkTAhRx0ZOYrdAIHG5pElL0yEVV4FgKpi0x
	55ifmJbEQIiC7fa1Ed7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isU5z-0004Ga-E7; Fri, 17 Jan 2020 16:03:39 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isU5t-0004Fz-Rq
 for linux-amlogic@lists.infradead.org; Fri, 17 Jan 2020 16:03:38 +0000
Received: by mail-ot1-f65.google.com with SMTP id r9so22936554otp.13
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Jan 2020 08:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cc+2p/NdA2drwwZu+ds0cTqC+QOcu+GLQ3qVjGXmwRQ=;
 b=fkO226LPM68JRXHBrDsXvD3mOR3jPu7DzIGA0YahL6AJ3P8FCBj07+uCFeGAV2q4EN
 7+YiMl9grxpaCLF0qJ+D9w+oqjO++oaGogf/tQ/X4yySdFimfEP8N//wbGx/3LwtjSur
 Q0g3w/T2NFrPACpHT30OoaDNBguDKCTeazDDrCvJB9IwFB6SiwTn/BlVm1bljE5ddnsY
 m7dAaK2PEsWUnz2Hd7RpxwXy5Q+7LKyb5n8XZc7bYhXuiJ0hEpMaHMyb8HSDqBBjJvq6
 EZOLzdC5YKFw0xkav+gq4RoYEVIBUFNj3rg/gjdkGVFBKf1swPvLXJ83lTxPYIrgLwKA
 6C/g==
X-Gm-Message-State: APjAAAWQLyBuPlECDwXzBp9iRu+zy9f9WztHMX4Epg0RWlJsxTJXMrwV
 XTfavIHXDx+k81zVwsLEfg==
X-Google-Smtp-Source: APXvYqwStuMK0QFk68kshtVW2xFzRr4VY3Yud366nVGYgDR/8no0d8SbTl51F5kthpK2jtrWklQcQg==
X-Received: by 2002:a9d:5c86:: with SMTP id a6mr6621526oti.68.1579277012884;
 Fri, 17 Jan 2020 08:03:32 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f3sm8941303otl.38.2020.01.17.08.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 08:03:31 -0800 (PST)
Received: (nullmailer pid 15163 invoked by uid 1000);
 Fri, 17 Jan 2020 16:03:29 -0000
Date: Fri, 17 Jan 2020 10:03:29 -0600
From: Rob Herring <robh@kernel.org>
To: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v5 1/7] dt-bindings: Add AXG PCIE PHY bindings
Message-ID: <20200117160329.GA15110@bogus>
References: <20200116111850.23690-1-repk@triplefau.lt>
 <20200116111850.23690-2-repk@triplefau.lt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116111850.23690-2-repk@triplefau.lt>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_080334_347892_F7587FB7 
X-CRM114-Status: UNSURE (   8.04  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Yue Wang <yue.wang@Amlogic.com>, Remi Pommarel <repk@triplefau.lt>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 16 Jan 2020 12:18:44 +0100, Remi Pommarel wrote:
> Add documentation for PCIE PHYs found in AXG SoCs.
> 
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  .../bindings/phy/amlogic,meson-axg-pcie.yaml  | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
