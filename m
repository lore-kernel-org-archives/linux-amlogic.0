Return-Path: <SRS0=Ru2C=7D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8783C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2020 21:39:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 810F9204EA
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2020 21:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BktTyBAU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YBG4QKyu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 810F9204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:To:From:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0eynEjAJYv7tvscFZj+9c4JTzjvAH3eE3R4zJ8Ne6kc=; b=Bkt
	TyBAUEd7WOOlOFrcfN9bk50GyILFYfybQSGBiSBtGJBZ2NkulbS+aKWVTX4HXB/G/TK+yiPCwcBVN
	Z2QWtQ99W/34sxdPSxBQsOnTb+a+Qed02ImKdKGeG1GqPuRM1/CmNhnIhycsTALy8HzRzG1XsXMpF
	tXA/uGeuE6pOGFwl05GJBbTRIRQmvePLJzhjtB2G0ZgpFkoLIsLAl7C6Kx2lFCxEBRA/H3rkd/gBj
	skZ97DPmUfVKZEwoEf7NMmmjG8BT/yQz/7PGh0omEypo1nMBKTLMd1DmVe+SkI0Te/83HfiBARoZA
	7jUno+q1MgGr48QPOBGEhk42+fXgc6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbsuC-0005mo-F3; Thu, 21 May 2020 21:39:08 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbsu9-0005jE-4f
 for linux-amlogic@lists.infradead.org; Thu, 21 May 2020 21:39:07 +0000
Received: by mail-pf1-x444.google.com with SMTP id x13so4088453pfn.11
 for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2020 14:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:to:cc:subject;
 bh=YS06TYXbnNyg5eqC9j5pAB5NNZGlsEdzKu+N3IhG1qE=;
 b=YBG4QKyudc9Cb6TAd84xHdhLiWkzteUpeQIK7uGB5nLP7iGJXJbF0yroONadM1Sm29
 8Y34X6CDUCVfMRWRF205BUCGdHwwZXc4VDR9JqHa/YtzhyMdo7rGz9/kUDrlFZPF5D+o
 m2muXRDZZoZhiUENVoDRv4gxB2YtaeyNOC4CuLcu5xQ/gYF+l3cWGMETF3chYUcwaWcX
 3HwUUzOMmKogN/NUFhQ2qLO7s6ceC3wH0JBInadHplzO+CUTahZXb6bNgdMzypZ13m8x
 huGFTSyonRQPshPkaX/NxYk5PIRqpjkEQnXwLoK1KLr8/o0UYJ3DEIpwo58XWmrMfHli
 C12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:cc:subject;
 bh=YS06TYXbnNyg5eqC9j5pAB5NNZGlsEdzKu+N3IhG1qE=;
 b=uSJNEharJLETekDtISDVLRANyv4ofh7zWuXS64lgNTwHzXOKoDP7ox2rYY+th0oUNY
 C04AgE+6h0BuoEMkecKZwfPYBbJC0D6L7M62DzPBnkHf+aR64iWEgSjDYI8JhmQ/sjIi
 JU3Y6ZQ5nQJnuBAQtqyz8GKGJekDwMdYdFXBqpVLe6/2bEUzd9izsU7BEsT91sFbwFxg
 P9iBB0SQUyDuK1I3aOJb5SSDElGMziGg7jUto+ik8qgAPIMid8qRaYgOx23wZ3UTQ5rd
 RSw1PhArELrJi3HjuBRL7vLNOg4ds4kAwrFw9BfXMXGjZ4i67G5uUcWJ8oLP7eGyzAzO
 W6Xw==
X-Gm-Message-State: AOAM530oPWAgvLyhxSVr1r0kGWccAAzrNOaGamqg9V+KHpFhIDnvtNgC
 l9kW7lEIftQjil7e7iM96sm1DA==
X-Google-Smtp-Source: ABdhPJzBGlvUSK12qblOTddjYFaTYFPNB1B9FYx3SaLPgKldfb3mFVxbTRVb0FsY58KwCvjBd64H9w==
X-Received: by 2002:a62:3441:: with SMTP id b62mr672687pfa.225.1590097142895; 
 Thu, 21 May 2020 14:39:02 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id f6sm5407230pfn.189.2020.05.21.14.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 14:39:02 -0700 (PDT)
Message-ID: <5ec6f4f6.1c69fb81.3fe34.b693@mx.google.com>
Date: Thu, 21 May 2020 14:39:01 -0700
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL 1/4] arm64: defconfig: Amlogic updates for v5.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_143905_197365_993167BE 
X-CRM114-Status: UNSURE (   6.67  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-defconfig

for you to fetch changes up to 38f58fc51d12b25f9aab9afa2e6f58227c950d9e:

  arm64: defconfig: enable meson gx audio as module (2020-04-30 07:53:22 -0700)

----------------------------------------------------------------
arm64: defconfig: Amlogic updates for v5.8
- enable meson gx audio as module

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: defconfig: enable meson gx audio as module

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
