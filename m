Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C7EC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:27:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B97E64F5C
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B97E64F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qFWpl+2ixThwf07AFQzQjCseuQNBtjkh7Y+ZdifWKno=; b=rjyZVlMiT+V0dsKT7UTYkGA6i
	+s8rcWKr6R1jkiD9vURLP0Jhw7IWUGFhzlDFUfKU5iMwivkx2F1JD3m2GgVWK3ozQPN5Qms5wpHcX
	DzCI7Py/lVbuo6ccRdfOXS5OJ4wF2I0hmu1diJ+BrYn208Ov/HKNiZX3yfZRvfvredwnUO3qe9HJk
	2KOZcZMZ+MyyibTF6q9+BYoDUfSgHp26GPm3W1dl3ogxTJkqRg81BMQkvKutCW8uoPNB9np4CLJ92
	1uTfl6lzyGUmZrjiyHERiAQtkSiyT3Eua1TJn6VIYPsE/Knu/Q6OGksaTC71BLjNgSBs2/pe1hXct
	Xhjnu/9Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7No4-0001Eh-DO; Wed, 03 Feb 2021 19:27:16 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Nnz-0001CT-DK
 for linux-amlogic@lists.infradead.org; Wed, 03 Feb 2021 19:27:12 +0000
Received: by mail-pj1-x1031.google.com with SMTP id s24so262775pjp.5
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Feb 2021 11:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bNbGmsRK7EtE+A+C+li0gY11J+UApuCknxlivtVnoCQ=;
 b=DWjb2bFxqmNAW/BlPcyRIq10tLyWin+KVH+audN+gSu1lquwWUwEWTEYYFO4Ajfl8+
 PLIed1ut3mA3JKPJh3T/xt4N8+olbCwku/bPb+hB1bczhc+8P+a87iwzvwM1lng+6dmi
 Cqgd8077QetOKepECmzQw9y0O1+q3TmjGes49HJ3Q6n/rkMJNvaKPl8QbQmQFsq/kP7A
 cueKGTRD7xwLRRmTNg7XZcEIBfk9rHsId5gDN/3f5JkgiEzdXnGU8Rd48HeF+3GLo236
 +HB6Vn5rFaV4Uh2PcpEyHB0yD8FP9fWIVb/yJfdAy16bXdsgsYlurViEcrjnGEpYwDtM
 1x7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bNbGmsRK7EtE+A+C+li0gY11J+UApuCknxlivtVnoCQ=;
 b=loZ7GqOFfWDApZB1mLNmY1bbjrkggvlPcwKGBHcqiovecSD6eZeE1Sfscib5Pxag/j
 Cf8eCl8qsdR5iJQIGdVHyPK3K/QGMvDW9mDLeKPSXuYxULctvkhRLM3uENqzT7nSs20b
 cfXmphgtdC2tRVNQ+PIP24XotdbpAPf2SJE9pxT3SAkmdSaHu0fpuslxv66Vcmjw5xBK
 nfELTnSwBONo4XpNUgVIMmYw+S8MpJSf2adMyDPErciE1bNYz3K4iOCmeNB8Xa3EI67i
 9//w3oKtkD2ZH38/otLp/4/8+FvB4ARcYrZaI73lTQIYqyVSNvuNWOsugrX9Dxz6bWuF
 MfiA==
X-Gm-Message-State: AOAM530f84LxwH+JqcbRbOquLpg5N7H+X5BFf1Z4R23LaWfbTULao7Ri
 JqqJ/TNIONEcDKibRZfFyr7DLQ==
X-Google-Smtp-Source: ABdhPJyCCy5Wn7Tedwh+xmpYfLj3gtMpYExYZcNb6JG6B51UNpF2Nvs/mNWe7tpbl5nRFMr5MskuYw==
X-Received: by 2002:a17:90a:f0c1:: with SMTP id
 fa1mr4549473pjb.3.1612380429127; 
 Wed, 03 Feb 2021 11:27:09 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id o14sm3865549pgr.44.2021.02.03.11.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:27:08 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/5] arm64: dts: meson: add support for ODROID-HC4
Date: Wed,  3 Feb 2021 11:27:07 -0800
Message-Id: <161238042310.26843.1778876341665074972.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202021021.11068-1-christianshewitt@gmail.com>
References: <20210202021021.11068-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_142711_542122_FA567400 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: Dongjin Kim <tobetter@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2 Feb 2021 02:10:16 +0000, Christian Hewitt wrote:
> This series fixes minor sort-order issues in the Amlogic bindings yaml and
> dtb Makefile, then converts the existing ODROID-C4 dts into dtsi so we can
> support its new sister product the ODROID-HC4.
> 
> I've also given the devices different audio card names. This is partly
> cosmetic, but also because HC4 is HDMI-only while C4 can be used with
> other i2c audio devices via an expansion connector so users may want to
> use different alsa configs.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: arm: amlogic: sort SM1 bindings
      commit: ad6d08d9e909be81c135355716590304e99543b7
[2/5] arm64: dts: meson: sort Amlogic dtb Makefile
      commit: fd88408951aef8c3e6e6a1dd2f0acf47b45182a2
[3/5] arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi
      commit: e329e6681d55e2ab9b3d033f3ee38f09e96f2f9c
[4/5] dt-bindings: arm: amlogic: add ODROID-HC4 bindings
      commit: 1429c7d223ed436f54e1c30efa7f87eb15d50b31
[5/5] arm64: dts: meson: add initial device-tree for ODROID-HC4
      commit: 9be09db3e2adf5843ec1e20771c598e70d2bd34a

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
