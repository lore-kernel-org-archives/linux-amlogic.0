Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF117C072A2
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Nov 2023 16:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XoP8euofNoAvW/NKaQtq+hl3P8wiMyXZTo4tpbaCRU=; b=ynwVDT94kmUsU+
	51tRsLLvxnkP/1cRKu/4hNnzxSQ57+DVtbI5ry33Z8OcpvffdBgtN/oWVJ49jsFmdVYQXm66Wdvib
	d8E/+xsKbmbng+/aq/GTVYjJB50C/RaxST8zvDi2cuCCmmcdCU4ZxHbU8VYL2t62ybe/zrzKT1D2i
	rR7NM1opX+qxM+0EjoxLvEgffpRwyfGxIPPhqvGBVldlXsrhZm1roWyAxz90/DYc+DwfFRlu2XEfh
	ph8Xs/F2AaHzvecjfG4fvW+0EpOnaf5oPf4kNMogwDPXulVjt74taUB8YUAMADDFzuqa1Sn/suXon
	nTTrcmIiFVKOGpzTpruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4kIu-00AN8M-32;
	Sun, 19 Nov 2023 16:05:48 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4kIs-00AN7u-01
	for linux-amlogic@lists.infradead.org;
	Sun, 19 Nov 2023 16:05:47 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5842a7fdc61so1901934eaf.3
        for <linux-amlogic@lists.infradead.org>; Sun, 19 Nov 2023 08:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700409944; x=1701014744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeBJzVCJkIuNqsd17pLyOwOcZ+Sp47V6E23Yzb93dhc=;
        b=CvCiPcFXipzg90IFqkmQ6oujUVMtRHfJTBkhzqcGdHUB8BiMxkHFwFtKkRNiK6FBQe
         I0xowqib6qGa17g9Yl83NMun58kdPflrJW+QE8uqkd2eFDAd+QBT0hCP7T3Itc9h0GC/
         nz87wB9KQD/KkUlZML0u6mMQaCw4czv1o9ospjVAK5bjqcjfXLvVmGTBSSzFUJBPENPS
         +8wKrr2EnLBwrAkJmCMDuibjc7VJIa8pzNzlUAXL9XiGW3KEZHVZ+1QOTJhc5NI1bybZ
         2RmEZY5ZRQySRXTWPONKeGilvrR3IPY7+G9PHQkj+nTX6Xkj1um+JXSkfOd2ZSK4dIB3
         ScBw==
X-Gm-Message-State: AOJu0YzCIhf8VEcgEyBMLgAd2tfKloOQUixih+c1ooNhoaLVfnjGJg3/
	ZH+r+0SpqKB5YzF5sRnTzw==
X-Google-Smtp-Source: AGHT+IGDy5/g5uqVytrExGghY6xmLlHEVnU/APft6O2sD3XnC7qd89vLcVO2/zgGenRKDEZ3eNDdfg==
X-Received: by 2002:a05:6820:541:b0:582:99ae:ca4c with SMTP id n1-20020a056820054100b0058299aeca4cmr6176083ooj.8.1700409944644;
        Sun, 19 Nov 2023 08:05:44 -0800 (PST)
Received: from herring.priv ([2607:fb90:45e3:889f:15b4:1348:6d64:224b])
        by smtp.gmail.com with ESMTPSA id r15-20020a4aad0f000000b0057bb326cad4sm1071204oon.33.2023.11.19.08.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 08:05:43 -0800 (PST)
Received: (nullmailer pid 269333 invoked by uid 1000);
	Sun, 19 Nov 2023 16:05:41 -0000
Date: Sun, 19 Nov 2023 10:05:41 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: JunYi Zhao <junyi.zhao@amlogic.com>, devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Message-ID: <170040994064.269288.960284011884896046.robh@kernel.org>
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
 <20231117125919.1696980-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231117125919.1696980-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_080546_070742_6D5F1066 
X-CRM114-Status: GOOD (  15.80  )
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


On Fri, 17 Nov 2023 13:59:12 +0100, Jerome Brunet wrote:
> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs.
> 
> The previous clock bindings for these SoCs described the driver and not the
> HW itself. The clock provided was used to set the parent of the input clock
> mux among the possible parents hard-coded in the driver.
> 
> The new bindings allows to describe the actual clock inputs of the PWM in
> DT, like most bindings do, instead of relying of hard-coded data.
> 
> The new bindings make the old one deprecated.
> 
> There is enough experience on this HW to know that the PWM is exactly the
> same all the supported SoCs. There is no need for a per-SoC compatible.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 36 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
