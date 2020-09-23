Return-Path: <SRS0=7V7W=DA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D5BC4363D
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 14:13:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD8D423119
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 14:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YdlGiFQG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qlSdUE8a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD8D423119
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SjEQc61LaxM6NisIOir+WQXZ+pj0wVzahnZvye6d/1M=; b=YdlGiFQGm6PUutd7NwLvAOC3t
	BcOkPHc5/5SwbvoGrUc/wkd82/9x3Wbohb8+Z0wzPLt7PwV2n0Qik7llXFZUvdH+nRppf5D4CX9LV
	ArgQw+jEKbe82Z2IRdFIKc2aZZeFI5Gd8sttsZbJ0HxcOSbUwduTRc5GDGWH/F+2V89oreM+9bCSZ
	HSovJPKfRugwJYOsCODpy1e6hkEBnJpdytHzvPG01O11h8EMVv1krpQ/Fs7EpEB9omXFlEUGtz4WC
	8hKkKfYUGExExzjA0fZmNtT3et6WxIN3PP9W7VKwgsQ9SIpT+i8OPdSqs3L8I+wTfcYzw06zeiWu6
	bURFZq5Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL5W4-0005hu-QL; Wed, 23 Sep 2020 14:13:04 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL5W2-0005gF-0Z; Wed, 23 Sep 2020 14:13:02 +0000
Received: by mail-ed1-x544.google.com with SMTP id e22so20038614edq.6;
 Wed, 23 Sep 2020 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mdUO4rdr50MnV1BrXIxomFi8tZf9S0Tgpb4dKKT+L6M=;
 b=qlSdUE8aJwkzEyqt8pukPEy+fB5tlgAI1XHvSUkYNRGQisCEteg2hs4Iepm4PZeiwU
 8m+mkoyE/1pOHPh7PVzJqGr+Uc1dzry7NtHAWfhCmKGc8hHQvDurueKu923retm890hN
 iUUkliEUdO2O5eisL4i1tikUqshX4h/nMgTvoWuolVnOFfGW8F0JUSLH22XSeOpWX95M
 C8ZtUMOk0VeCYdodJ1WZg/Qrargt6j7qhP9nm/UP1x+GoINIVXFNyhYpknpqt62ZHT1c
 +faQbRuldVK+eF113zrmX2nsDbtI2JB3eISYl3NeOdrw2tFtrzz9WcAsVTLKRSpCiJb/
 jV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mdUO4rdr50MnV1BrXIxomFi8tZf9S0Tgpb4dKKT+L6M=;
 b=mrN/eIN4U5Kzzez2m4sZcRQjZ8s0l/T549IcVELkyaQu5nUFlx+baC4VHpn1m/q8hl
 0uD0G0edo1dxSFqWLzVx2KSpwhCR1GfnkU6FKKYIOxDrAzTqKTUzi0tPz0eLpVLx08xm
 tovJPYSpmcjpy2EhATWWlYGJce7RVj3sW0oZYXit2sfcQW1vPCh2a1mmcn837lCn0F/X
 pfFJa1nxzoYkc/jTq3fnDwqiK4dqnerecnA+Ktx6mC2etWaCDr8IF+Yq6F+jTYTk2kKt
 mGVJPIMLYxP0XDAVvH358GQPROsJp1KffkllZq9+z9FVd76brnhhlqMpoTWQaORmztnf
 im2g==
X-Gm-Message-State: AOAM531flQ0o/XPXoyo3/U4zwAG2KfkRS3d3wKhtg5Wze/J+UaQlkKqS
 E3MHug60U22eTCWMdbJ3gme1nkfy0HutxqZmkI8=
X-Google-Smtp-Source: ABdhPJz60qOETLJanuZwtWyp2XoZ9fAx9QVXf7xhJCsy78hkEewN3uePBgTaDz3zT33MlvorJbD0T0a+uFA3r34Egmw=
X-Received: by 2002:aa7:da42:: with SMTP id w2mr9728548eds.287.1600870378866; 
 Wed, 23 Sep 2020 07:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200917065949.3476-1-narmstrong@baylibre.com>
 <20200917065949.3476-4-narmstrong@baylibre.com>
In-Reply-To: <20200917065949.3476-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 23 Sep 2020 16:12:47 +0200
Message-ID: <CAFBinCCqqT_pNurE0Lj5Md0gdi+PU7NwnspsmFkag5y9cw7bqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] usb: dwc-meson-g12a: Add support for USB on AXG
 SoCs
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_101302_060328_F060CA0B 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: balbi@kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

thanks for updating this patch!

On Thu, Sep 17, 2020 at 9:00 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic AXG is close to the GXL Glue but with a single OTG PHY.
>
> It needs the same init sequence as GXL & GXM, but it seems it doesn't need
> the host disconnect bit.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
