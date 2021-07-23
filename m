Return-Path: <SRS0=pDvI=MP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719A9C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jul 2021 22:35:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD1B60ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jul 2021 22:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CD1B60ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksM31/nwt18nUDflPJuuXhcPJ2cBBioZg43NQJxSD00=; b=zRBianlTx17dSt
	gFFUTuA/QoT6wVE1j5jMAEP300ANRXM0D9AWibe5wvUu8jeGjS5DVtIYc+q6Fh84Sx0EAVI00eS1h
	7TGloHmyG09vOTjYK8Pb9BZhoU8NOVgR8rXksaUI5XYJ5+5RmEdRCXHehVIQyhT/Jduv9RFdwiWxN
	o1dAZOKr/v/1dbbUu2/Vq/xAkAW/z/RexJa1SmZ7W6xgAgR4fWykdm8KRqTOYFJoQUHK2UeiY4uBS
	8J2Ys1XXjGMyXoG5DiWw3ajknE5L/lj79pnRvAF1qaicuxAdc7QLbKkG2JqixTj4l52uhjFa8sO+b
	UWOKh80W09q31i1qbbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m73lP-006GrX-FA; Fri, 23 Jul 2021 22:35:27 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m73lA-006God-BH; Fri, 23 Jul 2021 22:35:13 +0000
Received: by mail-il1-f181.google.com with SMTP id o7so1729131ilh.11;
 Fri, 23 Jul 2021 15:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qQxdLWyho3xwmuPp6KfF8mLtCmH5RhCLEXgrlUIh/L4=;
 b=IZ+NfGB0wbZLeg15p5dW7R7bHr8I0yL99kdwFkI12VQapgc5te4xM6pUIHoyH7Be3i
 0XrUe0zBXRpP0oEN03zWLvCtjd8lkGFqLsXxmd7NHrKBTw5MXtKVf/nlelW4FggWrCBQ
 QCBn2ABHADuVaaxhxCrqDXd4P43lcd1un+0pMGhzav4KhRE58ikzvrgMqHQa5Zzx1+Sa
 l2ksm6uRj+3z0Nv+5Pqf8pXPB1PLZIKLh7KNemy8dC/puwYg0D+YmNLCrlOZlsezVjHP
 xt7UC0YLggFjVw05f76pCivWtWM/uf9iTA+eXVdGOG1sV+YNFo07DPog9XT5qhSG2JLj
 LeYw==
X-Gm-Message-State: AOAM5333HyhoBnXkSxShmcmwpLFgBXWcjGUXgf3GfrNkn+efseSfckzL
 y4nYXxEke0iVEmVBlhn5AQ==
X-Google-Smtp-Source: ABdhPJwnp4BikKGksewDt2ZQql8uFbKwYjGumMljGC6abLtrr1kYbw/PexQnnWka1sOkOVsA94jrDg==
X-Received: by 2002:a92:505:: with SMTP id q5mr4606791ile.139.1627079711667;
 Fri, 23 Jul 2021 15:35:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id k4sm5340302ilu.67.2021.07.23.15.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 15:35:11 -0700 (PDT)
Received: (nullmailer pid 2726106 invoked by uid 1000);
 Fri, 23 Jul 2021 22:35:08 -0000
Date: Fri, 23 Jul 2021 16:35:08 -0600
From: Rob Herring <robh@kernel.org>
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: linux-media@vger.kernel.org, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 rockosov@gmail.com, narmstrong@baylibre.com, devicetree@vger.kernel.org,
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, sean@mess.org,
 mchehab@kernel.org
Subject: Re: [PATCH v7 1/2] media: rc: meson-ir-tx: document device tree
 bindings
Message-ID: <20210723223508.GA2726071@robh.at.kernel.org>
References: <20210719170506.13539-1-viktor.prutyanov@phystech.edu>
 <20210719170506.13539-2-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210719170506.13539-2-viktor.prutyanov@phystech.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_153512_439122_97DAF37B 
X-CRM114-Status: GOOD (  10.71  )
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

On Mon, 19 Jul 2021 20:05:05 +0300, Viktor Prutyanov wrote:
> This patch adds binding documentation for the IR transmitter
> available in Amlogic Meson SoCs.
> 
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  changes in v7:
>   - fifo-threshold property removed
> 
>  .../bindings/media/amlogic,meson-ir-tx.yaml   | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
