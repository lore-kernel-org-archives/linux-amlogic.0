Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8EBCA1015
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8U/oOpTWWzWR5sdPNzYz5FGo9SE9cSyVxYQTWPiUwYE=; b=hABn6fF1hdsLJL
	qRuL7lb8cd3M+FSrevuJPOpfO3qBEz3lTy1EDIRPEy//gkjKh8G+JBObuiUReM1qmKFEQR3oJRuBC
	fxECqWibl+u41HXC0Kg8NLuBq5rJpQxcUGlToIOpQf9OpX1JdESkvgHSiHxaRGLSFOjIuS7k4uKLy
	nitK1unpwSzbhQhdaAGBsQdA4L0KrHa2IpUqmUHRRvDKIjG6NES+1Zk8jF6oszzfef8tz5V2ucrqR
	AZScj060Q84h2HzPRZFrduDHrUvJhihLsOi6TF60MFIMgltWS53CnSCd/GnalwRTO2bTW37dryyOB
	e9XRDRIlJsWxf47tAawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCoB-0000000Cuzk-0P7O;
	Thu, 04 Sep 2025 16:27:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA1L-0000000BtQn-2hpE
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Sep 2025 13:29:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b9853e630so9597835e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Sep 2025 06:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756992538; x=1757597338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwjkP+OkdyXJDv66oQ0CyedXSSfDjbG63ToGTcAWABQ=;
        b=XizpD+/rVOz5bRFZbbNkkkc5AQ2hyAAgH3mfgaaIwtGm5U0/Ng59cJCdEJ6G5TcaFq
         +wqd7FBJD69dBwrGFtOjmHcUv/fKfGKWlrPZYua3XmQsjBujbiOImk1BHraCU32eVtom
         6zYs7ozUyMbKRuwF32Dio9nbIvCEz5QjDROUFp1nWaU+0c6HSktNJcjZ9Shtl90BgNV3
         KSUBpVOsqsEYvUKahqwwFNJ3U1PAxnx+Dbl4mnGt/XDRLaoB1o+i8w8BgXWVN3iCoI87
         WQcwURrjGO9w8d45jOXuAIImD+l8ymt8lG83EYdoOb+VEtysxGKeu/kvBjSdbBU9K63J
         Rovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992538; x=1757597338;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwjkP+OkdyXJDv66oQ0CyedXSSfDjbG63ToGTcAWABQ=;
        b=Til5j2ywLTuRS8faKTXrn3CHlKSAz7D3/GA+MrWwRvm0IdvDoll/ql09p5dnPvahyM
         NM6fuOfmFEgYS9Bg4VlcbdLWHiXTICSC2d5VnN506qZFeg03topNy7rA8/6vpUeRr3Sq
         /5xc9LJ4n/87tF314h/T/T6KGxviyWJ+Pl2ydi+BaOkLXYftE/Cs3eYq3CQrDffLAW9w
         5iSx61z3vBevwGHohT4zs+yhWvS+VjmKTE5Ul23C56pYTtSZZi5JzRxhEypc8LuTXi8y
         u/Dbwws+utjG1ywBurGkcH7xf+h6KJDhnQmREsFAzsK5Lo8ko+SAs5KtXCWh9FD5ba3P
         xyjg==
X-Forwarded-Encrypted: i=1; AJvYcCWfhYlRBJLcOysS17AdKvVG2f6+oTdfYhghfCjoM+jYRrzbs4wxU4jdYhIUADDLjBCZIJtQb3v3ZJ63eOGH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2wlkAfA5SvbKeFoBirjce0dlkslhctohaeGo6f1d38Mav6ppe
	9PTGqAY5kYppk5ai6TvE+jy8VpXypFU2+pSM6qFzs0V/Z/4d8kk72q8AzVlBewQ15xc=
X-Gm-Gg: ASbGncsovO9MIBGGqSkwtPIfdEg/mnhCE/n0OoQM8nzUFynhhc4uV0KJiev71s83UDJ
	75ZA9Hvh0R0FzgrUR3VNFZtsXRPjPvX7H/iOSv38vBDgj7UGhRh01VjigLteDir2xEzUh6Dd456
	su5Sr/pN1quF+4kqqRXuUu2m7Q1hoRMPEWez30Jsbmgz/WTWrUUPuo0IXZee4l5wQWSucPR+htr
	cA4GRU32cYHRAobvVeOm8ZSghno1sNNN5ViIrEWAs1w61M418zZ/XJT25e2CAbCC5q1sw/p9OuS
	qG0Ykgh/oFIksrJa2rueCFJAsQdxJ1mitD2bSXyFrRJP5Etxc4rPU+tq/kQ0vt74YHLRB+i+ruA
	n9ahnhiAp73xq4h78hXN9D4xTR9t4cFrqOHUk5gxbIBplec5uoZPhGQ==
X-Google-Smtp-Source: AGHT+IFc2iqk3tYMkm4EFxxL9R4GOj3DzOJyDOMOzUxuB34nLUq08b5Npz5Qy7crtT2kbpIf1kyDew==
X-Received: by 2002:a05:600c:3b21:b0:45c:b6b1:29a7 with SMTP id 5b1f17b1804b1-45cb6b12b8fmr62352635e9.16.1756992538058;
        Thu, 04 Sep 2025 06:28:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0869b33sm34579425e9.9.2025.09.04.06.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:28:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20250725074019.8765-1-johan@kernel.org>
References: <20250725074019.8765-1-johan@kernel.org>
Subject: Re: [PATCH] firmware: meson_sm: fix device leak at probe
Message-Id: <175699253745.3375485.7091705423903700055.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:28:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062859_691423_15D44724 
X-CRM114-Status: GOOD (  10.96  )
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

On Fri, 25 Jul 2025 09:40:19 +0200, Johan Hovold wrote:
> Make sure to drop the reference to the secure monitor device taken by
> of_find_device_by_node() when looking up its driver data on behalf of
> other drivers (e.g. during probe).
> 
> Note that holding a reference to the platform device does not prevent
> its driver data from going away so there is no point in keeping the
> reference after the helper returns.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/drivers)

[1/1] firmware: meson_sm: fix device leak at probe
      https://git.kernel.org/amlogic/c/8ece3173f87df03935906d0c612c2aeda9db92ca

These changes has been applied on the intermediate git tree [1].

The v6.18/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
