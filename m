Return-Path: <SRS0=/OEX=PP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B680BC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Oct 2021 21:12:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80FE760F92
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Oct 2021 21:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80FE760F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHajBAIWQTV2Lm54u4idlURZuyKAt4LwRM2eWJacdYU=; b=YtKp7ViGrmro0U
	T5fWjllVY7+PTE7J7oNxqHVM545+Pfjo+Zn50XoTNnc02BZonAFf/mXtIdt5H4tVMwxBydHWTZiej
	fUSMNsYN8AMzNM131EGJakQMdCgU9Fl6q8G+3XN/DLIbHo1F3n8WhwHKEN0g07uMc5B2ba0Az1MBz
	sfgKtToc68twXWKXcCnH6qKJgSfm3ulfPvffnJ0ASgfIziSPfraqmxslmUnZdE6oWraRO0/tz5A16
	clEMV1FtkBsMv0jkfk6DUnoNYHHJ66PI0PR/qxpA8kAwxYJP4LgrEpvNiCbuIvUkvinJbigJD4+bn
	DWEZFW0BHF1f6dWsyEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqDm-0069DY-PN; Wed, 27 Oct 2021 21:12:30 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqDZ-0069BI-Un; Wed, 27 Oct 2021 21:12:19 +0000
Received: by mail-oi1-f171.google.com with SMTP id o4so5284063oia.10;
 Wed, 27 Oct 2021 14:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k3QbaEEwsED/cBYuJpMYmPOuATHo/hhXNN4M6qAU9G4=;
 b=pJwZFdPb9Im5xwEgMfYPgLIu0HOuPBwedwTUnr3fYsK6aQOuh5BWQx1/CBvxHChCz0
 ymDC+rOCyOP6/r75imE0zHBvnj3058Fb1Ase9NPi1t7qkwl4a9a/L+4vr9PVUP13hGXn
 UwvIGASjzSQYx/Q3p9e9RUxrahTtveQxUeCHk208Bx0VXsZBA5TZ4sLSsm8NaQQQCQmx
 813xW/WUsx4kNl9icpAFwYin5OZ1UX28knL+usiKierKOfmonK++4mmLnXoK8IFt8lyF
 3IZBU0fYDzeJxMbK621zjIjZXDlLWGm/kT3dbIphHdzOSEIEjm6OaPdBacXNBNh2dh5x
 1PQA==
X-Gm-Message-State: AOAM533XVv198MA70auD3ATNmhTa5t0Sd4l1VlfrX1LfPALUoq/4XYI4
 4H6J56BjfHxHLmSa3FOZkA==
X-Google-Smtp-Source: ABdhPJxe2ua1/gV81De27mOC9lJwqcKmxLbHs05qHWaf/qz4cHIdZnnQ1ssNAf0BJpeFxKvm5ffOhg==
X-Received: by 2002:a05:6808:2189:: with SMTP id
 be9mr40292oib.145.1635369137058; 
 Wed, 27 Oct 2021 14:12:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l7sm381352oog.22.2021.10.27.14.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:12:16 -0700 (PDT)
Received: (nullmailer pid 2169171 invoked by uid 1000);
 Wed, 27 Oct 2021 21:12:15 -0000
Date: Wed, 27 Oct 2021 16:12:15 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kishon@ti.com, vkoul@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Add the Amlogic Meson8 HDMI TX
 PHY bindings
Message-ID: <YXnAr0nIuzeKFhLm@robh.at.kernel.org>
References: <20211020195107.1564533-1-martin.blumenstingl@googlemail.com>
 <20211020195107.1564533-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020195107.1564533-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141218_036955_CB7D7534 
X-CRM114-Status: UNSURE (   9.44  )
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

On Wed, 20 Oct 2021 21:51:06 +0200, Martin Blumenstingl wrote:
> Amlogic Meson8, Meson8b and Meson8m2 all include an identical (or at
> least very similar) HDMI TX PHY. The PHY registers are part of the HHI
> register area.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../phy/amlogic,meson8-hdmi-tx-phy.yaml       | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
