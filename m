Return-Path: <SRS0=HPE/=V3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC50C0650F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 09:23:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF9020644
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 09:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qq3u6MxK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RZP0LTlt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF9020644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hl72fyRdgJBmI3XRLWOpPauK7KvtZORey7Ms9Z+t83s=; b=qq3u6MxK1dOiHt
	uqiL0ROMCghWkkqS2eiUdtq1fC6btkWASFcTR8ONRQ+Ahf4xMtOMxXRdOhWYQ6idkOu9ZORC04Njm
	4vi+riipbY9QcvaS+gbX80Nf3/HfD/coLVtcQ9KYqpiKp4XNqWxFF8UcGIfZgKr+1Zc0tRuxEeVn+
	jenMWDr20TE5CbDfwddf3gh7MLe4eZ6x4iBrcdeWVDbgluw45pq+Q0axzjCWyFMlkd4Q3Kift62KH
	lR6Z0ufr4DS8MM8Owqrwuikf/Z57CHHAwmP83BUzYDp8dbWf7Ld0/B45OYq11pq6Fo5dopYCtEp73
	rQStRiCT07OI98rw6CHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsOLy-0000qg-UN; Tue, 30 Jul 2019 09:23:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsOLw-0000pg-To
 for linux-amlogic@lists.infradead.org; Tue, 30 Jul 2019 09:23:30 +0000
Received: by mail-wm1-x343.google.com with SMTP id v15so56446428wml.0
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2019 02:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=SRl6Oym7H9Un804DCDBW+OKthVL0/MehEFhPNzj7nQc=;
 b=RZP0LTltur2tXVfnLlFb3sxCk4RIrpNkY+ZMOizbAnwJOUwlbFM/ASG3OS64BMKFlO
 rX0NxhNBeUb03KCveiw7BsLtp7Y5Q7jlLF+MJPrc6wR6JeKiwfzfb3SH3DOhhHYcyd63
 CTNAKEQT3ega2bFKh9K5nEEBWiTdNbL2J4G3DgRi2DZ3Q2kUHD44S711hDAOTR6BMHzC
 VhCecUseI3CqDx7A8MhYCNskaXsOa5VkgHUca4KF/cVY1QjjKzm9gJZRdCIZ5fnmsVRN
 3qkpS/ZLgVaeJBlt/fpHL95b7iFIUqFpSkdTFMjxEJ4MUjCuhOJWM5AwygJhv+sUI8Pe
 0t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=SRl6Oym7H9Un804DCDBW+OKthVL0/MehEFhPNzj7nQc=;
 b=VE8MSARqgZgAZBm6Rk1CPxORVMryozIvdUShFlCVO2otklnPTVNS3VAxnGqZcSs1p9
 5NyIYREZC18SpQs29KKhOspb0LiZ9Fg/26ERAB8FdG2miJuwRtBbmxoMscm5Wm7VvJw6
 NZh9mdqdcH8Juj2zEg+cTJUgogYXaank/eMFZePTXkCGxyyMpqyQOFHYYkhAmnolvj1o
 aEnBII973pHtAJO/6wFCdG0Mjd7VyCpts++DPI8NF6gY6C/rhjD76lLDr6CQ8R9F4sdp
 l69e0P28/NfLPWw0DJ5uEc7bHY8KP9/syiXpRMpP/3u4g4p7neKtObln0y6Z5wMFbFMf
 HbLA==
X-Gm-Message-State: APjAAAU6Rik53a+wZ8rF+GgK8kAJoGkaO4Yj+5nwTiGgvf7zJ3pXdN8b
 UPtmAkOLcD0W7Nj8dCJYusVmYQ==
X-Google-Smtp-Source: APXvYqw4xbTN7s8DUis/v85pKNebf3+z6Rt6gyVLssbXbjErbl2YdUrChQDcR+Zgdb5oN25HQGa8Jw==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr103347180wmc.89.1564478607335; 
 Tue, 30 Jul 2019 02:23:27 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id g10sm48071944wrw.60.2019.07.30.02.23.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 02:23:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, srinivas.kandagatla@linaro.org,
 khilman@baylibre.com, narmstrong@baylibre.com, robh+dt@kernel.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: meson: Link nvmem and secure-monitor nodes
In-Reply-To: <20190729183941.18164-6-ccaione@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
 <20190729183941.18164-6-ccaione@baylibre.com>
Date: Tue, 30 Jul 2019 11:23:25 +0200
Message-ID: <1jpnlr27w2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_022328_960412_9E707C01 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 29 Jul 2019 at 19:39, Carlo Caione <ccaione@baylibre.com> wrote:

> The former is going to use the latter to retrieve the efuses data.

Actually, if you really want to not break bisect, this change must be
merged before the driver change (patch 4).

I'm a bit surpised to see only the axg and g12a here ?
Doesn't it apply to gxbb/gxl as well ?

>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 1 +
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 6219337033a0..b8244efb85fa 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -117,6 +117,7 @@
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		read-only;
> +		secure-monitor = <&sm>;
>  	};
>  
>  	psci {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index f8d43e3dcf20..2b07752e034f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -100,6 +100,7 @@
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		read-only;
> +		secure-monitor = <&sm>;
>  	};
>  
>  	psci {
> -- 
> 2.20.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
