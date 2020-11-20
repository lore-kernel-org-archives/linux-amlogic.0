Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65243C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:12:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E681222254
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E19H23O3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aFVadyz1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E681222254
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WS8sv3XNF10dg7hLziOno2oJouH4D5/IQARRg9QPaJ8=; b=E19H23O3XsIHufnT0jv0i7n0n
	rSduX6XnwbXc5GJ+sNdW25TBvWlroop0tFzZl7R8KY8gjbI/j1BsGnW+fiA8KN/dFwLyx4fl14DR9
	5u4Ucs0l3iuycJGgu79lsaOLpVxVdlXomHfh1M3MDZXeSVS/0LAXFa0u4C4bITURkbjvj5NCyrU2R
	ouff4io3W+Zk7It99QGXt0f+ZpE2sVvPFZSlFY8SglRnH+ESJityKNuJEpwKZUJDc6VwuDkN5ucC0
	DUBlT5hqqpeK1K/tJDTcmKbR7/h3uWIejWR1DwtlYZcvpUrFvxX8sRlj0WarDxfg4fVi2W0ZaeJ81
	SuQQHV8NQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgBpq-0001pg-2w; Fri, 20 Nov 2020 19:12:42 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgBpX-0001kC-9L
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 19:12:25 +0000
Received: by mail-pf1-x441.google.com with SMTP id a18so8786829pfl.3
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 11:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E/ELgvw+J09vz9vs0q6oZa1VgG1EOYdY7JKuts+v2/4=;
 b=aFVadyz1pX8uk5D4z1Jnv9buWn4SuTyoagqLC6b0/tkDVflrQu7ap+Q+ctQxfpTNwM
 5nLW5eOE1O4tpra4243m/6cBRinRoxKG4IYHFt1+8KZGATUNbHKEsAn2Sj9JRqFc2lpt
 ynovim53KD7OYb2bYWFvDGKhI5nzeXVDkg/R+xqqyyhh/RBAlamy8gFNZ++iLJWw1L57
 ytDIx1PHClses4H4OsoVJZOIXYdnqS+dx3u6Ac0mTTiKynw3tcOZgLHIFYcCFrl6+Pzb
 mRy01oUHGG6Na1BVPWZz3oFW3BAjfhNHfevE1jARulpThk67ufO72BSZfSdAHyQIqeW4
 y06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E/ELgvw+J09vz9vs0q6oZa1VgG1EOYdY7JKuts+v2/4=;
 b=sCMh2TrsG5Y9IY+doQU/vc6grz3oj8/owFBQwX7fDMZU+FMoSbvl1CHE37fakKjz7P
 aSN/1J5eClvCZ1KT2opypzwKlBxo7VcCfto1nzkBBmbRg+J3JyMc6Dys1gUnCnJ4ADLg
 5ad++Gk6/GUXY0fZaNd8p439hsQi/jjQFF9CRGktjB2b8/ib4nuFKe+qoFiEl+UlpcPM
 ifuVMrfoJHebe0UkC/L8zFnoEnMkqP9IkzU7XCUFMhawdTyIZN/h/ymKzTWT3T6ehVwV
 sLwy+uTZK7sOrLcExHWMRXe4xVCzNH400B8YvrZEMNATeTo4rsJkNDq0ZdaYs9ErfCwd
 ktcw==
X-Gm-Message-State: AOAM5326Suk+b66WoCTya4L1x0NhjVsk6xUtD3Rbtv5cSk00c5jExdfS
 cRf0uOiK2nKB7aejGd1jO9/zgA==
X-Google-Smtp-Source: ABdhPJx/EBQG4MqB+geHbSVfeWKms2Gkee+DKW+B14Z2ewvCaTkdRrHShNMzftA1IeeN8zXWp8lg7w==
X-Received: by 2002:a63:5262:: with SMTP id s34mr18391584pgl.382.1605899541288; 
 Fri, 20 Nov 2020 11:12:21 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id cv4sm4695636pjb.1.2020.11.20.11.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 11:12:20 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson-axg-s400: add support for Power
 Controller & MIPI-DSI PHY
Date: Fri, 20 Nov 2020 11:12:16 -0800
Message-Id: <160589952950.11499.3353982146380959022.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120152131.3918814-1-narmstrong@baylibre.com>
References: <20201120152131.3918814-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_141223_388795_4F775D56 
X-CRM114-Status: GOOD (  11.26  )
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

On Fri, 20 Nov 2020 16:21:29 +0100, Neil Armstrong wrote:
> This adds the Power Controller and MIPI DSI PHY nodes to AXG, since the corresponding
> driver and dt-bindings had been applied for next release.
> 
> Dependencies:
> - Patch 1: [1] applied for 5.11 in meson-clk tree & [2] merged for 5.10
> - Patch 2: [3] & [4] both applied for 5.11 in phy tree
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: meson-axg: add PWRC node
      commit: 2a51ac31449a19bfb815f21f246134d6518ff781
[2/2] arm64: dts: meson-axg: add MIPI DSI PHY nodes
      commit: 413b63ddf2f85e84b0824770cf9f42ea768adcb4

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
