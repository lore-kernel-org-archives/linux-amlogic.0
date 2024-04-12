Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762A5C00A94
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 13:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgiMlC5IgClWWoWeTQQI8NAu5Yj+EQ8vYMz9pF7KkZ4=; b=Lqu49xyYzaZsBM
	L+L+K26mPibZCtq17JnGAgAUH8hR/uZ+Mrqg3wj2lw9WE09NYuuomiS6Mi4V6HLmiK4/hoHBvtgGX
	2vWRdfh8a8a6JhzTXPhCuODjmakjIwzIOXBKxTt0R8xBymLGeqFl6bQpAHtitW71BP9VvqkM4oVkF
	6IEButG8mhV0mIHBD9NH+bBu9lcJPOpyDXoC41xhgR/c2iehKV4+jKYxzTuZRSAxgaRZMY0ApuJfA
	/4FkFcJckIUomuA2726Ff1xW+RIf6hz1N0HiQ48TJb8Uq8CptLiaho9gVJ3v6QIteVX2hXumc/dyh
	QKdbAXza9I12qr4UoZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGjN-0000000HGQ1-0V6f;
	Fri, 12 Apr 2024 13:14:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGjK-0000000HGOo-0zDB
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 13:14:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4155819f710so6466395e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2024 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712927649; x=1713532449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKIKmBiM6jcwJEcZrg6LHG0d6Eum207+g4jW0WFBkI4=;
        b=k/LJGe8TnDVfE+js56jpRB8I/7FuZIeUA4/w2t79L9KeMqWNEuXrVYDoxlN7FiWGG8
         oHKoWVGVbswejvn2hUd2ks2WLcLq5Iye7iljkpneqLDbfWidQat3URu3dD8pU2v015wT
         srEH8FfiV3qEalOSqpi7vl+UE77cj+eVL3Od59lGgKBvOkru80xvuR5xM+mSnYs+1/sS
         bYO38wH9COPt/MOUJOtdGfvhWKJGXfgedbEUpuhHskoZmhcKoOLyAK/uy4Q9fEEHYojX
         QmaouoMXf19ONS0nLhZsz+cVGYVk9H1vZtpA/um/22bEHlwMV7OeVNBsn9927Iuq3xP2
         KgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712927649; x=1713532449;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKIKmBiM6jcwJEcZrg6LHG0d6Eum207+g4jW0WFBkI4=;
        b=KxQ1DqK+Zr4KVTyXppciSAINZ5yrdJo4qtgKWXD4efl2grcBuz44phBwEGwl4A4mkl
         HCvFeAL6IMWL69Q4WojpvfS0v1r4K3n7t8a3h5ehCqQoDSmizfoCfzSTrxmNZhpUmiJl
         PoQYdvHYQqOjVJ1sbOmTcgORT2FsOGUnFT2MHG2z2kq4chq+x8OwCsv5ORiROAMVNd33
         xXKJYvJbW5VgYafYtvVNupcbf7lo/g7b3SHZIgerCaOKWDdGmTm0jR/7u0SYNkCGobZD
         wOi4DSHlyHBH+M83sJt3OSAMFGSDPRAHAtaMjLhCdT9uk4ssGqRHbtI09qcqiCupjp3+
         up9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdIVazTLK/+xSyLmozSGqTHnwqDU7oDlO19/CQ9rWH7JA6yRnXUskoEVsJp077lWsIul/hgGebhYKcVpdYUqweb1l8K0ezeBRlxhAOpIHCWro=
X-Gm-Message-State: AOJu0YynQSYBXv0eAROTQbQ2UC4oD0TdoeH5ZaSJKibY1pFb1kdP5kPH
	R4JWF2zjDbqFoizrihLo4HpDHHEZPqYcLQKPjh/Mw6EMAwlQEGpkNMQtSazVsTI=
X-Google-Smtp-Source: AGHT+IEqWFd+QuLDbJcv6OTiLAWvUCIGZ2gJlq/aV9qLhe8ioHcLstnAVYQDw4b9SFeb9RuTfwe69Q==
X-Received: by 2002:a05:600c:4510:b0:417:f58a:57e with SMTP id t16-20020a05600c451000b00417f58a057emr1582523wmo.0.1712927648621;
        Fri, 12 Apr 2024 06:14:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c4f8300b0041627ab1554sm8826376wmq.22.2024.04.12.06.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 06:14:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-serial@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240401-basic_dt-v3-0-cb29ae1c16da@amlogic.com>
References: <20240401-basic_dt-v3-0-cb29ae1c16da@amlogic.com>
Subject: Re: [PATCH v3 0/5] Baisc devicetree support for Amlogic A4 and A5
Message-Id: <171292764771.2837390.2489661650748373215.b4-ty@linaro.org>
Date: Fri, 12 Apr 2024 15:14:07 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_061410_348120_1FEB39CE 
X-CRM114-Status: GOOD (  11.74  )
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

On Mon, 01 Apr 2024 18:10:48 +0800, Xianwei Zhao wrote:
> Amlogic A4 and A5 are application processors designed for smart audio
> and IoT applications.
> 
> Add the new A4 SoC/board device tree bindings.
> 
> Add the new A5 SoC/board device tree bindings.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.10/arm64-dt)

[1/5] dt-bindings: arm: amlogic: add A4 support
      https://git.kernel.org/amlogic/c/8b8e6e24eca07efb4860c97aa773dd36fa3a1164
[2/5] dt-bindings: arm: amlogic: add A5 support
      https://git.kernel.org/amlogic/c/7e05175cb7be232450e70fe75ba2a852947eecc8
[3/5] dt-bindings: serial: amlogic,meson-uart: Add compatible string for A4
      https://git.kernel.org/amlogic/c/a652d67a84575e09b52614a2f81399772d52876b
[4/5] arm64: dts: add support for A4 based Amlogic BA400
      https://git.kernel.org/amlogic/c/6ef63301fa37087414342269bc02a2a930e81779
[5/5] arm64: dts: add support for A5 based Amlogic AV400
      https://git.kernel.org/amlogic/c/a654af36fe8b54e360fcf155b785df3aa0eab73e

These changes has been applied on the intermediate git tree [1].

The v6.10/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
