Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9649C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EccODOEWFSSyuKLR9Okz5OCWzd9UJBfABjqyjElJqgg=; b=HlUo60i2AhjUlM
	0WsUovFnKs+/ayeJr+ptvQaNGGqlyGGUoCooIM9o6TfGLwlj3+8dFwoiSBPTAp0Cw2RTULHAXRumH
	vRoATDqCJaIe4YCJZ11rrgv5ylxVwECcqXPnVSytCnsJggh022HgSzWzhMGK2FzkEd4xB7iEoBl2N
	e5YLmvybV6SAdWt+PxPundWHmYGnSE6Dj05rdPcdRG9gRmyaqefyTQLwO8W0zXLE0vICnUZrG4FjV
	40N9YdTnxT535DFl+K24xudkZiVMkz1RYuWqYxl6TlI1SL9DN/oa1/w0hqYKL6Vo/JmZQCuphJNgX
	QJxAW5ZIFQ7h9wHx0d2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMiU-00000004xIh-0J26;
	Tue, 20 Aug 2024 11:07:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMiQ-00000004xHj-3mjf;
	Tue, 20 Aug 2024 11:07:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42ab880b73eso4479755e9.0;
        Tue, 20 Aug 2024 04:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724152073; x=1724756873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N6tttD5i3mX/vVV2V+WZ9jYSThIeGsCvt0KATob2R5o=;
        b=FffKzYECiZn2EWM5ADry8E9bPfCaP3AM6lYBYqJRHTyZxxGEEPQ2MRuGuVfSx0qEGd
         Rgy/EynLd7WZlXTmsuy8zV3Dg2OARG4fK/pBJu1vKvC9u2jf82LzRl2hrzoUId/Ciqw2
         OexxzJt0bn7k0KGOyYNyUenW6zSBz1RuppiKMtn4WXK+QmzHEDjEyAWooxZtvwDE1xH4
         CYN2ccBfAtyBBCVA99l4UxOslE8pzFYKLkQmz8vzfTUxdUs2rM5Zh8ON0mmtsKbVsGXS
         yUfrAVLRdj5EkcKuQWdgmXU0Ec2a4FNsHRx0kmCPC85nhDCaqjG7sypvLrtG4DAUcyN6
         Lm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724152073; x=1724756873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6tttD5i3mX/vVV2V+WZ9jYSThIeGsCvt0KATob2R5o=;
        b=CI7KziUjbSXkXplS8lTFIIE+kjfTsbUvUYcscuqVz4oEjiHLnoSnZFk0vAek4Yztg1
         /nKqAqFPRhD9WHe1/Z8pHTdrSVVFJ+3XsYJAHJHTG3VCP6u7D54+j2JWQPn5tAQmDQ2w
         2pkiyYoe1NfSSBdDcEkBWuAqlviw3oumhj94BNbZ+/v3f+esTsioXGCIv+katXjikT21
         s1Xuah1pw5XqOKQ99dSCu34RTGbP0qZRneobtpy9i6YfcUSviW1AzvEPB97HLDhnraam
         uQiPRRrOPwP92S4pDpPk9cg1G4w/l7gDvmlP0FwE/uWIrWWcoJpvSnK9d8xGBSK4fO7b
         PL8A==
X-Forwarded-Encrypted: i=1; AJvYcCUnSB2gMYPGDvT9+T8m6CMjeES8qiSaZcZVr7Z3RMLc58lVN98RGsvLfbp6MmVk6tL1yz1a0fCeUWcEMxwhYbFPU4VWS9KBkvVsMJbE36tz/iu/+jVGQD19EtMLgrGZjMNip6u/Kmueua961pDiqHc7nx7jEJzE5A==
X-Gm-Message-State: AOJu0Yy3qg/vPtUatmuE/B3hhfwld+0wv6Xa/Gq15CJZ1F7W5BI4uzUS
	Ehcy6d9wLVe5uJg5j9xnGPu2oB+qt8mwwDmqmV3KYa4vYWktKHQf
X-Google-Smtp-Source: AGHT+IG6Us/1PmM2Zg5hGVloN45QypghzSk6mi6hblPNl8RyZ3u/26GzIKWTN2QyqExQ6Zx+mqKe+g==
X-Received: by 2002:a05:600c:45d3:b0:426:67dd:e9e9 with SMTP id 5b1f17b1804b1-429ed7a5ec1mr87674615e9.3.1724152072440;
        Tue, 20 Aug 2024 04:07:52 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3718985a6c4sm12816968f8f.52.2024.08.20.04.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 04:07:51 -0700 (PDT)
From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
X-Google-Original-From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 20 Aug 2024 13:07:48 +0200
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuan Liu <chuan.liu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: fix C3 PLL input parameter
Message-ID: <ypvsbxdlnao6i7i427ucjzosaurxccmc6xsyd4vmmn4wdzaclt@2wilfxi5z4sn>
References: <20240820-c3_add_node-v2-0-8fd3f06b7bce@amlogic.com>
 <20240820-c3_add_node-v2-1-8fd3f06b7bce@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820-c3_add_node-v2-1-8fd3f06b7bce@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_040754_965308_E82D28E9 
X-CRM114-Status: GOOD (  13.49  )
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

On Tue, Aug 20, 2024 at 05:41:56PM +0800, Xianwei Zhao wrote:
> Add C3 PLL controller input clock parameters "fix".
> 
> The clock named "fix" was initially implemented in PLL clock controller driver.
> However, some registers required secure zone access, so we moved it to
> the secure zone (BL31) and accessed it through SCMI. Since the PLL clock
> driver needs to use this clock, the "fix" clock is used as an input source.
> We updated the driver but forgot to modify the binding accordingly,
> so we are adding it here.
> 
> It is an ABI break but on a new and immature platform.
> Noboby could really use that platform at this stage, so nothing is going
> to break on anyone really.
> 
> Fixes: 0e6be855a96d ("dt-bindings: clock: add Amlogic C3 PLL clock controller")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
