Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12DAC3F2D1
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 23:49:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804692465E
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 23:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UWswU8Sr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 804692465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzF3fDa48pwtTHDOOunrtPdx6Vfvp2phrOWDTVkFnak=; b=UWswU8SrDsYi+Q
	GiMV0OoCYbj6o9L8aDt41qxZzJvAyrSH5fUA2PcdC8obCsbTmdxI9SOi/GRZ0ema2T31/a4cCAwtM
	DZTrpSGLrD7xZ3gm4OpZLvbYSG9DU0BR84RUwIBvR/GCbTXcgjWEnblw0miMdfsnZjLfkZMwY4byi
	5Q+CVsM1INSRYCiOIkSDfRbfXbLdAW1dDncRlCZmlsH0hraySvYN7iLF1QIRfDa44ZZcFc8Kaj4Vs
	ILguiKvPpZcW6cSH3X/RQdzPk0kMMo+m7RQZ77XtGDOlrwI1VIugglZjj7UoDcm8S/Ql039K03DTp
	Ge4VNl9cXqlbKHfRP8RA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8uo4-0007i6-N7; Mon, 02 Mar 2020 23:49:04 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8unr-0007Us-5h; Mon, 02 Mar 2020 23:48:52 +0000
Received: by mail-ot1-f66.google.com with SMTP id v22so1146842otq.11;
 Mon, 02 Mar 2020 15:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=byoAHElTnalS7sh70czz1zpbq5DcI2Go9YowGpXx29w=;
 b=GbRzqEOH8YIsCOc6kpqUJtHjRaqnNtgTpRRb0dwyy2p64nbep4B07gsuJ1pjCt+cJK
 WWyEyxgFmi3A2xKsbFZ5CVTHRySIahMp7wzDd3QULvk/HGZ2jEkuwVoRxSPjs8iuD8mA
 gF+/d7nv6DNEGsYpc5l+ODbEXWkAE+k7Mxz0kBGVjDIzYqHsnz75GlnhInb/IVixPRJy
 mrsQ/Zew3tNE4Uw0x+/YdVDzSti7exl5b6WovLp7W8GVuGLcozQZmAYj5vAkpvNZaPgt
 u4svhX2cOxjtVES+yZ4kiDOXEDB42Z2Ey05O85J/HMCeScul9uwhNxrPC96SxUqP2+pg
 71Cg==
X-Gm-Message-State: ANhLgQ3Vx47UNrCTAK/344e3ylHC9jMI1ZXbR/LzOrPK/1rioVZ/OHRy
 Ie7CVNErETLkF9nzyfUgpA==
X-Google-Smtp-Source: ADFU+vunmxxGjVzwfLQGBVehqtYrFNHSS1vUq/QZk7+dEkP+TRwtQ/33euUrPd47iWoLdqcHigvWww==
X-Received: by 2002:a9d:5d07:: with SMTP id b7mr1331515oti.209.1583192930303; 
 Mon, 02 Mar 2020 15:48:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w9sm641711oti.64.2020.03.02.15.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 15:48:49 -0800 (PST)
Received: (nullmailer pid 32323 invoked by uid 1000);
 Mon, 02 Mar 2020 23:48:49 -0000
Date: Mon, 2 Mar 2020 17:48:49 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: amlogic: add support for the
 SmartLabs SML-5442TW
Message-ID: <20200302234849.GA32272@bogus>
References: <1583036241-88937-1-git-send-email-christianshewitt@gmail.com>
 <1583036241-88937-3-git-send-email-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583036241-88937-3-git-send-email-christianshewitt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_154851_220164_AC29BF25 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-arm-kernel@lists.infradead.org,
 =?iso-8859-1?Q?Jer=F4me?= Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun,  1 Mar 2020 08:17:20 +0400, Christian Hewitt wrote:
> The SML-5442TW is an STB for O2 Czech IPTV/VOD and DVB-T/T2 based on the
> Amlogic P231 reference design using the S905D chipset. Specs:
> 
> 2GB DDR3 RAM
> 8GB eMMC storage
> 10/100 Base-T Ethernet
> 802.11 a/b/g/n/ac + BT 4.1 HS sdio wireless module (QCA9377)
> 2x single colour and 1x dual colour LEDs on the front panel
> 1x reset button on the front panel
> HDMI 2.0 (4k@60p) video
> Composite video + 2-channel audio output on 3.5mm jack
> S/PDIF audio output
> Single DVB-T/T2 tuner (AVL6762/MxL608)
> 2x USB 2.0 ports
> 1x micro SD card slot
> UART pins (internal)
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
