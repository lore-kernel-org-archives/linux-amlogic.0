Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3587C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:14:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C55860F4E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C55860F4E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kY1PwmQGN0ecXgUBYK7563Jn7Z2trd/Jr4vwMn0HSDM=; b=HWuHiXXP9ljZy3
	O6c3GJh8Kxv2tMpBXnebSkAP7j8/PFr0DpLigzr9smyw7+G5mH/ENzA09fynC3qg4VkfGLMeeoXAl
	JnDzP+HzHnN5T8UYv2n9r9EqQtmRGZU5WBPfDDR+GNXOutGMp3EHPQm6eRAjnvKmzHJe6W2DF9bDl
	932HZpHRHoKI3/ZxXQzYTOn5jd0bGSaSDFy1qfhRRwfr7+VkM0GQ5BsYZXEyWMityY69axwiECOQs
	v7HWWHyl1mkfmFV72v7T5iuw/3b6KVtLcipKP4HVNJ5cxgmlFglTCVwpeNtwiEndfbWIAinjHZbOx
	CLyEn8hVN0DXxaba1VEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vkn-00A7jB-2A; Mon, 26 Jul 2021 08:14:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vjJ-00A79V-2Z
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 08:12:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id n21so4746928wmq.5
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pd0dKlBYHvLkVO2Zdl3GYa2e5hb4Ag5G614F6Ir3KS8=;
 b=yRKxCHGvx04XZB93foYYNe7JeZLlBdRECKOes+D8QtCHsA134aDyTRzbN1XAZtIzID
 R3QBhFan8+KewLzZuxRtKqyGPc//XpBp/ewU36YARCDqB7LzwZvvTaSbe+l61ZyuYn98
 UbVJBxtDro/ah6eSdIo8+qm+lLohQ96wxvvGQQ+viz+/CUEJe6yY29h7bWl0Jt9dqKoe
 ZqK0ovrSPFFcwORGo8JoXz2r2NNVE/6+uDq74iaK68uaPp38IOsqUP4l5Nz/urHUByyG
 vdIf/viF01NyhPEmdSL1Uh/+yQep83P5nXPLqx9atgkkA4fV/BAntDxJr7h2m9DPomjD
 x4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pd0dKlBYHvLkVO2Zdl3GYa2e5hb4Ag5G614F6Ir3KS8=;
 b=Gbt3R1Z6ATxeBV6m/swPLLubp/sVYTPUHDPkFbs30s7sDCw3fQvXVyITNc4xBOsyHS
 1j2EdmuwzTtyU44WhOrjuSSUiBFuztY/9uILJVOA+YgDmiMxTPoiDbDXIE3JiRlWZOeC
 Pn4BbW5+UJSuAtOFrOi/aUgU+Gz/WFp4761MGWePvNz7NWjcDe9kRueFw16K9AcB2Jtx
 pEd7rtsuWUsu3/B6ZXvIopR7QRXBFQdLtpevuD6nglg1JR/GfGoC44oOYjXt0KtSVG7F
 SlbjTjcXUBOuemFmd91iH0VdF6nUN5x+Cc9auz07ZxFy35BKJReeBnaAaTjUbAgoR4Si
 sxvA==
X-Gm-Message-State: AOAM532QqUCdXA9IDiV1lPMq1Q51rxAuhIUWS7AXIbNXR5wlwuaZFF2G
 VzuaEW68FN/NhD/CIPxO/3jxNXzfNBk9HqNM
X-Google-Smtp-Source: ABdhPJwrfl6rlxSgTjm42EmSfB6Tqb/I8WZ2O7ybCej0rK6/08EAGSHsuYV5OevD9Ebn3d6AggvlwA==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr25217721wmb.156.1627287171296; 
 Mon, 26 Jul 2021 01:12:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id c15sm646762wrx.70.2021.07.26.01.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:12:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com, Demetris Ierokipides <ierokipides.dem@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: meson8: Use a higher default GPU clock frequency
Date: Mon, 26 Jul 2021 10:12:39 +0200
Message-Id: <162728713307.14205.9620047585632922207.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210711214023.2163565-1-martin.blumenstingl@googlemail.com>
References: <20210711214023.2163565-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_011253_153724_9EB35D86 
X-CRM114-Status: GOOD (  11.13  )
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

Hi,

On Sun, 11 Jul 2021 23:40:23 +0200, Martin Blumenstingl wrote:
> We are seeing "imprecise external abort (0x1406)" errors during boot
> (which then cause the whole board to hang) on Meson8 (but not Meson8m2).
> These are observed while trying to access the GPU's registers when the
> MALI clock is running at it's default setting of 24MHz. The 3.10 vendor
> kernel uses 318.75MHz as "default" GPU frequency. Using that makes the
> "imprecise external aborts" go away.
> Add the assigned-clocks and assigned-clock-rates properties to also bump
> the MALI clock to 318.75MHz before accessing any of it's registers.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/1] ARM: dts: meson8: Use a higher default GPU clock frequency
      https://git.kernel.org/amlogic/c/44cf630bcb8c5ec78125805c9447dd5766792224

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
