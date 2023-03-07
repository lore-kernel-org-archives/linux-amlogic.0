Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18836C678D4
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZQ+3eayxmSHTOBX3lQ34/6l9NJ0dfdtiULZkK6t7Hw=; b=VEbmu6YFBXhm8k
	6cQKnNCSCFLqV18+QNuqwDQMDvtbOWbSUcOkWmN76HP/W2hnY92o1UVCxVTbVukZ/AvJIQXSS9EeV
	CJjQrzebaGPgtbTLpfLypXAPH5bsJ2V+NjmplVfE8TOJgIYFf+ZMDk+9ihhgDvD8cmhvQK3Y1VB9T
	F5KShmHAlaZvI1lHrjoMBmDKKII8AYQzH7uNqzz80c6vozJWQgVoEOy67JquFDRf1ZOuM4IF/jjGX
	R+0RS4jF8m+i8rS7wFQU67JoCw+tWDbGGGuhZCp0KFdMKiKpvJGmw3w2yg0LHkfbEc+YqQOj1U30o
	tSYH/VfEuDpX0DaNVOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSDK-00GYUi-SV; Tue, 07 Mar 2023 07:58:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSDH-00GYTj-W2
	for linux-amlogic@lists.infradead.org; Tue, 07 Mar 2023 07:58:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so6629017wmq.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 23:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678175900;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLMVTmhug5W/ViPhUZNv91aDNn2fde2rmlEoDo3GK6I=;
        b=MNbDJ8uIPK5/6ZARHUVLpH6EBKlBhOYov6UIRFf18yzIt3Jh1TQynzubbE0QmdvxoK
         e7Z+uC6xY7gDtaQcX1bC30mZkaAq5xaMsaATRNw/svH5LJAKYuE5sJGheNQGO/ZUcIs0
         otG6rEk90ZYcsPdKVGC1nzusRNKbXhL2BmrQXDr1j5VkJviZmM4r3FU+CDrNgQjDPOHh
         h8jpjqteWpPCMh4zE2s8WX3oxj84y0I3NqYVo0hrOi1paO73oYw+TRsSpcGsNDnkQ1DX
         /ScKOFnxPEuqao2ywfKjwWcimKVSGcdMi8i9ayhSXvGw2C/hpjpMO7u2AL8TpZuSHU1S
         nq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678175900;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLMVTmhug5W/ViPhUZNv91aDNn2fde2rmlEoDo3GK6I=;
        b=E8ESyA+Q7/KlUS/hT4UuOtLGs2k1flP5Q8DoRCDipUDVu4Ab26YTeqqpl//4lyPHGk
         K8iQnbc/Nq/EmcBv9fhwei4Xll5FxFYGRc6Te4jZtTN98blms0i/0BuTvZrAE/BXRbSG
         DfM0+7V8JpJD77OkkgwgNv68vpAwdrW1rC17Yxo7cTQtF1mJ1uwIaVTN8cpiD6bBtA+l
         6P8aN6E1oGn/DBIVyVbDR1XUINnoxUsb0y2jfM+9jrTTB/9iBStNketnQbNlkgEKdbNI
         GwsvqlhvYTz0BKdSwgcwDXLUyctxu5E4DYkbY2FbSQF5J/WhYjY4KAY+VzBr5ydqmHC8
         hPDQ==
X-Gm-Message-State: AO0yUKWKn6FqQ5N1datcPSSRa7+ceUuhrTf+5FQoSpb3UgsZD0KDePdX
	eX/q8lDH2RqEuqDJf5TX0G0eaQ==
X-Google-Smtp-Source: AK7set/9bOskxsI40HBxPvMG59X6tvQhrLogkwCLCIPH50cPIOu3X5bNQiexyW5n0A+YqrEHHagXag==
X-Received: by 2002:a05:600c:1c9e:b0:3ea:f883:180 with SMTP id k30-20020a05600c1c9e00b003eaf8830180mr11574626wms.7.1678175900220;
        Mon, 06 Mar 2023 23:58:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c43d200b003dec22de1b1sm12041776wmn.10.2023.03.06.23.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 23:58:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230306151354.132973-1-jbrunet@baylibre.com>
References: <20230306151354.132973-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: use gxl mdio multiplexer
Message-Id: <167817589881.760403.18039732599742778608.b4-ty@linaro.org>
Date: Tue, 07 Mar 2023 08:58:18 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_235824_063139_2CBB479F 
X-CRM114-Status: GOOD (  11.88  )
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

On Mon, 06 Mar 2023 16:13:54 +0100, Jerome Brunet wrote:
> So the far, GXL SoCs were using the generic mmio register based mdio
> multiplexer. This properly sets one of the glue register but the SoC
> actually has 3 of those registers.
> 
> One of them sets the ID under which the internal phy will advertise
> itself. If nothing sets this register before linux boots (like u-boot), the
> internal phy path is broken.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/arm64-dt)

[1/1] arm64: dts: amlogic: gxl: use gxl mdio multiplexer
      https://git.kernel.org/amlogic/c/c2e9012bb383f538186cf11d00d223d025d10c8d

These changes has been applied on the intermediate git tree [1].

The v6.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
