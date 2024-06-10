Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0369FC27C5E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 10:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kntBHHjNi7+sFDm+3hrELrKVkNDfvgCFUQbXjWKGFE=; b=OMpHzfLE3sUrL3
	7h+J6XmK4utiBnvNhncDR8fT0ppNId05ka9qUdyQrCZP9VhI6YX+lmp0K+EzCgvV/w87Qr7flX04E
	pb7NW1DgMTeN6cV6xDTkPF/dDn+64gBtSYEBtaK7AIvci98/jb8Ma/I0yrl3ao9wN4AxCiQe6ZIPy
	zesyuFuca4TINkcHBIo4M3AIKWJyksU9Pbu1dtPrDTmwC42KBz2YD/pSfQy6IMojQyu5IBExle2fR
	h6rTJa8nF3WQonszU1ciFPTPG6iNKnC2kgosigx9TGju/XLlznOfouCqb2Cn09z1+jHa71wTSd1Mr
	Gr3IW5VrcscvQIH8yYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGc27-00000004b3v-0GbC;
	Mon, 10 Jun 2024 10:13:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGc24-00000004b1q-0pi6
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Jun 2024 10:13:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-35f14af40c2so1302601f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Jun 2024 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718014422; x=1718619222; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgx2T9kylilWsH1G1Hk710ItCP12Cz3Ph1mFoLPeyWc=;
        b=vifTxR8hvucNYQ2Hq0Pe864DtqJBH1TL5UOAjZpJCt91UTb2sG2jM4VW0WJ2PtvZhm
         K0r+9EBmS6rJyrhfhuoC8RjG4Gdja5GEjeTyx8EtVqPDdnFqQYsBB/XXireEOJ2LgQo5
         uhz7IRNE4s436D6tsQoExYEEMB4HyhC+jAA6lbgkyWIrPMq+8CBKTi4uY7iGRRA+Zj4p
         9XSH60GGaSHneYM5EFeLikQfKVKJIr5gpdU4ss0k5EcyqX5HJM7Jq/u+NvovDh18sRHb
         c97L+kvdG5ImgwQYVQWk6GvpzVJ6YoYfP8FWcPfkdX81Emn+vYl+76RHR9w1I6hdqhkW
         C5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718014422; x=1718619222;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgx2T9kylilWsH1G1Hk710ItCP12Cz3Ph1mFoLPeyWc=;
        b=AEa18QY7eyzYritvZpRMzYrQZJuStQ+nETfZfKDO4Z2fUslQKgqktji/Eh863BtwMA
         PSJOLuWjsnW5sTadf0sGaeuXkvrdoMeQ1iFSI0E8y53O0QRQgAtVRcGfCevNd8dP5GVe
         rXQTykYf7qsXL/b2PUd/CoEVzUgvgtnsRNXSRf7m6a12ymW4/MNMLaValVOQXkVvep6K
         MMTRLkRI9/ye3iyfHV8MIEqEf+Lv8DWwW3TbPkKqvWicp0RDg8lj84ka1yLG9rguPeTD
         t/ml5Myb2nTXDhXEjycMWu2D6w4xEGWRpNo5o9e/wbGsJU8QkfRxPa7QUBdFfVCeePqT
         id/A==
X-Forwarded-Encrypted: i=1; AJvYcCVWExTCM6UkUSO55Mq5fSrGEmSHUM60vndmUv0NP9daPbKg9GCzjEZGpseI9OgYZw9c9+A9Zh9jRoIOX80CNvtnq9Rd47uEuRxBbvcQ5geHZL0=
X-Gm-Message-State: AOJu0YxyO5cAAMAsrUlfBqfBce/Bw/90VsVCXjVMMeLb8Y1qNoPtCii5
	qf0om16rTaK5JxqbTOXBB8imESYV17xT5cTTVYA4gvW9XrCDI3tcR4OD4YxHSTw=
X-Google-Smtp-Source: AGHT+IGgeOOdto077Okd7vLn2j1OX9iKBjMp6WWe5i6+dhSZlAdwPE+HQyeM0KQew5XncDF0WV2dlQ==
X-Received: by 2002:a5d:47a2:0:b0:35f:2550:e276 with SMTP id ffacd0b85a97d-35f2550e366mr1516821f8f.5.1718014422196;
        Mon, 10 Jun 2024 03:13:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:afd3:66ee:5486:4249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f24ebfbbbsm2136085f8f.61.2024.06.10.03.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:13:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: <neil.armstrong@linaro.org>,  <mturquette@baylibre.com>,
  <sboyd@kernel.org>,  <robh+dt@kernel.org>,
  <krzysztof.kozlowski+dt@linaro.org>,  <khilman@baylibre.com>,
  <martin.blumenstingl@googlemail.com>,  <jian.hu@amlogic.com>,
  <kernel@sberdevices.ru>,  <rockosov@gmail.com>,
  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/7] clk: meson: introduce Amlogic A1 SoC Family CPU
 clock controller driver
In-Reply-To: <20240515185103.20256-1-ddrokosov@salutedevices.com> (Dmitry
	Rokosov's message of "Wed, 15 May 2024 21:47:23 +0300")
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
Date: Mon, 10 Jun 2024 12:13:41 +0200
Message-ID: <1jed95p0kq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_031344_294541_CE7B9313 
X-CRM114-Status: UNSURE (   8.71  )
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

On Wed 15 May 2024 at 21:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The CPU clock controller plays a general role in the Amlogic A1 SoC
> family by generating CPU clocks. As an APB slave module, it offers the
> capability to inherit the CPU clock from two sources: the internal fixed
> clock known as 'cpu fixed clock' and the external input provided by the
> A1 PLL clock controller, referred to as 'syspll'.
>
> It is important for the driver to handle the cpu_clk rate switching
> effectively by transitioning to the CPU fixed clock to avoid any
> potential execution freezes.
>

Please group your changes, fixes then bindings then driver.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
