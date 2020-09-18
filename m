Return-Path: <SRS0=O93K=C3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525F5C43463
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 20:40:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D294B21D7F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 20:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LKbiWUQC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C3FMMHry"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D294B21D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=whuV4ePyfOCRxdE+5mDHnCh7ds8lW9RQF6nYwTXZMJU=; b=LKbiWUQCCAxWoxECJUGJgQdV2
	tiwSxQ+1hxauEKl0KrChlg/oxsTGcncYUMh0PrgVLq5XO7m9DyAoDJxukw26RL2lhAVujjysHU0MU
	DnenAPOPO+fF53Q0+NQNFI3zUgh+YHytKDyVq99NWJbJoYmBJMk32VNSYwOJxzwe0PW4VY5QQ6lFy
	mLX03VU464P3ITOEm2E5Cj3HvCMjM3fk6T/cJccl8HOTmr6TctjzGFxIkiXCXu5FbMbP+Ulv7FJWa
	KYMvbwgypXcfBhn1lCnzXusdm66aCUYeUYGwbXdf0DfVPuveo/98zjtxwt+wUNV4RYz5mmHlcFpMI
	P9gEHZuHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJNAu-00010k-Nv; Fri, 18 Sep 2020 20:40:08 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJNAn-0000xq-Vo
 for linux-amlogic@lists.infradead.org; Fri, 18 Sep 2020 20:40:03 +0000
Received: by mail-pg1-x543.google.com with SMTP id 34so4133340pgo.13
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2020 13:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fmRn2g5BrFJHO9DbWyRy8DsUXY0bsMT/zVu/iCfx28=;
 b=C3FMMHryX4w/Eoq3d71K/IbeMCK+8a4DuC/vM88BYodyxLOnc+wAYGfIerEO8KBjf1
 f1RINcWhWEQDkAF+HvOzymCJYGNHb0o/zzYsHmp4bC90sa2uwRERZaU8MX+7Fz1OrYcW
 R6++RCw1ms3Pvbn84yh0bbtGol9/3oOh+gpvdt2pWI4x1D6qzDQfn2si/fdQSK1mEExe
 0uH0/xaOWG9/7bk2fm6SLGuD6EXcHK+mfiR24jq4N0ogdBjdZpdSw6VEQfmMYzKE8uYW
 9OZqQVZp9wo10gaj8cv2w1KAoWc+NJaWzlVR09lxmqx5yTlZsIQPI6qddvPw41SdBBsC
 JIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fmRn2g5BrFJHO9DbWyRy8DsUXY0bsMT/zVu/iCfx28=;
 b=h9Qy91wgm9ADUBeJNMXdcqJ5E9i7U46v8731R2VLfGBqPSD9WjI6wB4xaBzZx+GxjN
 MuAEwKh0Jvi6qtx9Uv6qfz7io/guZ2LcA5Cv5RxQxuwdSRYa0YY6mpdDoU7auoZ5Iri/
 ostVsq0Q1SC3vOOfsd3las80qA9UDIL9sl8tLzukFZztGkHsRe+jPIiS2Kk1VDugC+F7
 MY7uKfkuHGg4DZA3eE7P5bDybuuNUvVO4Yj9NwKTt6zZ6P1w5XpBOKAMPWqReNU/Lted
 xXlQKSZAdR7etvvfkmqrLas9ePuwpPSu1dXMcGoiTjCdt85oC/uFAGcIX+dT2RkwrbsL
 MV1A==
X-Gm-Message-State: AOAM530OAezoC4YSsPBbxb2d6gMVbFtfULoly6r4bqnFZDVeZFneIfp6
 L20tvpQvprOpDbTj2IAPnPaU7A==
X-Google-Smtp-Source: ABdhPJxf7pw4SsIj98qaw2E1WmIktjbeW77TUqAefjrsz31jaQx0Qwe98HQKFmjlYBU1hBtpf29vUg==
X-Received: by 2002:aa7:8249:0:b029:142:2501:39dd with SMTP id
 e9-20020aa782490000b0290142250139ddmr17389707pfn.44.1600461599016; 
 Fri, 18 Sep 2020 13:39:59 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j18sm3979209pgm.30.2020.09.18.13.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 13:39:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: meson: add support for ODROID-N2+
Date: Fri, 18 Sep 2020 13:39:56 -0700
Message-Id: <160046158476.39596.3643985967347076144.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915152432.30616-1-narmstrong@baylibre.com>
References: <20200915152432.30616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_164002_109478_7B69CB66 
X-CRM114-Status: GOOD (  13.57  )
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
Cc: linux-amlogic@lists.infradead.org, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tobetter@hardkernel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 17:24:29 +0200, Neil Armstrong wrote:
> This series splits the existing meson-g12b-odroid-n2.dts into a common
> dtsi and dts, and then adds new bindings and dts for the ODROID-N2+
> which uses an Amlogic S922X rev.C chip that Hardkernel supports with
> the same OPPs as the A311D.
> 
> Changes since v1 at [1]:
> - rebase on khilman's v5.10/dt64
> - get all review tags from v1
> - use the A311D OPPs, after review of Vendor kernel, the Rev, C uses the same OPPs (freq + voltage)
> 	as the A311D SoC of the same family
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: meson: convert ODROID-N2 to dtsi
      commit: ef599f5f3e10bf1979d8ece29fd7fa511fedd59d
[2/3] dt-bindings: arm: amlogic: add support for the ODROID-N2+
      commit: 88ba71cdc5497390350c87e68ce35688e88be3e8
[3/3] arm64: dts: meson: add support for the ODROID-N2+
      commit: 98d24896ee117b1f0969405476c943e9307e30d4

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
