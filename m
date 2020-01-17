Return-Path: <SRS0=6rq1=3G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275A8C33CB1
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2020 16:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F29DE2087E
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2020 16:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LJqiRZeP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F29DE2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIygsacVKyuLA78NExnK7HjOFBSqsRrkZKzscfZWckE=; b=LJqiRZePk7yur2
	y7tdbKuo+R9FFi2ldHt8aBjtiMGEPMwbglATuwo/8u+D1DRz6um/r1/i3mppvaA+0Db+OlZCgg6EA
	gUE46682CP+1UYLy7vzB1FPBBFDlzZM/NfPgh2cuv2wIO6VUC83eUmFS2USsuU7by0GluHn/4Pvmi
	C41vHH1/0II2gUNSzXYKI/sqdjwbgKW9u44uCBoi8S5fTKLKJzj8smttTaTBySfFtGXXXMGHYJM8J
	A69hNKc/rzzeQvTrWFj1XtLNW3TO85jNGFS6L4EtCVHoTscPeJCiaLRlKAg20RAkcAi15mfcdb621
	rJ1tTrttkY/AzDynRZvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isUXo-0008TO-Ly; Fri, 17 Jan 2020 16:32:24 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isUXm-0008Sk-CL; Fri, 17 Jan 2020 16:32:23 +0000
Received: by mail-ot1-f67.google.com with SMTP id k14so23057793otn.4;
 Fri, 17 Jan 2020 08:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/iHqFPp4gfD5oSMGWpTJjMZQbTl3nDjXtKJqZJn6JG8=;
 b=QdnOfZ8GO8tSAoqs8jkU6vQtYX0CZVFE8Z4AhhmhyoarR8jMeewXYTTAq2K9nG8vHe
 X8qI+Byqv/gsGdEnMd0f7yVJa1hkB17zY2jRXQ51Cspe5+D2DJdtzD3fnX7TudUdDzSy
 q1W4EHEiE3y2/133IUGKwGmA+Oc5BdRyjYXElwO4W/wQnviT86hVcvnPu4s9/n/3PsSx
 /InXk9oSl7zHK4ut7HN44RIi+3mj+u3HHsk8BRBCJ7dsiA01FqrbQDnSNPyLEyvBfp5J
 iFVnCGQMYM24wP3Vg5W5lol5ag5tNm8aJ/tw7G2C0+OP6O+gdMKYJ6xvcyz8OWvvqY8n
 DuxA==
X-Gm-Message-State: APjAAAV1SzedhH8oDkbx2QnbN2qFjdSHLuNSuNZe6zCsEJldeVE2fyBS
 jbHPxzv1onbtODT0owEEGLdUyug=
X-Google-Smtp-Source: APXvYqxVhhZJDntpTYO8RXp+1uUVt/4zWCDaLKGWVf9eFo48zxLv0olgodVWAXp81LRL5u91AiObWw==
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr6668144oto.207.1579278741150; 
 Fri, 17 Jan 2020 08:32:21 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d7sm7928734oic.46.2020.01.17.08.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 08:32:20 -0800 (PST)
Received: (nullmailer pid 26008 invoked by uid 1000);
 Fri, 17 Jan 2020 16:32:19 -0000
Date: Fri, 17 Jan 2020 10:32:19 -0600
From: Rob Herring <robh@kernel.org>
To: Hanjie Lin <hanjie.lin@amlogic.com>
Subject: Re: [PATCH v6 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
Message-ID: <20200117163219.GA25603@bogus>
References: <1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com>
 <1579220504-110067-3-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579220504-110067-3-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_083222_420755_A494F205 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: devicetree@vger.kernel.org, Victor Wan <victor.wan@amlogic.com>,
 Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>, Liang Yang <liang.yang@amlogic.com>,
 Qiufang Dai <qiufang.dai@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 17 Jan 2020 08:21:40 +0800, Hanjie Lin wrote:
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>  - a DWC3 IP configured as Host for USB2 and USB3
> 
> A glue connects the controllers to the USB2 PHY of A1 SoC.
> 
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> ---
>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 38 ++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml:  while parsing a block mapping
  in "<unicode string>", line 107, column 7
did not find expected key
  in "<unicode string>", line 111, column 8
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1224563
Please check and re-submit.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
