Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73DDC46467
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRbfDNUEcYnQkh3fAeobOW3ed4oBuHam4NhdbK579NU=; b=d1c53qE3dNMopa
	iWmxLIdlDw9f62jAKpzSto5QsnfhM3vO3HRUSmSPAwvvhZjoopPzJLTlZxRaaxPvTXMoRsykuup3E
	LMN/fbgmLj+jEFr+Nj8mbzyYvY9qzxdEZy7HIOvlEMqLX1JOn/65k1ieClzHemNocRWpMiTDhDUnH
	X5B2d2r0YxRYU5Ngro71v1W28TvK8F7cPHB/QP0Wd8tvQ53IS4QPoSmtXCy0q0yBCUKmeYUI/zfXN
	Np+/Z1Dn+kKEoIivjEz334SrvNXjIQ4ho6d2i1sclN1MsNoqMKAlndzylzwFpmkklPM1bBC4VuWKW
	RnOvJX4dRr8h39xDMGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFFVB-007HGK-BP; Tue, 10 Jan 2023 14:21:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFFV8-007HEr-LJ
	for linux-amlogic@lists.infradead.org; Tue, 10 Jan 2023 14:21:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso5714751wms.0
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jan 2023 06:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liyTD8kZN+VJiroRLr8l9K3r5/CB+eOjRyoY0GEnNto=;
        b=Es3Z1g+oh8f+c06foHQ1GV+ZKr97m8fGyY0/oPZpjfwDZQrLcUp0vyNSMLxjekUuej
         T3bgHP+pM/83eBnqgMUR/PtbGhXWm7rHW/KJ0vEtEOtnG7C/cglsv3d/QNIuYkgEjm7i
         evHiyk0pYU/RSuLDP2DZ29SM2JwWGTKzgN6fGyuIgViqeJB0dGwoX+KWu7sDFnVvEmtb
         jcpTOXerKhAZBWG92EccZBbshvXP1Ch7fGPcRb1WksetqOLl0aIa6wBbceaqiFZSG4GD
         jrygSV+g5ggEEot9jbCbgcJxyfTyJUhzSMfo+h44AN/y3+R0cxa6pdUGVgozEuxqY4Q4
         BtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liyTD8kZN+VJiroRLr8l9K3r5/CB+eOjRyoY0GEnNto=;
        b=vylpwEyo/3HOySkmP91BnIApwZWVXKhLBeTomMs90xoHGqzF4GPwKe8dhEzmRYjo26
         dOaBDeuVmTbrr/UpbyscrCHNeUd+pZ2i3ErSOhsTL8SnuZBtbtJx4lQqotH4Q7SVQYyx
         XDTL+Q4wrh5GpiWt5RyLi08ac+17OLRuJdxY4hpFXJMGaOv8jwy9p9W0ZcN/TjfH1EF8
         3rNF7raE78wyhtzysd0+Oun1T+t/di9ZgPoI3QU6cIdYLPfRixmqnxpp0A2hKqkkre5H
         w5a6IiRXPoWgq6uhWt+3mQvGsH9q2mohh0WGMsJqZu78aDz8DUZstFrMqzyJxQlnFNjR
         u07g==
X-Gm-Message-State: AFqh2kqYcMuIJ0NmJg8zj6vGBjpEU/uCGdrXB1cX9eYp3pi90HzqoM4U
	2DeUu5a7ZgqE4DZiYRwBc41Y6uyuljPlAbnZ
X-Google-Smtp-Source: AMrXdXuNjH+i9dFOXqBb7TEvhlDjx16HuNabSp7vHXWViPs7mGvrXmbrr8HmiRDwYR0s3uQkiCY93Q==
X-Received: by 2002:a05:600c:2844:b0:3da:4e:8dfe with SMTP id r4-20020a05600c284400b003da004e8dfemr183826wmb.38.1673360477384;
        Tue, 10 Jan 2023 06:21:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id f15-20020a7bcd0f000000b003d9a71ee54dsm14640561wmj.36.2023.01.10.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 06:21:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20230110031242.4917-1-miles.chen@mediatek.com>
References: <20230110031242.4917-1-miles.chen@mediatek.com>
Subject: Re: [PATCH] firmware: meson_sm: stop using 0 as NULL pointer
Message-Id: <167336047652.1961574.14299477052580291272.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 15:21:16 +0100
MIME-Version: 1.0
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_062118_729911_86D0CBB0 
X-CRM114-Status: GOOD (  10.47  )
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

On Tue, 10 Jan 2023 11:12:42 +0800, Miles Chen wrote:
> Use NULL for NULL pointer to fix the following sparse warning:
> drivers/firmware/meson/meson_sm.c:85:24: sparse: warning: Using plain integer as NULL pointer
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/drivers)

[1/1] firmware: meson_sm: stop using 0 as NULL pointer
      https://git.kernel.org/amlogic/c/fcdc53aceed413dce3ef1d0166a8e9348d5a9c94

These changes has been applied on the intermediate git tree [1].

The v6.3/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
