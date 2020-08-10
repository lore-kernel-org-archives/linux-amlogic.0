Return-Path: <SRS0=TX8f=BU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B31BC433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2020 22:18:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D35206E9
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2020 22:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ba6ObD1c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q7MSp+6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3D35206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SYxA+4G+k80cDJPvVbPIZyfLIE6tz5frKEz36yuRYY4=; b=Ba6ObD1cz3ZPMJm/7sxEWZRBi
	lG3Ig/XMwnkQ9ONfveZuddpz19JokKzFtfQ1sTp7UQSdHfrrWpWrDscFvIrhuDMy60BcK/JJVsur6
	Gl+6wu3UE4+8ryqTRn7ixKgsNqFsLnod11cs/5bA+m56vji+AixYxpPNWvn9J0s3+cxVzYFIUccw0
	63eIQJpyE82lnIfeMW7zekQSxPN8IFCs06jYb/3rXhleRG/YhgOQ05XElOnFChwNLkmn1B1issHYY
	zFBGpWe2m6Aw9kGw/pQgx2yvsQjfPmf3VKsuoqayvxi26rZSg6Dd8IrnLcvmrodQXePJOz+bKL+FB
	dsu9+yjCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5G7M-0001KQ-6d; Mon, 10 Aug 2020 22:18:08 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5G7J-0001Ir-75
 for linux-amlogic@lists.infradead.org; Mon, 10 Aug 2020 22:18:06 +0000
Received: by mail-pj1-x1041.google.com with SMTP id ha11so819068pjb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Aug 2020 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBIQCcYBYKE0CK0O3JpZQF/aDW336DAnKM6R6BbGj7s=;
 b=Q7MSp+6ZeJHNiLkPjUGr27POOQJapymBm+bWfnrg7JjPU2IOhuG0rjzJcgwrsnCZf3
 o7kRE3EtutAIoom++pDXYgEYbAVTHvEyyn5iZE0qpifrLum2nytjCPfGafkpr4PbKYMQ
 ET/ILf4IJcGITVrOeX/FDpL5yRVQ+q5n3YBHvwSoeWBVXyspmmizhpw0BIg6Kbr244es
 4L9fzG2DiJaVNQcS42UsP7ZFm3meuelftPbhw8Fk1HkxIXdGcU4Fx+mwaX/OhMdxoK8s
 0QgsZI3jOolUvzXWqpQLFXcMDDAVnfWs9LWtuagyzEL3NqIv6VFeEQhjR7ZjuUDMEFVn
 VRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBIQCcYBYKE0CK0O3JpZQF/aDW336DAnKM6R6BbGj7s=;
 b=cYz+aaq0K0sCBdTrg2fxYDNcuQxfiX+lIXNWzixBBW7WJZ9z6DdZ0Q1uignPQk0qUH
 8VacpPzwISdOPXDxd3Yb79j/OlzHywG0xRo6AArN3tdWawjMC1dRuk+nsXSKjauYUSGO
 j/6IzMJlNTRtAD5cvQg2wJVOL3OGCCOrrSahyPy2fJuwr5KOgyeyllJX2vrJXua5lrLJ
 unAl4VlhtcJZwpWLdsHxtEAJ0W+ZjtQUAtwJBoqjdI4x8CQqdNvTF8GgLb2n/T+5jHve
 /+iHhsR00TpLGycux7UNvO7iRZvKbLOJ7u84E+AIlDR73fXt1sqlr10CrLWj9tgpXbJZ
 HVQw==
X-Gm-Message-State: AOAM530/4OQ7oSTEdtbLhIB0DVcf7cYtAfkMOA+S5vH4k9tL+XAZrN6w
 QDnyoVyEqWKOQW8uamXeNWcMQQ==
X-Google-Smtp-Source: ABdhPJwsV7V0NSLQKQ7xjhZ4JJpUKz4dZj+ie2tUgdeIEyL7BWjueK/+zdWZ27iCa1NMdqyQ4rhkcQ==
X-Received: by 2002:a17:902:ac82:: with SMTP id
 h2mr26126281plr.300.1597097881464; 
 Mon, 10 Aug 2020 15:18:01 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 63sm22311820pfu.196.2020.08.10.15.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 15:18:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: odroid-n2: update sound card
Date: Mon, 10 Aug 2020 15:17:58 -0700
Message-Id: <159709786936.10576.16096406991867503196.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701094556.194498-1-jbrunet@baylibre.com>
References: <20200701094556.194498-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_181805_264953_F7FC1D37 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 1 Jul 2020 11:45:54 +0200, Jerome Brunet wrote:
> This patchset adds the support for the TDM loopback and audio on the jack
> output using the internal codec.
> 
> Jerome Brunet (2):
>   arm64: dts: meson: odroid-n2: enable audio loopback
>   arm64: dts: meson: odroid-n2: add jack audio output support
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: meson: odroid-n2: enable audio loopback
      (no commit info)
[2/2] arm64: dts: meson: odroid-n2: add jack audio output support
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
