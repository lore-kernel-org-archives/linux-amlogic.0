Return-Path: <SRS0=GB2T=5Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9129AC2D0F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2020 19:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2795F208E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2020 19:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CF/Ys77N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2795F208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeslNVEzreT7VTh7bUIPcav1fOTUXMd4c6cxRiESAZE=; b=CF/Ys77NqlQbHW
	kyTzgq3B9EovF1IipBguva2vW63GU2WOrGhjPxK+GwopQEL7NaempLCPzoJlGw/1IevJlgZpFmn19
	kfHGJA+GE4go76m0Qptcr/iZ9Y084MpUrZi9aFRUlYWm+0+hOLOV/TEtF6hAr9t62w6DPE9AlTMmg
	4y8t9u6fb9RhpdjAoXvmjyzWBuso3gjeidJgIxyyIhHbzS01CbaXk4hMj3nYO/A/+kYNgxqVITzrZ
	ucjxtKhyLSzQmvllNO+3GIiBJGJn+nj4/snvTzgXYNd56OuP5wy1a30pQwM7cRCr8W7Q2hxfSmhpE
	2ZlCf0UDiQFgHubTQ35A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJN21-0000jl-5m; Tue, 31 Mar 2020 19:58:41 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJN1x-0000WW-Oo; Tue, 31 Mar 2020 19:58:39 +0000
Received: by mail-il1-f195.google.com with SMTP id g15so20699451ilj.10;
 Tue, 31 Mar 2020 12:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nqeAJUtOtJijTj0sgAPusrPwg7HunH4vQhom+AKuF6M=;
 b=pBjnAK7AuPAxo8dVelRSwww1HcWlIm+7xh1+EVLc5Le3+GXOWHjiYovo7DQDQI0Fvf
 O3f180nWM9moqwM3zF2Y+gC0sk0cOTUrLX+cEFlZUdkSxOMWw4qlVs+mBT9PjbUHxPwf
 Hh2OEauW5YLyk6aeGKIphqEqv4ykKYgweHidyTUeQegC/F1BAGsNJELgaEnb/ajX86Mv
 18+5J12/xy6Al2gzTeX3/OF04eCVgz+vrYeLIXOhb/rX4ky5gMQPpYjAUoE4DZpAkfkD
 WjxCGhiIpapsgJrW+pW1PmAhX562BYvlfWGETmbiJYrNlf/vofsjFcKougKLRR3bGIaB
 wYjw==
X-Gm-Message-State: ANhLgQ0wQgkWTMCoRkgq4rHkpzziPEZ0X1L4EGlbmblXV1l9ItnPcnYS
 atAituwBteIDa6xQfWDCTQ==
X-Google-Smtp-Source: ADFU+vvScuJWyJByk9tGznU4ABrVRM+QGd4p+cYDLCyHzSV2GjkxegyexD9XgClwA0WcmvmzB/uk2g==
X-Received: by 2002:a92:8659:: with SMTP id g86mr18829453ild.267.1585684715873; 
 Tue, 31 Mar 2020 12:58:35 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id l25sm6209580ild.61.2020.03.31.12.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 12:58:35 -0700 (PDT)
Received: (nullmailer pid 1867 invoked by uid 1000);
 Tue, 31 Mar 2020 19:58:33 -0000
Date: Tue, 31 Mar 2020 13:58:33 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 12/13] dt-bindings: usb: dwc3: remove amlogic compatible
 entries
Message-ID: <20200331195833.GA1800@bogus>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
 <20200324102030.31000-13-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324102030.31000-13-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_125837_807230_1057B095 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 kishon@ti.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 24 Mar 2020 11:20:29 +0100, Neil Armstrong wrote:
> There is now a dedicated driver for these SoCs making the old compatible
> obsolete.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
