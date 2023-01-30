Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82377C54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 17:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmuAJUBqDx9TYcW44Hch1p3YkNingWTvL2cmEzAIkIw=; b=dawroNT6A3ySnJ
	SGa5fBDWXxwVlZjhpnQ+Dhi59zE9Iww+Q9R1Cu1lqwJlD4v4Ma3woF55qZDh9HzmEqqsJ7I9ro4gp
	QJa7MJSqCBJMQ1zPf5PxeEJYdYKitNbTuG06qM2p5t9i6YQfvz7gZpiBnwswJUJcl5WM0t8CG3Y8w
	eWcNz1wrlJUMsykoBRmpumZhYHX4hutfPmGFmEW3DMLNAHxqDHJcabPjWPncLL8j6PIXFtseO1oPY
	vGG7rsCh7pkPt0Z1JkX1Kif9NfNiwMHYV/qkgeDmjdwi83Waf6NzZqRnZPS6PYeyM3iyTiR/MLeBg
	FoSMMq02dKxSMDAXhMCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXhO-004QxI-0c; Mon, 30 Jan 2023 17:12:06 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXel-004Pe8-Nq; Mon, 30 Jan 2023 17:09:25 +0000
Received: by mail-ot1-f45.google.com with SMTP id 70-20020a9d084c000000b0068bccf754f1so1206606oty.7;
        Mon, 30 Jan 2023 09:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLP90Evg68dqE7RCwY4yV3xX4Fwp1YhDcXOoeu59D7A=;
        b=OVBr0S2HtNmlEFKsTEjgN7weooSkm6od059J3n8BeAJuqGjM9kSclUmw+NP2FyarYY
         RbOo5yz18HBvd8gUbDycXwXQykRivCMP3fVih1ynm1hHW3t+ZLgmjdLmMeEnb0v2uhYh
         lD7d78JIx3EbZPAtrwPj3TZIV8HNtbUAuMHOpgS0i6RlYcU49+rBs5MieP+QjuMhDk3f
         IRhsJLtgMdj3nGXXn8whwAU3I6SEfTa9TQXx8WmYWaBk0k8hLcvWCfv8gcWThsPmsBon
         1kXw0Vg4rWXEMijtMxOn259P9z8t8dcjdtkq4HqSKQ0gmweSM0475s+0tcXCr+h5khIc
         xZcw==
X-Gm-Message-State: AO0yUKW4RMmU8xasaW++7JsFzgDeI166qno5qWlsYcaa/QN9978T5KxB
	KzhtMqOOMAshkjceFmRkGQ==
X-Google-Smtp-Source: AK7set9PGL+jEBekhISIqkh5ljEQGgPzFLULCfmKB679JOMJ1IrE1SYdXIg/qMoMZUrgDhmNQ6pcuA==
X-Received: by 2002:a9d:148:0:b0:68b:bbaf:a299 with SMTP id 66-20020a9d0148000000b0068bbbafa299mr5152465otu.29.1675098561554;
        Mon, 30 Jan 2023 09:09:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j24-20020a9d7698000000b0068bb6043362sm3855938otl.11.2023.01.30.09.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 09:09:21 -0800 (PST)
Received: (nullmailer pid 2850409 invoked by uid 1000);
	Mon, 30 Jan 2023 17:09:20 -0000
Date: Mon, 30 Jan 2023 11:09:20 -0600
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Alessandro Zummo <a.zummo@towertech.it>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] dt-bindings: rtc: Convert Amlogic Meson vrtc
 controller binding
Message-ID: <167509855924.2850119.8228590011406676486.robh@kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <d820d54b-d082-589a-621f-2795d885696a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d820d54b-d082-589a-621f-2795d885696a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_090923_823271_430F2FE9 
X-CRM114-Status: GOOD (  12.11  )
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


On Wed, 25 Jan 2023 23:24:24 +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson vrtc controller binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - improve title and commit message
> - remove bus part from example
> ---
>  .../bindings/rtc/amlogic,meson-vrtc.yaml      | 44 +++++++++++++++++++
>  .../bindings/rtc/rtc-meson-vrtc.txt           | 22 ----------
>  2 files changed, 44 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
