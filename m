Return-Path: <SRS0=6rq1=3G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8015CC33CB3
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2020 16:05:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55877214AF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2020 16:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E8geqA2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55877214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v17yG9ET0R+IRWNYtzrAVOtWU433I5ZvmrWwklx46VE=; b=E8geqA2D9sGSr4
	ppEkiLWkOrAn43JBU0qaMMEQ/ySAaypkOffAvRH+5yj3cqCbZxZcjo1YszdesgIyNCNZSy0zr2dAi
	vbipm7WnAaH18hZIqb9/020UGSEWEU47NQsigs/qz48iU0UCXVBCCPmc40dovDwx3v/pqRLaVIgV3
	PAWsfW+JLLjM618y8vpgGTuykhsvbZ6itQ23yZr35OIKZF9A7CXCInAX0hmZJjBEdNdGWzuCkIplX
	mF9BBktq8ykBfDvuQox/F3iK8vPUCGBo9Z1LJ+HvY+8iMW6WAvGi7H3M/ETCIOEOnqMJCCdvmc2hs
	znG9OEW8Dku3JRBT7a6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isU7c-0005r3-9i; Fri, 17 Jan 2020 16:05:20 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isU7V-0005jO-FN
 for linux-amlogic@lists.infradead.org; Fri, 17 Jan 2020 16:05:18 +0000
Received: by mail-ot1-f65.google.com with SMTP id 66so22926886otd.9
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Jan 2020 08:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=09pIPN9VJnVoMEohnpzoMe9Wz3LLI11Byu6hcubzbxA=;
 b=LcsFDGu86Igmvg1sZ/5Fx4bFwTiJESQiswST7XW6OBmhUiSKK9WxZ3HfOSJAwvnZPt
 AABb0f0agOicXV8ZKS4Uhvpd9ilStbW8mRcTKhLOISHU8ymTySLI4WCoczYNXGjJVxWE
 MNFGwnAtFaQgsaosQujuWAOg328a1ECtj2rX5i/ofW4MsOqCLPCXQHIU33aFb6O4ZnL2
 FcxBaK7+uigifGDVc2wgDkJkaMDTc/OPOy+BPeSLPvPwBDO3zevNvQuR17XlnRxMcfRm
 LnhaNsLclIqv+6sSV1eNVyRTa6hQjaTgum2KkGW0ihOo79lj3Z6qjFpACOFo/QEDH0mv
 wtVg==
X-Gm-Message-State: APjAAAWlGdtBr/aNZPb7lQPtmfiOxdA60KmflahW2mlNskxtgzFhJsTG
 zcS0ncHEtmeO+lgjzt9yYw==
X-Google-Smtp-Source: APXvYqzQt3oAnIJ07HK2ThTZ7fZk/cAWmEqZh1TV2aFPYhVvNicW/VMaIbgMHihgXroZfWA+uWkxRg==
X-Received: by 2002:a9d:811:: with SMTP id 17mr6752321oty.369.1579277112497;
 Fri, 17 Jan 2020 08:05:12 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n17sm8969227otq.46.2020.01.17.08.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 08:05:11 -0800 (PST)
Received: (nullmailer pid 17750 invoked by uid 1000);
 Fri, 17 Jan 2020 16:05:10 -0000
Date: Fri, 17 Jan 2020 10:05:10 -0600
From: Rob Herring <robh@kernel.org>
To: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v5 3/7] dt-bindings: PCI: meson: Update PCIE bindings
 documentation
Message-ID: <20200117160510.GA17695@bogus>
References: <20200116111850.23690-1-repk@triplefau.lt>
 <20200116111850.23690-4-repk@triplefau.lt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116111850.23690-4-repk@triplefau.lt>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_080513_551617_D67A2E82 
X-CRM114-Status: UNSURE (   9.25  )
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

On Thu, 16 Jan 2020 12:18:46 +0100, Remi Pommarel wrote:
> Now that a new PHYs has been introduced for AXG SoC family, update
> dt bindings documentation.
> 
> Please note that this breaks backward compatibility but as not a single
> devicetree uses that yet that seems ok.
> 
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  .../bindings/pci/amlogic,meson-pcie.txt       | 22 ++++++++-----------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
