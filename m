Return-Path: <SRS0=cPU3=MG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4F3C12002
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 23:47:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F54A61106
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 23:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F54A61106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpQnhNwXnO6i0HSHrwyw21nv71S009i7VO7WdO6yEvo=; b=TEc6EFDBjA0GFO
	wFOXEnx2k7TwxuCIiWtZF6VGzWKwEUP7ZDPlQDjhbKpxbB36vOaYgUG/OPWNp9yMj/RyhL8jzF7ve
	+NPClIoM8pHXBYfkCmCkNyuN+v078+sqIcl6QDVtkdTnnIWHuWtG/+teWcvx7Hcel3vl3HLFB0izD
	gKorL/x8bUzmZG/EvfdHjY63/TaLxOsNgtmLnvquJhnlcYkwGLWiTY1PAhPbz3h+TYyh9QgtNsjRD
	v6JG/jJvaXqdZYxyw3thk3IjUGubfK4jnK+HBPS/ncoMUX19rK7VIo2H9abMpteuUd/KzKB1zzJ+Y
	XhcDth6zAPDQfzQuoqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ob1-00GPil-5K; Wed, 14 Jul 2021 23:47:19 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3m8h-00FI9Q-6p; Wed, 14 Jul 2021 21:09:56 +0000
Received: by mail-io1-f49.google.com with SMTP id z9so3802419iob.8;
 Wed, 14 Jul 2021 14:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i1vfhn+CRUOHYGpYKbityrVIovO4erqwqnKHptg/N30=;
 b=hdzmjlHS+2rOVNqlBuBNI0nFw1FEDUWOzcNebnwRSG2OoUgJ64pLUJOUqoQ0HKBkYb
 ntVb9+FEPvNkffehj4VuuDlwtLJGKtl/PtIx7/TmV8RiTuS5VVWhVoCdfzxdV//lAdlW
 e6864WZJt9EWSYfK2RXoNYK7WciKJkfMNT2H2Rc5dHT89r9Ixjio90QOVeHgh4fcF0PC
 9cWNHBz7Brmv3jGIpKn039hTxvKF2kX+eXDcjp7aER2+ixq2vmNxVmSfhzrO9rOAPbvD
 KArn0hNhAtA89Z7LDTdFlcKlMPACv4N5pJ2OklfLPLvg7Y8UfGu+L9q9ILrg2TnET7XT
 cZ5A==
X-Gm-Message-State: AOAM532AbWnGp96zgbPlrFBztLcwghc2/SsmxY5Pq6LUI0QSowwks8sA
 Xx0qpLWFBvgIuWKGoaKBPA==
X-Google-Smtp-Source: ABdhPJz7iMkOpKxv+9qy0XrhTd1+HIsoMrLD7EmQMOatdz2vJMZUodErwzMhE5Hr2jtWY1ej2fSMSg==
X-Received: by 2002:a05:6638:2726:: with SMTP id
 m38mr181470jav.115.1626296994336; 
 Wed, 14 Jul 2021 14:09:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id e14sm1859050ile.2.2021.07.14.14.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 14:09:53 -0700 (PDT)
Received: (nullmailer pid 3528907 invoked by uid 1000);
 Wed, 14 Jul 2021 21:09:49 -0000
Date: Wed, 14 Jul 2021 15:09:49 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, kishon@ti.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add the Amlogic Meson8 HDMI TX
 PHY bindings
Message-ID: <20210714210949.GA3528846@robh.at.kernel.org>
References: <20210629182047.893415-1-martin.blumenstingl@googlemail.com>
 <20210629182047.893415-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210629182047.893415-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_140955_334776_EA2695A2 
X-CRM114-Status: GOOD (  10.05  )
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

On Tue, 29 Jun 2021 20:20:46 +0200, Martin Blumenstingl wrote:
> Amlogic Meson8, Meson8b and Meson8m2 all include an identical (or at
> least very similar) HDMI TX PHY. The PHY registers are part of the HHI
> register area.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../phy/amlogic,meson8-hdmi-tx-phy.yaml       | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
