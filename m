Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BDEC43331
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 20:40:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A70662082E
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 20:40:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RL+zu/BZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Gey3+CNr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A70662082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mGW9OBUhvZqzHwQQta1i9cuM4izuzs+oJTqa50I/GQ=; b=RL+zu/BZ08XDlr
	+iDU1MztM3EfYdZFvyFaZ5TPOTdj61GRCKax7IGcvROeUwSFieHN0ZmZLhBl050skiBMPIxZu3kAL
	2R6awup8TRMAMwoBD44iWBFVIdRjzHb3Tk06FWqv1VCRVa8CwYdP07Mgn6rX/Cv3jUMh6drFrb/Oc
	BQb/7yvu6ItTEf5ZQAxhg02xWawjv0a/jpZKLapTtgl31qF8nDJRpHg7PcB9PNIX3IvYu97HnCVyB
	lJsmgAXFOqu1NJxRWRw5XdBvZZMCKoX2aAq37nNaPsMQiulJYr2j1YjHI8heg218RPPBdO8WcM/gr
	Tcg5eBfgAX4ki6QwEahw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5yYA-00008J-O3; Thu, 05 Sep 2019 20:40:14 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5yY7-0008Sv-Gp
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 20:40:13 +0000
Received: by mail-pl1-x641.google.com with SMTP id x3so1902760plr.12
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 13:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=VpJQlHdzOL058GU4wP50cEjksEXzOUX3pb5wvWLJu64=;
 b=Gey3+CNrdw64IW7vegKv4QWSElXeflb3/Gxy6dQ2wD/aUu5pkiNOpTrKaCmRUsOMSy
 zUTs/UyK7dICk5MzNYx5SWhQYTmIZ8CGeYZNwFv5FytESHKQucDLj12213hLkrRiA3h0
 ZW9R8hEaNJzR+xxm0cVuXW+OxS+SEHN3+KPDdandS5SRTgiO5VNlTu1Ano4df2zNrEMd
 DjA2BWRrdgJOoQjA61B4zk0ntC2jme7mMIdmWVUpW/u9JS2Dps+6Uq7BT0kaAOvlJGxi
 Hi4xiO33WQEvM9fSPVzsTXSMhtoegaqTVyCWvY2ocYACd2ZMXC0DDzsX74dttYU01bXd
 M+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=VpJQlHdzOL058GU4wP50cEjksEXzOUX3pb5wvWLJu64=;
 b=bsIc6AYAhKlA1YNcjf9vw60VGcHnm4vN7AmL0RP/gKDoRW+aICaWTp83wHx3FcFryg
 rDws/6iII6MqcHNP1dQkMQw7HRvO7KWRCi+0CQvAAVE4I5ec6BhS2i0J0FRUScOiXC4C
 1rMD6IlAvB3IhSXCWf5dekrlHcKEN5NI2+BF6GKr6Ognd7xshq8LqZdkNuYlFL2/ysLF
 hqJ56Y5la3AQgH4FJoyhXcWhwHkoDwkd/1PkRP8o/Vgom4Jec/NsnZPoTejcYiFj+yac
 6eZ3FP1BIi/c1ZUryMJuNZInKmSGwNEY3yhbAUwMykCXDhcIHmFVLF9yDP56gJc4Nix5
 ksCA==
X-Gm-Message-State: APjAAAWYHH/ZemIyiMF1iVrHXFmOCZ5LWj061I2wLSn9sEoKQe8PO4qW
 m2Dkr4b0QJHajsV0d4kPsCRqkQ==
X-Google-Smtp-Source: APXvYqyAQ4j/FUjC8TaAxYwTxb/knA75vtgilVu+e635/0e4hiV75mi8XILgeD8bJPqHj3zWdWW4jw==
X-Received: by 2002:a17:902:708c:: with SMTP id
 z12mr5615924plk.173.1567716010812; 
 Thu, 05 Sep 2019 13:40:10 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id m4sm4706664pgs.71.2019.09.05.13.40.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 05 Sep 2019 13:40:10 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: sm1: set gpio interrupt controller
 compatible
In-Reply-To: <20190902160334.14321-1-jbrunet@baylibre.com>
References: <20190902160334.14321-1-jbrunet@baylibre.com>
Date: Thu, 05 Sep 2019 13:40:09 -0700
Message-ID: <7hpnkeqxxy.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_134011_562033_DF1BB705 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Set the appropriate gpio interrupt controller compatible for the
> sm1 SoC family. This newer version of the controller can now
> trig irq on both edge of the input signal
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued.

I may do a late round for the dev cycle of v5.4, otherwise this will go
for v5.5.  If it goes for v5.5, it should probably have a Fixes tag, no?

Kevin

> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 521573f3a5ba..6152e928aef2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -134,6 +134,11 @@
>  	power-domains = <&pwrc PWRC_SM1_ETH_ID>;
>  };
>  
> +&gpio_intc {
> +	compatible = "amlogic,meson-sm1-gpio-intc",
> +		     "amlogic,meson-gpio-intc";
> +};
> +
>  &pwrc {
>  	compatible = "amlogic,meson-sm1-pwrc";
>  };
> -- 
> 2.21.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
