Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0D9606A31C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 21:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vqzoE22m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J1mLQN0R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W1aBP0Ck/O10Iq9Yv2GLr0y97uMmR5B+3I2onYjwuGc=; b=vqzoE22my875s586wTFSgVyrc6
	y9F/3Czikfh0DAZ0Zarw4HiuetA3bNClPz37mhfWS30cHj4Q6pQ9x7VK/8LfzPL4vLhv5K1Rhk+nE
	2qP59dO3DKd7JohmPGIq6d/EFd7VAWbu2eHj01uBbAextEaqvIF2XMWHmxrOJCWeEH5P/QLaOB40t
	Ex1c+sXNI/tTDS/Z6rndKZbPnhhYyXTznTGznU+Td/HwUETTGxsx89YhIKd1f5Nk13tYJrwqn2fNZ
	tSdu3Qo+y9RlPHPstiY6EZeCBGZM91AzlcU/X0VtptvvUD5Lqs1lQKi0xHMe1ZBsmLejWLm5LSBZ6
	yJEb/8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT49d-00000003wYc-30yT;
	Mon, 16 Nov 2026 21:22:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT49a-00000003wVT-3u2k
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Nov 2026 21:22:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4243614f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2026 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794864137; x=1795468937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
        b=J1mLQN0R86iW38MDzWRqP5AThXoykuuDe1xAlUnX5vuuzfUuXrSBUxUGWAPixkIklL
         3XMYOd4fJiy5Gf2oESP/TjUjX7e1L2GRPAC9H3UZSz5UH6+ul+9oKMDAHFy1lTRNtyvF
         P2/9r81jHXB5hKjui6YafFPASWGCv/BSV5HlSDi5hxSo98lHqCHBZGxROMy7rht2vrgp
         CvlUP0TXjvHgh37JPIH0CFKrKLNy4g1tl22qp5r0wLmVoJOT0cNeZOX3FOAxVR4eSSBX
         IHx0cNxeed82yEWbDKPZyC8Vx4Bqi97dW9uOTs1QFX1RMpU8f9lqHaVr52BYyIfjF1Kn
         RD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864137; x=1795468937;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
        b=g3XJYnod4HKANABQVWiza/ZxGDcp0a37c8qupREDyAwFwAXXITLvhSqMgsJcnX5vyV
         179r59DksKjeABVW4xF+4z0jWjQg+1u618CknaePuUwFTQF2TNQvEHLgQikX1ieVOeRY
         +bHUKe/1AMkxeL1g2T7P7PTFLiBGwmu87qq+RK50oELxRq2LQpgoCP0qAesSmu7S2DXb
         +w8XCMVR2Q/XKjP7lQDDL0Dz+QZNGI5X+ipKsevQ2SgNexbsehk6BI3ZtCgO4u0sugyC
         Rn4tXQpTppq6gThsrR87pfAqZgBWrqIyCaeRS9SVfNXrZEHJujq1nG9F9wfHbIo4KzTt
         pgvw==
X-Forwarded-Encrypted: i=1; AL+hErHFYWX7f66LhJ0zKEhzt/Zce+jp8SFTA+/ZItV7TkrOoIiwQdrtTeBQtGXBkN8MLZGNQSI+oBHgJhx/yyJD@lists.infradead.org
X-Gm-Message-State: APuU4Z+A94Tj0qEYxKweK0oipDlY48ydhfNbIUQ/FHGSFzRCBLVkomrq
	v0dZ2plFBjnIgDTlImmXOEW2U5PSZt/1qWjoOb9LnUYZh2fiUtD+VFSDM1Rjv65+ROc=
X-Gm-Gg: AZFdTZfMJV8fzr36fzNQhzrNj9nc4Nt5Mgj2LJxyvblkgDKOeNBUHYwsvcUJI08Jv49
	utz74t2EHsispdl+hgcjbnhrycHiry4ddjf1jXYXSaXqpULY9+1fp5yYOj71cTIRQMEOhv2kwEu
	BIJQMHaYHztbUSL4ai49dyRaOwyfTXnUb0Vul65J51YdEvAkZJ/ObNPi7TtTZFT2rJOp8uzHkeO
	AWR8gYNp8h5Wwj/M+blxuKCLiQDAk8bPJs53ueMFjNE5Zn2wMGjzTetHmS+daHPY0YBvhDAgH1Y
	d4swSzm3eUkUvfT1sl+a6nOm0yRgqtuT7CSXmQwOzYUoTCeLeB3E+urLSxS5XSjMdMxuF9oLEcY
	fukjJTNjvC6OVnNg5pSOQUthnOJJ4S2diiFPxMltnYwST1IZwG7S/Rs4/XsOAsmW/RNp7XGYfPn
	9FOhhYlhh+1qwadUYTxlmw9tgZPaX+1Js1FQPik1T1Hbi0gyOWrLVqknoGmWy31+FKX0SxH1jKJ
	EvSF0Az8/4TCSV37InwBlNO0EMAwbteJkfOxyFPqcwioOJrs4/oiEkKHtuoEprOsEWxIsJj4I3Z
	079bA+HxqzLFUc46hpJx/VoBpiKwpmxs2sd6g5aATQ7/iOEYT54=
X-Received: by 2002:a05:6000:4284:b0:492:820d:5e6 with SMTP id ffacd0b85a97d-49c72ba6660mr30296893f8f.49.1794864136472;
        Mon, 16 Nov 2026 13:22:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm23832144f8f.35.2026.11.16.13.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:22:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zhentao Guo <zhentao.guo@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Subject: Re: (subset) [PATCH v12 0/6] Add Amlogic stateless H.264 video
 decoder for S4
Message-Id: <179486413508.1210949.15857134761629837585.b4-ty@b4>
Date: Mon, 16 Nov 2026 22:22:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132218_998842_0D938589 
X-CRM114-Status: GOOD (  11.59  )
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

On Thu, 22 Oct 2026 13:26:58 +0800, Zhentao Guo wrote:
> Introduce initial driver support for Amlogic's new video acceleration
> hardware architecture, designed for video stream decoding.
> 
> Compared to the current Amlogic video decoder hardware architecture,
> this new implementation eliminates the Esparser hardware component,
> enabling direct vb2 buffer input. The driver is designed to support
> the V4L2 M2M stateless decoder API. The initial phase includes support
> for H.264 decoding on Amlogic S805X2 platform.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/6] firmware: meson: sm: video firmware loading via secure monitor
      https://git.kernel.org/amlogic/c/fe6c77ab883ecbbcb2d4731a2a5d883a9efbea30
[2/6] firmware: meson: sm: Add video firmware loading SMC call
      https://git.kernel.org/amlogic/c/a47962dfcc5a924d3b824ec7acf56c0c654510b8

These changes has been applied on the intermediate git tree [1].

The for-next branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
