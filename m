Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9760850A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0XeK+CoY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lleyHFBp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mNkY10+1b5v+ZCAiOzDe6Ej923JE7A7/HPcO5+kvQ2Y=; b=0XeK+CoYGxF1whwsFKaXChAKBp
	e4zfQCcc2gSVzcD/L5dB5Kw2num7NeDblB8UUIKI5sXGnnSKrt/s9iIAPJpysIfTnvdKThq1tW4WA
	HiugA33ZSov9h5qdhVlIkjsTwHdDaNEHpwME0jSgKMEmkX+R1xYl4bYy204nGhT7AbtiZx8ezDDOb
	vzetDMSjrRJQVfydC/PiJPY2tSnIIPeHMFqpK8bE7vPzkLMb/J7etvB55DHmwOHYMx+lcYFtyFlCo
	El3VEsFAxdWzBk3oc5LaPCbUZYUxPB6z73UvV2Q4V612cQYPtE/05pEtTKN4F0A/2XmyPIq8TzQ6E
	gYcojtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDd-00000001q7r-1kV8;
	Tue, 03 Nov 2026 09:54:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDV-00000001pzL-0Kj5
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 09:54:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso37613985e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 01:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699647; x=1794304447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=;
        b=lleyHFBplpYMGTN9OYLyUq7Tp9pbmaDTQpmpr5r5HfJjCVAtEo1HD2+654fdGLgbSq
         HsE9keCrPvMtTl03/lRDLmrk5d7ez1gJevHUnPghH6StiqEMbUYF3yY9E0I7VFvc0+fM
         penFdmAGRfX6GtCFHfbmOdpZwEjg890JT2ZIx5hBZM2oUxsELX/lemkxSFLUo/+2427/
         mobpbFndubLboJCavfMe3tNy/Ld0ql+JpokWXmK/8PVIff+eLa7xe5vozytuhPhhB0dC
         zo9ywP2gtZHZ6KwD1P7lfdIwqF0JYZOfKzj3OMDFmTa0UJHwGVfbWleOyBZkBR5+O1Qg
         B8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699647; x=1794304447;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=;
        b=LnD+mlP8eHtT/Mw006s8lNrBqob4NRer8lvXmOOBEd7xAtEW4j4K8ENH3GzqqZM+lz
         8QlUPfuABE07o56bRkMBoeyRtD+rphOk5qLW4gsn8RxBxCbrIhZsLGJDufvj7/YbFuJE
         nFD1akMVhVEG+M0QPzUQJinOZtGCsbRxfAs6kLomu66eM/gWlJmwCtnA8LR118Q2NNFj
         NgJklUHlH5yR+9OIkJLfnZtwtieLKLcEWuKfWezk5KEtnHkquNrlwUH8pPomlCa+ZBfv
         2RzvKU7eauwizTG8Ggx6bjD3Xu0a5zSLDdcl5A3GmNRvxB1gN50LlXszW1wy6LptWlmp
         4ZIA==
X-Forwarded-Encrypted: i=1; AKwUvBzOYd6xb2lVWV26b57OqJ2jYMFarqWwTKvgWMeojUes5fvqGcMoaKGJVRwGbbB3ZtWJwvVr7jyfbSUysiIt@lists.infradead.org
X-Gm-Message-State: APuU4Z86Q65vZge2ntN9yuX8hSVTgZp3kSsjewe5ZRJfppAY5Nx6xlXP
	orQX28IG+L6T+P25P6vWMLs+y8IVQJzV0ZrHvx1FK8xrqu0NEuzqqxdqyrvsCGBAWX8=
X-Gm-Gg: AYBFou0pXnp5sYup260D97qElm/qNq+DsiU0VMXpLXf/bb1+gMpnfRKgjmKFra7W4Rf
	wDgD6vWwU6fQBLCQGBQC43G8GolWXM/SaRo/4DlYT/YOFAweQ+JrS+NskHCz+ynW7jH50utXOFC
	/ZLQexyPY5FnJDuAK1nyX+6vzX+v8IexOR10+0Xt5zRvBuF2EOGYjy7FeV/9vUnpDHPcYaTtHBh
	6Lf7qA8B2Y/KqHsja2MM6wuZcIL5LLZvoezkobWMSnDQGE/7T/HHp/NNcijA2QDFgV4ZHKkZ51z
	N4Oh8HJSsz5v5uXj3hFMJjoyiZiIGqYJFER8EtIZ4GYpfzyZSp8735E3cI7cI8Q6CP+CEzdbwCu
	UCSLL+pnYhhN82wgpzoPuEHF9/kLc4yGNUlkrzyNzON8Zc+BuckzkTgzRuLXSeFlNoJGtAM8+Tj
	lQz7sdSd9mez3yuRFBu+ugknaBSBsNPsWwqWm6AlOXDQm7TOmW6dg2yMEFhxSUNhH5DwjvcuF9M
	g/dNfGb6qKhj14tOItbTzsLFeezT9PrEKI6mReNrXiyxI3wdDamYTX0i8vJ6C7eYWyZK/6w2VH4
	jDiCzkHAQdfIw1m1kWPutRYpkvDSZc4n3W44HM2iypeWO7D0ng==
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr308685225e9.6.1793699646995;
        Tue, 03 Nov 2026 01:54:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
Subject: Re: [PATCH v7 0/4] arm64: amlogic: T7 thermal support
Message-Id: <179369964613.2330120.9766633798877372121.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015409_753134_CCB3D6D2 
X-CRM114-Status: GOOD (  10.68  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri, 16 Oct 2026 19:16:06 +0200, Ronald Claveau wrote:
> This series adds thermal monitoring support for the Amlogic T7 SoC,
> used on the Khadas VIM4 board.
> 
> The T7 exposes six thermal sensors (a53, a73, gpu, nna, vpu, hevc),
> each accessible through the secure monitor firmware interface rather
> than a directly mapped eFuse register as on older SoCs.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/4] arm64: dts: amlogic: t7: Add cooling cells to all CPUs
      https://git.kernel.org/amlogic/c/79279ee341b99634f3c106e5970e13d073e8b064
[2/4] arm64: dts: amlogic: t7: Add thermal sensor nodes
      https://git.kernel.org/amlogic/c/c3644a9b59fa49ef88bd312dcdf47cc6e155dbeb
[3/4] arm64: dts: amlogic: t7: Add thermal zones
      https://git.kernel.org/amlogic/c/e41608d8792d8de0369a0e90f7e0d2b45db27541
[4/4] arm64: dts: amlogic: t7: khadas-vim4: Add fan cooling to thermal zones
      https://git.kernel.org/amlogic/c/e90086cb0f608c55e0b2d17e8db8207e789fdaf5

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
