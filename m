Return-Path: <SRS0=GB2T=5Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8940C43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2020 19:59:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 309682080C
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2020 19:59:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Queu9AGi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 309682080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GEaxYpibJgAhFtbmRivk+AkvDirmdXxVhqqBWnQZuk=; b=Queu9AGi4HjH6X
	0uwYwtaV1n3TqDBqBiaWnJAfOr7lPvge4mXq8Y1/QE0SHsaM+TbCxD8F0QUk5KbtPmbayenZNauko
	ltxRlu1nClf5NrQ6+19S4PES09aqe4pWkhGkWD5RsgdfkdZdGixZh8aTbdwvqSjbuIDC63ml7zZk3
	APoMJF5Vtu7kaKm4ftsQ0VFvbNgObkZDSAKns1M/6VXXzUGKdHjmkMdarUpWuLB7VxKgpo0AyasWe
	jCAEO8Hs6mo0AASqf9AoCnERK4mbsBL3hjqaAjii+8aFHX/hR17sIZZpUL+EtdN5EsYlONQ2kNThj
	sEzLfjXeAamuKDjKl4Jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJN2H-000120-GP; Tue, 31 Mar 2020 19:58:57 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJN2D-0000ws-54; Tue, 31 Mar 2020 19:58:54 +0000
Received: by mail-il1-f196.google.com with SMTP id a6so20716329ilr.4;
 Tue, 31 Mar 2020 12:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pkZ0aQadXW+UarG3V6yDDnoy3MjYoP4UMbK1exK/Agk=;
 b=DaHYCB88soJrZAmqD4tv9DShhApxIPJcXh2qYfJJXK3HkCPOgH7YRLmjNowG79tC9b
 ftYxubenx2SfjmPn2LJv6FpvbmFKyes/8aVw/r8fdr+FjNAUCclFe/WqMx4SZSFgCxnm
 oIrxMMQuWSgzg7U9upd3hCrXRO3K7gRhU3yTXrzOfvyYKZCOq+c3SDiu8sbjpnF3EnsY
 bJrk1nx10QMe4870D/m2P/+a7ioSgpHhrsAmDr/DFsl7BsJ/S6X/6QSaUmKt1golfhtA
 3BH7slz21rk8qjf9iJVIZUkVlpjSbAtqtrEW1vwoPzwLmEKrWVeO4i7lo8UICw0R55rw
 +bMg==
X-Gm-Message-State: ANhLgQ2JU5/VV1LjyrnQp6YJTj6D95bSd5SVXd3mHwVhqGZV3ZnAvDsp
 7Za+zbuFoDJfrDqxEOYfLQ==
X-Google-Smtp-Source: ADFU+vsmNeRowX49DLQnGgdAShsW+1YjICc0B8+q1P0/NHtVfbMIgSjjmQj+1JoZ0y7gtYkwNtlb2w==
X-Received: by 2002:a05:6e02:54e:: with SMTP id
 i14mr19034209ils.166.1585684732061; 
 Tue, 31 Mar 2020 12:58:52 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id i3sm5108021iow.11.2020.03.31.12.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 12:58:51 -0700 (PDT)
Received: (nullmailer pid 2448 invoked by uid 1000);
 Tue, 31 Mar 2020 19:58:50 -0000
Date: Tue, 31 Mar 2020 13:58:50 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 13/13] dt-bindings: usb: amlogic,dwc3: remove old DWC3
 wrapper
Message-ID: <20200331195850.GA2337@bogus>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
 <20200324102030.31000-14-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324102030.31000-14-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_125853_201856_A054E3ED 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: balbi@kernel.org, devicetree@vger.kernel.org,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 24 Mar 2020 11:20:30 +0100, Neil Armstrong wrote:
> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> There is now an updated bindings for these SoCs making the old
> compatible obsolete.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/usb/amlogic,dwc3.txt  | 42 -------------------
>  1 file changed, 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
