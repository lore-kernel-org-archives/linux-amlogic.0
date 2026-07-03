Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ECEC43458
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2026 09:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rH+eelhsa8F20X0rEM3chrHlo37u0lduPCdijdvzRE=; b=Ra2pTZbepo4OWD
	ibvCNjrml0pNnS6FiuhSBmZQ6GDUvxS4shq8g4jiWSq0wsAGIBFh5NeQXcqkhZfBMamRoX8eE2hMo
	bPnqNdzzjhFHmYdE0E79v0WWdEMFb9+z+WQyJ+9/3s6gbo3CbepG8RLOO5X7PfgQMk04ecQ01GFQk
	AQy85BpGPSLFXIRgDd0ETE9ZNoNLks/c1Wb6w4tywd/uwtTQ0PKYVUWibk92oZC9frpQ4ch/kwU2f
	1ONtXUW+IqzQeVn+6YSzaM8wI34XfBJP7zyv3wEf8IMiQhnEKxUqdvpfUUB8XNdTIe7g6w9t4tXXF
	4np3c03XVvnxlukRqKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaYf-00000006WFZ-2mdF;
	Fri, 03 Jul 2026 09:51:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaYd-00000006WEo-0EI4
	for linux-amlogic@lists.infradead.org;
	Fri, 03 Jul 2026 09:51:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so2548675e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2026 02:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783072297; x=1783677097; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0/o+BxhL5sTQiBioNkExLmkkWnNW1Q5SLBaV4tIgPk=;
        b=SKl+bHt1y+q5jHeiNb7S2dkyUfMndb02X19TrU8iAPOfbcIo3jxA9w7YHnuMMTEebx
         3ulPUe2BpX3zFX6Ncv9zPjivC5RPs2ZrSG294rzfAjGalTxkLn1OQJRlJ23I1Lq0MES7
         V2TPPHmfhjfaL+hc0VgoM74sUUBLAtrYW5tAk9/7ROvKIUcyY1ByLCMN4ChZyTyd2rZe
         eyadfTff5k+Yn/NY4v5OgonQ18Nz8EvR900XuIO89Cosz4sK9cTZSEy5mT3krb7EIsyO
         3YQ93FYAzM6WPfDXIHaUzg05w2SGS+ufrzhn43WfrN6c7TcTstv+qL0+NryAREifvxdj
         YBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072297; x=1783677097;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0/o+BxhL5sTQiBioNkExLmkkWnNW1Q5SLBaV4tIgPk=;
        b=tEBKGXVTs86eIWss4keFEpcOQ9X2+OUQYO8nRBS4TP9sAxAbCpydR8NlfEjJVkdmUt
         Q4oF5r1qdBPLcwtB/rnlxH8RltEwHUPqcA8fSOtOmCG1kVMsI9jEEdTHpIbk3bvMaQv6
         HXbQ/RnGF58RwBbn/PZ96+FKREvhh2NZpCXA06RBkkjgki7X89HxaDBSvzOxPAvuzqar
         LG8euA1PGTabElq7w+AH1ga2+/vn+pKKWYgZ3lhZvYePZcTSfC0YRcSqQM5XryWtWmfs
         fGgW0Va0WFRZ+4oqYfHrPot1Bl02sYlhr+bqMYmIRKTjcq3TtnUobGWIoSnt6dU2umaH
         htZw==
X-Forwarded-Encrypted: i=1; AFNElJ9mA8E+kLhAeX5Y49fjd48orRPreTYZ/+/JmOXYmspRr4pWEZF8cN5g4Y4YrnSaaiqr+Ub6RVyh94PHci4d@lists.infradead.org
X-Gm-Message-State: AOJu0YxrWr4gNPjZALzfRFbuerRcPsNY88xlCX4sn4ixt9Q3sFUlm29g
	KYd+kzwiU7ZU63iPjXReNjEDsKPtbr5HsV1hvRLX2usMxeIrpmJL8yFrQ98avoBhjPY=
X-Gm-Gg: AfdE7clvj74BfU8ig6w5GJVUIh9HPltBiIwe3lvGY6OfRf4K0rdVgG1VMSIWLoBFjay
	MDFNOy7ztyOSCtCyn1csirhVapHpTQ+pAksLNOn+2RjiEZdig6pxJS8vK688Y9MRzn1Z7Vio8jk
	y/4bEWAKNry9+QzLl1EZAlCQIprqSx5EYZEsUHHtWnL2nwAgFNbOSTJKRSRd5Ia9uiNEFzWt97g
	bQfFIVwk9ss8bTxyHXkXsnFDCIIgfrjI7lnQv3T/bxw2nwA0GtB14OUL+SkJKlZhF55ocVxJtZp
	78DrRE31dqdJjZ8zqwCQZEyicEkWKuYFQVVq07YBvOd8kUqKa6Djb5SzYqAXabnXcBqlJiiK7QX
	bcA6SqSu9zIrfSyjgYZlabDGsZpY9NcQLil4Ltewt6EDhb36hlkNOcJhb0L/FskjpSbT/bb2irQ
	A/PD2KFa/x5ZF6dltohJGbCp8jZTRbQnLqe60dCpnKnbOh
X-Received: by 2002:a05:600d:840c:10b0:493:b9cd:1272 with SMTP id 5b1f17b1804b1-493c3cf2f50mr96587925e9.23.1783072297045;
        Fri, 03 Jul 2026 02:51:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm16710140f8f.24.2026.07.03.02.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:51:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/4] soc: amlogic: clk-measure: add A1 and
 T7 support
Message-Id: <178307229627.3254712.12197309292158479320.b4-ty@b4>
Date: Fri, 03 Jul 2026 11:51:36 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_025139_116883_26B4C7A8 
X-CRM114-Status: UNSURE (   9.07  )
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

On Tue, 21 Apr 2026 16:17:40 +0800, Jian Hu wrote:
> This series adds Amlogic clock measurement support for A1 and T7 SoCs,
> including binding updates, driver additions, and device tree enablement.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/drivers)

[1/4] dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
      https://git.kernel.org/amlogic/c/457462828d08514fbf53a385c0cd39bf597adf63
[2/4] soc: amlogic: clk-measure: Add A1 and T7 support
      https://git.kernel.org/amlogic/c/8bfdc0393b3f3d6aaa1203e889ef9e96a50b28a2

These changes has been applied on the intermediate git tree [1].

The v7.3/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
