Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8CEC07E85
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 17:11:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 200E920892
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 17:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UJXwgn9l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SUAQlMuJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 200E920892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23Ptie99h3u90bqpTuqu1kHhmmevWnocGl2Ya/nm/dI=; b=UJXwgn9lzWnVu+
	8apNCmAsffaV6nynZyeED45Loz+TesAlywcLd0gWk6Ge2+PXyTcJDGdgdD8WESDFshYMgHZzlNho5
	wY/fzHfyeaKA2m7vGivBeEsPbHaI692E+WAAemiMwQcAm4Y4tzjp2OomJbNBMFBIr+zG2G7GH3SkY
	5ItGSZAeJgYVATC7wrdInbUJhZQ0YiGhHP+XBs1ByK+eKBciBnfCNbB++wHrFC3o262PwcJcRO2xQ
	BG7LRWvpux50cJC6rO0jjQYV5BYRP9SSql4eqnN3snc01joxkoB5qfvULwGfyZKqXd3OKGOdcMCTv
	LccjVL9xaU0RwycwOtlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUahO-0007Fc-6n; Wed, 05 Dec 2018 17:10:58 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUahD-00073q-ID
 for linux-amlogic@lists.infradead.org; Wed, 05 Dec 2018 17:10:49 +0000
Received: by mail-pf1-x444.google.com with SMTP id b7so10311437pfi.8
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Dec 2018 09:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=gO6GDEjeMU0BZEN+8pYig/a6BZs832Cvfmz53SX41bs=;
 b=SUAQlMuJ9rRPXlZkenE9nHTpyAjBxyft+a/eg6mzgTSpdTW2MSkcX9QOeateK2AuZE
 BPv7UM5is2ip1fpgfpQn5wuslMi2uoFH1vlskM3V6Dn/Lmd8Kkv2Q78Zy8/bHlJCMWOB
 /ko0LVoU/Xf12+v5M55ERxjsiNswtMpPsnUJpaa6gMGQt2EjC8K1LPmpDxZ9VN4CfMgg
 xGrxJOOh20bYIG+RC6+IQ3MBQW4W/sbXq51gluCZWGmIU0eUVq7Mf15pPzAmLTURubYi
 k9jkkwBr2g1n5qgFXIj7/abFoBv6WN8w+M08m+UoLNSUbmxzDaQ7VrGRr8u8FccXJgAP
 qeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=gO6GDEjeMU0BZEN+8pYig/a6BZs832Cvfmz53SX41bs=;
 b=H8GkYxKyfzLybZ7+V83zHuTSrGMJDYSPENzJMhm/lf2EVyQUcGTY/DuH2VN2fMGnCL
 0v6eczYpw2p33tp8IwMvCb0kDCTg5jB0CBJ2O6Z4BzUght5EM6g1aBOpAY07jSuLAgbw
 RWh82E4qjZW3sAIU22EXSsyiTgZ0OzFUaPelt4kJUvs3ImSSVlIOgbRQHK9uE4bPdqHa
 ksktJSumUJe8C/1Xl5io/X3wONhFzLfq1jXUXWmreH6cPcIJ+G+zd0NAQppylM2UIxLA
 K01NM3cXvoFPCLQeXePjCB19UDCoU28hPUhQOSVXnkpOUGkLDWRYRSWtKXCwVu5pyRs9
 hZOg==
X-Gm-Message-State: AA+aEWaAsv23gxBXDQeG8BSWqIk8C69ppvgzrDCs45doLz0Lz4s04nXg
 mnl4jPkmHV6cEQqO5Vq7enUglw==
X-Google-Smtp-Source: AFSGD/Wv7/0LALtDZ/KKhJHPun0A98iob2IEMh/t2ak4zWOs2mnu6l+65ZYCs+fcOOc0S7HEDjBDEA==
X-Received: by 2002:a63:7154:: with SMTP id b20mr21139922pgn.342.1544029836712; 
 Wed, 05 Dec 2018 09:10:36 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 p24sm40663837pfk.155.2018.12.05.09.10.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Dec 2018 09:10:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com
Subject: Re: [PATCH] arm64: dts: meson-axg: s400: Enable PHY interrupt
In-Reply-To: <20181205155207.25568-1-ccaione@baylibre.com>
References: <20181205155207.25568-1-ccaione@baylibre.com>
Date: Wed, 05 Dec 2018 09:10:34 -0800
Message-ID: <7h8t13lx11.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181205_091047_603966_2BBCC04F 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Carlo Caione <ccaione@baylibre.com> writes:

> Now that the GPIO controller has been enabled also on AXG we can hook up
> the GPIO interrupt for the PHY.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>
> This depends on https://patchwork.kernel.org/patch/10707741/

Queued for v4.21 on top of dependency (thanks for noting it!)

Kevin




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
