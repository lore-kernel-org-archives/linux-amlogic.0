Return-Path: <SRS0=Pv2c=KA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70EBC433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:26:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C7BA6044F
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C7BA6044F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O7a/pTonZ+DyjZHFWzjIwNLdBn9LLdBPGJE/q2gXxtg=; b=I9auk6bIqv3daM4BkDw18ylL+t
	kvGTQ4bysH/+Lo1zUpvvfMhyJcN0m19bZY26iYnhGVr0m6qYwfXX5vAB7dTyiPgbR6yw6D5B/hzai
	5E4GMenaCVWTZc+z9CeUACJ3evwnYRr0CoM01iWc++WnqL+CLZw892OS9hl1vVZwc9gXoaVm7CdCQ
	HLqoeaiMHcB5BZVpsjz9EKtKnaLghHWTs5Ojox/No08kM5aRLDdYI725sM/BjbjmFDuVXKgUdtuEV
	NKgGQqcLz1qIljHljoyW64PXV2uF9RB/h1yv9eT8KMCn9Y3iz8O34GOu8ooPyxnX2FrQyBuRWF65n
	6G1+oF3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leBvK-000Sb6-3A; Wed, 05 May 2021 07:26:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBvF-000Sa9-SJ
 for linux-amlogic@desiato.infradead.org; Wed, 05 May 2021 07:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=sSGB223I3PeBh3TG2RAuibwn3vbLRJONtkpynCow05g=; b=ymU/+L4bllu1OqFL87RO6mdotQ
 dVhGorKvrMK1q6sojL4ACSjWUG1kc1jM5VtkmaxYvzh6WGrFjJN14W3DwEYsdgzrdseZETMXYrw7b
 Lbr3deDoiH0PkO5VODvwnLHMUlsf0fngTMhB2v/j8nL5a/pbbwplgpBOLlb6+Q26c9FWEEG3izub2
 0BbFT9keiFEP5iZwDqBTSkK6eqd9ZlqTb9rMjxmB64EuHmu4fey+NqsIjWanJNDnfdhOb1WABg1lP
 I8L2ZdCFugPaItfn741a9jYwDLs/mCQNZQPWoe+9OUG/vHX6b+dSUVrt8wJrpLXKI0LpFhJevynWw
 xsf2831Q==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBvC-004Wro-J7
 for linux-amlogic@lists.infradead.org; Wed, 05 May 2021 07:26:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id m9so651061wrx.3
 for <linux-amlogic@lists.infradead.org>; Wed, 05 May 2021 00:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sSGB223I3PeBh3TG2RAuibwn3vbLRJONtkpynCow05g=;
 b=tNBsreuCJZemMha64jCuI97TnHZ0gwzRwx0zYrIb/M9JCEXaMBrNLQ7RxmV/PmWrbY
 HJoT2YoPVdEKNxcpCrk1VeJ0q5XVpBaRl0oNSqrmPy9aJajrmXRwxzcptYXNLBL22kg4
 kCI9rkOnmAKzVCFy0DAPO33h3iH53CX7AB+litwzli2VPeHS5m1OcNMogGiPj6w022RA
 E25OcZd9zZ4KiGk25bLrmRDXKvKPpwNFRI86GPn4Ff70sJHM29lmSjg7EFFDr/Ig830k
 tsKRqgMl3nZz5hbO9EZE4zKIvHL7NXpVXpMHGPUE/vvVs2FNzPMtmZmn3ndH27pIZCXU
 81RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sSGB223I3PeBh3TG2RAuibwn3vbLRJONtkpynCow05g=;
 b=VpVJgJiXatUooRtoAAgFS6kxKQShMLUDwn+cRJzPkHp+0yb1Hn2EiB0e6ALvA1G3At
 Llz5/io/Ce5iJKbw2O+08ydEhBXzLbq/QfI5WfFXM1+xa9h42o7AZ0ZMSPxITCualfxc
 sccl6KqrlY+qPFwtKxwvsBiAsUMLoWl8YfeDKEGmapJQMA6Bt+aj/elrKovv38siUieV
 jAHIPizkv+o0g+TMtg8lSRc5PcD7wUZAPAc045/7NSM+4SPIUxQR/UiacABfDI9cCeu0
 yeC5Hdpt3V7gWiwH/uHhfv8q7vDiVeJFMomwYpDpTxo3meCciVRB4kkOfizym0aTJ3MB
 NndQ==
X-Gm-Message-State: AOAM531y2uMz7purKzXZeHg7SJHczpj8xArlnhYYKio8z8/W+hkCrYCs
 0s5BfCZ316XYQjtF/BSEIq5qqQ==
X-Google-Smtp-Source: ABdhPJyABkwemPMKwQp9GLUEV/VZsbakg+LdwJTV16+JOgDc0yiICSRNDSpsAxOBJf+N1wu1PvwxEA==
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr18035799wrf.315.1620199572246; 
 Wed, 05 May 2021 00:26:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0])
 by smtp.gmail.com with ESMTPSA id
 f25sm19008991wrd.67.2021.05.05.00.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 00:26:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/2] ASoC: meson: g12a-toacodec: add support for SM1
Date: Wed,  5 May 2021 09:26:04 +0200
Message-Id: <20210505072607.3815442-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_002614_660928_A6DCA17E 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds Amlogic SM1 support on the TOACODEC driver, first by switching
to regmap fields for some bit fields to avoid code duplication, and then by adding
the corresponding bits & struct for the SM1 changed bits.

Changes since v1 at [1]:
- switch to regmap field

[1] https://lore.kernel.org/r/20210429170147.3615883-1-narmstrong@baylibre.com

Neil Armstrong (2):
  ASoC: meson: g12a-toacodec: use regmap fields to prepare SM1 support
  ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC

 sound/soc/meson/g12a-toacodec.c | 144 +++++++++++++++++++++++++++-----
 1 file changed, 125 insertions(+), 19 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
