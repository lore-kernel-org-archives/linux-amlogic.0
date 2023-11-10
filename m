Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6903CC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Nov 2023 20:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EajJ7YUNnOWu939nUx/Y6EQI08f8Ne972OSn1/eQdfY=; b=LAAO9tPrERT5Ar
	IfvZt3Aw6Mk5jnPHUbU0br2URtjcsDGOZC8ovVbknnTchSP54ij9z4HgP7TrT4GYHbUSKS0zX68Rg
	06EJIgfJAAocmA1ccplO99p/HU2uWosxfsRZsH3U3630zUCHGasRvwhtmX2NAmvjWw+SqisLkerYw
	7f7RRvpEKl1R5aVpZN0H/a/4gy9Z4pjnPTxew/YkeBSV1+8jjhGOaL1g9fMrYxUpkLlNLVP03WZOD
	to1D/TPgBhkUYEKRFH2VaIXIXbFF6kEuI/jkacF1up0alqxB2EeWihaYuXYlYEPORZHCSIUs3fgyI
	oj+YEtV+rnY22rgpcGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1YZ7-009R8C-1m;
	Fri, 10 Nov 2023 20:57:21 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1YZ4-009R7m-2v;
	Fri, 10 Nov 2023 20:57:20 +0000
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b6a837a2e1so1319533b6e.0;
        Fri, 10 Nov 2023 12:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699649838; x=1700254638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nm5zX5sql3IowmYolUuWYQdm2nSrl6pQAH5NV0J1g1c=;
        b=Xx+7XY+MLBHp8H5lkWOEf9ckrqVqansdSt7Ij7qoe4r8BDPX/eoyuWrwBUspIualOQ
         IKZi9sXkAIr9T+VE/a+BJlzgK4Y+QdVWy8js1Xyve66vbHWzICr17ebrI44FgGR1bRSp
         uox9C7+7pJy5/Mkf9KBSQl0+3aQkzjgSFLcE+FC0Qn6nDOyYdLaF5X+az70RaPZMxIJv
         DKlumP4Vv88Jevn9volUnbtVAFYXSAWn1fabZ+563qVpMApTn+O5bBulNCogQhSieExB
         yRj2FtDISdjXnMeu8PXtV2FO86IJh9C3ZU1orNMqCv4Gw+CNFVi4CtnaRfGk26AyEJMv
         kZuQ==
X-Gm-Message-State: AOJu0YwXdo6qV6/UaGW+FSUfF1uswKn12sQEXscBnvQXOlxMgX9QEedU
	yXsBaXqr1FkWFURl30SWmA==
X-Google-Smtp-Source: AGHT+IHtZtVlwtJPvoY4OrZnDnqXkONweOm+3JHkApZQBHo5IGHFFFxQ0l5z/Eo218CP8JWWycngxQ==
X-Received: by 2002:a05:6808:640c:b0:3a8:75f8:540a with SMTP id fg12-20020a056808640c00b003a875f8540amr497862oib.44.1699649837752;
        Fri, 10 Nov 2023 12:57:17 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j7-20020aca1707000000b003af6eeed9b6sm48245oii.27.2023.11.10.12.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:57:17 -0800 (PST)
Received: (nullmailer pid 418039 invoked by uid 1000);
	Fri, 10 Nov 2023 20:57:16 -0000
Date: Fri, 10 Nov 2023 14:57:16 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin <nbelin@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 04/12] dt-bindings: phy:
 amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
Message-ID: <20231110205716.GA413638-robh@kernel.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_125718_945717_4D635451 
X-CRM114-Status: UNSURE (   9.38  )
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

On Thu, Nov 09, 2023 at 10:00:05AM +0100, Neil Armstrong wrote:
> Now this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml and is
> documented as a subnode of a simple-mfd, drop the invalid reg property.

Why is it invalid? It's preferred to have 'reg' in MFDs even if Linux 
doesn't use them. If there's a chunk of registers you can define, then 
do so. If it's all register bit soup, then fine, omit it.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
