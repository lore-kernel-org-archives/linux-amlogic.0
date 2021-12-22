Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD01EC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Dec 2021 18:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERx1WAHk0oG4sVeZwtwasvmJD4Iv8wFapVa+aIDWQgE=; b=h1RVc60y8KLdCB
	uQIgEClYsFTTgmraHTOMJ7HHFmlKvS/ddanWBw3jA5QJYCd4lN2FEz7T+Zq7quonSyPIkDX5AVaK0
	91CLQYMKF9i+ADZGYNKU64hRyFrp90V7OSAkGIz9GaYpA3/BHrpOwg+2udwQWFvH2LJUi0slqtPaT
	8pPP31/DfnZ4pH9EaHmfeQ9MeV57g7w3IRkolkZPK/T4sX+eFD3Y3xvJA2VDVPQP05+X5QA8yfJ9X
	wJzuvZIj7j8b0j3aODUeG5N9dCugknZofsbLrPMVsYLms/4RwV+0dxQqbF2RVC9VVBBj9nFGrzNsI
	cC/MYMnYR4RlREFw6RNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n066l-00B2ot-1F; Wed, 22 Dec 2021 18:12:59 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n066i-00B2lH-Bk; Wed, 22 Dec 2021 18:12:57 +0000
Received: by mail-qt1-f176.google.com with SMTP id bp39so2391291qtb.6;
 Wed, 22 Dec 2021 10:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pIn5Bic5ZbGSB9APhGUz4jy4pv35Qb3TTEOzVa4bkls=;
 b=GN9P8supnqsfMkGqd/XNZSxL0eJm31/htFKBx+fEshZucU/QTrVoE/lBrRcIfNQ1FW
 HW6Zi2hFAqkBcvzS5Z6d5MUb2F9ovCqrpEjs7St+ROr6zIgtNnSS0tCNOSw6Xo6ka0DN
 ztFT225R2S0xfXhWS7i/hrjpdh/vGrKdT4dctLVINZG3DooXtN9Ub5q51/CIEg68x7KV
 mfdvInFajvRLPKReW42F0LSkGAYmUPA0MzYUsc7CQyRHcATmojl3rbSn1XqzYbZtJcJe
 b7KtL56H92ojh3rWND0hC6Lx9CuwRoPioXX4Z7NakR74EDEPHOu7PerNms0LSdZ0H8qr
 H+hw==
X-Gm-Message-State: AOAM533J9Si08iz//35PsMVpgr8+AUuh2dMb4+HXFyqIH6/CFRFGpisG
 1XEnTuNbT8lMR/IsMnFL5Q==
X-Google-Smtp-Source: ABdhPJw1fD7Aoe6vRDXEtZ30TjpD5hboLxAiT0qLvoQmynw9JfTHn6lnO3BOUX1Xo5oq8dXrcpLOLw==
X-Received: by 2002:ac8:5404:: with SMTP id b4mr3044585qtq.657.1640196757473; 
 Wed, 22 Dec 2021 10:12:37 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id e7sm2317876qtx.72.2021.12.22.10.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 10:12:36 -0800 (PST)
Received: (nullmailer pid 2437831 invoked by uid 1000);
 Wed, 22 Dec 2021 18:12:35 -0000
Date: Wed, 22 Dec 2021 14:12:35 -0400
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: kelvin.zhang@amlogic.com, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH V2] dt-bindings: serial: amlogic, meson-uart: support S4
Message-ID: <YcNqk/tHBttSTENO@robh.at.kernel.org>
References: <20211221030146.522-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221030146.522-1-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_101256_422886_8317AFE3 
X-CRM114-Status: UNSURE (   8.69  )
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

On Tue, 21 Dec 2021 11:01:45 +0800, Xianwei Zhao wrote:
> Add serial bindings support menson S4 SoC family.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2 : update author name
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
