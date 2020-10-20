Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74030C4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 23:14:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4DF5223BF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 23:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zGPXLx7o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZboeJElx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4DF5223BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iy467U+pXmKpz+zGPDXCGnJnVhYx5EeX49new1O3lMU=; b=zGPXLx7oijDSY2NUbaoMMlGYA
	IL78UG9DlR1MR10vqPTBEBqmWB97+gyFCZX8QtczWMDEv0d52maUzeaICqkVwa/v0Y2ISc1D7ufgf
	YcDTkA2u0z53e5zvyty5Zh4Em4WLyE60IoFjaEaKWjaXuD+CW7sMQeWKQZwnnucF96tnNr9oL5i1/
	ujpJCPC4TtrcOyp+zCvPv9BI0doJZjr5KFfAIfq72M4n2qAxbsxA3Zc9UpxguOgK/i++p63Xf26C9
	VbrII3Hz/2Y1lNvzASpyqGhOLGgIaUs9PJwQxc0FPMiJSH6OZDdM3xZ2fFCOE2lJYFzi8y87QghTh
	gGFOTprWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kV0pV-00013K-7x; Tue, 20 Oct 2020 23:14:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kV0pS-00012h-Od
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 23:14:07 +0000
Received: by mail-pf1-x42e.google.com with SMTP id 144so326822pfb.4
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 16:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KFfpH0InGRM8MvpZTbASmzGof5hPRvFFHjnrwDY+rdw=;
 b=ZboeJElxDX6dLFmLilvQG7EbuCwQdu8U2oYHQ33WgX8II2smq0C57POZYN9BM4k/Ex
 /XljvDv+J1fLMskvhoTWi1Vda9uo8cs9rVDE2pjGqmK5Np8cF8nXQ0bqx6hVAu8hUnRz
 7zqiRPXcJ/i8vJPaQBgMLLek61DBOJlLHgImf9Yb23KBa4OJkqr/z9Hu8A7TlVIHIcxE
 3F7UnecM6cYf3pdIzJfgsDIBSEgDSlDMx+o9R9Ko/5+EFzG6KVnqnz8ZU7SgcF8mi/AG
 i9yq9BUeJZT2cYFpZbRThQz5Ynl6d6aDuKeTms/LopCA1pUze87kijb0a0jtMrnqgahl
 0iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFfpH0InGRM8MvpZTbASmzGof5hPRvFFHjnrwDY+rdw=;
 b=pPYgTf5AlS3VOxX4AsePtTI9fUkZTFDYA2IK1qoi5YaQbZWgpDvTwxbmFeeuH144KL
 Gbx9uY/SKhkGfjUtj5Q24gv2BiHi+Qpe9NcoUAH54EmVAzmtAm16l4c0HdbRIADrPF5Z
 FLIGHQI+j6quPIFECk6wVHp2bjx5w99/cy1ktwVyMzLCiQm30m3FkODoKsh9IXwq0aUi
 E37rx6s4979RJI2cXRliFppdTchSmR6c/CKabBlzxzjwJ1oC7qMexKTsayM7uaHXUlss
 fFaqT5rxnZn498NxrsUTJHAJKdoYuiDTxalxe8Fqdfn+pMumnUsxXZqTU+yjBQs3yjbC
 7hcg==
X-Gm-Message-State: AOAM532eZe56Yi2BmwpeZKD51IMTcjNLH8z287wpZkRy7wP7VgVqq1NB
 Pu6cp/B/o0gpBEkeR0CTpYzLbQ==
X-Google-Smtp-Source: ABdhPJyqjnd3QXal7AHEsNxZ8SPBaMGxoLELYgl1NWJHEaMCtzJqhHsNEva2dpyBmedACi6FlHgi8Q==
X-Received: by 2002:a62:3815:0:b029:152:80d4:2a6f with SMTP id
 f21-20020a6238150000b029015280d42a6fmr296770pfa.72.1603235644320; 
 Tue, 20 Oct 2020 16:14:04 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id z3sm195910pgl.73.2020.10.20.16.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 16:14:03 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: amlogic: add missing ethernet reset ID
Date: Tue, 20 Oct 2020 16:14:01 -0700
Message-Id: <160323562909.7110.10553344711717844813.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020120141.298240-1-jbrunet@baylibre.com>
References: <20201020120141.298240-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_191406_810553_DE499677 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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
Cc: Anand Moon <linux.amoon@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 20 Oct 2020 14:01:41 +0200, Jerome Brunet wrote:
> Add reset external reset of the ethernet mac controller

Applied, thanks!

[1/1] arm64: dts: amlogic: add missing ethernet reset ID
      commit: f3362f0c18174a1f334a419ab7d567a36bd1b3f3

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
