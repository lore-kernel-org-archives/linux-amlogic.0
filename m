Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21757EB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 19:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lvvQoGqSc+aKSxFQff6x6BTc+4YajrljapXcya3/kg=; b=n8oGOBRBV4uPYE
	jwpQmvE8lqLdxR3vCiVKRkT6Tf8OrRXFs0RUOkrVo5Srga6VgFwTMm7Bz8rgXNuo+f87kno1kM6cd
	rhG3BVu3FL1cV2H50KOTWlFLFwyIyV9GEHxSbTzqJhnOnJ6M9ezHwB8jQeu7+e3Tx0+wk86gQYLHj
	FXL2HVVUQ1hScxMK7N++dirCxeXGpxY/bFe5GTyl8t+8DcOkFsnC7fmR9HEUrIlZyMwHU/D1h55dB
	+Tc87BYHuE6eF+M0RD4KJhLei3XM3EsREFpJsNjJusVZ7zF+bkpzRWu9ax5oRtZPNsRdB0UEBgJEK
	Ny1MUxWoBWhs9mwDl2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHULH-002TfO-0O;
	Thu, 06 Jul 2023 19:08:39 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHULD-002TdW-1n;
	Thu, 06 Jul 2023 19:08:37 +0000
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-77acb944bdfso40603839f.0;
        Thu, 06 Jul 2023 12:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688670512; x=1691262512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Itwax76YnyojIQJLz79e5RUWj30r3AOwHBsYmcyrKf8=;
        b=SifDC0ne7P5gz9HQIXdMgaXYScaolKEx428WEq9BnFaAGUod5LCCJG4Wx0pe50U6ue
         21er8sfc0bxkV2+qn+PD8KciOpvUfaMwEOA2wJ+BnEJyxcQ9tYiUJCa4kRVHDNNpsIeC
         b1ZjNR49IFQLa1++7S3kdM6vKG1S7Gn7YnPxEjGoADiBKJGytHHhapMMEcGDbbd5IGla
         /nuZn34a4LKY/xiiqTQbu8ZBkL0OWdNrG0OpN31JwtvvNQRpfNJOy0kCX3ePuwFjG+18
         qWEbyc0h7M06J4LVJ6Ay9fPrvuJ2TMQ6Eu17zC9UdLP1MU2f3heL6Lst7ao3rgLr4vSU
         82eA==
X-Gm-Message-State: ABy/qLYwcqP/f524AXFck8FKgCFPjGIuWeNtr9IHd9GBq7iWOlLbuJSw
	57iIndf5GGmJDvNlfbqzPA==
X-Google-Smtp-Source: APBJJlHFhdTk+xqOGmEno8+1bLtlEjUG1mfQ9YrWoHF2NuJtBJMKXqpF6dYJ4OUONDLFmPmx63WqWQ==
X-Received: by 2002:a5d:8488:0:b0:783:74c0:54ae with SMTP id t8-20020a5d8488000000b0078374c054aemr2879342iom.21.1688670512370;
        Thu, 06 Jul 2023 12:08:32 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w6-20020a02cf86000000b0042b21e8853bsm690551jar.36.2023.07.06.12.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 12:08:31 -0700 (PDT)
Received: (nullmailer pid 163648 invoked by uid 1000);
	Thu, 06 Jul 2023 19:08:29 -0000
Date: Thu, 6 Jul 2023 13:08:29 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: amlogic,meson-pinctrl-common:
 allow gpio hogs
Message-ID: <168867050887.163590.877379254232081515.robh@kernel.org>
References: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-0-fa442d5aae91@linaro.org>
 <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-2-fa442d5aae91@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-2-fa442d5aae91@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_120835_589262_BB65514B 
X-CRM114-Status: UNSURE (   8.96  )
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


On Thu, 06 Jul 2023 09:42:27 +0200, Neil Armstrong wrote:
> Allow gpio hog subnodes to the gpio subnode.
> 
> Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml  | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
