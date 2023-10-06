Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41163E81DEB
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQAJzX6Wq/ypd9xY0dWyyBaYRqSfOItoFaq/urJ6pqE=; b=z+FFHcxePraGnY
	ZL4egDIMYOQ7Cq3P/ennd/bW5fX9RodAtu9oycHPQARR9hakDg3ZwW1CBQ5TlxQtbCNrIlpZzW8Jr
	e5itDZUC+hMawkZ+pyk72v9rGy6MJqxmgRHY/bqikUwKTlc6Wfy8F8b6Q1UJGMnniVLFwtaN47QnC
	xjpO4kPbDDDyQRm45yMdbv6/thKwocTPDJmaRVHmNfkQOOalEW0tGZ8cecrl0JGgArKOf6T9tnVrd
	ODQE5Lr0vqAUN1qyt+oCAWgfTNJPiR/Hh0XCi9fWJHJSDUxTII8W8tBGw0F2U64GpSkZFdVozR9fD
	boye3RUUDF5fv6bJ1Vkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojAf-005hJT-2S;
	Fri, 06 Oct 2023 11:39:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojAc-005hIg-2I
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 11:39:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40684f53d11so19386905e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Oct 2023 04:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696592339; x=1697197139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lXCeX/nmRFaPa+W/SmSphBLmC5PqiBtH5lIkBBz74w=;
        b=eBdVuD8I/P2ZhL0w+RibbsBtwNShdSWYxizqQuLjkZ6DywNy4OOUGLZwruPHjTSvjM
         +Tt4UA98uvLsMheLontq9GlERiOMtgBpLNunuLRa6x1UvWvzFjRd93ZR1ND3G7dYISWv
         IUQhfSfLIgXbK6h/kgGsUPtOZlW+l9mnEBFogQDJnIDzUy5aUW22SDCYRZUiz7haMrSG
         xpCD5R+ywVMq4Y/d3VS/xMJndbZecg3MNcupzGJfRZqpgw+kKL15STwWKrhHUYt4zqLC
         hrdNTjeQplH2efB/ZkGZf3qPJDqMxRlFjnT4eozLeARVyW+usWI69EkUqfa0xe5eXcy7
         rAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696592339; x=1697197139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lXCeX/nmRFaPa+W/SmSphBLmC5PqiBtH5lIkBBz74w=;
        b=P3251+io89DvpB9OCQhY2Ud9hXU6GpZCDS+0SitxogWXoGZ9qf2NOkMiUgAitwtOdC
         4gVcGbSEOv4/T8gVS9gVYcpIN/2v6Me3pQeOpLt70Uw3G0SqnDiEJ5HPc9onRFiPhx7C
         fJhGVaq5Y/SobNDUFKC99aV3C7Fp89YLT+qtl/hK2JdBr8bvIpETyDy27tNDBYAVIcoC
         zNcq/HI9HhUnLHtN0UL8JmQ2D9VoFmpX8XA9Vp374ohdsFifTJMA5EUSpcgSWN5cOm3V
         vv4DUiGUU0ntWaGCD2MRrcpzv269pRcCw3mtJpMkrVtPjZ3nQHeSJRL/xJp7M52K77RP
         rERQ==
X-Gm-Message-State: AOJu0Yw8V17Y/0TVWkJ7JOHu7uQ6aczCSm+VP1nKz45LsDvfB9d9X/zn
	lQmpLEe8EYD+lOgMyQRvsUKFbehpfZN0r0w2pvQFUMg+
X-Google-Smtp-Source: AGHT+IGLqMrlBobTtK4ubGlWM7ey7sxhWNYax4656ew/AmwVJYYvVcHii1oOhmdar1qG9oSo3EgJ6g==
X-Received: by 2002:a05:600c:294a:b0:3f5:fff8:d4f3 with SMTP id n10-20020a05600c294a00b003f5fff8d4f3mr7527680wmd.7.1696592338825;
        Fri, 06 Oct 2023 04:38:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d68cd000000b0031ae8d86af4sm1442191wrw.103.2023.10.06.04.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 04:38:58 -0700 (PDT)
From: neil.armstrong@linaro.org
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Da Xue <da.xue@libretech.co>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: amlogic: add libretech cottonwood support
Date: Fri,  6 Oct 2023 13:38:55 +0200
Message-Id: <169659226645.1467422.5247587231855706519.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002141020.2403652-1-jbrunet@baylibre.com>
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_043902_758130_DA5243E9 
X-CRM114-Status: GOOD (  13.55  )
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

From: Neil Armstrong <neil.armstrong@linaro.org>

Hi,

On Mon, 02 Oct 2023 16:10:18 +0200, Jerome Brunet wrote:
> This patchset adds support for the Libretech cottonwood board family.
> The 2 boards are based on the same PCB, with an RPi B form factor.
> 
> The "Alta" board uses an a311d while the "Solitude" variant uses an s905d3.
> 
> This patchset depends on the usb support for the gl3510 [0]
> Without it, there will be dt check warnings and usb may not come up properly.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add libretech cottonwood support
      https://git.kernel.org/amlogic/c/7eb73b8abdae401ac70fd7d463df118a4a2404a9

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
