Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBE2C001DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 19:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvqOeJdRuPA7tu3E0FqVcHAwBMFRk/HMvGi872NpB+0=; b=c3dlmneUc2ChDp
	44XcwIpcauq5/WPgZ/u0Iw3WAN2pm/kyCddcMORJJNSXjVOkONAh9EXAeJiOdI0+ZgShbg1cFHpEZ
	AB935q01LrbJbTdEt5m0pRT8OR4M9+xj8KahXjEfKJTl+Dk70UJf2a5Z+psO5DcC/6oYjTJ2FeAWU
	ZfKXvH7okoHT4dfj8JIiVemMTnSPwaw8OE/WyImOO4lrJMRRpemKOfBTjEFe584CUGwYeD7Yjkl6N
	Gcydg9pBvDJrphxseX1goWFE9r3d924nDkVgB+x6+jjLtyQfppbOyKQn+TyLM9jfTcdBAIQ1ayQqU
	49DUDgt36geBmh75hALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH7jV-00GpHE-0X;
	Wed, 05 Jul 2023 19:00:09 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH7jS-00GpEg-0i;
	Wed, 05 Jul 2023 19:00:07 +0000
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-76c64da0e46so263803539f.0;
        Wed, 05 Jul 2023 12:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688583604; x=1691175604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0q11DZxec5L1lkk4HsxoZsfErpJ5+1KB1UsFypJsHD4=;
        b=DYRbOIJ5NlMZ5Lmv5TEpWfSqcwJiS1Duoy+7mVlPN2PSUz/XTVOTwIlrJA6jlGswb7
         8t+bGxP0a3KzdkO5ypDt6llL2SIQb/VUyWBLtZQH129BXakVOLgWVz5PPAZXYJoYPYoF
         0EjpU+Mif28dYuqqjrtgm2Ke6hz4+/8plL8ElDx0VbgN8Pdczrx9CVIQzeJlJ8/i4cXa
         ma6e+m86JLxM63QckW3lnN5/lyD0NT04ymADZc8A6fBjfFe64FkPB2BkrnlMTrdmVkmQ
         +1eZG2nfKmZCsC8grFqvBrMfsQlKGjaJkFciz5mHQcq7L6AqaeyGeMw0cZIRzYv+scjl
         qbCQ==
X-Gm-Message-State: ABy/qLZhvnxixdMz5q5GwRFhjdt3m35Yi6XWig+htZMfnlG0tSlNU99s
	xMfK6YguB49wnryXxwHvOA==
X-Google-Smtp-Source: APBJJlFqSXuAN1fdMf7i+nqPki2M66lKvpwvplbv+HDdzMUHg1S2FBrZDgnaOOqjV/1/ssZ0tQ6ohw==
X-Received: by 2002:a92:c688:0:b0:345:fae5:666c with SMTP id o8-20020a92c688000000b00345fae5666cmr32802ilg.4.1688583604526;
        Wed, 05 Jul 2023 12:00:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c15-20020a02a40f000000b0042b2f8024c9sm3034530jal.149.2023.07.05.12.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:00:03 -0700 (PDT)
Received: (nullmailer pid 1592669 invoked by uid 1000);
	Wed, 05 Jul 2023 19:00:01 -0000
Date: Wed, 5 Jul 2023 13:00:01 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-serial@vger.kernel.org, xianwei.zhao@amlogic.com, devicetree@vger.kernel.org, khilman@baylibre.com, kelvin.zhang@amlogic.com, linux-kernel@vger.kernel.org, conor+dt@kernel.org, jbrunet@baylibre.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, jirislaby@kernel.org, rockosov@gmail.com, krzysztof.kozlowski+dt@linaro.org, martin.blumenstingl@googlemail.com, neil.armstrong@linaro.org, linux-arm-kernel@lists.infradead.org, kernel@sberdevices.ru, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v1 4/5] dt-bindings: serial: amlogic,meson-uart: support
 Amlogic A1
Message-ID: <168858360022.1592604.9922710628917242811.robh@kernel.org>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-5-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230704135936.14697-5-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_120006_263199_8E4ED7C6 
X-CRM114-Status: UNSURE (   8.17  )
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


On Tue, 04 Jul 2023 16:59:35 +0300, Dmitry Rokosov wrote:
> Introduce meson uart serial bindings for A1 SoC family.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
