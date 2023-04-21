Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71099C7618E
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Apr 2023 18:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LT0KSoSvi6U4JpAoJYpnTVqZSFJuK0UXFEP8sUwV+R4=; b=gmdKphQw9qxV7W
	97Nf2kqxSuspX+SlZRepfMuxi3UB1x4yXZFv14RKB7O2cEC6GeG1ny0wc4xEA83tyzxKMY2p41Sh7
	8mEBqei2tDHqG2egC89E/YtB3v6kYid1MsLV9aP7nsoY+hQoqBCqXgBHNwUC/hmUOVdsqDGg0SuOJ
	4na6KDMIghIjCVg5KJSTmhqBcknSdWLJkzv304QMUEx+snXKsuG26sJwTcYBtXq6/2YUWoHov2UeJ
	Wc6BiVdc/FuxY9/gz55mRlrnEebwGHSN6+WQMPlMgcq4lasqrfcFN+kEarzwh78I5norMXpDmEQWn
	VnW6UVQ3AKu3cbTd3wmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppv4j-00BZC4-07;
	Fri, 21 Apr 2023 18:01:37 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppv4e-00BZ9L-31;
	Fri, 21 Apr 2023 18:01:34 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-18807540d5aso1757544fac.3;
        Fri, 21 Apr 2023 11:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682100092; x=1684692092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnmTMZtvA/f6TPhezgaB/eM/0Kt2Nz3CF0RXPywChaE=;
        b=OU5zpISzJ9WpA7QWotBArfJAI1kACbzg/LarAuyggnElKSzW/IkTATFiLtyTgdiE8l
         AjZdU60Q/UVDtRYdRbWzQvEFh+bRNfzin3aup9IsVuBrz2YiO/V2uS/qz6F8Fiq47mQ1
         WSzcj/ooNahz3Y+CcI/YwO4ULtmUdSVc4XN1cPfpZzzGJwEZaKBwCpNMxlc9qzlA3d6+
         IY+Bc6h653KpjfcP4KXyvIeghmmDGGIsYKY9rgZz6X2oeSV7RLdS97t1IWaivzeiH4yn
         2+N6lnWq/jhL/ryc5z2/hf7fsg9wV9raWjYypqjQOZ2SYa8PF2e0IaXtYeRB91mKn5Iu
         YIfQ==
X-Gm-Message-State: AAQBX9fMl1EeRK76SI0c6KtM8NXZhW4OwQb5b7ObcmNUkOuQYQyXjhYS
	Y7z8mnTAJY08DxFlKdfZWg==
X-Google-Smtp-Source: AKy350bS6Yt9+puose4G3XnzK+iG2RBGcT82lno6wn46NVV3zf3nyr8BIptdf9X2gnZJqGbUtRaqFw==
X-Received: by 2002:a05:6871:84:b0:17f:e13:9c96 with SMTP id u4-20020a056871008400b0017f0e139c96mr4884396oaa.51.1682100091343;
        Fri, 21 Apr 2023 11:01:31 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c3-20020a056870b28300b0018b22156e84sm1790729oao.38.2023.04.21.11.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 11:01:30 -0700 (PDT)
Received: (nullmailer pid 1552920 invoked by uid 1000);
	Fri, 21 Apr 2023 18:01:29 -0000
Date: Fri, 21 Apr 2023 13:01:29 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-usb@vger.kernel.org, hanjie.lin@amlogic.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, yue.wang@amlogic.com, rockosov@gmail.com, robh+dt@kernel.org, hminas@synopsys.com, martin.blumenstingl@googlemail.com, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-amlogic@lists.infradead.org, khilman@baylibre.com, kishon@kernel.org, Thinh.Nguyen@synopsys.com, kernel@sberdevices.ru, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: usb: dwc2: add support for Amlogic
 A1 SoC USB peripheral
Message-ID: <168210008936.1552867.8929832255980698687.robh@kernel.org>
References: <20230418111612.19479-1-ddrokosov@sberdevices.ru>
 <20230418111612.19479-4-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230418111612.19479-4-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_110132_976978_AFCD5751 
X-CRM114-Status: UNSURE (   9.01  )
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


On Tue, 18 Apr 2023 14:16:10 +0300, Dmitry Rokosov wrote:
> Provide the appropriate compatible string for the DWC2 IP that is found
> inside the Amlogic A1 SoC and used in peripheral mode.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
