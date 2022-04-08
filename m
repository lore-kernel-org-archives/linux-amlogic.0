Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AF8C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 07:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQBzyvZR7siV/fXniZjRNLrVafyqog5Ij6pOwQ1P7pk=; b=LOeVgmkk7jAmjZ
	861/BZweF+hQgYHjYH+ViVESHG/CB2+MQ7d1znIslafZLW5NsaQ377wryi2aJ1V6Cqjkg1cMjAf11
	9e+874mr7seM5ptmOg91OjuXuHNwXlhsbB9jGYOuzZihy5In/fVqfwL70HFApBQbI0ebEnJ8L6G6W
	Ew1EjAzAos5U1MK3nr+49fWS7PUtecDJpx8ZQpiyB9zbJpD1iNtMqXoGtrzWIdzUBv2s/2WHXpDhG
	uRuP2Yb93b9hrqq4/uQ+JHIDBxzgY4OfXVLlkia9YR+xf1CBzO9i5Rn0Xnr6BDCFRcwy7hX4UoYwb
	6hhXBHTiklLgDOhQi/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjBd-00FZtt-9H; Fri, 08 Apr 2022 07:37:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjBU-00FZpp-GF
 for linux-amlogic@lists.infradead.org; Fri, 08 Apr 2022 07:37:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso4987504wme.2
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Apr 2022 00:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRSJ43BNMFoLLCxjT9gcbTjLoqoj9s2ngsROXDxCAvA=;
 b=VoLcKWHU9xcw9WIQojtWE8XKvVdLU66uArMAHRaKmNyLlLM/y/GlfENofBcET1ILPl
 csR04lcUwqrAO97+DgcwTLkEOZNZUNaj5pxIRkjQRgOqHTb0Scc/wuP5LW1noYBBOAIq
 oTA2wv167p+s/gAJ57KJ/4fVnUd75q/l8jrdpsfLfrtZALv9uIuKmiWDpEij8LjyfYRa
 tCeiO3DdZ1jMy2HsjIlKAWEyVHdw9aNAV19AP3W3c2HLlPfxDgiAqKxtgRRKE0sGy6rk
 mbEElUNm4bxvDGOb2sOeiseVfLFs2blEfyVJRcMopo96BqpNsYgObuRtw6zM7x+gqix3
 /VmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRSJ43BNMFoLLCxjT9gcbTjLoqoj9s2ngsROXDxCAvA=;
 b=TJQMkAWFeC3cf/vsCaTc4pwmn+0iVy4Zz1knMCrx2qiEQLVw26T2rQaD4HvXTiY8vl
 ZbwnmK6NHTOXnkZaT2X21o9kJzGH86ZXCMlpTLAL4S49/hB8Bx7vSljQaXaBqqJAyCek
 JOMve1Hlb0jqvYFnHf2TMjA76qbJq4cBptlfpyMlAHMcgAMLVejhOhN0JO+FofbDfpby
 4xigUU5LRS+DQgQaOfSK5fWXIKtwKcRYKYAJMXi/5d3sGLFI5NA1N/jRJ3x/Ov9uofRi
 ODVeobuQZs6aKOxXaWQi4DcWtPxNYt19YpSTubWR2bVMdyp2e9IOL6glO1uQEo+8frvR
 D2sQ==
X-Gm-Message-State: AOAM530TAPKqiJcV3oZsfpRAOn84GDGznQso8j2zqWI0l34MydSZJTqh
 536dsGmbhBNu3+9/Lkk66/fb6w==
X-Google-Smtp-Source: ABdhPJz/4n4HPVlMMr3wTVeVUa7yREH8UY7gY3cf3RjQezwi3pTGIPat9rzAIy3N9vMZ5wWmX3NpRA==
X-Received: by 2002:a7b:cbc1:0:b0:38e:7c42:fe38 with SMTP id
 n1-20020a7bcbc1000000b0038e7c42fe38mr16265481wmi.51.1649403447084; 
 Fri, 08 Apr 2022 00:37:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a5d5849000000b002058631cfacsm19415843wrf.61.2022.04.08.00.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 00:37:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: remove cpu compatible "arm,armv8" for s4
Date: Fri,  8 Apr 2022 09:37:24 +0200
Message-Id: <164940343247.3642438.12121363573951062044.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408070901.26446-1-xianwei.zhao@amlogic.com>
References: <20220408070901.26446-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_003732_553025_91E1A47A 
X-CRM114-Status: UNSURE (   8.37  )
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

Hi,

On Fri, 8 Apr 2022 15:09:01 +0800, Xianwei Zhao wrote:
> Amlogic s4 device is already applied, but cpu compatible 'arm,armv8'
> is only valid for software models, so we remove it.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.18/fixes)

[1/1] arm64: dts: remove cpu compatible "arm,armv8" for s4
      https://git.kernel.org/amlogic/c/9af9c58a099b57b818b15eca1e50cef1d222406e

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
