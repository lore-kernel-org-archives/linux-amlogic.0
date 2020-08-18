Return-Path: <SRS0=wsHT=B4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D383C433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 07:45:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63DAF207FB
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 07:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NHBRJ4ba";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lP1zPxrP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63DAF207FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rKks45JDoL+/jaxH5WsUITyoeRkq4XLDwIITHx5jLw0=; b=NHBRJ4ba/5llJVMOcTpic4sKi
	oVhO0YguQuarSIeX5ZDAzBe9XrtxWMWSicE7/U3zHEAWnGWjhFBlKsMTq+jGAOfxVjY0VM+G+FMzZ
	5JpEg57+5yD2TeI63P+hKM+I5dua3V95/XttTSU7/4KWk0cGSpLv9RL6DiFjdLu4QKbDPFVMCSglF
	b1TyGdfkFqsysy1eL6Ma80KhCe66HuIeShEKq8LRSOu0GfUTOVdTRfvN1BrDLIYEz+NtKS+uhRJB5
	npFrpKd6z8W8iBUDeTruAUbW3DT0q8xWx4Fpq6nJa6yDGLuY62t4atcu4NYWbM9+XJWZj6zXIBu37
	3aZCTAOtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7wIv-00073V-2B; Tue, 18 Aug 2020 07:45:09 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7wIq-000723-DV
 for linux-amlogic@lists.infradead.org; Tue, 18 Aug 2020 07:45:05 +0000
Received: by mail-ej1-x644.google.com with SMTP id a26so20927340ejc.2
 for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2020 00:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=F9fOoRA9pJZPPsu0jJzLDURp0h2hTxmM73TFlf3VuwA=;
 b=lP1zPxrPZ/NsOHtDvabu13+OQG04WjHKR2fWQb6Wrx55QKqdtsBUcW8EGi594pDhEa
 NQMztuw8LhxWSmEY/o24kwy7pfjwSHCSz3L/uO5kTsHl3dqP+ijGsdlo3QQNLpzQ2pPo
 lT/hjfwq2L0vT7r0/3rbP8NNjGaKHsBc8+P73vrjtZx3XBb6SuH4dW39u+213hoaGcq8
 HBWE/S5OCavaqFIgazToH1qQIuZdHHfZs3ITOoxXZ+nrUUBe0vMPvB1qH3G6PH0oqqCy
 Kv/7/8fsCJSmw60kHaEGKFTg1L4oOKBIQNuHcHQLIkGxGR2O3DOeHlCgVqv0J/Z45QEn
 izYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=F9fOoRA9pJZPPsu0jJzLDURp0h2hTxmM73TFlf3VuwA=;
 b=ovzJK3i3VGutAt5sZ+ezpsrfkUN0oLrGYNukRbo8YzXjqMgRubsK7Ae9DkaVDiE94E
 pIgZzUcxM1onb+uZp1sFqdXmC3rgpaHFsvzQFwrUuX8AhFkKrpCSvUJRqriVsNuNTnLN
 FUg+KkyYNvErxOKEYY9anPseBOejMVzj0P24Q8QPQ5FwCSKgcjyXzr0NK8AsvlQhEjxv
 RA+spI5YxCFqK5jw8+4jBqbmX8V054Y5hoDXImKrJEyzvSbClifOxx4eDJhl//w1rPJJ
 NE0njCNrxYNyPh6EukC7mmgiKZsMN+PK0s9vcCfAbcvYRAzN4xZ7qAN526uW05ZdA7So
 wZCA==
X-Gm-Message-State: AOAM531mkT6+t6kWVdUrCG9QdVDKEImN7QTjqzGrC6cry5f0eOEO6e1l
 U8eCqWmFjb2kvuT4pMSruPN63g==
X-Google-Smtp-Source: ABdhPJzs/NEYfJqQIrV9qA0eRmM4MAKKamlMOkvCW+p1dOvvMwgBytrHgCCPAwYNJGw67ShMuKzI/Q==
X-Received: by 2002:a17:906:1604:: with SMTP id
 m4mr18317054ejd.6.1597736703062; 
 Tue, 18 Aug 2020 00:45:03 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id sb9sm16351802ejb.90.2020.08.18.00.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 00:45:02 -0700 (PDT)
References: <20200817102122.434-1-linux.amoon@gmail.com>
 <20200817102122.434-3-linux.amoon@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arm64: dts: meson-g12b-odroid-n2: Disable virtual
 RTC driver
In-reply-to: <20200817102122.434-3-linux.amoon@gmail.com>
Date: Tue, 18 Aug 2020 09:45:01 +0200
Message-ID: <1jzh6se6te.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_034504_491666_B748FEEF 
X-CRM114-Status: GOOD (  13.33  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 17 Aug 2020 at 12:21, Anand Moon <linux.amoon@gmail.com> wrote:

> Disable virtual RTC node on Odroid N2,
> since RTC PCF8563 support rtc wakeup.
>
> [    7.171149] meson-vrtc ff8000a8.rtc: registered as rtc0
> [    7.182875] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:07 UTC (7)
>

Maybe I'm missing something but why should disable this ?
Can't the 2 RTCs co-exist ?

> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Changes v2
> --Fix the subject and commit message.
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index f08ae1b337ad..7fb952a2a35e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -642,3 +642,7 @@ &usb2_phy1 {
>  	/* Enable the hub which is connected to this port */
>  	phy-supply = <&hub_5v>;
>  };
> +
> +&vrtc {
> +	status = "disabled";
> +};


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
