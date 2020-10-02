Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CE7C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:51:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43D95206CA
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQIXPHU+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PVw+/hJh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43D95206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByziT0a3+UuXp+jafHTjR3J7z9umOWPaTQksFyS4J3c=; b=nQIXPHU+DwC5ekh0msNpKUyNzn
	9aSsBbxwReTprDD1uB+yf+zBwYsVQvQ91x/K2/eG2mdifgyVYRgoU4F4Aw1ITN2ricoZL6LXTzaSN
	4viGaULFmQlibS4XtkzN8amR2rF9lE9BqVbLqU/IY3jOC2QT+xQCTwHYcx32zzWCLzOdhs7QNHIQ6
	ayt5JcZIaBoHWEPz2L6Hxa7kRptGne/7hggEhjPgkrM+ncDgmCy9QaOwJD809zP0ooXuo8xxwRfBh
	A4iPbxSp+1uCEY4A/ZbzDu9WQfqyy7c+MYb6HB+T1BH46UJWFg42GYz6s4+BDzM0ERFAOiGY9Nm4D
	xreMzJeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOQ9e-0004xi-GX; Fri, 02 Oct 2020 18:51:42 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOQ9b-0004w6-J8
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 18:51:40 +0000
Received: by mail-pj1-x1042.google.com with SMTP id x2so1353591pjk.0
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 11:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tUSYbGADt5zWhR4KyAct6QpTK0aisoUtA8b6yIqd5d8=;
 b=PVw+/hJhJzDBxSG+wde89r2aB1QxeJFWovzl5+HCfyu5Fbvf0dGxyoEtDBeG0kNMKP
 ljpsPY0KyCH83vK5RhmvWY59XTM3YGaUX2AfcdMWpbA4Qny3qaYt3TPdawmC7Dzn9M6c
 NzcUbBVfoxXJfsP1/vrjbM0VvtTz6AaLiFwkaQS5GDMG7uZzb+DNmcycEmBVJfIzR8f5
 Stt5mT41A6622bWseMJtVyPmrY1dKRUy3djJLRcjao8VvM8lAEpqnkHFV/+Mv73FTVMU
 5E0Jv3ilY+9PSZiNfNcgw5GISeyKStAO5STNwu1LCt1hkV5uBgA0HPl4+1ClrztOkwsV
 Vhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUSYbGADt5zWhR4KyAct6QpTK0aisoUtA8b6yIqd5d8=;
 b=jI1xt6kBxVKK3LAQvQvmYcA4rrz/3P4/ZWnVcrXgyGBgIopk9VySo4+TmcvuamNYt1
 N99eWnSqbcA5xJUUjHT8knjJFOkg6N9JI+CIY9yLrc/JPtEl+mMoBRY07sI/zjWgf9XA
 Z0BpnA8eiuCDACdcNnINtNr9opAK7BjtwsJdGpzOm9eDmTBGFhksFmH35h+1GpoHKsC5
 LYmvfzgMQaJmreTtK9fOhyzKbsiLHbFQnAqV0u9NfipJ/mic7kkAD/S5ihK/ZA6+8www
 Dz6xLEUyS9DFuzA+pwrz0o0N+crTJOpddXB93Ou6zruaIwrhwnva2tAOdh26vCDyeciZ
 SlSg==
X-Gm-Message-State: AOAM531ZMzz9MGOo+vfoOgaU1DEPVG3NsogW8k58oUYiUyyy6ewvN4F4
 Vqna6mJHUwZzNHkRJLPIf/IInLGiUEpvRLfs
X-Google-Smtp-Source: ABdhPJzUoHAc8JF6EJT4u/l5KCL4oF1JeRj5BESUn4xpNOLVZmmAS6ACGMC7bCzaWlMLkRwbEgf34Q==
X-Received: by 2002:a17:90b:4b0c:: with SMTP id
 lx12mr4166212pjb.125.1601664697165; 
 Fri, 02 Oct 2020 11:51:37 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id r4sm2261674pjf.4.2020.10.02.11.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:51:36 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: meson: add SM1 soundcard name to VIM3L
Date: Fri,  2 Oct 2020 11:51:34 -0700
Message-Id: <160166469102.35184.15775273206707708270.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002141619.14387-1-christianshewitt@gmail.com>
References: <20201002141619.14387-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_145139_642321_54AC8359 
X-CRM114-Status: UNSURE (   9.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2 Oct 2020 14:16:19 +0000, Christian Hewitt wrote:
> VIM3L now inherits the sound node from the VIM3 common dtsi but is
> an SM1 device, so label it as such, and stop users blaming future
> support issues on the distro/app "wrongly detecting" their device.

Applied, thanks!

[1/1] arm64: dts: meson: add SM1 soundcard name to VIM3L
      commit: 0fe4c285ef8bd0475da7e288c844cb55fc850970

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
