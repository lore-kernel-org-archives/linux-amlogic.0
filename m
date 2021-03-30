Return-Path: <SRS0=3LcN=I4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23EBC433C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 22:21:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9184F619CA
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 22:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9184F619CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fv+zc0VVFmwtEOvMvXx0ZMqR5T3Fyb4e5f3zQrX2ZPg=; b=d4JHttSNrLhfT2qfhzBtR/WVv
	+Su+BUQ+2OWmYjtzGyRmqNHFbD4ufqi/iKcYhr4WnLOCNWhnbafttm9ncNMWtZk53oC3ulcidYaSk
	SbKxlnWdhsOeuf2/6veV71uN3qpCDoWQhhbMvyXcSrxdm/WSJj1B9WjjTQC/XctNM53NgmC815Dg8
	/g22+zyY0r4C/0aciRcamhfPxY0Qq0veQ8s5thH5QiPIScdpEol85kLx0IkMG/k859vxwotDAM+V6
	brOHxtS4pGcEnD9Hi2eqLLPHTCPAzkr2HDVnZEFEXKMQHLlFiuJYsHFmFydSgHQ2y5oSRtdc01p/p
	W5KX0N+qA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRMjK-004zso-BF; Tue, 30 Mar 2021 22:20:58 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRMj9-004zs4-As; Tue, 30 Mar 2021 22:20:49 +0000
Received: by mail-oi1-f170.google.com with SMTP id z15so18035449oic.8;
 Tue, 30 Mar 2021 15:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mcyjEU9ez+tE1XbLqzdhNG48XxctHrMvJR0/lCn8Z44=;
 b=b4PcTJtVUdTWl4/DcE4kUhccOCT8ilfoMBScNV0/FW02EqajFGAfV1ijwHB+phQcMA
 0fQPtrEG0A5k6U4PmzA+k07rDl212yGgQlWFcj8VwB3NoXquBYvzqZkAqgWL/K/XoEcM
 D9aKCVnCVdG4I35f1KSJzENLGYhTUFNIPQBgsGIBrEYPvYZ4FsoXOC2O2WP1ffGJLkg1
 i6exJmuyoKNlKctHPWMnp5VvR4lJduEqoQ+HWAvGDf6LG2FG2BqEmkDQNo2CqFMDgZJI
 73NFkukpqBO2dVgkOZG/aL7W10aies2R25wh/OBCB7sB0MnnEgvP995Q3+DEZWZVKY2H
 Cy1g==
X-Gm-Message-State: AOAM533EZQ/6AqlvZWjaKbKaMtLJ1FXhZ1NZ6TPgIoUKrxU1nN+RWepz
 lkNgiTO3RQCWozoMBkH6RQ==
X-Google-Smtp-Source: ABdhPJw8Ax1lZspkldAtH9xF0BBrq8cT8LiJTaiFF2YvkOxM+a/WlpNVMVBhumcTmAA0vGFd0oJ22Q==
X-Received: by 2002:aca:a8c3:: with SMTP id r186mr80139oie.129.1617142846066; 
 Tue, 30 Mar 2021 15:20:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o10sm48333ote.5.2021.03.30.15.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:20:45 -0700 (PDT)
Received: (nullmailer pid 817400 invoked by uid 1000);
 Tue, 30 Mar 2021 22:20:44 -0000
Date: Tue, 30 Mar 2021 17:20:44 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-kernel@vger.kernel.org, Drazen Spio <drazsp@gmail.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: amlogic: add MeCool KII/KIII Pro
 bindings
Message-ID: <20210330222044.GA817353@robh.at.kernel.org>
References: <20210329154753.30074-1-christianshewitt@gmail.com>
 <20210329154753.30074-2-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329154753.30074-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_232047_570434_F329692F 
X-CRM114-Status: GOOD (  10.01  )
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

On Mon, 29 Mar 2021 15:47:51 +0000, Christian Hewitt wrote:
> Add the board bindings for the MeCool (Videostrong Technology Co., Ltd)
> KII-Pro (S905D) and KIII-Pro (S912) devices.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
