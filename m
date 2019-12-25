Return-Path: <SRS0=1Qmn=2P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDE9C2D0D5
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 01:06:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FE920722
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 01:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQvuacTA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iP6JNjcS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FE920722
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G0IXB8xawYEorer0wPR4YuNoORRofeJofevSG5V0tEg=; b=mQvuacTAG9fiJN
	3zroaq5R8PYwEn6yt3mputMrgliX8j0v6y0iavfg9BdyIsUnt04KQXe+Vd5xrjBOlwlCrEC5FFf1m
	3OTNVoY4Gl6CLKv06xjJptW4Faovg1cHJ2GpLREi53TONn5cU4frMNG3aiNg6Y9j12gzgXOgHXIyP
	dyeiLTszz5YNt25xD4j9Fx0HvTav8J6vOAq3DI5nR+5fUv1TCdHWQJHqCbP8MTwOGZgWnBRGfSjod
	0fBVrpc2fZjL0LLltutqjRywkDtQBdkiUxFU/qkL244Zd5bVhl7kKrsTQEu8u7ACUgxm049NFPPCD
	iRfanrU2jVLgDCluIbSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijv86-0000f5-TK; Wed, 25 Dec 2019 01:06:26 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijv84-0000d4-8c; Wed, 25 Dec 2019 01:06:25 +0000
Received: by mail-wr1-x444.google.com with SMTP id z3so20943258wru.3;
 Tue, 24 Dec 2019 17:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0zGgacboR5FhlzsxMkhuulP1I0LChnVXb7P5KAUVsko=;
 b=iP6JNjcSn31FVQziFhKwwn2t3pTM8vlWUCrShoH9MJDAosBuj/KiNcx1vf8pNd7wG1
 QiUxrKh3iwhUIH6nxH7XcE6FTRE59SZ8Uh+YbeNnrA6Z+4rCnwLCTDLGEWoCVZkAIp62
 2VETkvDcNXpOXHVy1up2KVfXT1yUd/sZ+zP0J+IUwQs9cjKU5qqrl2QMc3WjmBJ1Aikd
 JiKP+gnqh92wDKBbtPe1qYG10udAupF0c9k+brOD5G/9QDFM7kTSusxXXnfeY4uSm3z1
 pFJfY6XJbgTTqIDcJqgpGuPKmdIK/PjWoTKRXfQVyZmV1ncdO/qyRLGUwtcyLnwiCUQG
 iWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0zGgacboR5FhlzsxMkhuulP1I0LChnVXb7P5KAUVsko=;
 b=fo1qjEMuwfbpDk5Qr9a6sm562FuCkC9EHXZoNLzS3Ga8zruScsZfbY411XRogOUT90
 +jdVCWw2fCaSYHuNeJAyihTzlTxrLb6XHjyUzjKp38uSW2MVmQJVrUmBRq7oLCjoWMgy
 bQOY3ZNeJAvmV5z+wArateDaPlPdOjjSSKo8yeo/Ue2AugRJ5rHqxnDqzphxdjYN6CWG
 CeU+PrkMH3lydXozIUrsRVZwOzcNRN6b5PZbYfUfmLeEmvkL1QHA/4uSpE2R+YuIl7p6
 nJ4gZ0Z9Pvty405abyXrLaM50tEureODc5y0IeWfIw3lol2hjxASoARgjLAeZ1Tx5pXy
 BfWQ==
X-Gm-Message-State: APjAAAW8db7zzOtBJSfJJjSslYSjPXk2HTUiohRne8Ig+2QMaXc+2jY2
 5m3+TukP1mo0zbMJZiF9vki5lCLd
X-Google-Smtp-Source: APXvYqysmD2sVl/eNjmOaZfVfpZd4euoYnmvq2Vt7G/i+H8BAtX7T/Qi2791EsGXTyiaakkZJM8clA==
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr36188586wrw.327.1577235981614; 
 Tue, 24 Dec 2019 17:06:21 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id x26sm4066127wmc.30.2019.12.24.17.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2019 17:06:20 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/3] ARM: dts: meson: fixes for GPU DVFS
Date: Wed, 25 Dec 2019 02:06:04 +0100
Message-Id: <20191225010607.1504239-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_170624_332817_F7AC5D78 
X-CRM114-Status: GOOD (  12.33  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While testing my patch to add DVFS support to the lima driver [0] I
found one bug and two inconveniences with the GPU clocks in the
Meson8 and Meson8b .dts:
- the first patch is an actual fix so the two mali GPU clock trees can
  actually be used on Meson8b
- patch two and three are to prevent confusion when comparing the
  frequencies from the .dts with the actual ones on the system

Neither of these patches are critical, so I based them on top of
v5.6/dt (meaning they target Linux 5.6, not v5.5/fixes).


[0] https://patchwork.kernel.org/patch/11293193/


Martin Blumenstingl (3):
  ARM: dts: meson8b: fix the clock controller compatible string
  ARM: dts: meson8: use the actual frequency for the GPU's 182.1MHz OPP
  ARM: dts: meson8b: use the actual frequency for the GPU's 364MHz OPP

 arch/arm/boot/dts/meson8.dtsi  | 4 ++--
 arch/arm/boot/dts/meson8b.dtsi | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
