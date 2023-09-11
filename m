Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F7AEE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HerWQUc0ETpKuCBuQ5iYOM1Qr+8qhs7oSBerYuYCXMQ=; b=fnP3SO/4GcdBw7
	+OPSLfEySxD+6p6zMvlDIa/JuURKDX4Ql4Ijf+G5jEB24RDsM79MC5ndTTr6tGKbxFisMiA6I0TfT
	L2lhF63aDtDlzfZp3eQohCOq453TODN8CeRHjTwBKDGmommMrrXwPq1o43XeLtV4dwAICvj1nHVcr
	Mn94i5NIO1tSzBZ8eg1IVH5N14SiyTv/JtiSu3qvDxQE5/vi9spzh+H9cc8u6O9T3FWhFp5HjNBg3
	fdCa6KXNq9zz08u/R7CiwwlLMzj825vrJudhXAcACKvZjwIgR5av9u+Xgp1cWOVepAcVOjufWruVT
	m+KzHLplN1PImkPncPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdVA-0002qM-0R;
	Mon, 11 Sep 2023 09:46:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdV5-0002kt-2E
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 09:46:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4018af1038cso46242765e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 02:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425592; x=1695030392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cYuBqqKCr61kF+J0qE32P8LtYpg7LF8EeE5e0c2/vM=;
        b=GQkVx68Y3Pnc9wL2fCaj1exCyC+46RlP/ojLLK5Bbg644MdZceddlNsQjjcEh0Wyaw
         uVPQf6d/m3WDyz/yWw1fMA4aDyOMJYbVW7yO+D/hyKANUiKk8SX5G5YjaH2NEVx+58+E
         nsysyrmNvtLD1ZNA5ub0tDVBcgauOS7zMpD1MvGpMa+mxXBvTemQg4xlUashWNQj49Ih
         knaZx9MVCnC8vqSt2JkQfW/Dr+L5ALr2m71j33Hz1EgxS/kuWpHZwX6H0GR0qZz0Hg8L
         BZEQIhjPUfUwBvGjdDJ9uqbxWAnyaFjq0+raJpxP+p0Ao94lwyWJPnnIm9FAySqtLAz5
         ONkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425592; x=1695030392;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cYuBqqKCr61kF+J0qE32P8LtYpg7LF8EeE5e0c2/vM=;
        b=GJAfzcP58YqCctZAflxSVLsP00XGIYh8aBjNmj1PGpvc3B6LcLAsYXfqadeWptxaSj
         2OhpnKkeXyk43w+Hk4W8fxvUOzUKf6Cc20DSmDqjJRBHVWXgreaPJBccGWxMm2RAQWUa
         KZxFVe9KLxBuNIIupED4AVWKc9pFq2C6wgUMLWu+Z9ZZnQSiBeCI9bsIIlLfRES6CQ37
         Llhqz/IfCnVW8QK/KzyM//cEin0ERMUW1nEmb5OIAjQHiBVtncrj/Y6sw8v8zb6FVJBT
         HiOXiS3T8eLpaDWVzzaeTyM94pFSAjyLDCuj5Uemj+qdBbxSyYXqQBTl+HIH1PWT/8iD
         050Q==
X-Gm-Message-State: AOJu0YzzBjWFgJ9oIfwtlar3hz0Z8tfdm0cpDyCg3shnQIIQT5FsRQoj
	tfsIbBocn/Ls4tXZu7tAMdXSGw==
X-Google-Smtp-Source: AGHT+IF6Db7IOiAAxmcutp4cngm1dQLW31BDJ9vfe4xSUzSt9h7ay34mes/ebYDzWk0PZc1lOgJSnQ==
X-Received: by 2002:a05:600c:2a50:b0:402:bda9:74d1 with SMTP id x16-20020a05600c2a5000b00402bda974d1mr7609095wme.8.1694425591809;
        Mon, 11 Sep 2023 02:46:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d13-20020adff84d000000b00317909f9985sm9503496wrq.113.2023.09.11.02.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:46:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230815092751.1791195-1-christianshewitt@gmail.com>
References: <20230815092751.1791195-1-christianshewitt@gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: amlogic: add more basic audio support
Message-Id: <169442559097.3235506.12459574457912854518.b4-ty@linaro.org>
Date: Mon, 11 Sep 2023 11:46:30 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024635_733521_6E64ED17 
X-CRM114-Status: GOOD (  11.67  )
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

On Tue, 15 Aug 2023 09:27:48 +0000, Christian Hewitt wrote:
> This mini-series adds basic audio support to the P200/P201 (GXBB) and U200 (G12A)
> reference boards. Few people likely have the original reference boards which have
> extra audio capabilities, but the device-trees are widely [ab]used by users with
> Android set-top boxes whose hardware is copy/pasted from the reference designs to
> get working installs. Adding basic audio support does no harm to the real boards
> and helps the secondary cause.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[1/3] arm64: dts: meson: add audio playback to p200
      https://git.kernel.org/amlogic/c/61373cc074128c40d53857803371c4a9384d4200
[2/3] arm64: dts: meson: add audio playback to p201
      https://git.kernel.org/amlogic/c/2b2827a19024abcf879c18053ae3f2fc23891ad4
[3/3] arm64: dts: meson: add audio playback to u200
      https://git.kernel.org/amlogic/c/cfae4eadb7cd44cb5f17285e18477bed4ae5f03c

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
