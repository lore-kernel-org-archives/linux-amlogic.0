Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D11C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jan 2022 22:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zM+3cmuob9dW3B9mc7N/HlLGsrXoRU5IbrAHD9hahiU=; b=MYZk+V6EXmo/08
	zJnEtrJHx6AfjjkjeUXSzLaaXFVxnQJnqOr7afKOhykTDUX6cFivVuqb7uss9awBpykzbEq1bZqQL
	HxLL/1fAv7xfw568SbTXGfR/m/a9uvb1hTHx/3LgAQ4p6WFbdX7JWqJk7jVENaeJmSdSX/ok8nZBR
	YP0s4wfIj/wdkbcimeVuibp0IOPE/YSGsZ6XwchXPLIu+KQIt0oD5eSM48gQCob7zvX3RqOqMh3xX
	i5l6J/v0/I3wqogdKpCVFIFZEqKY5jf3184WRrPqgV00lBCjjsX7u8qM3Q2bPXfReZSbKOIvGQxWU
	ROgE8kHyvR4of8nUn0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Q3Y-000PbL-1r; Tue, 11 Jan 2022 22:55:56 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Q3M-000PYN-34; Tue, 11 Jan 2022 22:55:45 +0000
Received: by mail-oi1-f179.google.com with SMTP id w188so1094263oib.7;
 Tue, 11 Jan 2022 14:55:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OpLEV/BBaHh9HARHCaSK6mtjMzAdJsBjFUIg/RQ2Zbo=;
 b=a4KpRMa9P+qjPW1d2Qna1SJAB6O2l7s2BVsVoWqkgjfE9RfMDQPZd9AWerhe0y5Aj4
 6Tc78WfkzsBLGeEVdHkTfYpyA3fly/HvAh8uvEVftT8MKAE2D5clzO14GRvQ3m+OvAdn
 ZssAWrXVo22d1lwCPg5M4virR5Cs4wfx+GDCrp/F8Ip+LErB8xc1GujV8Ocq31QDFoom
 kpiyqFspN1ScppFa8VOykHbfybxKQjD04DrVSzWEZSIl4hLLieoX2EnH6alEUEPFq5qk
 FmgZj3foMkA3aK8Mk3vs1kszpNo1NzEC+ifd8TiX3t6qfhMiywergyxzUpfjnEp0rts5
 IoRQ==
X-Gm-Message-State: AOAM532nbiwRIrRFbnN/I81hc4gVxyB+j98/Tztx3kC1KvTNUSGVMeW3
 i6xkQ1yR+t6emQpW3CIlkg==
X-Google-Smtp-Source: ABdhPJx62RzcEFMWgL9929SGMfCClfFDhsXGUcXn5ew/3DlwxonlMFAywDVb0NlUUr6JUR8sCXwuoA==
X-Received: by 2002:a05:6808:658:: with SMTP id
 z24mr3290631oih.62.1641941741719; 
 Tue, 11 Jan 2022 14:55:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f18sm236620oop.9.2022.01.11.14.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 14:55:41 -0800 (PST)
Received: (nullmailer pid 3660995 invoked by uid 1000);
 Tue, 11 Jan 2022 22:55:40 -0000
Date: Tue, 11 Jan 2022 16:55:40 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Benoit Masson <yahoo@perenite.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: arm: amlogic: add A95XF3-AIR bindings
Message-ID: <Yd4K7PqBM/qNLDkI@robh.at.kernel.org>
References: <20220103163956.6581-1-christianshewitt@gmail.com>
 <20220103163956.6581-6-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220103163956.6581-6-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_145544_161510_A5C575A6 
X-CRM114-Status: GOOD (  10.68  )
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

On Mon, Jan 03, 2022 at 04:39:52PM +0000, Christian Hewitt wrote:
> Add board bindings for the CYX A95XF3-AIR set-top box which ships
> with model variants distiguished by Ethernet configuration: models

typo: distinguished

> using external Gigabit PHY have a -gbit suffix, while models using
> an internal 10/100 PHY have no suffix.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
