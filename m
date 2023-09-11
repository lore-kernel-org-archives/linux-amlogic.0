Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E032EE7FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjrdtdYuN8qHtYBjeRETNWuq+cxF49hmuShR/o1KKL0=; b=RHAKj4RcvELQZQ
	pRcxfgLGCt6qkriW1/E7RZBPu3FL2Di251S+W/zAKTuWWWI79A6H/QPuwOhsQ/QAlaq5lN3qWkTMj
	yNgMvbWiDi/6cJ9EB/GnVXpkbemIIdcbYxz/g51SUuCyP4dGq9IdKE+b5Yzz0YHauVE10pfKik4+o
	KU/D9oWl7vsPB408kapUgXlSqPhtqUc+b0FjQx2wS0/gtc6TjWkU6bWlHeCQuEAs155stbdRXfPnQ
	VHbTsaRV21z3Qcu4q6BoT3io5er3DfZKOmmfrK93Y5oSBQb02lHpVX/4IDMAqJAoaQAeeC5XENAlq
	Yi6XeYlP8NDVsUUikX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiXX-000pYy-1G;
	Mon, 11 Sep 2023 15:09:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiXU-000pVO-1H
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:09:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31f615afa52so4805157f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694444961; x=1695049761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYXngHOzN75PoywV4+ppenCMkO0BtlnfambIk5nvgf0=;
        b=AWwcT4zP0Aeh084kT6R0gjLxsgslIN8kW//E0dC6+FkptvFG22mKzUCWV0MG3O8UpX
         h5vyQjdv9xej5OVtSBt1VRwxoRwEvYsEEjnUygmNDx4eAhzasIXAuLng/KCoJeImRKbz
         CnXCvIjDpm1s+UjEN6lrdIolOd1Rwp8oBCdzaVnl58GBjFjxSgFGupX1huBL483979ON
         7bKuO0qUoX4GvH5Koncb+IdQGQVxqK3dRZxRLHgxabUox5Y3W7ygfipmDgSYSU780Yqh
         qwg3vKCNMo6EfZnZU05wiTqbkJa8Uxag+I/XhwZKmM2oc64H6P67ftm6DR9tafKcWXAZ
         AS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694444961; x=1695049761;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYXngHOzN75PoywV4+ppenCMkO0BtlnfambIk5nvgf0=;
        b=rlgzwsB48Ogvfewzg124JJd7h6kofSD6/dxm033UFYL9AXCQFACo29SXDdiRB/pmq1
         vbHEHwI6RDy1KRJmsF3TCws9r2uVs+fpTEkofi61x1bPLXqm/bDZ8KRKGE3LzVqMobgn
         vvTGinl1jgqaNJs1Ac1+c2vYnVjK9t3ZCSwKlT5APTgJeFoJEEgNDaNkZ2khs3UabyWn
         yIaPXwwyJWTeLXXubt3JZb7wCv1QmbmN7h+jwSu/j2NZtPd8z1cWTQnixucCRhFMqlSw
         cCJ8C2VLGXjjFG4A4PXmSWN3Ru209bURTiouIGqdus7peH8flOXjfMAyBF6obkOQPcKT
         uc9A==
X-Gm-Message-State: AOJu0Ywkbf+YHclgEVTkQTDWPjBqMqcuuP71kfmp2zW129TozASR0Ja5
	HlHBjaPJhs8TQK2i4+nccMCNDg==
X-Google-Smtp-Source: AGHT+IGEvvxL2vFpAriiGl4G3wGQZ/xpQvVGJmjqo5OcJg4NKx2heACN+56vMiFmzWqgfcWcpoS0XQ==
X-Received: by 2002:a05:6000:118f:b0:319:6001:978c with SMTP id g15-20020a056000118f00b003196001978cmr8510755wrx.53.1694444961129;
        Mon, 11 Sep 2023 08:09:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6152000000b0031f3780ce60sm10388691wrt.7.2023.09.11.08.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:09:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
References: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
Subject: Re: (subset) [PATCH V3 0/6] Power: T7: add power domain driver
Message-Id: <169444496026.3944766.18031639855172350392.b4-ty@linaro.org>
Date: Mon, 11 Sep 2023 17:09:20 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_080924_438930_4C8C70A3 
X-CRM114-Status: GOOD (  10.64  )
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

On Tue, 29 Aug 2023 10:03:58 +0800, Xianwei Zhao wrote:
> First patch is that remove C3 some power domain ALWAYS_ON property.
> Second patch is that add driver to support power parent node.
> Third patch is that turn on power if initial power domain with
> "AWAY_ON" property state is off.
> 
> Other patchs adds power controller driver support for Amlogic T7 SoC.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[6/6] arm64: dts: amlogic: t7: add power domain controller node
      https://git.kernel.org/amlogic/c/5355699dabac3c97492a30e6e01820fcaae11218

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
