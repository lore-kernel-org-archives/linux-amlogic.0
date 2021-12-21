Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F338C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Dec 2021 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoB3EBZfBqI+j37c8FZV/kEZacyzsYEsbGq6Cve+PwY=; b=r5dGFipdohVzyq
	Ac0gxGHUO23zfoTt28auVQ1g97a6c4L8pdkXby8Owwv4C4Ws7Qmnlfdq20QB+DC/Xc5XLQwSqRq/b
	81L0vXn0N4ujVO6HBZwEedf6kCcMEp1IolbBDXUcXwxJcxdMBTzNOVG7JfAPo0WPYxRne4SXINwVP
	Fzn+tEKauc+NSN8KVjW+zCS4KOtDpVPv3wgCAj2Q9JNcBqXlAhuOUF3llNXOEggJh5TuyCEnrFGt0
	gNE/sw3/nhebjJRxNNSVoqyf+2E8b8Bf2RcnxIr9Y7CeVjmiKHGOt9RgPCpWqJrhFsENi9P1hX9NL
	RGE3tjRMv3lMg33xglKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzipQ-007o4d-La; Tue, 21 Dec 2021 17:21:32 +0000
Received: from mail-qv1-f47.google.com ([209.85.219.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzipM-007o2m-TV; Tue, 21 Dec 2021 17:21:30 +0000
Received: by mail-qv1-f47.google.com with SMTP id kj16so9074374qvb.2;
 Tue, 21 Dec 2021 09:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X+CVb/g6dnkbXp9dG9nViDZF9etnV+5k0QPN7oufv/0=;
 b=TEdbiAI/9bXnY6jwCtFR/e/l9BC/Dy+P48/8E+uylmerQ0OHFWXXY0UZl2jfL7FdDB
 SQcLakrOcitmFIy48HMpkCcM+4wXbGavaz6SjNwTgv4LBIAIQK1B0Sx1qXc1+Bqf8HwT
 0j7ZGHEpzc0fhpBNCfjmBNe+VdMChVu4/G3gGZcs8/l5FSRjmKCUje9f5mZIlqTbjfAT
 rWcp4ziQPK7nyC+sBFAxA//rE0et6SfBOTBgr1Hv0KSa7Js9wnJt4i1zCXOWnUjAQxwx
 60eZbRfr6sp1vvpPlHSXFQjWFX2zsdBdQ+hC/xYnahVad9Vbot4dVN7mkptybFMgP7bk
 QcCQ==
X-Gm-Message-State: AOAM533q1W3JKgc9LjIiGaKRdDCmw4Ekbbl0gtf+KFBZN4PdisdcHv6Q
 d4MuoqQTOWrMfhzdq0z09Q==
X-Google-Smtp-Source: ABdhPJyUZqgy8z6h1itTc00ig548tDmWDMm+yG6tEOlBa0l55dZI6W1MWmhrwR6z45DhGzx1FIF2iA==
X-Received: by 2002:a05:6214:27c6:: with SMTP id
 ge6mr2077176qvb.83.1640107287804; 
 Tue, 21 Dec 2021 09:21:27 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id k8sm16700695qtx.35.2021.12.21.09.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 09:21:27 -0800 (PST)
Received: (nullmailer pid 1478362 invoked by uid 1000);
 Tue, 21 Dec 2021 17:21:24 -0000
Date: Tue, 21 Dec 2021 13:21:24 -0400
From: Rob Herring <robh@kernel.org>
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, narmstrong@baylibre.com,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: reset: add bindings for the Meson-S4 SoC
 Reset Controller
Message-ID: <YcINFJ2vaB5WRqzm@robh.at.kernel.org>
References: <20211217073521.35820-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217073521.35820-1-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_092128_999440_E08A2850 
X-CRM114-Status: UNSURE (   8.78  )
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

On Fri, 17 Dec 2021 15:35:21 +0800, Zelong Dong wrote:
> Add DT bindings for the Meson-S4 SoC Reset Controller include file.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  .../reset/amlogic,meson-s4-reset.h            | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-s4-reset.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
