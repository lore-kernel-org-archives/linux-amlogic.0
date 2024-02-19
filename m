Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4688C5475B
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7u7DadXDmw1zr3Yt/X2MzImg4wXyOK43wx9tR7+VqqQ=; b=NiuyRkhfqR/tWJ
	mLXtExHNop172VgQjMb0BSYvlGUMjoB9j+kCJwDbfX3BVHP2PrtxEB84H+aooqPCMZ84M3CbYXL/i
	7uuJx8Zyqi7cZOhPDDM+2an16y3pBhINvlxL6mHaWG80mGN4H+rORVq4tsZ+R3Xl4eOorp+RdPLOK
	qDAi0hMmRKOugOuInmgmkiUh9KvTYauFCcZqeICLKG64bKEOoLGVNO68RvcD667mDAnAG/n11dYB1
	qZ3MRsWyCJq60nLBdZk01crDwAOmbqKPURnBQ8tHSIhyR2XMhheMgorwDMHOmoFq7gywXH5OsVKBk
	lfzj0qk6ID2HFTGCwNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzQ5-00000009gYI-2VNl;
	Mon, 19 Feb 2024 08:54:37 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzQ2-00000009gWD-1kg7
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 08:54:35 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-512bc0e8ce1so314972e87.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 00:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708332872; x=1708937672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22Yt75fVfsEL7mA144l/kMA/h2fIbqb72OW3O39FRkg=;
        b=p/54O4laC7/J2mTyN6i7f5T4EOG8rhjnEdWbkGVcmZNkFmZubqp7KobNJdPIzKXpEK
         +bWOFOPvH2tFK1tEKfB+B+lDbcOg7lJm5CujHYbZimCrFuYktpGyOkaEER0oNzlnjEWh
         9gOxCgw6Q98Ju2cj/Az6Pw5MAr2FmlI6dQP8SseyyLPBpqL6UWHd7or8gpy1jsujRj8q
         Sx64z+Ae9pGwM5/qDOaUzo4BniU4hgKUPIKYzLGq6iUlr3TzuChJDFYY0vzvBz1N+r7H
         lP6QcQagRYvxL2HIwbFNOgHGQSCEXxuvXtJueMuC9b0GvxY8EA7UkqtvElYXYtKRMjsL
         A1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708332872; x=1708937672;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22Yt75fVfsEL7mA144l/kMA/h2fIbqb72OW3O39FRkg=;
        b=j7BOHd/Ki2fN8O02BUKhYJsIqN5YafbGpe+l0bT8bvMugSgFFBzEj+EpDxHQLmiOIN
         w5Njs3fcSC9xN7EG9DgJxynDBws83Hs/baZyKahS38sKESDqerB7aVCoeS8yHbivMAJD
         51ANBez1oO8XI3qthBIIYTaV+Tvfyu28PrZrenTRw+mFIAU6QJ/KTk2IOUjP2hcuSyXX
         8Al7pu7xO5OzO5IqC5EZOiZYEyY2rWuPaG1PwGjzkpNosFFdH9rCbbjjeBOrNcm5uhno
         cyDS3QlGhWK8l7e0+ct0pd3eiqAM7nEff2qgHVfOwHeUDFh/etXyVtP/p8JJaXD05Bbc
         tmKA==
X-Gm-Message-State: AOJu0Yy+VKLx/AudFPQDWZsLL9G2MwF0nyw8bB10weW6AHjImjxqJ9SS
	JkPCyQmMUeHMzH5FLKkBdHMGPJnkOiulVDAkiFFqTTfGU0ySm8Il+oBf/V++JDk=
X-Google-Smtp-Source: AGHT+IEhBJtr8HJXpxu3ixn4sc8EZXWyTbhE3RUOTjq4ZkWMI1AY/AUQw/AAthgBEoEb2+pWdxcZ2g==
X-Received: by 2002:a19:ac48:0:b0:512:ba54:6ce9 with SMTP id r8-20020a19ac48000000b00512ba546ce9mr539662lfc.67.1708332872499;
        Mon, 19 Feb 2024 00:54:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f5-20020a7bc8c5000000b00410bca333b7sm10516716wml.27.2024.02.19.00.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:54:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: AML <linux-amlogic@lists.infradead.org>, 
 DT <devicetree@vger.kernel.org>, Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>
In-Reply-To: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
References: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
Subject: Re: [PATCH v3 0/4] Add support for Freebox fbx8am boards
Message-Id: <170833287175.1749763.7592258625709220992.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 09:54:31 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_005434_492094_0023344B 
X-CRM114-Status: GOOD (  11.32  )
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

On Tue, 13 Feb 2024 18:11:12 +0100, Marc Gonzalez wrote:
> Add support for Freebox fbx8am boards
> 
> v3:
> - order board binding alphabetically (Conor D)
> - replace underscores with dashes in DT node names (Krzysztof K)
> - Merge overlays in the build for coverage (Rob H)
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm64-dt)

[1/4] dt-bindings: vendor-prefixes: add freebox
      https://git.kernel.org/amlogic/c/fedeacff9611917231d710382e7ccb518cd440a6
[2/4] dt-bindings: arm: amlogic: add fbx8am binding
      https://git.kernel.org/amlogic/c/beee431b3257334e450999ebe77636bb18ca87e7
[3/4] arm64: dts: amlogic: add fbx8am board
      https://git.kernel.org/amlogic/c/acbe5b6b0fb74197ebff06a62abcfec9858c23ae
[4/4] arm64: dts: amlogic: add fbx8am DT overlays
      https://git.kernel.org/amlogic/c/13636d5502204e671398470962babbfb46bc2721

These changes has been applied on the intermediate git tree [1].

The v6.9/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
