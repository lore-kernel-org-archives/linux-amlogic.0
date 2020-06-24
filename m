Return-Path: <SRS0=3F0F=AF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88898C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2020 10:11:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C462084D
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2020 10:11:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3BUulF1i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xZqQbfz7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C462084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QO6v9C20gFW4lltKzXdY3Iqb/MXcqbJrA1bDf0Gj7QE=; b=3BUulF1iSoIYR0CUZn/2dZbp/
	roc1Oy3rnXbYmK0iDUk3islNkxgf5QmvXEOBn4oHJPSWOI1OgjsQkQqzSIM0aILtG4As2sxFtJwQf
	iGZA8cj/iBKEJrhFxJfv+tIM94s/P0PQGMSzNyu6P/xUeluNZBwFeHS9ok+HhSq/xNUCrV4Gu7zy6
	YLzmYmBw55K72UqkUAMdcio1l/4FQ0+3Nm+OXJGsmvTzhdfR2y2+ct/ov/5G9h/POi6p9gCT/5sPv
	F7NxkkfG0CmAviQ0yf2neIJIIWZAX1VGz4U4xGLzeLuMfEtaJ1Y4/UkUpGMP4cuKRTSyCkiZgOgsO
	g2p1zAGAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo2Na-0005Sk-8L; Wed, 24 Jun 2020 10:11:42 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo2NR-0005Pa-VZ
 for linux-amlogic@lists.infradead.org; Wed, 24 Jun 2020 10:11:37 +0000
Received: by mail-wm1-x341.google.com with SMTP id 17so1955950wmo.1
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2020 03:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=igZtrvoVRESa1OptkNZlf7jr2wxCNuT6tHPjKiqOH2Y=;
 b=xZqQbfz7SczvKrDSaN7j6UnsFBhfXGEAdKPoRtxIkkmU+Fk1A8U0WuWhj5RlUn36gb
 oEdZRYnoMZkHbxbJghWTTAMIJIqMVxEYZTo9Jd5xA6pP5bVkRp2d6HKhFk4dWN1ecwfR
 XjADbrLnuibFwLv4BfXq7ioG8MA7dwNhVp2e3wFZBxzUrmrRUtMTvpNXr7H9G5Ii5M3W
 Nw9o/HnY4pR5O8udEAuE+VEiln7XxBF9FJzVAr1isdys++0iL8KX1oztEPOwhluKnbRC
 03uIWzrzxjOQfBxjxcr5URfZp4vn1+Tx/cNWWKNUfX+EcGUNJc4YeDO0jInCBVgis3V7
 Rbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=igZtrvoVRESa1OptkNZlf7jr2wxCNuT6tHPjKiqOH2Y=;
 b=HrpSypUTcvZjXVZ0OeQjHhhXLfEfA2ZEkwqIDHoA7U62ZavS3B/6fdLway8WfBMi+m
 DcTImOXC9qRdNevfCefdspVP1cc+E4YO983Z8UeX0fCpQ7LtucfbcHdwpSfYGxlVbmax
 OFCispGveUMRIxlL5xdhvL3lglIGd3fh1Y5wxQMdLNmJd8l7v6sHeEf+EihpCZRoBIGb
 h0CxNRC8T/zOyccHc5rklSu6BEmEvmXJLuG6Sh2yKcVX3OiyPqiIZBCAYlWXGOAFLpjz
 6AIafFcVWnSZjEDIvhTmWRBGWVM/MkL7yL7Mg/ZKBatC7hg/yr0Q+B8RB95J0OkoofKY
 EScw==
X-Gm-Message-State: AOAM5315Dt4r27sfSGeyrgRB64N9p/unZCu1lZyL4nUaHOyzhKbLtjYV
 RyP+dumLbcc+cAkfjPU8o7EytA==
X-Google-Smtp-Source: ABdhPJwgLFr0/kRDRVXP8K8wBpQtcOlMyFUgKez+F/Ly7c+/i/o83wAuC+PTRyhhEUV32a5BV3tn7A==
X-Received: by 2002:a7b:c158:: with SMTP id z24mr30586736wmi.12.1592993491424; 
 Wed, 24 Jun 2020 03:11:31 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 92sm18571397wrr.96.2020.06.24.03.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 03:11:30 -0700 (PDT)
References: <20200610083012.5024-1-narmstrong@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] clk: meson: g12a: Add the NNA source clocks
In-reply-to: <20200610083012.5024-1-narmstrong@baylibre.com>
Date: Wed, 24 Jun 2020 12:11:29 +0200
Message-ID: <1jpn9oixim.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 10 Jun 2020 at 10:30, Neil Armstrong <narmstrong@baylibre.com> wrote:

> This patchset adds the Neural Network Accelerator source clocks present
> on the Amlogic SM1 SoCs family.
>
> Dmitry Shmidt (2):
>   dt-bindings: clk: g12a-clkc: Add NNA CLK Source clock IDs
>   clk: meson: g12a: Add support for NNA CLK source clocks
>
>  drivers/clk/meson/g12a.c              | 119 ++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h              |   7 +-
>  include/dt-bindings/clock/g12a-clkc.h |   2 +
>  3 files changed, 127 insertions(+), 1 deletion(-)

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
