Return-Path: <SRS0=LO2h=U3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A92C4321A
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 17:58:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B302083B
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 17:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UH3asZfK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QidYQZ1e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B302083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qZ8e0kOSTDP+dpY63MU7C8QsHwKT2EiyD+3vNhcPrg=; b=UH3asZfK9hy5dL
	hmzX5gdb6pUVH1szLGuCfxqyQ3tznNMbhrfZ44GZV6iAtye8gi2tkvGsSRZW3IhWGOukEW27/cvyX
	U+BofIRRVCekti4pN4sT9KroV5Nz900HqO6hryi8DGtnWSoFbsdKEOiVo3GOpkdUE3v12+ylAOW2k
	svQA62VJa50R77eyA4tivK3B9g78ZWxFSixH3Xg405dmc2/3ZSCrCp0V/LKfXZZSEYG3//SOSFgHj
	QqsnubhQrp83Mt3i3WlUlzx6OOcprHZOAaKwnuRynsdmHO7l1zM+9kGB7I2DSSOiGceKejvNniBij
	kPGD7mkkjWGxYMyXQJAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgv8N-0000Uf-Dz; Fri, 28 Jun 2019 17:58:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgv8I-0000TV-Qt
 for linux-amlogic@lists.infradead.org; Fri, 28 Jun 2019 17:58:01 +0000
Received: by mail-pl1-x62e.google.com with SMTP id bi6so3636988plb.12
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2019 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JXDx5Of53xKpwKzie292LEzpOCIt7HdxAp/TZojOC98=;
 b=QidYQZ1e5tVfpSNlbzJAwZ1PSEo4dbT1h4HX6qlUhaYy/0WDP2DbYNFPTucwsPtXtJ
 P5Da3q4BSmLlg7YBmA0owHM1bUPrEb7BS8gzdHoNIWge3t/+SscDfMMBa3vx9swwjY5n
 LFvDrn5pgiwG3LzawIGsvptYLxKuORQdAVK4jqhJjDPscsuEl0XBsIcIhtmOUiqLnY31
 rl5J0Is/8LGOWfkwroXrx5lrTEZnf+8x1H9rCHGrYrmt0cwF3/5ZHvKqdnUE5x9l17cs
 65Qi5bpDUOP3xQ2tieEt795doUy4MrobU1fhvRK9NMQeo5arbU4RPh5V9yXTVNhCQ2rL
 ovHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JXDx5Of53xKpwKzie292LEzpOCIt7HdxAp/TZojOC98=;
 b=V5ttX9lD2Pj28OVWunU60ov/cher5b9S1TCPv4R3mW7wBK5kfIH26Rnhy8mMB5iui3
 5l6sVxLcy6Zed0w3dEVgjXnDcJS043zyq0t45qqihwKCatPtRbBWymIMwXmasY1p68hu
 /Ook4PD2+Ww9P3abf34eq2Uyaf5/fQ7GfYw6PLNq19ciGgUl8ccD1C1Lcj3gr7JKp1Du
 WOOvr1JYZUL+A0i0Pg2CdQVNW6WM2052xleNfK4npUiZwKxZmEJKwkr9lMj3Njs1bDGS
 B5t0LyqI6omebOtpw+rG3I5L5uzt1ymY1xbd9EJIsZOZA7MIWKn8cWk+S91nUnrNRBc2
 vIpg==
X-Gm-Message-State: APjAAAWK9NlhCbzAUA1XgjI3axdkm6cXc7tlXCYuD2KrbpPpJ8cQtHxy
 oD0sbbiNW8wd5U9udGgkMg7pAA==
X-Google-Smtp-Source: APXvYqxBvlNYSLn6PRoeEXRuFeavrw3x9z3+yywP5RFfiMDYAfvzlGijWI2kL3fNFlbko9TEHruOVA==
X-Received: by 2002:a17:902:3341:: with SMTP id
 a59mr12892929plc.186.1561744677360; 
 Fri, 28 Jun 2019 10:57:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id c26sm2814912pfr.172.2019.06.28.10.57.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Jun 2019 10:57:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Subject: Re: [RFC/RFT v2 05/14] soc: amlogic: meson-clk-measure: protect
 measure with a mutex
In-Reply-To: <20190626090632.7540-6-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
 <20190626090632.7540-6-narmstrong@baylibre.com>
Date: Fri, 28 Jun 2019 10:57:56 -0700
Message-ID: <7hsgrtr3rv.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_105758_895346_1EF8C5C2 
X-CRM114-Status: UNSURE (   4.97  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> In order to protect clock measuring when multiple process asks for
> a mesure, protect the main measure function with mutexes.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
