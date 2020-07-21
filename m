Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBADC433E3
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:15:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C10E2072E
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:15:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Emk/FAbl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Qt3KHO5l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C10E2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRXWF5Ck12PQcbXiN0I/iGuoFsExG67neydnhPGHxtc=; b=Emk/FAblZDL3DDys3Xhr2hOoDZ
	ITw7qNfTAGGczTdze2VY72yNXCb+wwtZAmYIaojgdt+bDIxemcJUpe1k4HqQaq9O2BBk5sgz1ui8w
	c7OBwGXEOSYPtARrOMTgYtqzP8m9yukQxUtbbTachknS2+U/0VCGiML1MZHBppYi36GXv0Lh8rcPv
	6k6R0OtifPtn7OIPmU6eDR8zheAcHX5u5ftaW6CxCFxHCe64SfCjq+JTdaILw3qqAms3EAVwEBg+2
	VcE1jQgMSse5Cclvs7wERqyRmz8iMl92yAZAbDG5Sl9btaf1/Dav5gu9VgsaN/XuzsmFhtxNtKOIw
	5v1Uo97Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxzbK-0002Tl-BA; Tue, 21 Jul 2020 21:15:02 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxzb9-0002PM-DP
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 21:14:52 +0000
Received: by mail-pf1-x441.google.com with SMTP id 1so45529pfn.9
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 14:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oSUWq982rBlWRI7hOTohIn18y5KqsT4lbUPrCubS9rQ=;
 b=Qt3KHO5lvvUtQ8imVFOJ2VhAHOnvuWrMPARwSJIhErVMtjHNHMP5M58cIfz/ydEO3b
 N8xJ6iroaX2XUBw+nW75h1JxrT0xcFO4rM4GGxT7PAtvL8GWT+6Yac0aO1mgkDSn7+YX
 redNFf1wwK4hKomJtf+QYgF8/WFKRQFzX0RlPrYYMx9X1PdVztVvmiV38Zh2VpIw7NGy
 nREPu12wtWIThP59O6Tza0z4xgsHIsButqmIlRK7WclqPsQCRBL3SZYFc0Y++V59JbUb
 CUQEx5/xboqbc242yoVwbC6nDqv0hBljzLPz9BcwTSKLY/G+4AhD62tWPRwhPfYGFONa
 hKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oSUWq982rBlWRI7hOTohIn18y5KqsT4lbUPrCubS9rQ=;
 b=PiFfkHrtKs3bxc0G69IpKW5P1hr/1WL0ISf8hUkILvFJUnrO4n8gEswmoOjt2Uxvnx
 +7xlFYukmQNKvQwpvQNacGRDehxnldcOwK3qrqRKCINL98ZwzxtDMcimeGVHH8gJDgNj
 pCAKpIOWlya6NGHHU0cLyAK/OlP29fP/p0hNV4Vyid5C6fai4CopSW3jfqVXd3KZHQNH
 8FkSqr0Ds5aiOEHqR4J6ruXbcOcrmN8SRGLQ6YkvA48iw7Ow8v/FlXRkuOgOHAwom9us
 0wBCDoCV1vh6VQh+ohBJBGh9GqsLCwvNLwtuTcrhJ2ogoyddYh7lkJbCV+KiuxS5ugRq
 EdtQ==
X-Gm-Message-State: AOAM533GHqWxMw+36uLKCzWoAHrDeU6oIa19RfyrcLF0E1TOxNMHbOGR
 dykfOk1FPIxmgGrNZFbp15VEcFrr3PHoPg==
X-Google-Smtp-Source: ABdhPJyQntzppnYI6sfe3fXSIfegwAdBnN0ZD8OF2gPFZ9fMv/PTK9G75ha/vG9as5mIrSCMEF0NMg==
X-Received: by 2002:a62:2b85:: with SMTP id
 r127mr24357616pfr.239.1595366089357; 
 Tue, 21 Jul 2020 14:14:49 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id cv7sm3966952pjb.9.2020.07.21.14.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 14:14:48 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: meson: update spifc node name on Khadas
 VIM3/VIM3L
Date: Tue, 21 Jul 2020 14:14:44 -0700
Message-Id: <159536607959.30777.2083924894013034325.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200718054505.4165-1-christianshewitt@gmail.com>
References: <20200718054505.4165-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_171451_477021_597071F4 
X-CRM114-Status: UNSURE (   7.28  )
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

On Sat, 18 Jul 2020 05:45:05 +0000, Christian Hewitt wrote:
> The VIM3/VIM3L Boards use w25q128 not w25q32 - this is a cosmetic change
> only - the device probes fine with the current device-tree.

Applied, thanks!

[1/1] arm64: dts: meson: update spifc node name on Khadas VIM3/VIM3L
      commit: d57c69ca6d4ab890e8edac5c8e10c7c2b54d500c

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
