Return-Path: <SRS0=O93K=C3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CAEC43465
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 21:31:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6CAE222BB
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 21:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="utsjqBzW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="g1vDEt7a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6CAE222BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YkkTGs3nUSm8X72V4fxMRhbAc53rfn9KvKAgg6uceLM=; b=utsjqBzW6tFg59P3xHXJ/b9v2
	l4QYqr/KcE8NT26zSXZGqf0DM/X4UdW90nlNgHfjX8Zu1j6MKrxInjdmDZaffKbxrBrg75dVI7WIO
	l2xm7Qdx2eKZtCYjgLhz7gpBmSfz0VPbat/IgoZjIZlATzhmSKlFWaJZgJVn2wcsuzhTE4ET+y0sq
	flbJAs4jGObXaiHBriyPlurY9lMJkretT9Cl7HkNibD8Q99jxQJS4Q6UyMI0gJ6ZWi61QdDSyfiT1
	wPc2PwXC67XGv9XD5AZo3LosLi1dtFqMY7hHAxv+JOPvqedryBikTAVcPbgqWSEcGsBO1dj5Zbm+N
	nK1YZGH8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJNya-0007G4-KG; Fri, 18 Sep 2020 21:31:28 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJMvG-0003Xg-EC
 for linux-amlogic@lists.infradead.org; Fri, 18 Sep 2020 20:24:19 +0000
Received: by mail-pl1-x642.google.com with SMTP id x18so3570526pll.6
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2020 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPkEsOcLuz9gTEj7lkyB7Qd0fwR9xFacocdc2fUFPK0=;
 b=g1vDEt7aNAgGkbwo8Rc35OXS9mqga9dx5J+RRHirmUm4gv+j7+2th3LAgY9eB+9wLn
 zLgwBamDT+tNVqOOGP+PSNGWHG0zoSRyw/cDdrEfO9gGImRRfkWa92kekdsqop6ir94H
 wkGmrGcIdsuSVxNvBLSZw1G7+ubyw3e6a+amOqsgV/T4kRQYwZLxFe96XBNeNXZ4gatq
 ThF/LKTTr97EmHiRx4ZTmu69PlOgBt+aMNtB6EgngCdlIyDruW8IT1rBt/ymM2InT8Cl
 WJmyEqwC1Bv38QVBtyH7ppyhlW9qIJ7z+WlzMujbVt+yvlg5rL4PZELgGiaKAPPKR3u1
 vhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPkEsOcLuz9gTEj7lkyB7Qd0fwR9xFacocdc2fUFPK0=;
 b=a6Qi49B740nNaJedz3FgZmov/RHQyC8krkcS5MEQZJhvas41TY5uanTupJe8S9TtcJ
 QV2xZyGPAozfxMS7g1ko40juB8KuefbFppGQMEtzLxUoUhUfccFm86Qr0MlNh+/meDrq
 9dEHQr3QhnckTdCc33VJwksS+se4et4on4yb8leyUHzZ4QfT+pOJ8UVcWXLwr472gvqq
 2ioFLp48oxaYyEnhzr67zIAJQTeF0VQjjXpOP7CW/6Oq8CDaLYmaiCq479E0pwsxQvny
 B+ZhB7ycgl8UNEFhCiYEXEsTJQ6+xX0vyNB462YX40m0N8VuetrjgdYv1nt4GofU3u4P
 Pv5w==
X-Gm-Message-State: AOAM530d16pzS47IkJWkP5NLB5DP6naaNfRoT51trz5Fa6LJdZfNJcTU
 GtzaxXna4y1knjtlRYkYW7qKQg==
X-Google-Smtp-Source: ABdhPJwqUWUPI8LBuv/ru8S5RZsK+t1ITdDxhQ3831rllcMpbX1PU9dVn2qCx+BK1dgdiIwHeopSKQ==
X-Received: by 2002:a17:90a:d512:: with SMTP id
 t18mr13917899pju.106.1600460635445; 
 Fri, 18 Sep 2020 13:23:55 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k24sm4213011pfg.148.2020.09.18.13.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 13:23:54 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/2] soc: amlogic: add support for the Meson AXG Power
 Controller
Date: Fri, 18 Sep 2020 13:23:53 -0700
Message-Id: <160046062721.27609.17071791777862350491.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917064702.1459-1-narmstrong@baylibre.com>
References: <20200917064702.1459-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_162358_746534_A4763550 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 17 Sep 2020 08:47:00 +0200, Neil Armstrong wrote:
> This adds the bindings and support for the Power Controller found in the
> Amlogic AXG SoCs.
> 
> The Power Controller in the Amlogic AXG SoCs is similar to the GXL one
> but with less VPU memory domains to enable and a supplementary Audio
> memory power domain.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: power: amlogic, meson-ee-pwrc: add Amlogic AXG power controller bindings
      commit: 97de44c5ecd413d3da3d4ace74272a1ad6a409ca
[2/2] soc: amlogic: meson-ee-pwrc: add support for the Meson AXG SoCs
      commit: 525054782a74d28503c3f585e00d9860d67d7ad1

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
