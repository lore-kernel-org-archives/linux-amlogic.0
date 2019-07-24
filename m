Return-Path: <SRS0=ig9A=VV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F813C76186
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 20:04:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A43206BA
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 20:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="efrGD92A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29A43206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npyZZ2b0Zd9jGWAMO0KgEf1Qv1ATgw6hcE9mNch6qF0=; b=efrGD92Aodi+0/
	DWg3dLbE2vQ4QGMq72b/lyhmdpf9/wWgOQzCo9eyNWqJ0RSe2Erwpc5yoTZLYaTXgYzy7+zSQpe4A
	3umQlmfw1TA/vnWT2Kyu+YvBDfC+FR0qp6h8Gd9ci6IKghQm1OJt0gQWewv1ni5Yz5C9q/+5W13LM
	tz9Rl3bL1aQWCcF7jnpSodM+05ghoMdEF/L8aOKJwW8sNKb+7gWCiDtYvXQqgqlM6pD1m0Dfge3/G
	BYrpNEoFcpyrA/Xv/x2fccAEFXHEKFyCTs5eL5/dOJKkLQ+eVw8g0hLRD11+DebFrqFVjV+2aHl+2
	k/WJNgbIyBF9+WoLdUZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqNUc-00083K-Ql; Wed, 24 Jul 2019 20:04:06 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqNUa-00082a-1I; Wed, 24 Jul 2019 20:04:05 +0000
Received: by mail-io1-f68.google.com with SMTP id h6so5695792iom.7;
 Wed, 24 Jul 2019 13:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2uycp2gga3gM+KOCP4bhhbNNGiztJcFj+cixg7Ny5a8=;
 b=pMTGccFh5wiNY9luuLxBrHTlONMJT5Qjzteu6IWfzQbXXcomQLdAxP9WBqpPlGRBXW
 Oe9fqEHtYcFLWIwoSUgi9d0DDSv3ivqsO37knjn5KTohm8sq2TtG62Q6g3ZE1xHLJ5Q7
 Li67YxmC038eutlCIzLEJ2+m/SkHLqgyGdCm3mjYtt+sPV8FHqka98KPIEsQhp+phGDq
 SBSzqKIXSeR/2SCbXb4vNuMWEYSUuoyloGmmdRl0iso6zDTFSw5VzwYBwOyy9D7REebf
 knjMmWz4LwJ9OfSsam9i6SM0kaxv4U60eXB8nmSoPiqkK0C+t0F3CVMgEJByLLegzqAu
 jSpA==
X-Gm-Message-State: APjAAAXPdLbdRnQmo6sblvkPaVh0pQrZirG21orUI/NScmux/d3qWbiz
 pb5StS1Vk56BPbicWcBiOw==
X-Google-Smtp-Source: APXvYqxVgzs7Z4nbFzTiE8Dg1WGnxjhQTgBQ3UGeU4dqV15F3jI/eEMSMkTn8E1P1ohSUYz0jjYwFg==
X-Received: by 2002:a5e:c00e:: with SMTP id u14mr46190740iol.196.1563998643068; 
 Wed, 24 Jul 2019 13:04:03 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id p25sm37965705iol.48.2019.07.24.13.04.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 13:04:02 -0700 (PDT)
Date: Wed, 24 Jul 2019 14:04:01 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v1 1/2] dt-bindings: mmc: Document the Amlogic Meson
 SDHC MMC host controller
Message-ID: <20190724200401.GA28867@bogus>
References: <20190708173330.13217-1-martin.blumenstingl@googlemail.com>
 <20190708173330.13217-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708173330.13217-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_130404_080670_B6E1BCF8 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon,  8 Jul 2019 19:33:29 +0200, Martin Blumenstingl wrote:
> This documents the devicetree bindings for the SDHC MMC host controller
> found in Meson6, Meson8, Meson8b and Meson8m2 SoCs. It can use a
> bus-width of 1/4/8-bit and it supports eMMC spec 4.4x/4.5x including
> HS200 mode (up to 100MHz clock).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/mmc/amlogic,meson-mx-sdhc.txt    | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
