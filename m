Return-Path: <SRS0=y4a2=EP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD5AC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2020 23:24:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4342B206ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2020 23:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qah5s2Dx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YUqFSFao"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4342B206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=717jlC7jCAd/3l6QtPBUvKIqJ4mZLGxEQogduk46D6U=; b=qah5s2Dx1ONvkKEYJCA7E7kV/
	jdiNJzvaoiL+D4HwlZL3RCX+WT+ICIFqEnO6aWtkonsV3g0LkF2Hl79FgJzqMrsYVbsG+VDYxZ/UM
	FBIhHSQv3Ml2b60w9vJr6OQBBwd3LvSx/sQO6Tw3TpTZYygacR6Hg75nJP/m69+/60Be3QNpWOoi8
	v9kYkWSwzTltUunSnmG+qEGHRu1I/nmdrSRR8Mb0ZfA52rSj5KyLfJTcJNWalR/vEZN21qZBOwVb2
	8/o5jthHMnSoznIl/99MLgg5K1NkhrZBqO8GUyHjGfLA/ycAU5zWosi1sriJydETZsrSQXb46oJHk
	udZmJ7bRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcGVo-0005aU-L0; Mon, 09 Nov 2020 23:23:48 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcGVl-0005ZT-9Q
 for linux-amlogic@lists.infradead.org; Mon, 09 Nov 2020 23:23:46 +0000
Received: by mail-pg1-x542.google.com with SMTP id e21so8459785pgr.11
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2020 15:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pSI6Hxh+VGHB4fhlPl5YbxM+ykFtkRO9Um5a1XP/b8k=;
 b=YUqFSFaoqWcW7XjBcNuHScwn+EC4flNhnYXz8URi1t85iGaWAZkbWknRMhOwyuVK9x
 F1n/7KXocrwJBUjodDuZxMOcZTbhilJUlKJ6iBMXq3BZvxS1wUMxOUCQUDP/7NIQfrUY
 9nV7VMU1OTKBtz2uG/Qz4PRLo0wxd+YTnEsEUp4ObHjYqDfqZAcEqVu0A0zt2Ury+d/9
 mLw47nmrosV3MnFxpuQ+uN1Ot2KpWRFQ2cAF2hrbgAyeNmLp1s1TcojIevfo9g4BvI9S
 xgTIMVvHiyQCu6PQGjdfdD7ypawJQMcW5Xc3lhwxalWTUkulzvxItImsiXeb5AEhuaRi
 G8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pSI6Hxh+VGHB4fhlPl5YbxM+ykFtkRO9Um5a1XP/b8k=;
 b=XVfvu1z71Fb8oICEQMCoZ4ERK2dN02Ggx1GHxQoPqfMBZZAvHBIvg8Hdj7Dkx0FZX8
 RxwRoUlf1LxKBqINlzrLQOZltGiDd9WnQf4RCNdGoLl3tHdvHNLlkzfS/nT8vMpki1Vr
 lgjFptdTP9RDXhvh/jtOMA2T1ZSnXQu1NZ1rYX1VhrGsXwaLXL1JJ42TBq70z6MiQZEQ
 NLOH1EyPI9ZXEgo4PhaJ45OvEeOu/3lRvweYc7bQ9BEQTmKG01rOPy3fDbftG5QQwEK7
 RDjUr/QXxELKlWEMEM7dyIgJ3G96AXXEH9EyBZbGr6GiGKNFHq8K2qXqJ0zwBjFPCfaP
 Y9yw==
X-Gm-Message-State: AOAM532XGVIBkEh5BHqWkNnG0aoDS2+ixRZ/8axgQD4pICVNhQ6/NoXy
 8eJmgpoyH5P6vqFZ/899EkYi6xgyzscERdm18iw=
X-Google-Smtp-Source: ABdhPJwHmgicboxydybrqq+qVuzqbGMjM2UgCfdmY1g7veBRUUzzMpiV4ifMhY7XmcNco3ZD05ORmw==
X-Received: by 2002:a17:90a:a58e:: with SMTP id
 b14mr1558289pjq.203.1604964221546; 
 Mon, 09 Nov 2020 15:23:41 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j19sm9886398pfd.189.2020.11.09.15.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 15:23:40 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: meson: ship only the necessary clock controllers
Date: Mon,  9 Nov 2020 15:23:40 -0800
Message-Id: <160496421227.17768.3544175809651783421.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020075034.172825-1-jbrunet@baylibre.com>
References: <20201020075034.172825-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_182345_385298_40DA9B6D 
X-CRM114-Status: GOOD (  10.07  )
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

On Tue, 20 Oct 2020 09:50:34 +0200, Jerome Brunet wrote:
> There now the menu entries for the amlogic clock controllers.
> Do not select these when ARM64 is enabled so it possible to ship only the
> required.

Applied, thanks!

[1/1] arm64: meson: ship only the necessary clock controllers
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
