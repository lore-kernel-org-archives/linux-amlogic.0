Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B656CC352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 13:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDsai9rvFAqCBsaJjGTwQRMypEzmlPL8zIHSbwTrm7U=; b=212AJ1KfYhl8Ay
	cosNyABaXnSWbJ7LW0rZjJPHL8y3tAzVAuBxrRyg1+SmUdlXMvvAwbxMmx8/6Pfe0rvI9On2BWj97
	T0Jy6c+PEkf2Tg9D25sW8ZdN8oYJTsHbeeJLQRMgdMsJq2kqgjANd+BQqzkaIMuYlg2sNjYcxvePD
	OdMjtO8urT+RQ0kmxFsRmdEN3qmcrAYRarbV4fqDMcqromV77HrMhc9SOhKyuiPWCBk86IfN34IAN
	7ykQZkWcaCVPBrVtt0QRqWH9x9lz7HuBuRBoRYbBgCh0NyVuqNo6d+gdMCF6A4WcPUVcIvtQD9BL3
	LIr7Ww4YIxE9XSA2HAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XdM-009VZz-Tq; Tue, 06 Dec 2022 13:05:16 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Xd4-009VQV-F2; Tue, 06 Dec 2022 13:05:00 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-14455716674so11157684fac.7;
        Tue, 06 Dec 2022 05:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PA9L06FReN9gMJW1BhOEhzIMLjiatd9la6VdvyM95E=;
        b=B3RgJrokcd7iXTNPmv/5RQgmuBwp1WxjkqU0hJ8XEY+HTK9GBVg4yFQDhkGwhYgH1p
         pj2QCK2XNYNUzXbgFu+FlhHT2WvQFSVTibfEgJMObQekTGA2JjdDB/bJpAKwaeTK2J4Z
         V6SEHTvzmxbTOju4gojjWYI0tnp0nDGI+PyJVby0WK1/qYPtcSOOZVOZj4VRZw2hymGV
         Dqj/sMX3hFUl63ZHjAm5eZbln0gRXmSK4j463f3jA56lRYs4dbJbJ2cqOtWKz6c0i+8j
         AC7lfQ1eFH1fKA2xSafVeQdAy35Biz8Vzagabubefh9n1MWItChpLN9YU0I5gp/9fdqf
         Kgzg==
X-Gm-Message-State: ANoB5plbNi/hDN+cujh3JXZN7sbbRAN39RDlGTKGKFFXR3ONHF7UQKtb
	nWbVnXQ4zhPnVJCmIf+RIA==
X-Google-Smtp-Source: AA0mqf4OD6Dy3yFsVoldxMcqJvPGCgCh+F/7YTzrJMkOhg4PXj2JwTNX9wO+2Gqu7sAuwvEhtKG/Hw==
X-Received: by 2002:a05:6871:410d:b0:144:4557:320a with SMTP id la13-20020a056871410d00b001444557320amr9285238oab.112.1670331896981;
        Tue, 06 Dec 2022 05:04:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j20-20020a056830271400b0066e80774203sm6638956otu.43.2022.12.06.05.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:04:56 -0800 (PST)
Received: (nullmailer pid 229159 invoked by uid 1000);
	Tue, 06 Dec 2022 13:04:55 -0000
Date: Tue, 6 Dec 2022 07:04:55 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Yannick Fertre <yannick.fertre@foss.st.com>, Joe Tessler <jrt@google.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Jeff Chase <jnchase@google.com>
Subject: Re: [PATCH v2 7/9] media: dt-bindings: cec-gpio: convert to DT schema
Message-ID: <167033189469.229101.10106957833693362255.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-8-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050458_529457_7CF64563 
X-CRM114-Status: UNSURE (   9.27  )
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


On Mon, 05 Dec 2022 16:18:43 +0100, Krzysztof Kozlowski wrote:
> Convert HDMI CEC GPIO bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../devicetree/bindings/media/cec-gpio.txt    | 42 -----------
>  .../bindings/media/cec/cec-gpio.yaml          | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 74 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
