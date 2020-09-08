Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D867EC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 19:48:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC6C20768
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 19:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gWvhJYFa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FC6C20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pJ4ItNxt24cLPOS7lzJ/LXYtUKjmqp8yrhsFwqy8ces=; b=gWvhJYFa06TMrBnGjOuem6ir3
	KYoqkdM3etsa9YYv6E5P3KHCPMO+liMS7oLIqiojK1+OdcpnKEwTwxf+dv2PF3/Sfnn+hIUqkVGRH
	DO2t62kFzHV+aeu21+7XoR4P6qG2KBBOHNiNU0veE7xXqw6v+my01bLsSI89p8AAw1QTg7/y1dvhE
	Kha0d0sfmSzowk6kU/PuZoKT6VPwHsiFGJo9Hq/4OicDqFBQW/MNWmUUavuVSzRhNd1H0BsgCB1lG
	eClkw7NZQgq2ayUR0mXVoHAebKXH73m41P1/2MHoL1o4Q95cans4lSDOOdRFZnDANPLJD2iATDnrx
	GIskMUTfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFjbQ-0005Tj-MV; Tue, 08 Sep 2020 19:48:28 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFjbN-0005TG-NH; Tue, 08 Sep 2020 19:48:26 +0000
Received: by mail-il1-f194.google.com with SMTP id t16so41219ilf.13;
 Tue, 08 Sep 2020 12:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PlBmgS/sjuCEIQu1u5ZYl8mMPlH7KVu/qGuOumfaosA=;
 b=kKsiNjKNkhPz63hsip0RDLG8hEAg+Sd4Wi7T020l3uOAXukQXYKhITf/FO0wrltN6f
 Kd0ZZd6dmgwcC1/ajXCoHyAP9XTPac727s3rCXBeqvSZ5uXUVDlzMPeAn086R59a4cLi
 zw5rle/cpjB54pEYKMgyAiPGJ/boX5Ci1BJRW2zbwrgWmP6KzR/Z3ybFk7rJklX+teZ8
 a+6c2s3EB2i0BTRlT2qxDOXPVNbkVamMt2ODVC6JT5O0YqldAHzmm8EhdKHy3wKW2eul
 6C4TdNdqASFKeFxHy/54Ptqemb8b3tp8zAOQso12Fq6K/bInIS82kJgf1N5118Q1Sz7g
 popQ==
X-Gm-Message-State: AOAM531R8kn7a1wBAezjEY5h+r2w/6EKoXu8k4pGgKhIrH8QLKtbdusn
 gy57nJ4AYgfftOQdiuB7ZQ==
X-Google-Smtp-Source: ABdhPJwN1OwrU3sDw8effHgraPgDprUoh6q/VhYkCUX+OIayZE87xKJpLW8f/hji5fWBS4UIu+vurg==
X-Received: by 2002:a05:6e02:13aa:: with SMTP id
 h10mr370198ilo.212.1599594505051; 
 Tue, 08 Sep 2020 12:48:25 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id l2sm102112ilk.19.2020.09.08.12.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 12:48:24 -0700 (PDT)
Received: (nullmailer pid 791744 invoked by uid 1000);
 Tue, 08 Sep 2020 19:48:21 -0000
Date: Tue, 8 Sep 2020 13:48:21 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove reg attribute
Message-ID: <20200908194821.GA790974@bogus>
References: <20200907073402.26674-1-narmstrong@baylibre.com>
 <20200907073402.26674-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907073402.26674-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_154825_773449_C94EA01E 
X-CRM114-Status: GOOD (  12.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 repk@triplefau.lt, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 07 Sep 2020 09:34:00 +0200, Neil Armstrong wrote:
> The Amlogic AXG MIPI + PCIe Analog PHY should be a subnode of the hhi mfd
> node like the axg-clkc node.
> 
> Thus the reg attribute is not needed.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml      | 4 ----
>  1 file changed, 4 deletions(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.example.dt.yaml: phy@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml


See https://patchwork.ozlabs.org/patch/1358643

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
