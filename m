Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B92DC30658
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 13:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GM2u4+lC7F8quIiEKC6a21gta/N2Poo6TQQwEMtMSFA=; b=AD74uAlhI/mJgv
	exkwH46Wsy3Xs9oaSfhNzzWnBWHk6P1xsw91Hv81UNs/FKVBZo+E/AjURstjCT4DPce4LOIACCCsh
	nRPzQFuNmvtza1H9fgVG7Hx40hPp6u95O/HJH9TqOmHiFhILTlL6e/2/b4iZjjoGIXgklU4o5KvSc
	CPMQ/7XzIxLZa9AZckJIUsrFRbRtCJpSvUZ/VpP4sJyWvhRt3T+4xwGSPx+kleIkIiYAfaUC7863b
	fxUiAlNfiUhjpQusyXeb1+1WAFi3Vrfo6QcC42/dk84sMTAj9jB4tJFq+qqQgKNr4xRAVEJ1tN4jm
	dsuckzf4EmCi2SPKtC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM5xT-00000002v4w-3TU3;
	Tue, 25 Jun 2024 13:11:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM5xQ-00000002v3w-2l09
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 13:11:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42172ed3597so32956075e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719321095; x=1719925895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWdwFGLisZTjIZj5f6mqYa4O5wFiRQ0vmR5lx8cA8wI=;
        b=MNuLrfOJAjEoa86//+OfY5nGeD8LcnXtIBhJycMfGThzo/oWilx+ZFp6NulwzeJj5R
         negV3bkdeK3fw2qtdxc5msGTTcteQjNQ2QnTLT7qpQ0V/3svELv2JOFJlfk2RxSL19m8
         dsY56VDfy23PqujFHLwk8Gta0qK9Gjqla8muCyy4RP/NHv/SjT4sE/9IyGI3AFt5M+bT
         agiPNU0frqQEJx5bRRblSdk7xAu+6ASwGIokbaVJ+emJ9rGfcFO3gfOfM0AY8ZWcfUoz
         aJ8DfS5f4YKoWNn9Ivp/HmQmc2OElV5XMsTvhz/S8oaQZRSi7BH2x+vlZsnAFjw90owO
         2DeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719321095; x=1719925895;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWdwFGLisZTjIZj5f6mqYa4O5wFiRQ0vmR5lx8cA8wI=;
        b=t/dpGixsezDocauzkeCTvy20qeHeQ/+PcPqjCu5X7B2fyx9eZeGryQVwIfMv9D2+zH
         1C9ncTlmZsyUdGNsS9O6aeELLH5pT6L0PbBLpJ1Kw7dC1J/a+nfdvcKGqWKvKFt2tGAE
         96BeMkeWqeGNdw4hZs1t2LTlxHUbNZtRrrYnoHdYXgwKFPYrXP8yOz2T1Gp4O9FeeOms
         eurHXyyFmr0P+IECAya5TIyYatAURnNvSj7lHPnvEdLymWh3j/YBWsMbIvWgfGqW+o4a
         1vtuhNY+tx/ACFJKtNudlErzCePOSCLiusP5ElaxPg08Pm94MJiiBcAHtaXtgglrGEC/
         6uPw==
X-Forwarded-Encrypted: i=1; AJvYcCWqV0a4z2EIOkx7Z7i1zMOH9cRe7ARHxZL2FSiHb2ZFmakwSon/jIz38jcI+blh2iUAiJsyIHSF7J4OjF5HK4g43pSYbIu6XTxxhNnYclho/o8=
X-Gm-Message-State: AOJu0Yw0z/VixJlTyG4+XQAJw0VOtlJEwcmxoUiACgKXBVUzsXXPYlg+
	k7UGcnEyVV4dS4njPkFKhIiQCO+2rc4zPBHltZyh49aq+O3EVWEbo/QXfTmctHc=
X-Google-Smtp-Source: AGHT+IHMvZCbIGUwTjA6XAJc7GaXn40HqxJWlWqt76/dBBaT8glx/jIewK3UrGIK55zvb4ODd+CG6A==
X-Received: by 2002:a05:600c:56d6:b0:424:8acb:7d53 with SMTP id 5b1f17b1804b1-4248acb7f20mr72630725e9.1.1719321093913;
        Tue, 25 Jun 2024 06:11:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0b62basm216005375e9.8.2024.06.25.06.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 06:11:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240625111845.928192-1-jbrunet@baylibre.com>
References: <20240625111845.928192-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: amlogic: sm1: fix spdif compatibles
Message-Id: <171932109316.875193.8293227942667432366.b4-ty@linaro.org>
Date: Tue, 25 Jun 2024 15:11:33 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_061136_753774_2E13F2DA 
X-CRM114-Status: GOOD (  10.89  )
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

On Tue, 25 Jun 2024 13:18:43 +0200, Jerome Brunet wrote:
> The spdif input and output of g12 and sm1 are compatible but
> sm1 should use the related compatible since it exists.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/1] arm64: dts: amlogic: sm1: fix spdif compatibles
      https://git.kernel.org/amlogic/c/b0aba467c329a89e8b325eda0cf60776958353fe

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
