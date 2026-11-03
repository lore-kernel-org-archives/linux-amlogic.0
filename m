Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536A6606EE8B
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LhbHShWT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P6rUjeNw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bDnVRz7w7R390Io2zftv0lZKOr61Pt0/hp7t391SuhE=; b=LhbHShWTDcZt5nlA8YGiEoxIfQ
	MWr8gkmwM6YFpf877k40Cimh+ofMLcCcDgeolxL6MNgwMwAEcpmcDGkLS6Czr1LbiGnb6gNgUR4kk
	7LdC4139aPdSGC1aJoushZTbXuTbnqM35P1dK3LtIDovtJr0cfTAjUhde6vezKQkym63lKR8SfKjD
	gjRUY8ugYLy1+LhKEhKTH01PQ8DsjpOI3ZNTs7QZ7VX7FdQXwx54hEYKjNfi+N/QCjw8xJ0UF43Pw
	pgk6eefVe5Ob+0eGD+Jpb0gb/KqLUm9MfPXkJyayzfkFtghFGiwC4ImtKmuXIKWf+3yVGfG2Xu6jw
	rkDycv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDd-00000001q9Y-3s48;
	Tue, 03 Nov 2026 09:54:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDV-00000001q0R-2c48
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 09:54:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26673995e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 01:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699648; x=1794304448; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=;
        b=P6rUjeNwcJWl2AE6HQKH5UqYbwcbRDL8yPKWrpi4FdonJeogS03zOIuH5bN2ayOVfb
         nB9fQ0oLAsNUhCxY45u3d+R/xawe3Pt6d67kKpcKBExDXpcpOSqiXYoBz5Mhk04cZDkk
         jTItOauSnAIHAfhv4W20QFPGHHLpF1x7oi0tfvQFJ7G/Ufzh4XvP6/nK2mN8Ro9vWPN8
         Tus0Vog3y2ZRB3Sz2zeOmpIFPv5mAXiqlW59U6+EPemsjmz3Fh8dmdwFe16Qc5imw3el
         n36zs9alUGgZCFK8SI6jQRvAiQZRj90GpHzxrJ7O2QbPx7qs39JToydgWYS4f4nfMLEk
         +0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699648; x=1794304448;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=;
        b=ztbRskEqe2FRP+xU7QBvxHhkRpTQrB4+i52kyPb1sIDeedYmVwc2Xpry/7JG/uZIA0
         vq0taA+EZHomCMxjs6EIjP1vJXAbgN8BYe3++JNaIQoDt/GaoeJdUL2l1xxL3b7r7/xu
         32iATQPgZSzb4RJDCiMr1iSQ6c4NMrjG/maUAtlBvHp8+l+xCT8mX1y3YP03qFMOjaEF
         c5w5jHonxsmBs9gzI4lNja4DenkH35iRjsXIfbdKm/paulCL8hVZeP2/lEpZHhhFYYYy
         D28qqPP+MAl42X6GCnuPVe81y1+4NUso9pTJUdNjLRX2orAcz68Yfpm862e2WjpN2b5K
         EbJw==
X-Forwarded-Encrypted: i=1; AKwUvBznqoWBXUFf8zEokooEnJMuMD4aJg6glSth6hWCFjfzFIRjmsbQPISh+zAHGCBOHYwhlKq9FvVhL6CL+tNz@lists.infradead.org
X-Gm-Message-State: APuU4Z9azHPsprICeZm+GURoWyr6IrP7COCI7y7Agp4di4DyYGaFtPAI
	md8M4Y72cypkK0ePc8GpX5RrdOBK6iF1FiVjcgBNZvhuFKuHHw8zj6tejqNfvjEgSESYbinX36+
	yayHZvxs=
X-Gm-Gg: AYBFou0rYi4n22hCmzg/pvnbIoZiMkDAP8hQUfW1pqPgUX3zynw/vqFgGZ92L+IFMdD
	WGb7UwQqFify3MFAEriB5+02DT7ATfn7qgB/OJdoHkiOjZdjCVKi8EmU3LzdE3N8tjwtrU4uz/D
	tVZG2a29Hhkz2etGheYKa967+XSupDG+kAub2e4V3uRCKMP8Q0f9DxhWJaRGMDviHQhWcRkozx2
	YFwvVHXxqLQjG3CrUHOsCpV2AlL8mpnK/jaxOYAAQrA0jtUESg1eblQchMANNv9KUpJJ9TF/mh5
	GHd4oZj1XatOCCOgUCylGdE5BnjNyUWDDe3/ik7wy6wDS/D7OSner7EAN05HXSt3sv4g2WWO1FT
	xdiIp+w8IaDoTa6PEDWXt6RczeyyLY7EiwiZBMzevjTdl2tUsGbFGXELuClPE9hXlR4Kf1IliML
	EPjE3O3Ysb4M9YVUyUideDX71tLW/dpJbuJNiCJA9GUFAIXKozd220c/T3I/65dxNl1TK05zHwg
	fftfKX1qLc/pZmLkbOyuwbySfSg6jObbxbamaBS4R4qmIBTvPP/gT422+GPq7dnFWSeo350dIxU
	OL87AMusGQr8q1UqsD51UuKCf5ntGx2xdzFCt1+vY2fWTpJq3w==
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr271871785e9.33.1793699647846;
        Tue, 03 Nov 2026 01:54:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, Nick Xie <nick@khadas.com>
In-Reply-To: <20261017040038.3702428-1-nick@khadas.com>
References: <20261017040038.3702428-1-nick@khadas.com>
Subject: Re: [PATCH 0/2] Add initial support for Khadas VIM 5
Message-Id: <179369964713.2330120.11723763412614220428.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015409_768746_80F4E535 
X-CRM114-Status: GOOD (  12.57  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org, xianwei.zhao@amlogic.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, xieqinick@gmail.com, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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

On Sat, 17 Oct 2026 12:00:36 +0800, Nick Xie wrote:
> This series adds initial support for the Khadas VIM 5, a board based
> on the Amlogic A311Y3 SoC.
> 
> The first patch documents the board compatible. The second adds the
> board device tree with UART B enabled, an 8 GiB memory description,
> and the ARM Trusted Firmware reserved memory region.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] dt-bindings: arm: amlogic: Add Khadas VIM 5
      https://git.kernel.org/amlogic/c/7db251465d5319a5c0fc46c397ebddb284560982
[2/2] arm64: dts: amlogic-a9-a311y3-khadas-vim-5: add initial device tree
      https://git.kernel.org/amlogic/c/56d1180882a32c78a6207b5364e43c2fc546cd9d

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
