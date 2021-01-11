Return-Path: <SRS0=5e44=GO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79E4C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jan 2021 22:25:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ACFB22D03
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jan 2021 22:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ACFB22D03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ezWk+blv4bS3bgHhqLdRjF8MHzCj9YdHC148Vr8Jy/Q=; b=v7OkCXrspZi9t17ntNqAv3yZY
	JI+4P3brugrta+8nhTzZiTIXixoWnVjeIIplagImHMh03bK9hYJUTPjtNwXDHs6VzmIuHlkU/gPD3
	jirFIsqZAgcMq1qIyVAhFi5X8FVJ2EdzziIRShhelgVIqSOKkFKuaaPbmUpgM8Xb8pbqcmDNUg6nC
	HCVT5Q/flVYf8Z42bkqFqG0X4fWhT7j/GYt0eCfKpsfqy02da6xSXRLw0qSh8HQAX8IktQFLHlyIv
	CBYehOF5TYqlNUfF4wTT6QxOIank/Yeu0CNUSU6dbHcjJk+ObpBemVd+jVrp4j1N7QO+VPk7NF5Jx
	+FsHE2ioA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz5cy-0005cb-1T; Mon, 11 Jan 2021 22:25:32 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz5cu-0005ak-M2; Mon, 11 Jan 2021 22:25:29 +0000
Received: by mail-ot1-f49.google.com with SMTP id n42so393049ota.12;
 Mon, 11 Jan 2021 14:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4PfTLxMOVvDlbCq/bvKfXWzNilh/iML3qIR50BxBSjY=;
 b=S6E10wR4MWrGoYYXY0pnScJLpDCvyowIWHKTx3pPZWKZ6mUAQuwOt6GPvU5yaRsO+F
 ebtC/B+qkLQoE01KXvxLZQNdyENLmQ5JdsoczRrQnPgoyQv9mn80+b/GwoS+rlRVzG9D
 0Y6bh0MxY5CX88Dzm85c+NcFzZ6PdXLxjb5+xSUuUoqw+Y3C6xqTUCav9vVFR3No3IM2
 adTVDrBeI6eMPgOn2kvfNiFbYPFMtTR66s8Om5ibf+12fmS5wlYYfHQ6HZb6Hkg/PHI0
 GsDTz8Y278X/+nwEe9xXXlpiUy3WU9WcqDGyJvWbRlFTCmFBLTejtTHdCls/nIxbI4Jo
 5/YA==
X-Gm-Message-State: AOAM533/aNmF0TZZViKkXZF21PTVb//C8ad9+HSoNF2Rrn2v1UIy1pGI
 W8F+HcqJRhLJjyFuY5XlJw==
X-Google-Smtp-Source: ABdhPJxHduQTK2m6PjKWQtnXIxp9PMu6VCRKLlpfa4iwt0UhBX6oIT2kiPwO6YaYT+/NsMM2CLOzTw==
X-Received: by 2002:a05:6830:1d8e:: with SMTP id
 y14mr834615oti.356.1610403927646; 
 Mon, 11 Jan 2021 14:25:27 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t26sm238517otm.17.2021.01.11.14.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 14:25:26 -0800 (PST)
Received: (nullmailer pid 3168352 invoked by uid 1000);
 Mon, 11 Jan 2021 22:25:25 -0000
Date: Mon, 11 Jan 2021 16:25:25 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: remoteproc: Add the documentation
 for Meson AO ARC rproc
Message-ID: <20210111222525.GA3168299@robh.at.kernel.org>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
 <20210102205904.2691120-4-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210102205904.2691120-4-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_172528_783392_4FD8B85F 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 02 Jan 2021 21:59:02 +0100, Martin Blumenstingl wrote:
> Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4
> controller for always-on operations, typically used for managing system
> suspend.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
